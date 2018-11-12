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
        public ActionResult Index(string searchString,int page=1, int pageSize=10)
        {
            var dao = new ProductDAO();
            var model = dao.listAllPaging(searchString,page,pageSize);
            ViewBag.SearchString = searchString;
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
            SetAlert("Thêm sản phẩm thành công", "success");
            return View("Create");
        }

        public ActionResult Edit(int id)
        {
            var product = new ProductDAO().ViewDetail(id);
            PopulateCategoryDropDownList();
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
                    SetAlert("Sửa sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Sửa sản phẩm thất bại");
                }
            }
            return View("Index");
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            SetAlert("Xóa sản phẩm thành công", "success");
            new ProductDAO().Delete(id);
            return RedirectToAction("Index");
        }
    }
}