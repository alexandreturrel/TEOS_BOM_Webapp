using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class Rank
    {
        [Key, ScaffoldColumn(false)]
        public int ID { get; set; }

        [Required, Display(Name = "Value")]
        public int Value { get; set; }

        [Required, Display(Name = "Rank")]
        public string Name { get; set; }

    }
}