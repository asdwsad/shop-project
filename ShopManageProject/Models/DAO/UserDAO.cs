using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
namespace ShopManageProject.Models.DAO
{
    public class UserDAO
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();
        public Users Login(UsersLogin u)
        {
           return db.Users.Where(m => m.UserName.Equals(u.UserName) && m.Password.Equals(u.Password)).FirstOrDefault(); 
        }
    }
}