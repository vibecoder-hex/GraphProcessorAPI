using GraphProcessorAPI.Models;
using GraphProcessorAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;


namespace GraphProcessorAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ILogger<UserController> _logger;
        private readonly IConfiguration _configuration;
        private readonly ILoginService _loginService;
        
        public UserController(ILogger<UserController> logger, IConfiguration configuration, ILoginService loginService)
        {
            _logger = logger;
            _configuration = configuration;
            _loginService = loginService;
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] UserLoginDto userData)
        {
            var loginResult = _loginService.Login(userData.Username, userData.Password);
            if (!loginResult.IsValid)
            {
                _logger.LogError($"Login failed for user {userData.Username}");
                return Unauthorized(new { Error = loginResult.ErrorMessage });
            }
            _logger.LogInformation($"User {userData.Username} logged in and received token: {loginResult.TokenString}");
            return Ok(new { TokenString = loginResult.TokenString });
        }

        [Authorize]
        [HttpGet("profile")]
        public IActionResult Profile()
        {
            return Ok(new { Message = "This is a protected endpoint." });
        }
    }
}
