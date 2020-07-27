using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BomShopping2.Startup))]
namespace BomShopping2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
