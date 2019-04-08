using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Linq.Mapping;

namespace ConsoleApp1
{
    [Table(Name = "DATEANDTIME")]
    public class DATEANDTIME
    {
        [Column]
        public int id_d { get; set; }
        [Column]
        public DateTime dates { get; set; }
        [Column]
        public string dayw { get; set; }
        [Column]
        public DateTime times { get; set; }
        [Column]
        public int tip { get; set; }
    }

    [Table(Name = "SOTRUDNIKI")]
    public class SOTRUDNIKI
    {
        [Column]
        public int id_s { get; set; }
        [Column]
        public string fio { get; set; }
        [Column]
        public DateTime datebirth { get; set; }
        [Column]
        public string otdel { get; set; }
        [Column]
        public int FilialID { get; set; }
    }
}
