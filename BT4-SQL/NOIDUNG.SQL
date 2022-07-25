USE NTT_PRAC
GO

DECLARE @_String NVARCHAR(MAX) = ''
SELECT @_String = STRING_AGG(TenMatHang,',') FROM MatHang
--REPLACE()

--CHARINDEX

--SUBSTRING

--SELECT VALUE FROM string_split(@_String,',') AS NTT

-- . Các hàm về chuỗi :
--  REPLACE ()
SELECT @_String=REPLACE(@_String,',','.')
SELECT @_String
--  CHARINDEX()
SELECT CHARINDEX('SO TAY',@_String)
--  SUBSTRING()

--  STUFF()
--  SPACE()
--  RTRIM()
--  LTRIM()
-- 2. Các hàm về kiểu ngày:
--  DATEDIFF()
--  DATEADD()
-- 3. Các hàm về số :
--  CAST()
--  CONVERT()
--  ROW_NUMBER() OVER()
--  SUM() OVER()
--  STR()
--  ISNULL()
--  ISNUMERIC()