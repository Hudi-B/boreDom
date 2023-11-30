using System.ComponentModel.DataAnnotations;

namespace test.Models
{
    public class UserDetails
    {
        public UserDetails(int id, int user_Id, string? fullname, string? address, DateTime birth_Date)
        {
            Id = id;
            User_Id = user_Id;
            Fullname = fullname;
            Address = address;
            Birth_Date = birth_Date;
        }

        public int Id { get; set; }
        [Key]
        public int User_Id { get; set; }
        [Required]
        public string? Fullname { get; set; }
        [Required]
        public string? Address { get; set; }
        [Required]
        public DateTime Birth_Date { get; set; }
    }
}
