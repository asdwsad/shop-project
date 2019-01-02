using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
using ShopManageProject.Models.DAO;
namespace ShopManageProject.Service
{
    public class ProductCategoryService
    {
        private ProductCategoryDAO pd = new ProductCategoryDAO();
        public IEnumerable<ProductCategory> ListProductCategory()
        {
            return pd.ListProductCategory();
        }

        public ProductCategory search(long? id)
        {
            return pd.search(id);
        }
    }
}