using BomShopping2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using Microsoft.Ajax.Utilities;

namespace BomShopping2.Views
{
    public partial class Pricelist : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<PricelistItem> GetPricelist([QueryString("categoryID")] int? categoryId, [RouteData] string categoryName)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<PricelistItem> query = _db.PricelistItems;

            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CategoryID == categoryId);
            }

            if (!String.IsNullOrEmpty(categoryName))
            {
                query = query.Where(p =>
                    String.Compare(p.Category.CategoryName,
                    categoryName) == 0);

            }

            return query;
        }

        public IQueryable<Category> GetHardwareCategories()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Category> query = _db.Categories;
            query = query.Where(p => p.Type == "HARDWARE").OrderBy(p => p.CategoryName);
            return query;
        }
        public IQueryable<Category> GetSoftwareCategories()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Category> query = _db.Categories;
            query = query.Where(p => p.Type == "SOFTWARE").OrderBy(p => p.CategoryName);
            return query;
        }
        public IQueryable<Category> GetServiceCategories()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Category> query = _db.Categories;
            query = query.Where(p => p.Type == "SERVICE").OrderBy(p => p.CategoryName);
            return query;
        }

        public IQueryable<Category> GetCategories()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        protected void AddingToCart_Click(object sender, CommandEventArgs e)
        {
            Response.Redirect("AddToCart.aspx?pricelistItemID="+e.CommandArgument+"&quantity=1");
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