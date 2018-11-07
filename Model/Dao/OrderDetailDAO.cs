using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDetailDAO
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineShopDbContext"].ConnectionString;
        OnlineShopDbContext db = null;
        public OrderDetailDAO()
        {
            db = new OnlineShopDbContext();
        }
        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetails.Add(detail);
                db.SaveChanges();
                return true;
            } catch(Exception e)
            {
                return false;
            }
            
        }
        public bool ChangStatus(long id)
        {
            var order = db.Orders.Find(id);
            order.Status = !order.Status;
            db.SaveChanges();
            return order.Status;
        }
        public List<OrderDetailJoinProduct> getOrderDetail(long id)
        {
            var orderDetail =
                from a in db.OrderDetails
                join b in db.Products
                on a.ProductID equals b.ID
                where a.OrderID == id
                select new OrderDetailJoinProduct()
                {
                    OrderID = a.OrderID,
                    Quantity = a.Quantity,
                    Price=a.Price,
                    ProductID=a.ProductID,
                    NameProduct=b.Name,
                    CodeProduct=b.Code,
                    ImageProduct=b.Image
                };
                
            return orderDetail.ToList();
        }
    }
}
