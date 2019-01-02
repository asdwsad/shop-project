using ShopManageProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopManageProject.Service;
using ShopManageProject.Models.DAO;
namespace ShopManageProject.Controllers
{
    public class LoginController : Controller
    {

        LoginService loginService = new LoginService();
        //UserDAO userDAO = new UserDAO();

        public ActionResult Login()
        {
            Session.Remove("UserID");
            Session.Remove("Name");
            //Session.RemoveAll();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UsersLogin u)
        {
            var user = loginService.Login(u);
            bool checkLogin = loginService.CheckLogin(u);

            if (checkLogin && ModelState.IsValid)
            {
                //  ID = user.UserId;
                Session["UserID"] = user.UserId;
                Session["Name"] = user.Name;
               
                if (Session["Productid"] != null)
                {
                    return RedirectToAction("Details", "Products", new { id = int.Parse(Session["ProductId"].ToString()) });
                }
                return RedirectToAction("Index", "Products");
            }
            else
            {
                ModelState.AddModelError("", "Username or password is not correct!");
            }

            return View(u);
        }
    }
}


