using GraphProcessorAPI.Data;
using GraphProcessorAPI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GraphProcessorAPI.Services
{
    public interface ILoginService
    {
        LoginResult Login(string username, string password);
    }

    public interface IUserService
    {
        Task<UserResult> GetUserByNameAsync(string username);
    }

    public class UserService : IUserService
    {
        private readonly GraphProcessorContext _dbContext;

        public UserService(GraphProcessorContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<UserResult> GetUserByNameAsync(string username)
        {
            var user = await _dbContext.Users
                .SingleOrDefaultAsync(u => u.Username == username);
            if (user == null)
            {
                return new UserResult { IsValid = false, ErrorMessage = $"User by {username} not found" };
            }
            return new UserResult { IsValid = true, SelectedUser = user };
        }
    }

    public class LoginService : ILoginService
    {
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher<User> _passwordHasher;

        public LoginService(IConfiguration configuration, IPasswordHasher<User> passwordHasher)
        {
            _configuration = configuration;
            _passwordHasher = passwordHasher;
        }

        private string JsonWebTokenString(string username)
        {
            var claims = new List<Claim> { new Claim(ClaimTypes.Name, username) };
            var jwtToken = new JwtSecurityToken
                (
                   issuer: _configuration["JwtParams:Issuer"],
                   audience: _configuration["JwtParams:Audience"],
                   claims: claims,
                   expires: DateTime.UtcNow.AddMinutes(30),
                   signingCredentials: new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtParams:SecretKey"])), SecurityAlgorithms.HmacSha256)
                );
            return new JwtSecurityTokenHandler().WriteToken(jwtToken);
        }

        public LoginResult Login(string username, string password)
        {
            var user = new User { Username = "vibecoderhex", PasswordHash = "AQAAAAIAAYagAAAAEAGonv99quIdG961Lyo9pkCqGdPCoeEeRFujpiWL1s2zgTIYRzbAIu+YWYNqP7A0JA==" };
            var verificationResult = _passwordHasher.VerifyHashedPassword(user, user.PasswordHash, password);

            if (username != user.Username || verificationResult == PasswordVerificationResult.Failed)
            {
                return new LoginResult { IsValid = false, ErrorMessage = "Invalid username or password"};
            }
            var tokenString = JsonWebTokenString(username);
            return new LoginResult { IsValid = true, TokenString = tokenString };
        }
    }
}
