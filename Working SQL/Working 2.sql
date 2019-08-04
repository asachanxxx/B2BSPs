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

backup database B2BSystem to disk = 'I:\TFS\B2BSystem\File\SPs\B2BSPs\DB\B2BSystem.bak'