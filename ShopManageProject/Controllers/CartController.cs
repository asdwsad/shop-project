using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopManageProject.Models.CartItem;
using ShopManageProject.Models.DAO;
namespace ShopManageProject.Controllers
{
    public class CartController : Controller
    {
        static int count;
        // GET: Cart
        private string cartSession = "cart";
        public ActionResult Index()
        {
            var cart = Session[cartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;

            }

            return View(list);
        }

        public ActionResult deleteItem(long id)
        {
            Session.Remove("count");
            

            var cart = (List<CartItem>)Session[cartSession];

            cart.RemoveAll(x => x.Product.ProductId == id);
            Session[cartSession] = cart;
            foreach (var item in cart)
            {
                Session["count"] = item.quantity;
                
            }


            return RedirectToAction("Index");
        }

        public ActionResult deleteAllItem()
        {
            Session.Remove("count");
            count = 0;
            Session.Remove(cartSession);

            return RedirectToAction("Index");
        }

        public ActionResult AddItem(long ProductId, int Quantity)
        {
            ProductsDAO pd = new ProductsDAO();
            var product = pd.details(ProductId);

            //Session["count"] = Quantity;


            if(Session["UserID"] == null)
            {
               return RedirectToAction("Login", "Login");
            }

            var cart = Session[cartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ProductId == ProductId))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ProductId == ProductId)
                        {
                            item.quantity += Quantity;
                            count += Quantity;
                            
                        }

                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.quantity = Quantity;

                    count += Quantity;

                    list.Add(item);
                }
                Session[cartSession] = list;
            }
            else
            {
                var item = new CartItem();
                item.Product = product;
                item.quantity = Quantity;

                count += Quantity;

                var list = new List<CartItem>();
                list.Add(item);
                Session[cartSession] = list;
            }


            //count += int .Parse(Session["count"].ToString());

            Session["count"] = count;
            if (Session["ProductId"] != null)
            {
                return RedirectToAction("Details", "Products", new { id = Session["ProductId"].ToString() });
            }
            

            return RedirectToAction("Index");
        }
    }
}