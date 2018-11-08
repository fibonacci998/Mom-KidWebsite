using Model.Dao;
using Model.EF;
using OnlineShop.Common;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            var controll = new UserProcess();
            ViewBag.Login = new UserProcess().LoginViewModel;
            ViewBag.Register = new UserProcess().RegisterViewModel;
            return View();
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            Session[CommonConstants.CartSession] = null;
            return Redirect("/");
        }
        
        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                if (dao.CheckUsername(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }else
                {
                    var user = new User();
                    user.Username = model.UserName;
                    user.Name = model.Name;
                    user.Password = Encryptor.MD5Hash(model.Password);
                    user.Phone = model.Phone;
                    user.Address = model.Address;
                    user.Email = model.Email;
                    user.CreatedDate = DateTime.Now;
                    user.Status = true;
                    var result=dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng kí thành công";
                        model = new RegisterModel();
                    }else
                    {
                        ModelState.AddModelError("", "Đăng kí không thành công");
                    }
                }
            }
            return View("~/Views/User/Index.cshtml");
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                var result = dao.LoginNormal(model.Username, Encryptor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetByID(model.Username);
                    var userSession = new UserLogin();
                    userSession.Username = user.Username;
                    userSession.UserID = user.ID;

                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }else
            {

            }
            return View("~/Views/User/Index.cshtml");
        }
    }
}