using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using AutoMapper;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers.api
{
    public class UsersController : ApiController
    {
        readonly UserManager<ApplicationUser> _manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));

        RoleManager<IdentityRole> _roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
        private readonly ApplicationDbContext _context;

        public UsersController()
        {
            _context = new ApplicationDbContext();
        }
        public IEnumerable<UserViewModel> Get()
        {
            var users = _manager.Users.Include(x => x.Store).ToList();
            var result = new List<UserViewModel>();
            Mapper.Map(users, result);
            return result;
        }

        public UserSaveViewModel Get(string id)
        {
            var user = _manager.Users.SingleOrDefault(x => x.Id == id);
            var result = new UserSaveViewModel();
            return Mapper.Map(user, result);
        }

        public async Task<IHttpActionResult> Post([FromBody] UserSaveViewModel user)
        {
            if (user == null) return BadRequest("user null");
            var userSave = new ApplicationUser();
            Mapper.Map(user, userSave);
            //string[] roles = new []{""};
            //int i = 0;

            //foreach (var role in user.Roles)
            //{
            //    roles = new string[user.Roles.Count];
            //    roles[i++] = role;
            //}
            await _manager.CreateAsync(userSave, user.Password);

            _context.SaveChanges();
            var result = new UserViewModel();
            Mapper.Map(user, result);
            return Ok(result);
        }

        public UserSaveViewModel Put(string id, [FromBody] UserSaveViewModel viewModel)
        {
            var user = _manager.Users.Include(x => x.Roles).SingleOrDefault(x => x.Id == id);
            if (viewModel == null || user == null) return new UserSaveViewModel();

            Mapper.Map(viewModel, user);

            _context.SaveChanges();
            var result = new UserSaveViewModel();
            Mapper.Map(viewModel, result);
            return result;
        }

        public UserViewModel Delete(string id)
        {
            var user = _manager.Users.SingleOrDefault(x => x.Id == id);
            if (user == null) return new UserViewModel();
            user.Status = false;
            _context.Users.Remove(user);
            _context.SaveChanges();
            var result = new UserViewModel();
            Mapper.Map(user, result);
            return result;
        }
    }
}
