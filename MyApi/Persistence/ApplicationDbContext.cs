using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyApi.Core.Domain;

namespace MyApi.Persistence
{

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Store> Stores { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }

        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}