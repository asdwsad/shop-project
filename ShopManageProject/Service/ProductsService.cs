using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopManageProject.Models;
using ShopManageProject.Models.DAO;
namespace ShopManageProject.Service
{
    public class ProductsService
    {
        private ProductsDAO pd = new ProductsDAO();
       public IEnumerable<Product> ListProduct()
        {
            return pd.ListProduct();
        }


        public IEnumerable<Product> FilterProduct(long? id)
        {
            return pd.FilterProduct(id);
        }

        public Product detail(long? id)
        {
            return pd.details(id);
        }

        public IEnumerable<Product> Search(string search)
        {
            return pd.Search(search);
        }

        public void CreateProduct(Product product)
        {
            pd.CreateProduct(product);
        }

        public void editProduct(Product product)
        {
            pd.editProduct(product);
        }

        public void deleteProduct(long? id)
        {
            pd.deleteProduct(id);
        }

    }
}