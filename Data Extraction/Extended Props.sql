select * from [dbo].[All$]
select * from [dbo].[Cache$]
select * from [dbo].[Chipset$]
select * from [dbo].[Color$]
select * from [dbo].['Core Name$']
select * from [dbo].['CPU Socket Type$']
select * from [dbo].['CPU Type$']
select * from [dbo].['CUDA Cores$']
select * from [dbo].[GPU$]
select * from [dbo].[Manufacturer$] where name like '%Intel%'
select * from [dbo].['Operating Frequency$']
select * from [dbo].[Series$]
select * from [dbo].[Speed$]


insert into extMap
select distinct ltrim(rtrim(level3))  from [Speed$]

select distinct level3 from  extMap

select *from [All$] where Level3 = 'Processors'

--Id	Level3Id	Level3Name	Extended	Value
--Id	SpecItemName	SpecItemDisplayName	DataType


--select * from LevelWiseExtended where extended = 'gpu' and Level3Name = 'Desktop Computers'
--select distinct Level3Name from LevelWiseExtended where extended = 'gpu'

--select * from [dbo].[Specifications] where AttName = 'gpu'
--select distinct AttName from [dbo].[Specifications] where AttName = 'gpu'

--select SpecItemName from [dbo].[SpecItems] where SpecItemName   in
--(select distinct extended from LevelWiseExtended)

select distinct extended  from LevelWiseExtended  where Level3Name = 'Processors'


--select distinct Level3Name from LevelWiseExtended where Level3Name not in(
--select SpecItemName from [dbo].[SpecItems] where SpecItemName  in
--(select distinct Level3Name from LevelWiseExtended))




--select distinct name from [dbo].[Level3]

--select name , count(name) from [dbo].[Level3]
--group by name
--having  count(Name) >1


--select * from [Level1] where id in ( 6 ,7)

--select * from [Level3] where name ='Barcode Scanner'

select * from extMap

SELECT        L1.ID AS CatID, L1.Name AS CatName, L2.ID AS SubCatId, L2.Name AS SubCatName, L3.ID AS Sub2CatId, L3.Name AS sub2Catname2
FROM            dbo.Level1 AS L1 INNER JOIN
                         dbo.Level2 AS L2 ON L1.ID = L2.CatID INNER JOIN
                         dbo.Level3 AS L3 ON L1.ID = L3.CatID AND L2.ID = L3.SubCatID



select * from [dbo].[SpecItems]
select *  from LevelWiseExtended


[dbo].[Level3]

select distinct Level3Name  from LevelWiseExtended
