using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Dynamic;
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
    public class ProductsController : Controller
    {

        private ShopManageDBEntities db = new ShopManageDBEntities();
        private ProductsService productsService = new ProductsService();
        private ProductCategoryService productCategoryService = new ProductCategoryService();
        // GET: Products

        public ActionResult Index(long? id)
        {
            var product = productsService.ListProduct();

            if (id != null)
            {
                product = productsService.FilterProduct(id);
                Session["pcid"] = id;
            }

            var productCategory = productCategoryService.ListProductCategory();
            ViewData["product"] = product;
            ViewData["productCategory"] = productCategory;

            return View();
        }



        public ActionResult Filter(long? id, int? page)
        {
            var filterProduct = productsService.FilterProduct(id);
            var product = productsService.ListProduct();
            var productCategory = productCategoryService.ListProductCategory();
            ProductCategory Category = productCategoryService.search(id);

            int pageNumber = (page ?? 1);

            filterProduct = filterProduct.ToList().ToPagedList(pageNumber, 8);
            Session["CategoryName"] = Category.Name;
            ViewData["filterProduct"] = filterProduct;
            ViewData["product"] = product;
            ViewData["productCategory"] = productCategory;
            return View(filterProduct);
        }

        // GET: Products/Details/5
        public ActionResult Details(long? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = productsService.detail(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            Session["ProductId"] = id;
            return View(product);
        }


        public ActionResult AddToCart(Product p)
        {

            return View();
        }


        [HttpGet]
        public ActionResult Search(string SearchTerm, int? page)
        {
            Session.Remove("search");
            Session["search"] = SearchTerm.Trim();

            var productCategory = productCategoryService.ListProductCategory();

            ViewData["category"] = productCategory;

            var products = productsService.Search(SearchTerm.Trim());
            Session["countSearch"] = products.Count();
            int pageNumber = (page ?? 1);
            products = products.ToList().ToPagedList(pageNumber, 8);



            ViewBag.SearchTerm = SearchTerm;
            ViewData["searchProduct"] = products;

            return View(products);
        }
    }
}

       
       