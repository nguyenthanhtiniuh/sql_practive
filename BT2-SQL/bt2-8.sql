--8. Tao bang [#tblResult] tu table [#tblResource]
USE NTT_PRAC
GO


DROP TABLE IF EXISTS #tblResource
CREATE TABLE #tblResource
(
    Id INT IDENTITY,
    Code NVARCHAR(24),
    Value INT
)

INSERT INTO #tblResource
(
    Code,
    [Value]
)
SELECT 'A',
       100
UNION ALL
SELECT 'B',
       100
UNION ALL
SELECT 'C',
       220
UNION ALL
SELECT 'A',
       150
UNION ALL
SELECT 'C',
       300
UNION ALL
SELECT 'D',
       120
UNION ALL
SELECT 'E',
       120

--SELECT * FROM #tblResource

DROP TABLE IF EXISTS #tblResource2
SELECT ID,
       A,
       B,
       C,
       D,
       E
INTO #tblResource2
FROM #tblResource
    PIVOT
    (
        MAX(VALUE)
        FOR CODE IN (A, B, C, D, E)
    ) AS PIVOTTABLE;
SELECT *
FROM #tblResource2


SELECT ID,
       CodeType = 'A',
       VALUEcount = A
FROM #tblResource2
UNION ALL
SELECT Id,
       'B',
       B
FROM #tblResource2
UNION ALL
SELECT Id,
       'C',
       C
FROM #tblResource2
UNION ALL
SELECT Id,
       'D',
       D
FROM #tblResource2
UNION ALL
SELECT Id,
       'E',
       E
FROM #tblResource2

-- SELECT id, Code, Value
-- FROM #tblResource2
-- UNPIVOT (
--     Code FOR Codetype IN (
--         A,B,C,D,E
--     )
-- ) unpvt