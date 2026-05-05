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
    public interface ITokenService
    {
        string GetJsonWebTokenString(string username);
    }

    public interface ILoginService
    {
        Task<LoginResult> Login(string username, string password);
    }

    public interface IUserService
    {
        Task<UserResult> GetUserByNameAsync(string username);
        Task<UserResult> AddUserAsync(string username, string passwordHash, string firstName, string lastName, string email, string phone);
    }

    public interface IRegistrationService
    {
        Task<RegistrationResult> Register(string username, string password, string repeatPassword, string firstName, string lastName, string email, string phone);
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

        public async Task<UserResult> AddUserAsync(string username, string passwordHash, string firstName, string lastName, string email, string phone)
        {
            var existingUserResult = await GetUserByNameAsync(username);
            if (existingUserResult.IsValid)
                return new UserResult { IsValid = false, ErrorMessage = $"User by {username} is already exists" };

            var newUser = new User
            {
                Username = username,
                PasswordHash = passwordHash,
                FirstName = firstName,
                LastName = lastName,
                Email = email,
                Phone = phone,
                IsActive = true,
                Role = UserRole.Admin,
                CreatedAt = DateOnly.FromDateTime(DateTime.Now),
                
            };

            _dbContext.Users.Add(newUser);
            await _dbContext.SaveChangesAsync();
            return new UserResult { IsValid = false, SelectedUser = newUser };
        }
    }

    public class TokenService : ITokenService
    {
        private readonly IConfiguration _configuration;

        public TokenService(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public string GetJsonWebTokenString(string username) 
        {
            var claims = new List<Claim> 
            { 
                new Claim(ClaimTypes.Name, username),
                new Claim(ClaimTypes.Role, UserRole.Admin.ToString())
            };
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
    }

    public class LoginService : ILoginService
    {
        private readonly IPasswordHasher<User> _passwordHasher;
        private readonly IUserService _userService;
        private readonly ITokenService _tokenService;

        public LoginService(IPasswordHasher<User> passwordHasher, IUserService userService, ITokenService tokenService)
        {
            _passwordHasher = passwordHasher;
            _userService = userService;
            _tokenService = tokenService;
        }

        public async Task<LoginResult> Login(string username, string password)
        {
            var userResult = await _userService.GetUserByNameAsync(username);
            if (!userResult.IsValid)
                return new LoginResult { IsValid = false, ErrorMessage = userResult.ErrorMessage };

            var user = userResult.SelectedUser;
            var verificationResult = _passwordHasher.VerifyHashedPassword(user, user.PasswordHash, password);

            if (verificationResult == PasswordVerificationResult.Failed)
                return new LoginResult { IsValid = false, ErrorMessage = "Invalid password"};

            var tokenString = _tokenService.GetJsonWebTokenString(username);
            return new LoginResult { IsValid = true, TokenString = tokenString };
        }
    }

    public class RegistrationService : IRegistrationService
    {
        private readonly IPasswordHasher<User> _passwordHasher;
        private readonly IUserService _userService;
        private readonly ITokenService _tokenService;

        public RegistrationService(IPasswordHasher<User> passwordHasher, IUserService userService, ITokenService tokenService)
        {
            _passwordHasher = passwordHasher;
            _userService = userService;
            _tokenService = tokenService;
        }

        private bool IsValidPasswords(string password, string repeatPassword)
        {
            return (password == repeatPassword) && (password.Length >= 6);
        }

        public async Task<RegistrationResult> Register(string username, string password, string repeatPassword, string firstName, string lastName, string email, string phone)
        {
            if (!IsValidPasswords(password, repeatPassword))
                return new RegistrationResult { IsValid = false, ErrorMessage = "Passwords is incorrect" };

            string passwordHash = _passwordHasher.HashPassword(null, password);
            var hashVerificationResult = _passwordHasher.VerifyHashedPassword(null, passwordHash, password);
            if (hashVerificationResult == PasswordVerificationResult.Failed)
                return new RegistrationResult { IsValid = false, ErrorMessage = "Password hash verification filed" };

            var userCreationResult = await _userService.AddUserAsync(username, passwordHash, firstName, lastName, email, phone);
            if (!userCreationResult.IsValid)
                return new RegistrationResult { IsValid = false, ErrorMessage = userCreationResult.ErrorMessage };

            string tokenString = _tokenService.GetJsonWebTokenString(username);
            return new RegistrationResult { IsValid = true, TokenString = tokenString };
        }
    }
}
