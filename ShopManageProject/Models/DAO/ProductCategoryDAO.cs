using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
namespace ShopManageProject.Models.DAO
{
    public class ProductCategoryDAO
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();
        public IEnumerable<ProductCategory> ListProductCategory()
        {
            return db.ProductCategory.ToList();
        }

        public ProductCategory search(long? id)
        {
            return db.ProductCategory.Find(id);
        }
    }
}