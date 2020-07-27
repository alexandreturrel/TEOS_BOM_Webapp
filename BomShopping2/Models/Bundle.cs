using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace BomShopping2.Models
{
    public class Bundle
    {
        [Key, ScaffoldColumn(false)]
        public int BundleID { get; set; }

        [Required, StringLength(100), Display(Name = "Bundle")]
        public string BundleName { get; set; }

        [Display(Name = "Template Description")]
        public string Description { get; set; }

        public virtual Rank Rank { get; set; }

        public virtual ICollection<Template> Templates { get; set; }
        public double? Price { get; set; }

        public string RawTemplates { get; set; }

        public string ImagePath { get; set; }

        public void AddTemplate(Template template)
        {
            this.Templates.Add(template);
            this.Price += template.Price;
        }

        public void RemoveTemplate(Template template)
        {
            this.Templates.Remove(template);
            this.Price -= template.Price;
        }

        public List<PricelistItem> GetPricelistItems()
        {
            List<PricelistItem> result = new List<PricelistItem>();
            foreach (var template in Templates)
            {
                foreach(var item in template.GetPricelistItems()) {
                    result.Add(item);
                }
            }

            return result;
        }
    }
}