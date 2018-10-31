using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class MenuDAO
    {
        OnlineShopDbContext db = null;
        public MenuDAO()
        {
            db = new OnlineShopDbContext();
        }

        public List<Menu> ListByGroupID(int groupId)
        {
            return db.Menus.Where(x => x.TypeID == groupId && x.Status==true).OrderBy(x=>x.DisplayOrder).ToList();
        }
    }
}
