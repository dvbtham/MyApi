using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;
using MyApi.Core;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using Newtonsoft.Json;

namespace MyApi.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductsController : BaseController
    {
        public async Task<ActionResult> Index()
        {
            var client = new HttpClient();

            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/products");
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();

            var products = JsonConvert.DeserializeObject<List<Product>>(responBody);

            return View(products);
        }

        public ActionResult Create()
        {
            var model = new ProductSaveViewModel { Heading = "Add new product" };
            return View("ProductForm", model);

        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(ProductSaveViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View("ProductForm", model);
            }
            using (var client = new HttpClient())
            {
                var myContent = JsonConvert.SerializeObject(model);
                var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                var responseMessage = await client.PostAsync(EndPointBase.EndPoint + "/api/products", byteContent);
                if (responseMessage.IsSuccessStatusCode)
                {
                    SetAlert("Data successfully saved.", "success");
                    return RedirectToAction("Index");
                }
                return View("ProductForm", model);
            }
        }

        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> Edit(long id)
        {
            var client = new HttpClient();
            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/products/" + id);
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();
            var product = JsonConvert.DeserializeObject<Product>(responBody);
            var model = new ProductSaveViewModel { Heading = "Update product" };
            Mapper.Map(product, model);
            return View("ProductForm", model);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Update(ProductSaveViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View("ProductForm", model);
            }
            using (var client = new HttpClient())
            {
                var myContent = JsonConvert.SerializeObject(model);
                var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                var responseMessage = await client.PutAsync(EndPointBase.EndPoint + "/api/products/" + model.Id, byteContent);
                if (responseMessage.IsSuccessStatusCode)
                {
                    SetAlert("Data successfully saved.", "success");
                    return RedirectToAction("Index");
                }
                return View("ProductForm", model);
            }
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> Delete(long id)
        {
            var client = new HttpClient();

            var response = await client.DeleteAsync(EndPointBase.EndPoint + "/api/products/" + id);
            return Json(response.IsSuccessStatusCode ? "Delete successfully" : "Delete failed");
        }
    }
}