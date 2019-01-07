using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
namespace ShopManageProject.Models.DAO
{
    public class OrderDao
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();
        public void CreateOrder(Orders orders)
        {
            db.Orders.Add(orders);
            db.SaveChanges();
        }

        public void deleteOrder(long ? id)
        {
            var order = db.Orders.Find(id);
            db.Orders.Remove(order);
          
        }


        public IEnumerable<Orders> getOrder()
        {
            return db.Orders.ToList();
        }
        public void CreateOrderDetail(OrderDetail orderDetail)
        {
            db.OrderDetail.Add(orderDetail);
            db.SaveChanges();
        }
        public Orders detail(long? id)
        {
            return db.Orders.Find(id);
        }

        public List<OrderDetail> getListOrderDetail()
        {
            return db.OrderDetail.ToList();
        }

        public void updateOrder(Orders orders)
        {
           
                db.Entry(orders).State = EntityState.Modified;
            //db.Orders.
                db.SaveChanges();
            
        }



    }
}