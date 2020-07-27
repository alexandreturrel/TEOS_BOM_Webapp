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
    public partial class TemplateList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Template> GetTemplates([QueryString("purposeID")] int? purposeId, [RouteData] string purposeName)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Template> query = _db.Templates;

            if (purposeId.HasValue && purposeId > 0)
            {
                query = query.Where(p => p.PurposeID == purposeId);
            }
            if (!String.IsNullOrEmpty(purposeName))
            {
                query = query.Where(p =>
                    String.Compare(p.Purpose.PurposeName,
                    purposeName) == 0);
            }
            return query;
        }

        public IQueryable<Purpose> GetPurposes()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<Purpose> query = _db.Purposes;
            return query.OrderBy(p => p.PurposeName);
        }

    }
}