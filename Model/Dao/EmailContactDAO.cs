using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class EmailContactDAO
    {
        OnlineShopDbContext db = null;
        public EmailContactDAO()
        {
            db = new OnlineShopDbContext();
        }

        public bool UpdateMail(EmailContact email)
        {
            db.EmailContacts.Add(email);
            db.SaveChanges();
            return true;
        }
    }
}
