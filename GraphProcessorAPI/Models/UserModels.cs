namespace GraphProcessorAPI.Models
{
    public partial class User
    {
        public int UserId { get; set; }

        public string Username { get; set; } = null!;

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        public DateOnly CreatedAt { get; set; }

        public string Email { get; set; } = null!;

        public string? Phone { get; set; }

        public string PasswordHash { get; set; } = null!;

        public bool IsActive { get; set; }

        public virtual ICollection<Graph> Graphs { get; set; } = new List<Graph>();
    }

}
