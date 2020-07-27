using BomShopping2.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BomShopping2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ContactRegion> GetContacts([QueryString("Region")] string region)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<ContactRegion> query = _db.Contacts;

            if (!String.IsNullOrEmpty(region))
                query = query.Where(p => p.Region == region);
            else
                query = query.Where(p => p.Region == "EU");

            return query;
        }

        public IQueryable<NewsRelease> GetLastNews([QueryString("Region")] string region)
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<NewsRelease> query = _db.News;

            if (!String.IsNullOrEmpty(region))
                query = query.Where(p => p.Region == region);
            else
                query = query.Where(p => p.Region == "EU");

            return query;
        }

        public IQueryable<QnA> GetQuestions()
        {
            var _db = new BomShopping2.Data.BomShoppingContext();
            IQueryable<QnA> query = _db.QuestionsAndAnswers;
            return query;
        }
    }
}