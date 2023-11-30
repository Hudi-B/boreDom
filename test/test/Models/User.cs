using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Net.Mime;

namespace test.Models
{
    public class User
    {
        public User(int id, string? email, string? password, DateTimeOffset created)
        {
            Id = id;
            Email = email;
            Password = password;
            Created = created;
        }

        [Key]
        public int Id { get; set; } 
        [Required]
        [Column(TypeName="varchar(50)")]
        public string? Email { get; set; }
        [Required]
        [Column(TypeName = "varchar(50)")]
        public string? Password { get; set; }
        public DateTimeOffset Created { get; set; } //Do we need it?
    }
}
