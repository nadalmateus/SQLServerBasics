CREATE OR ALTER VIEW vwCourses AS 

SELECT [Course].[Id], [Course].[TAG], [Course].[Title], [Course].[Url], [Category].[Title] AS [Category], [Author].[Name] AS [Author]
FROM [Course] INNER JOIN [Category] ON [Course].[CategoryId] = [Category].[Id]
INNER JOIN [Author] ON [Course].[AuthorId] = [Author].[Id]
WHERE [Active] = 1
