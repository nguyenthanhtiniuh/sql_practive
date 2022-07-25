USE NTT_PRAC
GO

DROP TABLE IF EXISTS #tblResource
CREATE TABLE #tblResource
(
    Class nvarchar(50),
    A INT,
    B INT,
    C INT,
    D INT
)

INSERT INTO #tblResource
VALUES
    ('F1', 100, 100, NULL, NULL),
    ('F2', NULL, NULL, 520, 300),
    ('F3', 150, NULL, NULL, 120)

    -- SELECT * FROM #tblResource

SELECT Class,Code,Value FROM
(
    SELECT Class,A,B,C,D
    FROM #tblResource
)AS tbl
UNPIVOT
(
    VALUE FOR CODE IN (A,B,C,D)
)AS tblUNPIVOT;


