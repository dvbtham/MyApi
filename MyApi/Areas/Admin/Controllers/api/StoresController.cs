using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using MyApi.Core.Domain;
using MyApi.Persistence;

namespace MyApi.Areas.Admin.Controllers.api
{
    public class StoresController : ApiController
    {
        private readonly ApplicationDbContext _context;

        public StoresController()
        {
            _context = new ApplicationDbContext();
        }
        public IEnumerable<Store> Get()
        {
            return _context.Stores.ToList();
        }

        public Store Get(long id)
        {
            return _context.Stores.SingleOrDefault(x => x.Id == id);
        }

        public IHttpActionResult Post([FromBody] Store store)
        {
            if (store == null) return BadRequest("store null");
            _context.Stores.Add(store);
            _context.SaveChanges();
            return Ok(store);
        }

        public Store Put(long id, [FromBody] Store store)
        {
            var storeSave = _context.Stores.SingleOrDefault(x => x.Id == id);
            if (store == null || storeSave == null) return new Store();

            storeSave.Name = store.Name;
            
            _context.SaveChanges();
            return storeSave;
        }

        public Store Delete(long id)
        {
            var store = _context.Stores.SingleOrDefault(x => x.Id == id);
            if (store == null) return new Store();
           
            _context.Stores.Remove(store);
            _context.SaveChanges();
            return store;
        }
    }
}
