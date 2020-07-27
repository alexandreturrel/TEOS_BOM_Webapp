using BomShopping2.Data;
using BomShopping2.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace BomShopping2.Logic
{
    public class PricelistActions : IDisposable
    {

        private BomShoppingContext _db;

        public PricelistActions(BomShoppingContext context)
        {
            this._db = context;
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                _db = null;
            }
        }

        public PricelistItem FindByReference(string reference)
        {
            IQueryable<PricelistItem> query = _db.PricelistItems;
            query = query.Where(p => p.Reference == reference);
            if (query.Count() == 1)
            {
                var result = query.Single();
                return result;
            }
            else
                return null;
        }

        public int FindIDByReference(string reference)
        {
            IQueryable<PricelistItem> query = _db.PricelistItems;
            query = query.Where(p => p.Reference == reference);
            if (query.Count() == 1)
            {
                var result = query.ToList().FirstOrDefault();
                Debug.Print(result.PricelistItemID.ToString());
                return result.PricelistItemID;
            }
            else
                return -1;
        }

        public void UpdateCompatibleItems(PricelistItem item)
        {

            string[] rawReferences = item.CompatibleModels.Split('|');
            //add new references to the CompatibleItems list
            foreach(string reference in rawReferences)
            {
                var isCreated = FindByReference(reference);
                if (isCreated!=null && !item.CompatibleItems.Contains(isCreated.PricelistItemID))
                {
                    item.AddCompatibleItem(isCreated);
                }
            }

            var linkedReferences = item.CompatibleItems;
            //remove old references from the CompatibleItems list
            foreach (var linkedReference in linkedReferences)
            {
                if (!rawReferences.Contains(_db.PricelistItems.Find(linkedReference).Reference))
                {
                    item.RemoveCompatibleItem(_db.PricelistItems.Find(linkedReference));
                }
            }
        }
    }
}