using System.ComponentModel.DataAnnotations;

namespace test.Models
{
    public class UserCards
    {
        public UserCards(int id, int user_Id, int creditCard_Num, int cvc, string? exp_Date, string? card_Name)
        {
            Id = id;
            User_Id = user_Id;
            CreditCard_Num = creditCard_Num;
            Cvc = cvc;
            Exp_Date = exp_Date;
            Card_Name = card_Name;
        }

        public int Id { get; set; }
        [Key]
        public int User_Id { get; set; }
        [Required]
        public int CreditCard_Num { get; set; }
        [Required]
        public int Cvc { get; set; }
        [Required]
        public string? Exp_Date { get; set; }
        [Required]
        public string? Card_Name { get; set; }
    }
}
