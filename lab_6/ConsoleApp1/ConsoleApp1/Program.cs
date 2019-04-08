using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.IO;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("MENU: \n 1 - Search \n 2 - Access \n 3 - Change \n Enter your choice:");
                int menu = Convert.ToInt32(Console.ReadLine());
                if (menu == 1)
                {
                    Search();
                }
                else if (menu == 2)
                {
                    access();
                }
                else if (menu == 3)
                {
                    change();
                }

            }
        }
        static void Search()
        {

            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../cities.xml", FileMode.Open);
            xDoc.Load(myFile);

            //1
            XmlNodeList names = xDoc.GetElementsByTagName("City");
            for (int i = 0; i < names.Count; i++)
                Console.Write(names[i].ChildNodes[0].Value + "\r\n");

            //2
            XmlDocument xDoc1 = new XmlDocument();
            FileStream myFile1 = new FileStream("../citiesW.xml", FileMode.Open);
            xDoc1.Load(myFile1);

            Console.WriteLine("ID to find: ");
            string ID_find = Console.ReadLine();
            XmlElement id = xDoc1.GetElementById(ID_find);
            if (id == null)
            {
                Console.Write("NULL");
                Console.Write(id);
            }
            else
                Console.Write(id.ChildNodes[0].InnerText + "\r\n");

            //3
            XmlNodeList sur = xDoc.SelectNodes("//row/City/text()[../City_id/text()<'5']");
            for (int i = 0; i < sur.Count; i++)
                Console.Write("\nSelect Nodes_1: " + sur[i].Value + "\r\n");
            XmlNodeList second = xDoc.SelectNodes("descendant::row[City_id = 5]");
            for (int i = 0; i < second.Count; i++)
                Console.Write("\nSelect Nodes_2: " + second[i].ChildNodes[1].ChildNodes[0].Value + "\r\n");

            //4
            XmlNode single = xDoc.SelectSingleNode("descendant::row[City_id < 5]");
            Console.Write("\nSelect Single: " + single.ChildNodes[1].ChildNodes[0].Value + "\r\n");
            myFile.Close();
            myFile1.Close();
        }
        static void access()
        {
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../cities.xml", FileMode.Open);
            xDoc.Load(myFile);
            
            //1
            Console.Write("Access to XmlElement, nodetype: " + xDoc.DocumentElement.NodeType + "\r\n");
            //2
            XmlNodeList second = xDoc.SelectNodes("descendant::row[City_id = 5]");
            Console.Write("Access to XmlText, nodetype: " + second[0].ChildNodes[1].ChildNodes[0].InnerText + "\r\n");
            //3 вроде тоже не работает
            foreach (XmlComment commentNode in xDoc.SelectNodes("//comment()"))
            {
                Console.Write("Access to comment: " + commentNode.Value);
            }
            //4 не работает
            XmlProcessingInstruction procIns = (XmlProcessingInstruction)xDoc.DocumentElement.ChildNodes[0];
            Console.Write("\n\nAccess to instruction: " + procIns.Name);
            //5
            second = xDoc.SelectNodes("descendant::row[City_id < 5]");
            for (int i = 0; i < second.Count; i++)
                Console.Write("\nAccess to attribute: " + second[i].ChildNodes[1].ChildNodes[0].Value + "\r\n");
            myFile.Close();
        }
        static void change()
        {
            //1
            XmlDocument xDoc = new XmlDocument();
            FileStream myFile = new FileStream("../cities.xml", FileMode.Open);
            xDoc.Load(myFile);

            XmlElement delete = (XmlElement)xDoc.GetElementsByTagName("City")[1];
            XmlNode parent = delete.ParentNode;
            parent.RemoveChild(delete);
            xDoc.Save("../delete.xml");
            //2 не работает
            xDoc = new XmlDocument();
            myFile.Close();
            myFile = new FileStream("../cities.xml", FileMode.Open);
            xDoc.Load(myFile);

            XmlNode single = xDoc.SelectSingleNode("descendant::row[City_id < 5]");
            Console.Write("\nBefore change: " + single.ChildNodes[1].ChildNodes[0].Value);
            single.ChildNodes[1].ChildNodes[0].Value = "asd";
            Console.Write("\nAfter change: " + single.ChildNodes[1].ChildNodes[0].Value + "\n");
            xDoc.Save("../change.xml");
            //3
            xDoc = new XmlDocument();
            myFile.Close();
            myFile = new FileStream("../cities.xml", FileMode.Open);
            xDoc.Load(myFile);

            single = xDoc.SelectSingleNode("descendant::row[City_id < 2]");
            XmlElement elementToAdd = xDoc.CreateElement("new");
            elementToAdd.AppendChild(xDoc.CreateTextNode("123"));
            single.AppendChild(elementToAdd);
            Console.Write("\nAdded: " + single.ChildNodes[2].InnerText + "\n");
            xDoc.Save("../addnew.xml");
            //4
            XmlElement attAdd = (XmlElement)single;
            attAdd.SetAttribute("newatt", "123");
            Console.Write("\nAfter change: " + single.Attributes[0].Name + "\n");
            xDoc.Save("../attAdd.xml");
            myFile.Close();
        }

    }
    
}
