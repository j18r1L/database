USE master
GO

ALTER DATABASE master SET TRUSTWORTHY ON;
EXEC sp_configure 'clr enabled' , '1';  
RECONFIGURE; 

CREATE ASSEMBLY HandWrittenUDF
FROM
 'C:\Users\Марк\source\repos\HandWrittenUDF\HandWrittenUDF\bin\Debug\HandWrittenUDF.dll'
GO

CREATE FUNCTION GetRandomNumber ()
RETURNS INT
AS
EXTERNAL NAME
HandWrittenUDF.[HandWrittenUDF.UserDefinedFunctions].GetRandomNumber
GO

SELECT dbo.GetRandomNumber() AS RandomNumbe
GO