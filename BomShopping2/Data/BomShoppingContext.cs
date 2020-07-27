using BomShopping2.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BomShopping2.Data
{
    public class BomShoppingContext : DbContext
    {
        public BomShoppingContext() : base("BomShoppingPLDB") { }
        public DbSet<Bundle> Bundles { get; set; }
        public DbSet<Template> Templates { get; set; }
        public DbSet<PricelistItem> PricelistItems { get; set; }
        public DbSet<Purpose> Purposes { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Rank> Ranks { get; set; }
        public DbSet<ShoppingCartItem> ShoppingCartItems { get; set; }

        public DbSet<QnA> QuestionsAndAnswers { get; set; }

        public DbSet<ContactRegion> Contacts { get; set; }

        public DbSet<NewsRelease> News { get; set; }
    }
}