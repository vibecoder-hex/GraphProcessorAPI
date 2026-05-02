using GraphProcessorAPI.Data;
using GraphProcessorAPI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GraphProcessorAPI.Services
{
    public interface ILoginService
    {
        Task<LoginResult> Login(string username, string password);
    }

    public interface IUserService
    {
        Task<UserResult> GetUserByNameAsync(string username);
    }

    public class UserService : IUserService
    {
        private readonly GraphProcessorContext _dbContext;
        private readonly ILogger<UserService> _logger;

        public UserService(GraphProcessorContext dbContext, ILogger<UserService> logger)
        {
            _dbContext = dbContext;
            _logger = logger;
        }

        public async Task<UserResult> GetUserByNameAsync(string username)
        {
            var user = await _dbContext.Users
                .SingleOrDefaultAsync(u => u.Username == username);

            if (user == null)
                return new UserResult { IsValid = false, ErrorMessage = $"User by {username} not found" };

            _logger.LogInformation($"Successfull selected {user} by {username}");
            return new UserResult { IsValid = true, SelectedUser = user };
        }
    }

    public class LoginService : ILoginService
    {
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher<User> _passwordHasher;
        private readonly IUserService _userService;

        public LoginService(IConfiguration configuration, IPasswordHasher<User> passwordHasher, IUserService userService)
        {
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _userService = userService;
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

        public async Task<LoginResult> Login(string username, string password)
        {
            var userResult = await _userService.GetUserByNameAsync(username);
            if (!userResult.IsValid)
                return new LoginResult { IsValid = false, ErrorMessage = "Invalid username" };

            var user = userResult.SelectedUser;
            var verificationResult = _passwordHasher.VerifyHashedPassword(user, user.PasswordHash, password);

            if (verificationResult == PasswordVerificationResult.Failed)
                return new LoginResult { IsValid = false, ErrorMessage = "Invalid password"};

            var tokenString = JsonWebTokenString(username);
            return new LoginResult { IsValid = true, TokenString = tokenString };
        }
    }
}
