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
        OnlineShopDbContext db = null;
        public OrderDAO()
        {
            db = new OnlineShopDbContext();
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
    }
}
