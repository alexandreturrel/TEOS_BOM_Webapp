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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Bundle> GetBundles([QueryString("rank")] int? rank, [RouteData] string rankName)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Bundle> query = _db.Bundles;

            if (rank.HasValue && rank > 0)
            {
                query = query.Where(p => p.Rank.Value == rank);
            }
            if (!String.IsNullOrEmpty(rankName))
            {
                query = query.Where(p =>
                    String.Compare(p.Rank.Name,
                    rankName) == 0);
            }
            return query;
        }

        public IQueryable<Rank> GetIntRanks()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Rank> ranks = _db.Ranks;
            return ranks;
        }
    }
}