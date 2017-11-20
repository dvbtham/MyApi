using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using AutoMapper;
using Microsoft.AspNet.Identity;
using MyApi.Core;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using MyApi.Persistence;
using Newtonsoft.Json;
using Constants = MyApi.Core.Constants;

namespace MyApi.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            if (Session[Constants.CartSession] == null)
            {
                Session[Constants.CartSession] = new List<CartViewModel>();
            }
            var cart = new CartViewModel();

            return View(cart);
        }

        public JsonResult GetAll()
        {
            if (Session[Constants.CartSession] == null)
            {
                Session[Constants.CartSession] = new List<CartViewModel>();
            }
            var cart = (List<CartViewModel>)Session[Constants.CartSession];

            return Json(new
            {
                status = true,
                data = cart
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public async Task<JsonResult> Add(long productId)
        {
            var httpClient = new HttpClient();
            var cart = (List<CartViewModel>)Session[Constants.CartSession];
            var responseMessage = await httpClient.GetAsync(EndPointBase.EndPoint + "/api/products/" + productId);

            if (responseMessage.IsSuccessStatusCode)
            {
                var responBody = await responseMessage.Content.ReadAsStringAsync();
                var product = JsonConvert.DeserializeObject<Product>(responBody);

                if (cart == null)
                {
                    cart = new List<CartViewModel>();
                }

                if (product.Quantity == 0)
                {
                    return Json(new
                    {
                        status = false,
                        message = "This product is run out of stock."
                    });
                }

                if (cart.Any(x => x.ProductId == productId))
                {
                    foreach (var item in cart)
                    {
                        if (item.ProductId == productId)
                            item.Quantity += 1;
                    }
                }
                else
                {
                    var newItem = new CartViewModel
                    {
                        ProductId = productId,
                        Product = Mapper.Map<Product, ProductViewModel>(product),
                        Quantity = 1
                    };
                    cart.Add(newItem);
                }
                Session[Constants.CartSession] = cart;
                return Json(new
                {
                    status = true
                });
            }
            return Json(new
            {
                status = false,
                message = "Add to cart failed"
            });
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult Update(string cartData)
        {
            var cartViewModel = new JavaScriptSerializer().Deserialize<List<CartViewModel>>(cartData);
            var cartSession = (List<CartViewModel>)Session[Constants.CartSession];
            foreach (var item in cartSession)
            {
                foreach (var jitem in cartViewModel)
                {
                    if (item.ProductId == jitem.ProductId)
                    {
                        item.Quantity = jitem.Quantity;
                    }
                }
            }

            Session[Constants.CartSession] = cartSession;

            return Json(new
            {
                status = true
            });
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult DeleteItem(int productId)
        {
            var cartSession = (List<CartViewModel>)Session[Constants.CartSession];
            if (cartSession == null)
                return Json(new
                {
                    status = false
                });
            cartSession.RemoveAll(x => x.ProductId == productId);
            return Json(new
            {
                status = true
            });
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult DeleteAll()
        {
            DeleteCart();
            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        [Authorize]
        public async Task<ActionResult> CreateOrder(string orderViewModel)
        {
            var order = new JavaScriptSerializer().Deserialize<Order>(orderViewModel);

            order.ShipDate = DateTime.Now;
            order.OrderDate = DateTime.Now;
            order.UserId = User.Identity.GetUserId();
            bool isEnough = true;

            var cart = (List<CartViewModel>)Session[Constants.CartSession];
            var orderItems = new List<OrderItem>();
            foreach (var item in cart)
            {
                var detail = new OrderItem
                {
                    ProductId = item.ProductId,
                    Quantity = item.Quantity,
                    Amount = item.Quantity * item.Product.Price
                    
                };
                orderItems.Add(detail);
                isEnough = await IsEnough(item.ProductId, item.Quantity);
            }
            if (!isEnough)
                return Json(new
                {
                    status = false,
                    message = "This product is out of stock."
                });

            var context = new ApplicationDbContext();
            context.Orders.Add(order);
            context.SaveChanges();

            foreach (var item in orderItems)
            {
                item.OrderId = order.Id;
                context.OrderItems.Add(item);
            }
            context.SaveChanges();

            return Json(new
            {
                status = true,
                message = "Order success"
            });
        }
        private void DeleteCart()
        {
            Session[Constants.CartSession] = new List<CartViewModel>();
        }
        public async Task<bool> IsEnough(long productId, int quantity)
        {
            var httpClient = new HttpClient();
            var responseMessage = await httpClient.GetAsync(EndPointBase.EndPoint + "/api/products/" + productId);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responeBody = await responseMessage.Content.ReadAsStringAsync();
                var product = JsonConvert.DeserializeObject<Product>(responeBody);
                if (product.Quantity < quantity)
                    return false;
                product.Quantity -= quantity;
                return true;
            }

            return false;
        }
    }
}