using Microsoft.EntityFrameworkCore;

namespace test.Models.dbContext
{
    public class Table_DbContext : DbContext
    {
        public Table_DbContext(DbContextOptions options) : base(options) 
        {

        }

        public DbSet<User> Allusers { get; set; } = null!;
        public DbSet<UserDetails> Userdetals { get; set; } = null!;
        public DbSet<UserCards> Usercards { get; set; } = null!;
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) //MySql database generator
        {
            if (!optionsBuilder.IsConfigured)
            {
                string conn = "server=127.0.0.1; database=HorseRacing; user=root; password="; //Ip change if not on right server

                optionsBuilder.UseMySql(conn, ServerVersion.AutoDetect(conn));
            }
        }
    }
}
