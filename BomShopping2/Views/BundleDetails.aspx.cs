using BomShopping2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BomShopping2.Views
{
    public partial class BundleDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Bundle> GetBundle([QueryString("bundleID")] int? bundleId)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Bundle> query = _db.Bundles;
            if (bundleId.HasValue && bundleId > 0)
            {
                query = query.Where(p => p.BundleID == bundleId);
            }
            else
            {
                query = null;
            }

            return query;
        }

        public List<PricelistItem> GetItems([QueryString("bundleID")] int? bundleId)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Bundle> query = _db.Bundles;
            if (bundleId.HasValue && bundleId > 0)
            {
                query = query.Where(p => p.BundleID == bundleId);
            }
            else
            {
                query = null;
            }

            return query.FirstOrDefault().GetPricelistItems();
        }

        protected void AddingToCart_Click(object sender, CommandEventArgs e)
        {

            Response.Redirect("AddToCart.aspx?pricelistItemID=" + e.CommandArgument + "&quantity=1");
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
    }
}