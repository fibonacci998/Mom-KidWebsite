using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ProductCategoryDAO
    {
        OnlineShopDbContext db = null;
        public ProductCategoryDAO()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<ProductCategory> selectAll()
        {
            IQueryable<ProductCategory> list = db.ProductCategories;
            return list;
        }
        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategories.Find(id);
        }
    }
}
