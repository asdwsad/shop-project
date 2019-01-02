using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopManageProject.Models.CartItem
{
    [Serializable]
    public class CartItem
    {
       
        public Product Product { get; set; }
        public int quantity { get; set; }
    }
}