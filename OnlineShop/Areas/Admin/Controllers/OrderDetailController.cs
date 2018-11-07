using Model.Dao;
using Model.EF;
using Model.ViewModel;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class OrderDetailController : BaseController
    {
        // GET: Admin/OrderDetail
        public ActionResult Index(int id)
        {
            List<OrderDetailJoinProduct> order = new List<OrderDetailJoinProduct>();
            order = new OrderDetailDAO().getOrderDetail(id);
            return View(order);
        }
    }
}