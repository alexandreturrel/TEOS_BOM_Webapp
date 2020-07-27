using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class Purpose
    {
        [Key, ScaffoldColumn(false)]
        public int PurposeID { get; set; }

        [Required, StringLength(100), Display(Name = "Purpose")]
        public string PurposeName { get; set; }

        [Display(Name = "Purpose Description")]
        public string Description { get; set; }

        public string ImagePath { get; set; }

        public string LinkToDatasheet { get; set; }
        public string LinkNameToDatasheet { get; set; }
    }
}