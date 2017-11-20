using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;
using MyApi.Core;
using MyApi.Core.Domain;
using Newtonsoft.Json;

namespace MyApi.Areas.Admin.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        public async Task<ActionResult> Index(string from, string to)
        {
            var client = new HttpClient();
            
            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/orders");
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();

            var orders = JsonConvert.DeserializeObject<List<Order>>(responBody);

            if (!string.IsNullOrEmpty(from) && !string.IsNullOrEmpty(to))
            {
                ViewBag.From = from;
                ViewBag.To = to;
                orders = orders.Where(
                    x => DateTime.ParseExact(x.OrderDate.ToShortDateString(), "dd/MM/yyyy", CultureInfo.InvariantCulture) >= DateTime.ParseExact(from.ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture)
                         && DateTime.ParseExact(x.OrderDate.ToShortDateString(), "dd/MM/yyyy", CultureInfo.InvariantCulture) <= DateTime.ParseExact(to.ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture)).ToList();
            }

            return View(orders);
        }

        public async Task<ActionResult> View(long id)
        {
            var client = new HttpClient();

            var response = await client.GetAsync(EndPointBase.EndPoint + "/api/orders/"+ id);
            response.EnsureSuccessStatusCode();
            var responBody = await response.Content.ReadAsStringAsync();

            var orders = JsonConvert.DeserializeObject<Order>(responBody);
            
            return View(orders);
        }

    }
}