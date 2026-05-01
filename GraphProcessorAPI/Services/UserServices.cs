using GraphProcessorAPI.Data;
using GraphProcessorAPI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GraphProcessorAPI.Services
{
    public interface ILoginService
    {
        LoginResult Login(string username, string password);
    }

    public class LoginService : ILoginService
    {
        private readonly GraphProcessorContext _dbContext;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher<User> _passwordHasher;
        private readonly ILogger<LoginService> _logger;

        public LoginService(GraphProcessorContext dbContext, IConfiguration configuration, IPasswordHasher<User> passwordHasher, ILogger<LoginService> logger)
        {
            _dbContext = dbContext;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _logger = logger;
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
