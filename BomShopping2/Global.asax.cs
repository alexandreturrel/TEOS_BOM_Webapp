using BomShopping2.Data;
using System;
using System.Data.Entity;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using BomShopping2.Logic;

namespace BomShopping2
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Database.SetInitializer(new BomShoppingDBInitializer());

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);

            // Create the custom role and user.
            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();
        }

        

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "ProductsByCategoryRoute",
                "Pricelist/{categoryName}",
                "~/Views/Pricelist.aspx"
            );
            routes.MapPageRoute(
                "ProductByNameRoute",
                "PLItemDetails/{reference}",
                "~/Views/PLItemDetails.aspx"
            );

            //routes from the Top Navbar
            routes.MapPageRoute(
                "BundlesByRank",
                "Bundles/{rankName}",
                "~/Views/BundleList.aspx"
            );
            routes.MapPageRoute(
                "TemplatesByPurpose",
                "Templates/{purposeName}",
                "~/Views/TemplateList.aspx"
            );
        }
    }
}