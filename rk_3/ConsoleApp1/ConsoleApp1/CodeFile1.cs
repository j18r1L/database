using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Reflection;

namespace ConsoleApp1
{
    class Program
    {
        public static DataContext db;
        private static string connectionstring = @"Data Source = .\DESKTOP-IT4CJHN; Database = RK3; Integrated Security = true";
        static void Main(string[] args)
        {

            db = new DataContext(@"Data Source = .\DESKTOP-IT4CJHN; Database = RK3; Integrated Security = true");
            select1();
            //select2();
           // select3();
            select1ADO();
            //select2ADO();
            //select3ADO();


            Console.ReadLine();

        }
        
         

        //---------------
        static public void select1()
        {
 
            DateTime date1 = new DateTime(2019, 1, 18, 9, 00, 00);
            Table<DATEANDTIME> table1 = db.GetTable<DATEANDTIME>();
            Table<SOTRUDNIKI> table2 = db.GetTable<SOTRUDNIKI>();
            var query = from s in table1
                        join f in table2 on s.id_d equals f.id_s
                        where (s.times.TimeOfDay > date1.TimeOfDay) && (s.tip == 1)
                        select new { name = f.otdel };

            foreach (var item in query)
                Console.WriteLine(item + "    "); 
        }
        static public void select1ADO()
        {
            DateTime date1 = new DateTime(2019, 1, 18, 9, 00, 00);
            const string queryString = @"SELECT *
                                            FROM DATEANDTIME AS S JOIN SOTRUDNIKI AS F ON S.id_d = F.id_s
                                            WHERE DATEDIFF(times, date1) > 0 ";

            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open(); 

            SqlCommand command = new SqlCommand(queryString, connection);

            SqlDataReader dataReader = command.ExecuteReader();
            while (dataReader.Read())
                Console.WriteLine(dataReader[0].ToString());

            dataReader.Close();
            connection.Close();
        }
        //-----------------
        static public void select2()
        {

            DateTime date1 = new DateTime(2019, 1, 18, 9, 00, 00);
            Table<DATEANDTIME> table1 = db.GetTable<DATEANDTIME>();
            Table<SOTRUDNIKI> table2 = db.GetTable<SOTRUDNIKI>();
            var query = from s in table1
                        where (s.tip == 1)
                        group s by s.id_d into sotr
                        select new { name = sotr.Key, c = sotr.Count(), max = c.Max() };
             
            foreach (var item in query)
                Console.WriteLine(item + "    ");

        }

        static public void select2ADO()
        {
            
            const string queryString = @"SELECT MAX(I) AS t
                                            FROM  
                                            (
                                               SELECT COUNT(id_d) as I
                                               FROM DATEANDTIME AS S
                                               WHERE S.tip = 2 
                                            ) AS w";

            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();

            SqlCommand command = new SqlCommand(queryString, connection);

            SqlDataReader dataReader = command.ExecuteReader();
            while (dataReader.Read())
                Console.WriteLine(dataReader[0].ToString());

            dataReader.Close();
            connection.Close();
        }

        //--------------
        static public void select3()
        {
            DateTime date1 = new DateTime(2019, 1, 18, 9, 00, 00);
            Table<DATEANDTIME> table1 = db.GetTable<DATEANDTIME>();
            Table<SOTRUDNIKI> table2 = db.GetTable<SOTRUDNIKI>();
            var query = from s in table1
                        join f in table2 on s.id_d equals f.id_s
                        where s.times.TimeOfDay <= date1.TimeOfDay
                        group s.id_d by f.otdel
                        having  

            foreach (var item in query)
                Console.WriteLine(item + "    ");

        }

        static public void select3ADO()
        {
            DateTime date1 = new DateTime(2019, 1, 18, 9, 00, 00);
            const string queryString = @"SELECT Otdel
                                            FROM DATEANDTIME AS S JOIN SOTRUDNIKI AS F ON S.id_d = F.id_s
                                            GROUP BY S.Otdel
                                            HAVING 0 =
                                                  ( SELECT COUNT(id_d)
                                                    FROM DATEANDTIME
                                                    WHERE times > date1 AND tip == 1 )";
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();

            SqlCommand command = new SqlCommand(queryString, connection);

            SqlDataReader dataReader = command.ExecuteReader();
            while (dataReader.Read())
                Console.WriteLine(dataReader[0].ToString());

            dataReader.Close();
            connection.Close();
        }


        /*static public void select1()
            {
                Table<FilialT> table = db.GetTable<FilialT>();

                var query = from t in table
                            group t by t.Adress into searchadr
                            select new { name = searchadr.Key, c = searchadr.Count() };

                foreach (var item in query)
                    Console.WriteLine(item + "   ");
            }
            static public void select2()
            {
                Table<SotrT> table = db.GetTable<SotrT>();

                var query = from t in table
                            where DateTime.Now.Year - t.Rozhd.Year == 26
                            select t.FilialID;


                foreach (var item in query)
                    Console.WriteLine(item + "   ");
            }

            static public void select3()
            {
                Table<SotrT> table1 = db.GetTable<SotrT>();
                Table<FilialT> table2 = db.GetTable<FilialT>();

                var query = from s in table1
                            join f in table2 on s.FilialID equals f.FilialID
                            where f.Phone.IndexOf("7") == -1    
                            select new { name = f.NameF, names = s.Fio };

                foreach (var item in query)
                    Console.WriteLine(item + "   ");
            }


            static public void selectADO()
            {
                const string queryString = @"SELECT *
                                            FROM SotrT AS S JOIN FilialT AS F ON S.FilialID = F.FilialID
                                            WHERE CHARINDEX('7', f.Phone) = 0";

                SqlConnection connection = new SqlConnection(connectionstring);
                connection.Open();

                SqlCommand command = new SqlCommand(queryString, connection);

                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                    Console.WriteLine(dataReader[0].ToString());

                dataReader.Close();
                connection.Close();
            }
    //gavrilova_j_m@mail.ru
            static public void select2ADO()
            {
                const string queryString = @"SELECT * 
                                            FROM FilialT AS F JOIN 
                                            (	SELECT * 
                                                FROM SotrT
                                                WHERE DATEDIFF(year,SYSDATETIME(), Rozhd) = 26 
                                            ) AS S ON s.FilialID = f.FilialID 
                                            WHERE COUNT(S.FilialID) > 6 AND COUNT(S.FilialID) < 15";

                SqlConnection connection = new SqlConnection(connectionstring);
                connection.Open();

                SqlCommand command = new SqlCommand(queryString, connection);

                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                    Console.WriteLine(dataReader[0].ToString());

                dataReader.Close();
                connection.Close();
            }
            static public void select3ADO()
            {
                const string queryString = @"SELECT COUNT(FilialID) 
                                            FROM FilialT
                                            WHERE Adress IN (SELECT value FROM STRING_SPLIT(FilialT.Adress, ','));";

                SqlConnection connection = new SqlConnection(connectionstring);
                connection.Open();

                SqlCommand command = new SqlCommand(queryString, connection);

                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                    Console.WriteLine(dataReader[0].ToString());

                dataReader.Close();
                connection.Close();
            }
        */
    }
}
