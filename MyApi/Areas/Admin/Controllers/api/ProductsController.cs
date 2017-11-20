using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using MyApi.Core.Domain;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers.api
{
    public class ProductsController : ApiController
    {
        private readonly ApplicationDbContext _context;

        public ProductsController()
        {
            _context = new ApplicationDbContext();
        }

        public IEnumerable<Product> Get()
        {
            return _context.Products.ToList();
        }

        public Product Get(long id)
        {
            return _context.Products.SingleOrDefault(x => x.Id == id);
        }

        public IHttpActionResult Post([FromBody] Product product)
        {
            if (product == null) return BadRequest("product null");
            _context.Products.Add(product);
            _context.SaveChanges();
            return Ok(product);
        }

        public Product Put(long id, [FromBody] Product product)
        {
            var productSave = _context.Products.SingleOrDefault(x => x.Id == id);
            if (product == null || productSave == null) return new Product();

            productSave.Name = product.Name;
            productSave.Description = product.Description;
            productSave.Image = product.Image;
            productSave.OriginalPrice = product.OriginalPrice;
            productSave.Price = product.Price;
            productSave.Quantity = product.Quantity;
            productSave.Status = product.Status;

            _context.SaveChanges();
            return productSave;
        }

        public Product Delete(long id)
        {
            var product = _context.Products.SingleOrDefault(x => x.Id == id);
            if (product == null) return new Product();
            product.Status = false;
            _context.Products.Remove(product);
            _context.SaveChanges();
            return product;
        }
    }
}
