using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Model.Dao
{
    public class ProductDAO
    {
        OnlineShopDbContext db = null;
        public ProductDAO()
        {
            db = new OnlineShopDbContext();
        }
        public bool Insert(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
            return true;
        }

        public IEnumerable<Product> listAllPaging(int page, int pageSize)
        {
            return db.Products.OrderByDescending(x=>x.ID).ToPagedList(page,pageSize);
        }
    }
}
