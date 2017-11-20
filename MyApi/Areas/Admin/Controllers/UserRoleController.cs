using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UserRoleController : BaseController
    {
        private readonly UserManager<ApplicationUser> _userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
        private readonly RoleManager<IdentityRole> _roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
        
        public ActionResult Index(string id)
        {
            var context = new ApplicationDbContext();
            var user = context.Users.SingleOrDefault(x => x.Id == id);
            var model = Mapper.Map<ApplicationUser, UserSaveViewModel>(user);
            var roles = _roleManager.Roles.ToList();
            ViewBag.Roles = roles;

            var userRoles = _userManager.GetRolesAsync(id).Result.ToList();
            model.Roles = userRoles;

            return View(model);
        }

        [HttpPost]
        public async Task<JsonResult> UpdateRole(string role, string id)
        {
            try
            {
                var userRoles = _userManager.GetRolesAsync(id).Result.ToList();

                if (userRoles.Contains(role))
                {
                    var res = await _userManager.RemoveFromRoleAsync(id, role);
                    if (res.Succeeded)
                        SetAlert("Hủy quyền " + role + " thành công", "warning");
                    else
                        SetAlert("Hủy quyền " + role + " không thành công", "error");
                }
                else
                {
                    var res = await _userManager.AddToRoleAsync(id, role);
                    if (res.Succeeded)
                        SetAlert("Cấp quyền " + role + " thành công", "success");
                    else
                        SetAlert("Cấp quyền " + role + " không thành công", "error");
                }

                return Json(new
                {
                    status = true
                });
            }
            catch
            {
                return Json(new
                {
                    status = false
                });
            }
        }
    }
}