using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Category(long id)
        {
            var category = new ProductCategoryDAO().ViewDetail(id);
            ViewBag.Category = category;
            var model = new ProductDAO().listByCategoryId(id);
            return View(model);
        }
        public ActionResult Detail(long id)
        {
            var product = new ProductDAO().ViewDetail(id);
            ViewBag.Category = new ProductCategoryDAO().ViewDetail(product.CategoryID.Value);
            ViewBag.Related = new ProductDAO().ListRelatedProduct(id);
            return View(product);
        }
    }
}