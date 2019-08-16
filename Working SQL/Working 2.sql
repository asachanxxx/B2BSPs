use [B2BDataExtract]

select * from [dbo].[XxX_SpecDetails]
select * from [dbo].[XxX_ProductDetails] where section is null
select * from [dbo].[XxX_FeatureProducts]
select * from [dbo].[XxX_ExtractedSpecItems]
select * from [dbo].[XxX_ExtractedLevel3s]
select * from [dbo].[XxX_ProductList]


select * from [dbo].[Products]
select * from [dbo].[SpecItems]
select * from [dbo].[SpecProductDetails] where ProductId = 16
select * from [dbo].[SpecGroups]  where name is null
select * from [dbo].[XxX_ExtractedSpecItems]
select * from [dbo].[XxX_All] where ProductId = 16
select * from XxX_LVL3Extended where ProductId = 16
select * from [dbo].[SpecProductDetails] where ProductId = 16

select distinct  SpecItemName from [dbo].[SpecItems]

/*
Plan:
1. So the specitem is the root for every thing. but it missing the grouping. also current one is also missing some more SPec Items so we must extract it from XxX_All
   Just find spectitems that are not in XxX_All and then insert them all. 
2. And we are missing some more spec items and those are needed to be extract from the site.idea here is you get one prodcuct from each trype that aren't available in our Product Tables
3.Then get all that spec items and add groups by looking at the site. so we need like 3 tables
	- Group table - holds the top groupign records
	- SpecItems - Holds the unique Spec Items
	- SpecLevelValues - this will have Level1ID, SpecItemID,SpecItemName . so when we need filters we can get it from here. (Link specitemID and Level3It to XxX_All and make this table so it will be fine)
	- SpecProductDetails - this will holds spec Details for given product. this will be used to search for (Fille this table with other products that not already in.and distinct spec item values and query not in with specitems. ) 

4. Need to get initial amount of products for display when come from level3 click
*/
select count(*) from [dbo].[SpecItems] -- 134
select COUNT(*) from [dbo].[SpecItems] --Szd x

select distinct Extended from [dbo].[XxX_All] where Extended not in 
(select SpecItemName from [dbo].[SpecItems] )



--INSERT INTO [dbo].[SpecItems]
--           ([SpecItemName]
--           ,[SpecItemDisplayName]
--           ,[DataType]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])

--select distinct Extended , Extended ,'String' ,1,'' ,'','',GETDATE(),GETDATE() from [dbo].[XxX_All] where Extended not in 
--(select SpecItemName from [dbo].[SpecItems] )

select * from Level3 --15542



--INSERT INTO [dbo].[SpecLevelDetails]
--           ([Level3Id]
--           ,[Level3name]
--           ,[SpecId]
--           ,[SpecItemName]
--           ,[SpecValue]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])

--select L.ID , L.Level3name,SI.Id as sidd , SI.SpecItemName, A.ValueX , '', '','',GETDATE(),GETDATE() from XxX_All as A inner join  --15991
--Level3 as L on A.Level3 = L.level3name 
--inner join SpecItems as SI on SI.SpecItemName = A.Extended



/*
Product Search SP:

Devided by main 2 categories
1. search via Level 3 search
2. Search via Search box

Search Criteria type
====================
1. No search just give what you have when clicked on level 3
2. when filter via any of the spec items there must be a method to accept it
3. need to apply sort by filter. this is an individual filter
4. need to parameterize the input no of items on search box
5. when user search for a keyword we have to find out where those keyword has words. so need an index of words

EX: Keyword | Match		| ProductIDStrings | No Of OCcurances
     Dell	  Full Word	

	 * No Of OCcurances - no of occurance products that purticular key word has
	 * ProductIDStrings		- Product Id's of all those occurances 
*/

backup database B2BSystem to disk = 'I:\TFS\B2BSystem\File\SPs\B2BSPs\DB\B2BSystem.bak'.

select distinct Extended from XxX_All where Extended like '%Memory%'



select * from Level1
select * from Level2
select * from Level3

select SG.Id as 'GroupID' , sg.Name as 'GroupName', SpecItemName,SpecItemDisplayName,Value from [SpecProductDetails] as SPD  
inner join SpecGroups as SG on sg.Id = spd.SpecGroupid
where ProductId = 16

select SpecItemName,Id as 'SpecId','Value' as SpecValue from [dbo].[SpecProductDetails] where ProductId = 16


select * from ProductReviews
select * from ProductRatings
select * from [dbo].[Users]


select distinct Level3Id , Level3.Level3Name from SpecLevelDetails as S
inner join Level3 on Level3.Id = s.Level3Id

SELECT * FROM Level2
SELECT * FROM Level3

SELECT  id AS 'Level1Id' ,level1name AS 'Level1Name' FROM Level1 ORDER BY ID

SELECT * FROM Level2

SELECT L2.LEVEL1ID AS 'Level1Id',L2.ID AS 'Level2Id',L2.LEVEL2NAME AS 'Level2Name',L2.Url,L2.[External],L2.Target, L2.ColumnNumber  , L3.ID AS 'Level3Id',L3.LEVEL3NAME AS 'Level3Name',L3.Url,L3.[External],L3.Target FROM Level2 AS L2
INNER JOIN Level3 AS L3 ON L2.ID = L3.LEVEL12D WHERE L2.LEVEL1ID= 1



SELECT level1id , count (level1id) FROM Level3
group by level1id  --xl'|'lg'|'nl'|'sm';
--update Level1 set image = code
------ target?: '_self'|'_blank';
--update Level1 set URL ='./process/categoryview'

SELECT CONVERT(varchar(10),level1id),* FROM Level2
SELECT * FROM Level2 where id in (1,2,3,4) 

SELECT * FROM Level2
--update Level2 set columnNumber = CONVERT(varchar(10),level1id) + '-3' where id in (9,10,11,12) 

--backup database b2bsystem to disk = 'I:\DBBackups\B2BSystem\b2bsystem_2019_08_12.bak'

update Level2 set columnnumber ='' where id >12

Id	Level1Id	Level12d	Code	Level3Name	NoOfClicks	NoOfImpressions	SpecMasterId	IpAddress	CreatedBy	ModifiedBy	CreatedWhen	ModifiedWhen	Url	External	Target
602	1	1	LVL3-602	Desktop Processors	0	0	0		System	System	2019-07-09 12:10:08.817	2019-07-09 12:10:08.817	./shop	0	_self

SELECT * FROM Level1
SELECT * FROM Level2
SELECT * FROM Level3


SELECT L2.Id as 'L2ID' , l2.Level2Name as 'label1',l2.Url as 'url1', l3.ID as 'Id' , l3.level3Name as 'label' , L3.Url as 'url'     FROM Level2 as L2 inner join 
Level3 as L3 on L2.ID = L3.Level12d
