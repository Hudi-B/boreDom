namespace test.DTOs
{
    public class UserCardsDTO
    {
        public record UserCards_Dto(int Id, int User_Id, int CreditCard_Num,
            int Cvc, string Exp_Date, string Card_Name);
        public record CreatedUserCards_Dto(int CreditCard_Num,
            int Cvc, string Exp_Date, string Card_Name);
        public record UpdateUserCards_Dto(int CreditCard_Num,
            int Cvc, string Exp_Date, string Card_Name);
        public record DeleteUserCards_Dto(int User_Id);
    }
}
