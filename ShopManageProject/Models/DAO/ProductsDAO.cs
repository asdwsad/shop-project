using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
namespace ShopManageProject.Models.DAO
{


    public class ProductsDAO
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();

        public IEnumerable<Product> ListProduct()
        {
            return db.Product.ToList().OrderByDescending(p=>p.CreateDate);
        }

        public IEnumerable<Product> FilterProduct(long? id)
        {
            return db.Product.Where(pr => pr.ProductCategoryId == id).OrderByDescending(p => p.CreateDate);
        }

        public Product details(long? id)
        {
            return db.Product.Find(id);
        }

        public IEnumerable<Product> Search(string search)
        {
            return db.Product.Where(p => p.Name.ToLower().Contains(search.ToLower())).ToList().OrderByDescending(p => p.CreateDate);
        }

        public void CreateProduct(Product product)
        {
            db.Product.Add(product);
            db.SaveChanges();
        }

        public void editProduct(Product product)
        {
            db.Entry(product).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void deleteProduct(long? id)
        {
            Product product = db.Product.Find(id);
            db.Product.Remove(product);
            db.SaveChanges();
        }

    }
}