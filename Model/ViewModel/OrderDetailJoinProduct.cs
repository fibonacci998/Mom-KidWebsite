using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class OrderDetailJoinProduct
    {
        public long ProductID { get; set; }

        public long OrderID { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }

        public string NameProduct { get; set; }
        public string CodeProduct { get; set; }
        public string ImageProduct { get; set; }
            
    }
}
