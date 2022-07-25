USE NTT_PRAC
GO
 --3.Tạo table từ chuỗi “A,B,C”

 DECLARE @_String NVARCHAR(MAX) = 'A,B,C'

-- Drop a table called '#tblTam' in schema 'dbo'
-- Drop the table if it already exists

DROP TABLE  if exists #tblTam
CREATE TABLE #tblTam(
    Id int IDENTITY,
    TextString NVARCHAR(3)
)

INSERT INTO #tblTam(TextString)
SELECT VALUE FROM string_split(@_String,',') 

SELECT * from #tblTam