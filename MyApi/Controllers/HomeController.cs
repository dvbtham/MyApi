using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using MyApi.Core;
using MyApi.Core.Domain;
using Newtonsoft.Json;

namespace MyApi.Controllers
{
    public class HomeController : Controller
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

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}