namespace GraphProcessorAPI.Models
{
    public record UserLoginDto(string Username, string Password);
    public record UserRegistrationDto(string Username, string Password, string RepeatPassword, string FirstName, string LastName, string Email, string Phone);

    public class UserProfileDto
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
    }
}
