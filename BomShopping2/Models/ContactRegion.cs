using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class ContactRegion
    {

        [Key, ScaffoldColumn(false)]
        public int ContactID { get; set; }

        [Required, StringLength(100), Display(Name = "Contact Name")]
        public string Name { get; set; }

        [Required, StringLength(1000), Display(Name = "Address")]
        public string Address { get; set; }

        [Required, StringLength(100), Display(Name = "City")]
        public string City { get; set; }

        [Required, Display(Name = "Postal Code")]
        [StringLength(10)]
        public string PostalCode { get; set; }

        [Required, Display(Name = "Region")]
        [StringLength(10)]
        public string Region { get; set; }

        [Required, StringLength(15), Display(Name = "Phone")]
        [RegularExpression(@"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
        ErrorMessage = "Email is is not valid.")]
        public string Phone { get; set; }

        [Required, StringLength(100), Display(Name = "Email Address")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",
        ErrorMessage = "Email is is not valid.")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

    }
}