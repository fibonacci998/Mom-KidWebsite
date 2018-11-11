using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: Admin/Order
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var dao = new OrderDAO();
            var model = dao.listAllPaging(page, pageSize);
            return View(model);
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new OrderDAO().ChangStatus(id);

            return Json(new
            {
                status = result
            });
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new OrderDAO().Delete(id);
            return RedirectToAction("Index");
        }
    }
}