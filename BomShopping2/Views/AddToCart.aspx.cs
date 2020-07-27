using BomShopping2.Logic;
using BomShopping2.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BomShopping2.Views
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string plId = Request.QueryString["pricelistItemID"];
            int pricelistItemId;
            string tpId = Request.QueryString["templateID"];
            int templateId;
            string blId = Request.QueryString["bundleID"];
            int bundleId;
            string qnt = Request.QueryString["quantity"];
            int quantity;
            if (!String.IsNullOrEmpty(qnt) && int.TryParse(qnt, out quantity))
            {
                if (!String.IsNullOrEmpty(plId) && int.TryParse(plId, out pricelistItemId))
                {
                    using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
                    {
                        usersShoppingCart.AddToCart(Convert.ToInt16(plId), quantity);
                    }
                    Response.Redirect("Pricelist.aspx");
                }
                else if (!String.IsNullOrEmpty(tpId) && int.TryParse(tpId, out templateId))
                {
                    using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
                    {
                        var _db = new BomShopping2.Data.BomShoppingContext();
                        var query = _db.Templates.Find(templateId);
                        foreach(PricelistItem i in query.Items) 
                        {
                            usersShoppingCart.AddToCart(Convert.ToInt16(i.PricelistItemID), quantity);
                        }
                    }
                    Response.Redirect("TemplateList.aspx");
                }
                else if(!String.IsNullOrEmpty(blId) && int.TryParse(blId, out bundleId))
                {
                    using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
                    {
                        var _db = new BomShopping2.Data.BomShoppingContext();
                        var query = _db.Bundles.Find(bundleId);
                        foreach (Template t in query.Templates)
                        {
                            foreach (PricelistItem i in t.Items)
                            {
                                usersShoppingCart.AddToCart(Convert.ToInt16(i.PricelistItemID), quantity);
                            }
                        }
                    }
                    Response.Redirect("BundleList.aspx");
                }
            }
            else
            {
                Debug.Fail("ERROR : We should never get to AddToCart.aspx without a pricelistItemID.");
                throw new Exception("ERROR : It is illegal to load AddToCart.aspx without setting a pricelistItemID.");
            }
            Response.Redirect("ShoppingCart.aspx");
        }


    }
}