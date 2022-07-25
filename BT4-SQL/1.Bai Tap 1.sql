--1.Bai tap 1:
-- Thêm bảng tạm #B20Warehouse (Danh mục kho), thêm dữ liệu. Viết T-SQL kiểm
-- tra mã lồng nhau như AB lồng trong ABC, Mã BC không phải là mà lồng trong ABC.
USE NTT_PRAC
GO

DROP TABLE IF EXISTS #B20Warehouse
CREATE TABLE #B20Warehouse
(
    Stt INT IDENTITY,
    WarehouseCode NVARCHAR(24)
)

INSERT INTO #B20Warehouse(WarehouseCode)
SELECT 'A'
UNION ALL 
SELECT 'B'
UNION ALL 
SELECT 'C'
UNION ALL 
SELECT 'ABC'

SELECT * FROM #B20Warehouse

