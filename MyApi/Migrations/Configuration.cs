using System.Globalization;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyApi.Core.Domain;
using MyApi.Persistence;

namespace MyApi.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            CreateStore(context);
            CreateUser(context);
        }

        private void CreateStore(ApplicationDbContext context)
        {
            if (context.Stores.Any()) return;

            var store = new Store { Name = "FPT Shop" };
            context.Stores.Add(store);
            context.SaveChanges();
        }

        private void CreateUser(ApplicationDbContext context)
        {
            if (context.Users.Any()) return;

            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var store = context.Stores.SingleOrDefault(x => x.Name == "FPT Shop");
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            if (store != null)
            {
                var user = new ApplicationUser
                {
                    UserName = "admin@gmail.com",
                    Email = "admin@gmail.com",
                    EmailConfirmed = true,
                    Fullname = "Yang Leo",
                    CreateDate = DateTime.ParseExact(DateTime.Now.ToShortDateString(), "dd/MM/yyyy", CultureInfo.InvariantCulture),
                    Status = true,
                    StoreId = store.Id
                };

                if (manager.Users.Any()) return;

                manager.Create(user, "123123$");
            }

            if (!roleManager.Roles.Any())
            {
                roleManager.Create(new IdentityRole { Name = "Admin" });
                roleManager.Create(new IdentityRole { Name = "Mod" });
            }

            var adminUser = manager.FindByEmail("admin@gmail.com");

            manager.AddToRoles(adminUser.Id, "Admin", "Mod");
        }
    }
}
