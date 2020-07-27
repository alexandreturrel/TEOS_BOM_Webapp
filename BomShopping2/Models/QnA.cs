using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class QnA
    {
        [Key, ScaffoldColumn(false)]
        public int QnaID { get; set; }

        [Required, StringLength(10000), Display(Name = "Question"), DataType(DataType.MultilineText)]
        public string Question { get; set; }

        [Required, StringLength(10000), Display(Name = "Answer"), DataType(DataType.MultilineText)]
        public string Answer { get; set; }

        public int PositiveReview { get; set; }
        public int NegativeReview { get; set; }
    }
}