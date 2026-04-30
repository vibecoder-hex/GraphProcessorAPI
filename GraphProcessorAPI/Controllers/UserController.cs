using GraphProcessorAPI.Data;
using GraphProcessorAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;


namespace GraphProcessorAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ILogger<UserController> _logger;
        private readonly GraphProcessorContext _context;
        private readonly IConfiguration _configuration;
        
        public UserController(ILogger<UserController> logger, GraphProcessorContext context, IConfiguration configuration)
        {
            _logger = logger;
            _context = context;
            _configuration = configuration;
        }

        [HttpPost("login")]
        public IActionResult Login(UserLoginDto userData)
        {
            var claims = new List<Claim> { new Claim(ClaimTypes.Name, userData.Username) };
            var jwtToken = new JwtSecurityToken
                (
                   issuer: _configuration["JwtParams:Issuer"],
                   audience: _configuration["JwtParams:Audience"],
                   claims: claims,
                   expires: DateTime.UtcNow.AddMinutes(30),
                   signingCredentials: new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtParams:SecretKey"])), SecurityAlgorithms.HmacSha256)
                );
            string tokenString = new JwtSecurityTokenHandler().WriteToken(jwtToken);
            _logger.LogInformation("User {Username} logged in and received token: {Token}", userData.Username, tokenString);
            return Ok(new { Token = tokenString });
        }
    }
}
