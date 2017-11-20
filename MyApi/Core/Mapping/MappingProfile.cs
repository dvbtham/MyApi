using AutoMapper;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using MyApi.Persistence;

namespace MyApi.Core.Mapping
{
    public class MappingProfile : Profile
    {
        public static void MappingConfig()
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
            Mapper.Initialize(mapper =>
            {
                //Domain to view Model
                mapper.CreateMap<Product, ProductSaveViewModel>();
                mapper.CreateMap<Order, OrderSaveViewModel>();
                mapper.CreateMap<ApplicationUser, UserSaveViewModel>();

                // View Model to Domain
                mapper.CreateMap<ProductSaveViewModel, Product>();
                mapper.CreateMap<OrderSaveViewModel, Order>();
                mapper.CreateMap<UserSaveViewModel, ApplicationUser>();
                mapper.CreateMap<UserSaveViewModel, UserViewModel>();
            });
        }
    }

    public class KeyValuePairResource
    {
        public string Id { get; set; }

        public string Name { get; set; }
    }
}