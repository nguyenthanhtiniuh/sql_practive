--10
DROP TABLE IF EXISTS #tblResource1
CREATE TABLE #tblResource1
(
    Class NVARCHAR(50),
    Code NVARCHAR(50),
    Value NUMERIC(18,2)
)

INSERT INTO #tblResource1
VALUES
    ('F1', 'A', 100)
,
    ('F1', 'A', 200)
,
    ('F1', 'B', 100)
,
    ('F2', 'C', 220)
,
    ('F3', 'A', 150)
,
    ('F2', 'C', 300)
,
    ('F3', 'D', 120)

DROP TABLE IF EXISTS #tblResource2
CREATE TABLE #tblResource2
(
    Class nvarchar(50),
    Value NUMERIC(18,2)
)
INSERT INTO #tblResource2
VALUES
    ('F1', 500)
,
    ('F2', 400)
,
    ('F3', 600)


-- SELECT * FROM #tblResource1 ORDER BY Class,Code

-- SELECT * FROM #tblResource2 ORDER BY Class

SELECT 
t2.Class,t2.Code,t2.Value
,SUM(t2.Value) OVER(PARTITION BY t2.Class) AS _Sum
,t1.Value AS _Distributed
,ROUND(t2.Value/SUM(t2.Value) OVER(PARTITION BY t2.Class)*t1.Value,2) AS _Result
FROM 
    (
    SELECT Class,Code,SUM([Value]) AS VALUE
    FROM #tblResource1 
    GROUP BY Class,Code) t2 
    LEFT OUTER JOIN #tblResource2 t1 ON T1.Class=t2.Class
