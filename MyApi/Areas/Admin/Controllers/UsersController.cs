using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Mvc;
using MyApi.Core;
using MyApi.Core.ViewModel;
using MyApi.Persistence;
using Newtonsoft.Json;

namespace MyApi.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UsersController : BaseController
    {
        public async Task<ActionResult> Index()
        {
            var client = new HttpClient();

            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/users");
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();

            var result = JsonConvert.DeserializeObject<List<UserViewModel>>(responBody);

            return View(result);
        }

        public ActionResult Create()
        {
            var model = new UserSaveViewModel { Heading = "Add New User" };
            PrepareStoreList(model);
            return View("UserForm", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(UserSaveViewModel model)
        {
           
            if (!ModelState.IsValid)
            {
                PrepareStoreList(model);
                return View("UserForm", model);
            }
            using (var client = new HttpClient())
            {
                var myContent = JsonConvert.SerializeObject(model);
                var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                var responseMessage = await client.PostAsync(EndPointBase.EndPoint + "/api/users", byteContent);
                if (responseMessage.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                PrepareStoreList(model);
                return View("UserForm", model);
            }
        }

        public async Task<ActionResult> Edit(string id)
        {
            var client = new HttpClient();
            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/users/" + id);
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();
            var model = JsonConvert.DeserializeObject<UserSaveViewModel>(responBody);
            model.Heading = "Update User";
            PrepareStoreList(model);
            return View("UserForm", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Update(UserSaveViewModel model )
        {
            model.Heading = "Update User";
            if (!ModelState.IsValid)
            {
                PrepareStoreList(model);
                return View("UserForm", model);
            }
            using (var client = new HttpClient())
            {
                var myContent = JsonConvert.SerializeObject(model);
                var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                var responseMessage = await client.PutAsync(EndPointBase.EndPoint + "/api/users/" + model.Id, byteContent);
                if (responseMessage.IsSuccessStatusCode)
                {
                    SetAlert("Data successfully saved.", "success");
                    return RedirectToAction("Index");
                }
                PrepareStoreList(model);
                return View("UserForm", model);
            }
        }

        [HttpPost]
        public async Task<ActionResult> Delete(string id)
        {
            var client = new HttpClient();

            var response = await client.DeleteAsync(EndPointBase.EndPoint + "/api/users/" + id);
            return Json(response.IsSuccessStatusCode ? "Delete successfully" : "Delete failed");
        }

        [NonAction]
        public void PrepareStoreList(UserSaveViewModel model)
        {
            model.StoreList = new SelectList(new ApplicationDbContext().Stores, "Id", "Name");
        }
    }
}