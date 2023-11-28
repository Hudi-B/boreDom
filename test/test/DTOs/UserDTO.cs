namespace test.DTOs
{
    public class UserDTO
    {
        public record UserDto(int Id, string Email, int Password,
            DateTimeOffset Created);
        public record CreatedUserDto(string Email, int Password);
        public record UpdateUserDto(string Name, string Email);
        public record DeleteUserDto(int Id);
    }
}
