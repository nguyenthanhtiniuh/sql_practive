USE NTT_PRAC
GO

-- 5.tao cot close,open

DROP TABLE IF EXISTS #tblResourceA
CREATE TABLE [dbo].[#tblResourceA]
(
    [Id] INT IDENTITY PRIMARY KEY,
    -- Primary Key column
    [Code] NVARCHAR(50)  ,
    [Open] NVARCHAR(50)
    -- Specify more columns here
);

INSERT INTO #tblResourceA
    (Code,[Open])
    SELECT 'A', 1
UNION ALL
    SELECT 'C', 3
SELECT *
FROM #tblResourceA

DROP TABLE IF EXISTS #tblResourceB
CREATE TABLE [dbo].[#tblResourceB]
(
    [Id] INT IDENTITY PRIMARY KEY,
    -- Primary Key column
    [Code] NVARCHAR(50)  ,
    [Input] INT  ,
    Output INT
);

INSERT INTO #tblResourceB
    (Code,[Input],[Output])
    SELECT 'A', 1, 0
UNION ALL
    SELECT 'A', 3, 2
UNION ALL
    SELECT 'A', 1, 3
UNION ALL
    SELECT 'B', 1, 1
UNION ALL
    SELECT 'B', 2, 1
UNION ALL
    SELECT 'C', 1, 4
UNION ALL
    SELECT 'C', 2, 2
SELECT *
FROM #tblResourceB

SELECT b.Id,b.Code, [Open], [Input], [Output], [Open]+[Input]-[Output] AS [Close]
FROM #tblResourceB b
    LEFT JOIN #tblResourceA a
ON b.Code=a.Code

