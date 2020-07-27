using BomShopping2.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BomShopping2.Views
{
    public partial class PLItemDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<PricelistItem> GetPricelistItem([QueryString("pricelistItemID")] int? pricelistItemId,
        [RouteData] string reference)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<PricelistItem> query = _db.PricelistItems;

            if (pricelistItemId.HasValue && pricelistItemId > 0)
            {
                query = query.Where(p => p.PricelistItemID == pricelistItemId);
            }
            else if (!String.IsNullOrEmpty(reference))
            {
                query = query.Where(p =>
                      String.Compare(p.Reference, reference) == 0);
            }
            else
            {
                query = null;
            }

            return query;
        }

        public List<PricelistItem> GetCompatibleItems([QueryString("pricelistItemID")] int? pricelistItemId,
        [RouteData] string reference)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<PricelistItem> query = _db.PricelistItems;

            if (pricelistItemId.HasValue && pricelistItemId > 0)
            {
                query = query.Where(p => p.PricelistItemID == pricelistItemId);
            }
            else if (!String.IsNullOrEmpty(reference))
            {
                query = query.Where(p =>
                      String.Compare(p.Reference, reference) == 0);
            }
            else
            {
                query = null;
            }

            var tmp = query.Select(p=>p.CompatibleItems);

            List<PricelistItem> result = new List<PricelistItem>();
            foreach(var list in tmp)
            {
                foreach(var item in list)
                {
                    result.Add(_db.PricelistItems.Find(item));
                }
            }

            return result;
        }

        public string ProcessStatusLabel(string status)
        {
            string result;
            switch (TryParseIntInvariant(status))
            {
                case -1:
                    result = "danger";
                    break;
                case 0:
                    result = "warning";
                    break;
                case 1:
                    result = "success";
                    break;
                default:
                    result = "default";
                    break;
            }
            return result;
        }

        public string ProcessStatusText(string status)
        {
            string result;
            switch (TryParseIntInvariant(status))
            {
                case -1:
                    result = "Discontinued";
                    break;
                case 0:
                    result = "EOL";
                    break;
                case 1:
                    result = "Active";
                    break;
                default:
                    result = "N/A";
                    break;
            }
            return result;
        }

        private int TryParseIntInvariant(string status)
        {
            try
            {
                return int.Parse(status);
            }
            catch
            {
                new NotImplementedException();
            }
            throw new Exception();
        }

        protected string ProcessVisibilityString(string text)
        {
            string result;
            if (!String.IsNullOrEmpty(text))
            {
                result = "";
            }
            else
            {
                result = "hidden";
            }

            return result;
        }

        protected string ProcessVisibilityInt(int? value)
        {
            string result;
            if (value.HasValue)
            {
                result = "";
            }
            else
            {
                result = "hidden";
            }
            return result;
        }
    }
}