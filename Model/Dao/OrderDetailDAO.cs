using Model.EF;
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
        public List<OrderDetail> getOrderDetail(long id)
        {
            List<OrderDetail> orderDetail = (List < OrderDetail > )db.OrderDetails.Where(x => x.OrderID == id).ToList();
            return orderDetail;
        }
    }
}
