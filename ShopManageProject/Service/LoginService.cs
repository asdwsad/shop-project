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
            if (userDAO.Login(u) != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int Check(UsersLogin u)
        {
            var us = userDAO.Login(u);
            if (us != null)
            {
                if (us.UserName.Equals(u.UserName) && !us.Password.Equals(u.Password))
                {
                    return 0;
                }
                return 1;
            }
            
            return 0;
        }

        public Users Login(UsersLogin u)
        {
            return userDAO.Login(u);
        }
        }
}