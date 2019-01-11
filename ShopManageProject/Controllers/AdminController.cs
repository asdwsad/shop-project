using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using ShopManageProject.Models;
using ShopManageProject.Models.CartItem;
using ShopManageProject.Service;
using PagedList;
using System.Data.Entity;

namespace ShopManageProject.Controllers
{
    

    public class AdminController : Controller
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();
        private ProductsService productsService = new ProductsService();
        private ProductCategoryService productCategoryService = new ProductCategoryService();

        // GET: Admin
        public ActionResult ProductList(int? page)
        {
            if (Session["GroupID"] == null||!Session["GroupID"].ToString().Equals("11111"))
            {
                return RedirectToAction("Login", "Login");
            }
            var product = productsService.ListProduct();

            int pageNumber = (page ?? 1);

            product = product.ToList().ToPagedList(pageNumber, 5);
            ViewData["productList"] = product;

            return View(product);
        }


        public ActionResult CreateProduct()
        {
            ViewBag.ProductCategoryId = new SelectList(db.ProductCategory, "ProductCategoryId", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateProduct([Bind(Include = "ProductId,Name,Code,Description,Image,Price,PromotionPrice,Quanlity,ProductCategoryId,CreateDate")] Product product)
        {
            if (Session["GroupID"] == null || !Session["GroupID"].ToString().Equals("11111"))
            {
                return RedirectToAction("Login", "Login");
            }

            if (ModelState.IsValid)
            {
                product.CreateDate = DateTime.Now;
                productsService.CreateProduct(product);
                return RedirectToAction("ProductList");
            }

            ViewBag.ProductCategoryId = new SelectList(db.ProductCategory, "ProductCategoryId", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult EditProduct(long? id)
        {
            if (Session["GroupID"] == null || !Session["GroupID"].ToString().Equals("11111"))
            {
                return RedirectToAction("Login", "Login");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductCategoryId = new SelectList(db.ProductCategory, "ProductCategoryId", "Name", product.ProductCategoryId);
            return View(product);
        }

        // POST: Products/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProduct([Bind(Include = "ProductId,Name,Code,Description,Image,Price,PromotionPrice,Quanlity,ProductCategoryId,CreateDate")] Product product)
        {
            if (ModelState.IsValid)
            {
                product.CreateDate = DateTime.Now;
                productsService.editProduct(product);
                //db.Entry(product).State = EntityState.Modified;
                //db.SaveChanges();
                return RedirectToAction("ProductList");
            }
            ViewBag.ProductCategoryId = new SelectList(db.ProductCategory, "ProductCategoryId", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public ActionResult DeleteProduct(long? id)
        {
            if (Session["GroupID"] == null || !Session["GroupID"].ToString().Equals("11111"))
            {
                return RedirectToAction("Login", "Login");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("DeleteProduct")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
           
                db.Product.Remove(db.Product.Find(id));
                db.SaveChanges();
            
            return RedirectToAction("ProductList");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        //JsonResult
    }
}


  