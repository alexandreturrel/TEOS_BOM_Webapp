using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace BomShopping2.Models
{
    public class PricelistItem
    {
        //
        //Internal variables, only used in the BOM
        //Could be automatically updated from DB modification
        //

        [Key, ScaffoldColumn(false)]
        public int PricelistItemID { get; set; }

        [Required, StringLength(2), Display(Name = "Status")]
        public string Status { get; set; }     // -1 Discontinued, 0 EOL, 1 Active

        public List<int> CompatibleItems { get; set; }


        //
        //External variables, gathered from the Public Pricelist and its dependencies
        //Those items can be updated directly from an Excel file correctly formatted
        //See the documentation for more details
        //
        [Required, StringLength(10), Display(Name = "Region")]
        public string Region { get; set; }

        [Required, StringLength(100), Display(Name = "Tag")]
        public string Tag { get; set; }

        [Required, StringLength(50), Display(Name = "Last updated on ")]
        public string Month { get; set; }

        [StringLength(5), Display(Name = "European Category")]
        public string EU_Category { get; set; }

        [Required, StringLength(100), Display(Name = "Reference")]
        public string Reference { get; set; }

        [Required, StringLength(10000), Display(Name = "Item Description"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Display(Name = "Buy Price")]
        public double? BuyPrice { get; set; }

        [Required, Display(Name = "List Price")]
        public double? UnitPrice { get; set; }

        [StringLength(1000), Display(Name = "Comments")]
        public string Comments { get; set; }

        [Display(Name = "Size")]
        public string Size { get; set; }

        [StringLength(100), Display(Name = "Technology")]
        public string Technology { get; set; }

        [StringLength(100), Display(Name = "Resolution")]
        public string Resolution { get; set; }

        [Display(Name = "HDR")]
        public string HDR { get; set; }

        [Display(Name = "Brightness")]
        public string Brightness { get; set; }

        [Display(Name = "24/7")]
        public string TwentyFourSeven { get; set; }

        [Display(Name = "Portrait Mode")]
        public string Portrait { get; set; }

        [Display(Name = "Tuner")]
        public string Tuner { get; set; }

        [Display(Name = "IP Control")]
        public string IPControl { get; set; }

        [Display(Name = "RS232")]
        public string Rs232 { get; set; }

        [Display(Name = "Professional Mode")]
        public string Professional { get; set; }

        [StringLength(10000), Display(Name = "Included Warranty")]
        public string Warranty { get; set; }

        [StringLength(100), Display(Name = "Interactive")]
        public string Interactive { get; set; }

        [StringLength(50), Display(Name = "Color")]
        public string Color { get; set; }

        [StringLength(100000), Display(Name = "Compatible Models")]
        public string CompatibleModels { get; set; }

        [StringLength(100), Display(Name = "Image Path")]
        public string ImagePath { get; set; }

        [StringLength(200), Display(Name = "Link")]
        public string LinkToDatasheet { get; set; }

        [StringLength(200), Display(Name = "Linkname")]
        public string LinkNameToDatasheet { get; set; }

        [StringLength(50), Display(Name = "OS")]
        public string OS { get; set; }

        [Required, StringLength(10), Display(Name = "Currency")]
        public string Currency { get; set; }


        public int? CategoryID { get; set; }
        [ForeignKey("CategoryID")]
        public virtual Category Category { get; set; }

        public virtual ICollection<Template> Templates { get; set; }

        //
        //Internal Methods
        //

        public void AddCompatibleItem(PricelistItem item)
        {
            this.CompatibleItems.Append(item.PricelistItemID);
        }

        public void RemoveCompatibleItem(PricelistItem item)
        {
            this.CompatibleItems.Remove(item.PricelistItemID);
        }

    }
}