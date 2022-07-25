USE NTT_PRAC
GO

--7.Tao table [#tblResult] tu [#tblResource]
IF OBJECT_ID('Tempdb..#tblResource') IS NOT NULL DROP TABLE #tblResource
CREATE TABLE #tblResource
(
    Class nvarchar(50),
    Code nvarchar(50),
    Value int
)

INSERT into #tblResource
VALUES
    ('F1', 'A', 100),
    ('F1', 'B', 100),
    ('F2', 'C', 220),
    ('F3', 'A', 150),
    ('F2', 'C', 300),
    ('F3', 'D', 120),
    ('F4', 'A', 110),
    ('F5', 'A', 110),
    ('F4', 'B', 110),
    ('F5', 'B', 110),
    ('F4', 'C', 110),
    ('F5', 'C', 110)

-- SELECT Class,
-- 	sum(A) AS CODEA,
-- 	sum(B) AS CODEB,
-- 	sum(C) AS CODEC,
-- 	sum(D) AS CODED
-- FROM(
-- 	SELECT
-- 		[Class],
-- 		[Code],
-- 		[Value]
-- 	FROM #tblResource
--  )AS SOURCETABLE
--  --FOR A
--  PIVOT
--  ( 
--  sum(Value) for Code IN (A,B,C,D)
--  )AS PIVOTTABLE
-- GROUP BY Class

--Truong hop co nhieu Class or Code, viet sql dong khi co F4,F5,Code E,Code F
SELECT [Class],
    [A],
    [B],
    [C],
    [D]
FROM #tblResource
PIVOT
(
	SUM(Value) FOR Code IN (A,B,C,D)
)AS PivotTable

SELECT [avg_], [11], [12], [13], [14], [15] 
FROM (
  SELECT 'average price' AS 'avg_', screen, price FROM laptops) x
  PIVOT (AVG(price) FOR screen IN([11], [12], [13], [14], [15])
) pvt;

	SELECT PlayerID,GameType = 'Win', GameCount = Win
FROM dbo.Players
    UNION ALL
SELECT PlayerID,'Defeat', Defeat
FROM dbo.Players
    UNION ALL
SELECT PlayerID,'StandOff', StandOff
FROM dbo.Players
