using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using OnlineShop.Areas.Admin.Models;
using PagedList;
namespace OnlineShop.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(int page=1, int pageSize=10)
        {
            var dao = new ProductDAO();
            var model = dao.listAllPaging(page,pageSize);
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            PopulateCategoryDropDownList();
            return View("Create");
        }
        void PopulateCategoryDropDownList(object selectedCategory=null)
        {
            SelectList list = new SelectList(new ProductCategoryDAO().selectAll(),"ID","Name",selectedCategory);
            ViewBag.CategoryID = list;
        }
        [HttpPost]
        public ActionResult Create(Product product)
        {
            var dao = new ProductDAO();
            dao.Insert(product);
            PopulateCategoryDropDownList(product.CategoryID);
            return View("Create");
        }

        public ActionResult Edit(int id)
        {
            var product = new ProductDAO().ViewDetail(id);
            return View(product);
        }
        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDAO();
                bool result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user thất bại");
                }
            }
            return View("Index");
        }
    }
}