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
            Session.Remove("GroupID");
            Session.Remove("GroupName");

            //Session.RemoveAll();
            return View();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UsersLogin u)
        {
            var user = loginService.Login(u);
            bool checkLogin = loginService.CheckLogin(u);
            

            if (checkLogin && ModelState.IsValid)
            {

                if (u.Remember)
                {
                    Session["UserName"] = user.UserName;
                    Session["Password"] = user.Password;
                }
                else if (!u.Remember)
                {
                    Session.Remove("UserName");
                    Session.Remove("Password");
                }

                Session["UserID"] = user.UserId;
                Session["Name"] = user.Name;
                Session["GroupID"] = user.GroupId;
                Session["GroupName"] = user.UserGroup.Name;
                // check user group
                foreach (var item in loginService.group())
                {
                    if (item.Name == user.UserGroup.Name)
                    {
                        if (item.Name == "Admin")
                        {
                            return RedirectToAction("ProductList", "Admin");
                        }
                        else if (item.Name == "User")
                        {
                            if (Session["Productid"] != null)
                            {
                                return RedirectToAction("Details", "Products", new { id = int.Parse(Session["ProductId"].ToString())});
                            }
                            return RedirectToAction("Index", "Products");
                        }
                    }
                }
            }
            else if(!checkLogin && ModelState.IsValid)
            {
                ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
            }

            return View();
        }
    }
}


