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
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineShopDBContext"].ConnectionString;
        public StaticDAO()
        {
            db = new OnlineShopDbContext();
        }

        public Dictionary<string,int> GetListRevenue()
        {
            Dictionary<string, int> map = new Dictionary<string, int>();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(@"SELECT CAST(CreatedDate AS DATE) AS Date,SUM(Price) AS Price 
            FROM dbo.[Order] JOIN dbo.OrderDetail 
            ON OrderID=ID 
            where dbo.[Order].status=1
            GROUP BY CAST(CreatedDate AS DATE)", conn);
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
        public Dictionary<string, int> GetTopSellProduct()
        {
            Dictionary<string, int> map = new Dictionary<string, int>();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(@"SELECT Number,Name+' ,ID:'+ cast(ProductID as varchar(100)) AS [Name] FROM 
            (SELECT TOP 10 COUNT(*) AS Number,ProductID FROM 
            dbo.OrderDetail JOIN dbo.Product ON dbo.OrderDetail.ProductID=dbo.Product.ID
            GROUP BY ProductID) a JOIN dbo.Product ON a.ProductID=dbo.Product.ID", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                string name = dr["Name"].ToString();
                int number = Convert.ToInt32(dr["Number"]);
                if (!map.ContainsKey(name))
                    map.Add(name, number);
            }
            return map;
        }
    }
}
