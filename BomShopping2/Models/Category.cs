using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class Category
    {
        [Key, ScaffoldColumn(false)]
        public int CategoryID { get; set; }

        [Required, StringLength(100), Display(Name = "Category")]
        public string CategoryName { get; set; }

        [Display(Name = "Category Description")]
        public string Description { get; set; }

        [Display(Name = "Type")]
        public string Type { get; set; }

    }
}