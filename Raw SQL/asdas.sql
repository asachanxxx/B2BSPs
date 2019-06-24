SELECT * FROM [dbo].[Level1]
SELECT * FROM [dbo].[Level2]
SELECT * FROM [dbo].[Level3]

select DISTINCT SpecItemName from [dbo].[SpecItems]
select * from [dbo].[SpecMasters]
select * from [dbo].[SpecDetails]


select SpecItemName , COUNT (SpecItemName) from [dbo].[SpecItems]
GROUP BY SpecItemName
HAVING COUNT(SpecItemName)>1