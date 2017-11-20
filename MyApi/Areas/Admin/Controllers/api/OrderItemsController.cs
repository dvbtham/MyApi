using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using MyApi.Core.Domain;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers.api
{
    public class OrderItemsController : ApiController
    {
        private readonly ApplicationDbContext _context;

        public OrderItemsController()
        {
            _context = new ApplicationDbContext();
        }
        public OrderItem Get(long id)
        {
            var orderItem = _context.OrderItems.Include(x => x.Order).Include(x => x.Product).SingleOrDefault(x => x.OrderId == id);

            return orderItem;
        }
    }
}
