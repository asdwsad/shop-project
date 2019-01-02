using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models.DAO;
using ShopManageProject.Models;
namespace ShopManageProject.Service
{
    public class OrderService
    {
        OrderDao orderDao = new OrderDao();
        public void CreateOrder(Orders orders)
        {
            orderDao.CreateOrder(orders);
        }

        public void CreateOrderDetail(OrderDetail orderDetail)
        {
            orderDao.CreateOrderDetail(orderDetail);
        }

        public Orders detail(long? id)
        {
            return orderDao.detail(id);
        }

        public IEnumerable<Orders> getOrder()
        {
           
            return orderDao.getOrder();
        }
        public IEnumerable<Orders> getOrderbyUser(long? userId)
        {
            IEnumerable<Orders> list = orderDao.getOrder();
            List<Orders> filter =new List<Orders>();
            foreach (var item in list)
            {
                if (item.UserId == userId)
                {
                    filter.Add(item);
                }
            }

            return filter;
        }

        public List<OrderDetail> getListOrderDetail(long orderId)
        {
            List<OrderDetail> list = orderDao.getListOrderDetail();

            List<OrderDetail> filter = new List<OrderDetail>();
            foreach (var item in list)
            {
                if (item.OrderId == orderId)
                {
                    filter.Add(item);
                }
            }

            return filter;
        }
        public void updateOrder(long orderId)
        {
            IEnumerable<Orders> list = orderDao.getOrder();
            Orders orders=new Orders();
            foreach (var item in list)
            {
                if (item.OrderId == orderId)
                {
                    item.Status = true;
                    orders = item;
                    break;
                }
            }

            orderDao.updateOrder(orders);
        }
    }
}