namespace GraphProcessorAPI.Models
{
    public record UserLoginDto(string Username, string Password);
    public record UserRegistrationDto(string Username, string Password, string RepeatPassword, string Email);
}
