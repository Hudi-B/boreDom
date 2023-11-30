using System.Reflection.Metadata.Ecma335;
using test.Models;
using test.DTOs;

namespace test
{
    public static class Extension
    {
        public static User User_AsDto(this User user) 
        {
            return new(user.Id, user.Email, user.Password, user.Created);
        }
        public static UserCards UserCards_AsDto(this UserCards userCards)
        {
            return new(userCards.Id, userCards.User_Id, userCards.CreditCard_Num, userCards.Cvc,
                userCards.Exp_Date,userCards.Card_Name);
        }
        public static UserDetails User_AsDto(this UserDetails userDetails)
        {
            return new(userDetails.Id, userDetails.User_Id, userDetails.Fullname, userDetails.Address,
                userDetails.Birth_Date);
        }
    }
}
