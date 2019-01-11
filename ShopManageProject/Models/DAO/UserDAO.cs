using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public List<UserGroup> group()
        {
            return db.UserGroup.ToList();
        }

        public void createUser(Users u)
        {
            db.Users.Add(u);
            db.SaveChanges();
        }
        public void editUser(Users u)
        {
            db.Entry(u).State = EntityState.Modified;
            db.SaveChanges();
        }


    }
}