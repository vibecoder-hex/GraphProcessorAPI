namespace GraphProcessorAPI.Models
{
    public abstract class ServiceResult
    {
        public required bool IsValid { get; set; }
        public string? ErrorMessage { get; set; }
    }

    public class LoginResult : ServiceResult
    {
        public string? TokenString { get; set; }
    }
}
 