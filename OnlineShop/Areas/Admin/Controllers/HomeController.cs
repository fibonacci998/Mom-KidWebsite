﻿using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var staticDAO = new StaticDAO();
            Dictionary<string, int> revenue = staticDAO.GetListRevenue();
            Dictionary<string, int> topProduct = staticDAO.GetTopSellProduct();
            ViewBag.revenue = revenue;
            ViewBag.top = topProduct;
            return View();
        }
    }
}