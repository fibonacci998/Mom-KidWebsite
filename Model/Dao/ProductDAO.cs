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
        public Product ViewDetail(int id)
        {
            return db.Products.Find(id);
        }
        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ID);
                product.Quantity = entity.Quantity;
                product.Price = entity.Price;
                product.ModifiedDate = DateTime.Now;
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
