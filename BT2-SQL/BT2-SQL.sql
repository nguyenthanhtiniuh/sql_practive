--1. Tạo chuỗi “Tk LIKE ‘111%’ OR Tk LIKE ‘112%’ OR Tk LIKE ‘131%’” từ chuỗi cho trước
-- “111,112,131”
USE NTT_PRAC
GO



DECLARE @_StringInput NVARCHAR(MAX) = '111,112,131,1112,1113'

DROP TABLE IF EXISTS #tblTam
CREATE TABLE #tblTam(
    TextString NVARCHAR(24)
)


INSERT INTO #tblTam(TextString)
SELECT 
 value FROM STRING_SPLIT(@_StringInput, ',');
--SELECT @_StringInput

SELECT 'TK LIKE ' +TextString+'%'  FROM #tblTam
DROP TABLE IF EXISTS #tblTam

--2.Tao chuoi 'A,B,C' tu bang du lieu sau
DROP TABLE IF EXISTS #tblTam2
CREATE TABLE #tblTam2(
    Id INT IDENTITY,
    Code VARCHAR(3),
    Name NVARCHAR(24)
)

INSERT INTO #tblTam2(Code,Name)
SELECT 
'A','Name'
UNION ALL
SELECT 
'B','BỈ'
UNION ALL
SELECT 
'C','Canada'

SELECT * FROM #tblTam2

SELECT STRING_AGG(Code,',')  FROM #tblTam2
