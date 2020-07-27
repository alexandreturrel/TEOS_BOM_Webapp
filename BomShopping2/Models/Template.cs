using BomShopping2.Views;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BomShopping2.Models
{
    public class Template
    {
        [Key, ScaffoldColumn(false)]
        public int TemplateID { get; set; }

        [Required, StringLength(100), Display(Name = "Template")]
        public string TemplateName { get; set; }

        [Display(Name = "Template Description")]
        public string Description { get; set; }

        public int Rank { get; set; }

        public string Tag { get; set; } //Raw Purpose, or Workplace Solution column in the Excel file

        public int? PurposeID { get; set; }

        [ForeignKey("PurposeID")]
        public virtual Purpose Purpose { get; set; }

        public virtual ICollection<PricelistItem> Items { get; set; }

        public string RawItems { get; set; }

        public virtual ICollection<Bundle> Bundles { get; set; }

        public double? Price { get; set; }

        public string ImagePath { get; set; }

        public void AddItem(PricelistItem item)
        {
            this.Items.Add(item);
            this.Price += item.UnitPrice;
        }

        public void RemoveItem(PricelistItem item)
        {
            this.Items.Remove(item);
            this.Price -= item.UnitPrice;
        }

        public List<PricelistItem> GetPricelistItems()
        {
            return this.Items.ToList();
        }
    }
}