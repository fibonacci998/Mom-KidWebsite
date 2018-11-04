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
        OnlineShopDbContext db = null;
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineShopDbContext"].ConnectionString;
        public StaticDAO()
        {
            db = new OnlineShopDbContext();
        }

        public Dictionary<string,int> GetListRevenue()
        {
            Dictionary<string, int> map = new Dictionary<string, int>();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(@"SELECT CAST(CreatedDate AS DATE) AS Date,SUM(Price) AS Price FROM dbo.[Order] JOIN dbo.OrderDetail 
            ON OrderID=ID GROUP BY CAST(CreatedDate AS DATE)", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                string dateTimeString = ((DateTime)dr["Date"]).ToString("yyyy-MM-dd");
                //DateTime datetime = DateTime.Parse(dateTimeString);
                DateTime datetime = (DateTime)dr["Date"];
                int price = Convert.ToInt32(dr["Price"]);
                if (!map.ContainsKey(dateTimeString))
                {
                    map.Add(dateTimeString, price);
                }else
                {
                    map.Add(dateTimeString, map[dateTimeString] + price);
                }
            }
            return map;
        }
    }
}
