namespace test.DTOs
{
    public class UserDetailsDTO
    {
        public record UserDetails_Dto(int Id, int User_Id, string Fullname,
            string Address, DateTime Birth_Date);
        public record CreatedUserDetails_Dto(string Fullname,
            string Address, DateTime Birth_Date);
        public record UpdateUserDetails_Dto(string Fullname,
            string Address, DateTime Birth_Date);
        public record DeleteUserDetails_Dto(int User_Id);
    }
}
