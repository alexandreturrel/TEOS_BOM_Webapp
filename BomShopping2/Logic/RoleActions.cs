using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using BomShopping2.Data;
using BomShopping2.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace BomShopping2.Logic
{
    internal class RoleActions
    {
        public void AddUserAndRole()
        {
            // Access the application context and create result variables.
            ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Then, you create the "administrator" role if it doesn't already exist.
            if (!roleMgr.RoleExists("administrator"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "administrator" });
            }
            if (!roleMgr.RoleExists("sales"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "sales" });
            }
            if (!roleMgr.RoleExists("client"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "client" });
            }


            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUserAdmin = new ApplicationUser
            {
                UserName = "admin@admin.com",
                Email = "admin@admin.com",
                //Region = "EU",
            };
            IdUserResult = userMgr.Create(appUserAdmin, "Sony0!");   //the last parameter is the password
            var appUserSales = new ApplicationUser
            {
                UserName = "sales@sales.com",
                Email = "sales@sales.com",
               // Region = "US",
            };
            IdUserResult = userMgr.Create(appUserSales, "Sony0!");   //the last parameter is the password
            var appUserClient = new ApplicationUser
            {
                UserName = "client@client.com",
                Email = "client@client.com",
               // Region = "AS",
            };
            IdUserResult = userMgr.Create(appUserClient, "Sony0!");   //the last parameter is the password


            // If the new  users were successfully created, 
            // add the users to the different roles. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("admin@admin.com").Id, "administrator"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("admin@admin.com").Id, "administrator");
            }
            if (!userMgr.IsInRole(userMgr.FindByEmail("sales@sales.com").Id, "sales"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("sales@sales.com").Id, "sales");
            }
            if (!userMgr.IsInRole(userMgr.FindByEmail("client@client.com").Id, "client"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("client@client.com").Id, "client");
            }

        }
    }
}