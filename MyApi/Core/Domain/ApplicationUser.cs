using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MyApi.Core.Domain
{
    public class ApplicationUser : IdentityUser
    {
        public string Fullname { get; set; }

        public string Address { get; set; }

        public DateTime CreateDate { get; set; }

        public bool Status { get; set; }

        public int StoreId { get; set; }

        [ForeignKey("StoreId")]
        public Store Store { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }
}