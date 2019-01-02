using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopManageProject.Models;
using ShopManageProject.Models.CartItem;
using ShopManageProject.Service;
using PagedList;

namespace ShopManageProject.Controllers
{
    public class OrdersController : Controller
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();
        OrderService orderService = new OrderService();
        ProductsService productsService = new ProductsService();

        public ActionResult GetOrderByUser(long? userId,int ?page)
        {
            var orders = orderService.getOrderbyUser(userId);
            int pageNumber = (page ?? 1);

            orders = orders.ToList().ToPagedList(pageNumber, 10);

            return View(orders);
        }

        public ActionResult GetOrderDetail(long orderId)
        {
            var orderDetail = orderService.getListOrderDetail(orderId);
            return View(orderDetail.ToList());
        }
        // GET: Orders/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orders orders = orderService.detail(id);
            if (orders == null)
            {
                return HttpNotFound();
            }
            return View(orders);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "UserId", "UserName");
            return View();
        }



        private string cartSession = "cart";

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderId,ShipName,ShipMobile,ShipAddress,ShipEmail")] Orders orders)
        {
            long OrderId=0;
            var list = (List<CartItem>)Session[cartSession];


            if (ModelState.IsValid)
            {
                orders.UserId = long.Parse( Session["UserID"].ToString());
                orders.Status = false;
                orders.CreateDate = DateTime.Now;
                orderService.CreateOrder(orders);

                foreach( var item in orderService.getOrder())
                {
                   OrderId = item.OrderId;
   
                }

                foreach(var item in list)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderId = OrderId;
                    orderDetail.ProductId = item.Product.ProductId;
                    orderDetail.Quanlity = item.quantity;
                    orderDetail.Price = item.Product.PromotionPrice * item.quantity;
                    orderService.CreateOrderDetail(orderDetail);

                    Product product = productsService.detail(item.Product.ProductId);

                    product.Quanlity -= item.quantity;
                    product.CreateDate = DateTime.Now;
                    productsService.editProduct(product);

                    

                }
                Session.Remove("count");
                Session.Remove("product");
                //Session.Remove(cartSession);
                return RedirectToAction("Details", new { id = OrderId});
                //return RedirectToAction("Index", "Products");

            }

            return View(list);
        }

        public ActionResult AcceptOrder(long orderId)
        {
            if (ModelState.IsValid)
            {
                orderService.updateOrder(orderId);
                return RedirectToAction("GetOrderByUser", new { userId = Session["UserID"].ToString()});
            }

            return View();
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orders orders = db.Orders.Find(id);
            if (orders == null)
            {
                return HttpNotFound();
            }
          
            return View(orders);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderId,CreateDate,UserId,ShipName,ShipMobile,ShipAddress,ShipEmail,Status")] Orders orders)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orders).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("GetOrderByUser", new { userId = Session["UserID"].ToString() });
            }
            
            return View(orders);
        }

        // GET: Orders/Delete/5
        //public ActionResult Delete(long? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Orders orders = db.Orders.Find(id);
        //    if (orders == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(orders);
        //}

        //// POST: Orders/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(long id)
        //{
        //    Orders orders = db.Orders.Find(id);
        //    db.Orders.Remove(orders);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
