using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Chun_Hsien_Admin.Startup))]
namespace Chun_Hsien_Admin
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
