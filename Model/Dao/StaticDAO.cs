using Model.EF;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class StaticDAO
    {
        string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineShopDbContext"].ConnectionString;
        OnlineShopDbContext db = null;
        public StaticDAO()
        {
            db = new OnlineShopDbContext();
        }

        public Dictionary<DateTime,int> GetStaticRevenueByDate()
        {
            SqlConnection conn = new SqlConnection(conStr);
            Dictionary<DateTime, int> map = new Dictionary<DateTime, int>();

            SqlCommand cmd = new SqlCommand(@"SELECT CreatedDate AS Date,SUM(Price) AS Price FROM dbo.[Order] JOIN dbo.OrderDetail 
            ON OrderID=ID GROUP BY CreatedDate", conn );
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                DateTime date= DateTime.ParseExact(dr["Date"].ToString(), "yyyy-MM-dd",
                                        System.Globalization.CultureInfo.InvariantCulture);
                int price = Convert.ToInt32(dr["Price"].ToString());
                if (!map.ContainsKey(date))
                {
                    map.Add(date, price);
                }else
                {
                    map.Add(date, map[date] + price);
                }
                
            }
            return map;
        }
    }
}
