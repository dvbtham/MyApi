using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using AutoMapper;
using MyApi.Core.Domain;
using MyApi.Core.ViewModel;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers.api
{
    public class OrdersController : ApiController
    {
        private readonly ApplicationDbContext _context;

        public OrdersController()
        {
            _context = new ApplicationDbContext();
        }
        public IEnumerable<Order> Get()
        {
            var orders = _context.Orders.ToList();

            return orders;
        }

        public Order Get(long id)
        {
            return _context.Orders.Include(x => x.User).Include("OrderItems").SingleOrDefault(x => x.Id == id);
        }

        public IHttpActionResult Post([FromBody] Order order)
        {
            if (order == null) return BadRequest("Order null");
            _context.Orders.Add(order);
            _context.SaveChanges();
            return Ok(order);
        }

        public Order Put(long id, [FromBody] OrderSaveViewModel order)
        {
            var orderSave = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (order == null || orderSave == null) return new Order();

            Mapper.Map(order, orderSave);

            _context.SaveChanges();
            return orderSave;
        }

        public Order Delete(long id)
        {
            var order = _context.Orders.SingleOrDefault(x => x.Id == id);
            if (order == null) return new Order();

            _context.Orders.Remove(order);
            _context.SaveChanges();
            return order;
        }
    }
}
