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

        //public int Check(UsersLogin u)
        //{
        //    var us = userDAO.Login(u);
        //    if (us != null)
        //    {
                
        //        return 1;
        //    }

        //    return 0;
        //}

        public List<UserGroup> group()
        {
            return userDAO.group();
        }

        public Users Login(UsersLogin u)
        {
            return userDAO.Login(u);
        }

        public void createUser(Users u)
        {
            userDAO.createUser(u);
        }

        public void editUser(Users u)
        {
            userDAO.editUser(u);
        }
    }
}