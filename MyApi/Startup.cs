using Microsoft.Owin;
using MyApi.Core.Mapping;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyApi.Startup))]
namespace MyApi
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            MappingProfile.MappingConfig();
            ConfigureAuth(app);
        }
    }
}
