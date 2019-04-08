using System;
using System.Xml;
using System.Xml.Schema;
using System.Xml.XPath;


class XPathValidation
{
    static void Main()
    {
        try
        {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.Schemas.Add("urn:MyUri", "C:\Users\Марк\Documents\SQL Server Management Studio\lab5\citiesXSD.xsd");
            settings.ValidationType = ValidationType.Schema;
            Console.WriteLine("dfs");
            XmlReader reader = XmlReader.Create("C:\Users\Марк\Documents\SQL Server Management Studio\lab5\cities.xml", settings);
            XmlDocument document = new XmlDocument();
            document.Load(reader);
            Console.WriteLine("dfs");
            ValidationEventHandler eventHandler = new ValidationEventHandler(ValidationEventHandler);
            Console.WriteLine("THATS WORKING!!!!");
            // the following call to Validate succeeds
            document.Validate(eventHandler);
            Console.ReadLine();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        Console.ReadLine();
    }



    static void ValidationEventHandler(object sender, ValidationEventArgs e)
    {
        switch (e.Severity)
        {
            case XmlSeverityType.Error:
                Console.WriteLine("Error: {0}", e.Message);
                break;
            case XmlSeverityType.Warning:
                Console.WriteLine("Warning {0}", e.Message);
                break;
        }
        Console.ReadLine();
    }
}