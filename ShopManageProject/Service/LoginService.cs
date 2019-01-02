using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models.DAO;
using ShopManageProject.Models;
namespace ShopManageProject.Service
{
    public class LoginService
    {
        UserDAO userDAO = new UserDAO();
        public bool CheckLogin(UsersLogin u)
        {
            if (userDAO.Login(u)!=null)
            {
                return true;
            }
            return false;
        }

        public Users Login(UsersLogin u)
        {
            return userDAO.Login(u);
        }
        }
}