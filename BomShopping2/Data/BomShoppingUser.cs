using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace BomShopping2.Data
{
    public class BomShoppingUser : IdentityUser
    {
        public string Region { get; set; }
    }
}