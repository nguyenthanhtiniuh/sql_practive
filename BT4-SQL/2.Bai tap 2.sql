-- Viết SQL tao bảng tạm có Field [Code] và [Value] tính toán thêm [Accumulative
-- Value] lấy dữ liệu từ [So] dữ liệu như sau:
USE NTT_PRAC
GO

DROP TABLE IF EXISTS #tblTam
CREATE TABLE #tblTam(
    Code NVARCHAR(24),
    Value NUMERIC(18,0),
    Accumulative NUMERIC(18,0)
)

INSERT INTO #tblTam(Code,[Value])
SELECT 'A',1
UNION ALL
SELECT 'B',3
UNION ALL
SELECT 'C',2
UNION ALL
SELECT 'D',5
UNION ALL
SELECT 'E',7

SELECT Code, [Value], SUM([Value]) OVER (ORDER BY Code ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM #tblTam
ORDER BY Code