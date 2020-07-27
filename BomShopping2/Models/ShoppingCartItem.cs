using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class ShoppingCartItem
    {

        [Key]
        public string ItemId { get; set; }

        public string CartId { get; set; }

        public int Quantity { get; set; }

        public System.DateTime DateCreated { get; set; }

        public int PricelistItemID { get; set; }

        public virtual PricelistItem PricelistItem { get; set; }

    }
}