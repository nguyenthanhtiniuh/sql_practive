USE NTT_PRAC
GO


-- 6. Tao table [#tblResult] tu table [#tblResourceA]
DROP TABLE IF EXISTS #tblResourceA
CREATE TABLE [dbo].[#tblResourceA]
(
    Id INT IDENTITY,
    Date DATE,
    [Code] NVARCHAR(50)  ,
    Name NVARCHAR(50)
);

INSERT INTO #tblResourceA
    ([Date],Code,Name)
    SELECT '20130101', 'A', 'Mr.Nam'
UNION ALL
    SELECT '20130515', 'A', 'Mr.Tung'
UNION ALL
    SELECT '20130201', 'B', 'Mrs.Lam'
UNION ALL
    SELECT '20130430', 'B', 'Mrs.Hoa'
UNION ALL
    SELECT '20130412', 'C', 'Ms.Hanh'
UNION ALL
    SELECT '20130623', 'C', 'Ms.Han'
UNION ALL
    SELECT '20130830', 'C', 'Ms.Huong'

--SELECT * FROM #tblResourceA

DROP TABLE IF EXISTS #tblResourceB
CREATE TABLE [dbo].[#tblResourceB]
(
    Id INT IDENTITY,
    Date DATE,
    [Code] NVARCHAR(50)
);

INSERT INTO #tblResourceB
    ([Date],Code)
    SELECT '20130101', 'A'
UNION ALL
    SELECT '20130311', 'A'
UNION ALL
    SELECT '20130615', 'A'
UNION ALL
    SELECT '20130101', 'B'
UNION ALL
    SELECT '20130214', 'B'
UNION ALL
    SELECT '20130502', 'B'
UNION ALL
    SELECT '20130211', 'C'
UNION ALL
    SELECT '20130418', 'C'
UNION ALL
    SELECT '20130817', 'C'

--SELECT * FROM #tblResourceB

SET DATEFORMAT dmy;  
GO

;WITH cte AS
(
SELECT B.[Date], B.Code, A.Name
FROM #tblResourceA A
    RIGHT JOIN #tblResourceB B
    ON A.[Date] <= B.[Date] AND A.Code=B.Code
--ORDER BY B.Code,B.[Date]
)SELECT * FROM cte
