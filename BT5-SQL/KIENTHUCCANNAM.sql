

-- KIÊN THỨC CẦN NẮM
-- - Sử dụng các hàm xử lý chuỗi: LEFT, RIGHT, RTRIM, SUBTRING, REPLACE, REPLICATE, STUFF,
-- CHARINDEX, PATINDEX

USE AdventureWorks2012;
GO
-- LEFT  -- GET LETTER FROM THE LEFTMOST OF STRING,
-- SELECT LEFT(Name,5),Name
-- FROM Production.Product
-- ORDER BY ProductID;

--  RIGHT  --GET LETTER FROM THE RIGHTMOST OF STRING,

--SELECT RIGHT('MOUTAIN BIKE', 4);

--   RTRIM,
--SELECT RTRIM('Four spaces are after the period in this sentence.    ')+' Next string.';
--    SUBTRING,
/* TODO */
--SELECT SUBSTRING('elephant', 4, 2);

--     REPLACE,
--SELECT REPLACE('Mountain Bike', 'Mountain', 'All Terrain');

--      REPLICATE,
--SELECT REPLICATE('Mountain Bike ', 3);

--       STUFF,
--SELECT STUFF('abcdef', 2, 3, 'ijklmn');
GO

--  CHARINDEX,
--DECLARE @document VARCHAR(64);
--SELECT @document='Reflectors are vital safety'+' components of your bicycle.';
--SELECT CHARINDEX('bicycle', @document);
--GO

--   PATINDEX
--SELECT position=PATINDEX('%ter%', 'interesting data');
--SELECT position=PATINDEX('%ensure%', DocumentSummary)
--FROM Production.Document;
--WHERE DocumentNode = 0x7B40;  
--GO
--SELECT DocumentSummary
--FROM Production.Document
--WHERE DocumentNode = 0x7B40;

-- - Sử dụng các hàm xử lý thời gian: DATE, DATEDIFF, DATAPART, YEAR, MONTH, DAY,
-- FORMATDATETIME
--SELECT FORMAT(CURRENT_TIMESTAMP, 'dd-MM-yyyy hh:mm:ss tt');

--DATE, 
--DROP TABLE IF EXISTS #tblTemp
--CREATE TABLE #tblTemp
--(
--    Date1 DATE,
--)
--INSERT INTO #tblTemp
--(
--    Date1 
--)
--VALUES
--('20121231' -- Date - date
--    ),
--('20130101')
--SELECT *
--FROM #tblTemp

--DECLARE @_maxDate DATE,
--        @_minDate DATE
--SELECT @_maxDate = MAX(Date1),
--       @_minDate = MIN(Date1)
--FROM #tblTemp

--SELECT DATEDIFF(SECOND,@_minDate,@_maxDate) AS second_dd
--SELECT DATEDIFF(MINUTE,GETDATE(),@_maxDate) AS minute_diff
--SELECT DATEDIFF(HOUR,GETDATE(),@_maxDate) AS hour_diff
--SELECT DATEDIFF(DAY,GETDATE(),@_maxDate) AS day_dd
--SELECT DATEDIFF(WEEK,GETDATE(),@_maxDate) AS week_dd
--SELECT DATEDIFF(MONTH,GETDATE(),@_maxDate) AS month_dd
--SELECT DATEDIFF(QUARTER,GETDATE(),@_maxDate) AS quarter_dd
--SELECT DATEDIFF(YEAR,GETDATE(),@_maxDate) AS year_dd

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], second ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], minute ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], hour ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], day ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], week ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], month ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], quarter ) )  

--DATEDIFF(MIN( Calendar[Date] ), MAX( Calendar[Date], year ) )

--DATEPART, 
--SELECT DATEPART (tzoffset, '2007-05-10  00:00:01.1234567 +05:10');

--YEAR, 
--SELECT YEAR('2010-04-30 01:01:011234567-07:00');

--MONTH, 
--SELECT MONTH('2007-04-30 01:01:01.1234567 -07:00');

--DAY,
--SELECT DAY('2015-04-30 01:01:01.1234567');
-- FORMATDATETIME

--DECLARE @d DATE='11/22/2020';
--SELECT FORMAT(@d, 'd', 'en-US') 'US English', FORMAT(@d, 'd', 'en-gb') 'Great Britain English', FORMAT(@d, 'd', 'de-de') 'German', FORMAT(@d, 'd', 'zh-cn') 'Simplified Chinese (PRC)';
--SELECT FORMAT(@d, 'D', 'en-US') 'US English', FORMAT(@d, 'D', 'en-gb') 'Great Britain English', FORMAT(@d, 'D', 'de-de') 'German', FORMAT(@d, 'D', 'zh-cn') 'Chinese (Simplified PRC)';

-- - Sử dụng các hàm xử lý số: /, %, ROUND, ISNUMERIC
--/,
-- Uses AdventureWorks  
  
SELECT VacationHours/SickLeaveHours AS PersonalTimeRatio  
FROM HumanResources.Employee;
--%, 
SELECT 38 / 5 AS Integer, 38 % 5 AS Remainder;
--ROUND, 
SELECT ROUND(CAST (748.58 AS decimal (6,2)),-3);

SELECT ROUND(150.75, 0);  
GO  
SELECT ROUND(150.75, 0, 1);  
GO
--ISNUMERIC
USE AdventureWorks2012;  
GO  
SELECT City, PostalCode  
FROM Person.Address   
WHERE ISNUMERIC(PostalCode) <> 1;  
GO

USE master;  
GO  
SELECT name, ISNUMERIC(name) AS IsNameANumber, database_id, ISNUMERIC(database_id) AS IsIdANumber   
FROM sys.databases;  
GO
-- - Chuyển đổi số liệu: CAST, CONVERT, STR
--CAST, 
--USE CAST
USE AdventureWorks2012;
GO
SELECT SUBSTRING(Name,1,30) AS ProductName,ListPrice
FROM Production.Product
WHERE CAST(ListPrice AS INT) LIKE '33%'

--CONVERT, 
SELECT Name,SUBSTRING(Name,1,30) AS ProductName, ListPrice
FROM Production.Product
WHERE CONVERT(INT,ListPrice) LIKE '33%'
--STR
SELECT STR (123.45,2,2)

SELECT STR (FLOOR(123.45),8,3);

-- - Sử dụng các cách khác nhau (nếu có) cho từng câu bài tập

--TRANLATE
SELECT TRANSLATE('abcdef','abc','bcd') AS Translated,
       REPLACE(REPLACE(REPLACE('abcdef','a','b'),'b','c'),'c','d') AS Replaced;