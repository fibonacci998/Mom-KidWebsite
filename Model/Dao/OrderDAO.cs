using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDAO
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineShopDbContext"].ConnectionString;
        OnlineShopDbContext db = null;
        public OrderDAO()
        {
            db = new OnlineShopDbContext();
        }
        public long insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }
        public IEnumerable<Order> listAllPaging(int page, int pageSize)
        {
            return db.Orders.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        public bool ChangStatus(long id)
        {
            var order = db.Orders.Find(id);
            order.Status = !order.Status;
            db.SaveChanges();
            return order.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var order = db.Orders.Find(id);
                db.Orders.Remove(order);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
    }
}
