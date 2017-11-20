using System.Web.Mvc;

namespace MyApi.Areas.Admin.Controllers
{
    public class StoresController : Controller
    {
        // GET: Admin/Store
        public ActionResult Index()
        {
            return View();
        }
    }
}