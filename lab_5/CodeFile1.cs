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

            settings.Schemas.Add(@"..\\citiesXSD.xsd");
            settings.ValidationType = ValidationType.Schema;
            Console.WriteLine("dfs");
            XmlReader reader = XmlReader.Create(@"..\\cities.xml", settings);
            XmlDocument document = new XmlDocument();
            document.Load(reader);
            Console.WriteLine("dfs");
            ValidationEventHandler eventHandler = new ValidationEventHandler(ValidationEventHandler);
            Console.WriteLine("exit^ working");
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

