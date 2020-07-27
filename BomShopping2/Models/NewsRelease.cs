using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class NewsRelease
    {
        [Key, ScaffoldColumn(false)]
        public int NewsRealeaseID { get; set; }

        [Required, StringLength(1000), Display(Name = "Title")]
        public string Title { get; set; }

        [Required, StringLength(10000), Display(Name = "Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Required, StringLength(10), Display(Name = "Region")]
        public string Region { get; set; }

        public string ImagePath { get; set; }

        [StringLength(200), Display(Name = "Link")]
        public string LinkToDocumentation { get; set; }

        public int OneStarReview { get; set; }
        public int TwoStarReview { get; set; }
        public int ThreeStarReview { get; set; }
        public int FourStarReview { get; set; }
        public int FiveStarReview { get; set; }
    }
}