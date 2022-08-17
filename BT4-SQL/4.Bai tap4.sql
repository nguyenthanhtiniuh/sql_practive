-- 4. Bài tập 4 :
-- Tạo bảng tạm Danh mục vật tư #B20Item (Code, Name, GroupCode), và tồn kho đầu
-- kỳ #B30OpenStock (ItemCode, Quantity, WarehouseCode):

USE NTT_PRAC 
GO

DROP TABLE IF EXISTS #B20Item
CREATE TABLE #B20Item(
    Code NVARCHAR(24),
    Name NVARCHAR(192),
    GroupCode NVARCHAR(24)
)

INSERT INTO #B20Item
SELECT
'Vt1','Vat tu 1','VT'
UNION ALL
SELECT 
'Vt2','Vat tu 2','VT'
UNION ALL
SELECT 
'Vt3','Vat tu 3','VT'

DROP TABLE IF EXISTS #B30OpenStock
CREATE TABLE #B30OpenStock(
    ItemCode NVARCHAR(24),
    Quantity NUMERIC(18,2),
    WarehouseCode NVARCHAR(24)
)

INSERT INTO #B30OpenStock
VALUES
    ('Vt1', 5, 'Stock1'),
    ('Vt2', 9, 'Stock2'),
    ('Vt2', 1, 'Stock3'),
    ('Vt3', 3, 'Stock1'),
    ('Vt3', 2, 'Stock2'),
    ('Vt3', 7, 'Stock3')


DROP TABLE IF EXISTS #tblcte
;WITH
    cte
    AS

    (
        SELECT ItemCode,
            Stock1, Stock2, Stock3
        FROM(
	SELECT
                [ItemCode],
                [WarehouseCode],
                [Quantity]
            FROM #B30OpenStock
 )AS SOURCETABLE
 PIVOT
 ( 
 SUM(Quantity) FOR WarehouseCode IN (Stock1,Stock2,Stock3)
 )AS PIVOTTABLE
    )-- Insert rows into table '#tblResult' in schema '[dbo]'
SELECT *
INTO #tblcte
FROM cte

--SELECT * from #tblcte

DROP TABLE if EXISTS #tblResult
SELECT *
INTO #tblResult
FROM(
SELECT GroupCode, [ItemCode], Name,
        [Stock1],
        [Stock2],
        [Stock3]
    FROM #tblcte
        JOIN #B20Item
        ON #tblcte.ItemCode=#B20Item.Code
)AS tbl

SELECT *
FROM #tblResult

INSERT INTO #tblResult
    (Name,Stock1,Stock2,Stock3)
SELECT 'Tong Cong', SUM(Stock1), SUM(Stock2), SUM(Stock3)
FROM #tblResult

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT *
FROM #tblResult