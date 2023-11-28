namespace test.Models
{
    public class User
    {
        public int Id { get; set; } 
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTimeOffset Created { get; set; } //Do we need it?
    }
}
