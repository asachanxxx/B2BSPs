--INSERT INTO [dbo].[Models]
--           ([Name]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])

--select distinct Model , 1, '','System','System' , GETDATE(), GETDATE() from [XxX_ProductList] 

--INSERT INTO [dbo].[Series]
--           ([Name]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select distinct Series, 1, '','System','System' , GETDATE(), GETDATE() from [XxX_ProductList] where Series not in
--(select Name from [dbo].[Series])

--INSERT INTO [dbo].[Brands]
--           ([Name]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select distinct brand, 1, '','System','System' , GETDATE(), GETDATE() from [XxX_ProductList] where Brand not in
--(select Name from [dbo].Brands)


select * from [dbo].[XxX_ProductList]
select * from [XxX_ProductList] where Series is null
select * from Models
select * from [dbo].[Series]
select * from [dbo].[Products]



--INSERT INTO [dbo].[Products]
--           ([ProductCode],[BrandId],[ModelId],[ShortName],[DisplayName],[PartNumber],[Series]
--           ,[Name],[ItemNo],[UNSPSC],[Level1Id],[Level2Id],[Level3Id],[Rating]
--           ,[PriceValidityPeriod],[SupplierPrice],[ProductPrice],[DefaultImagePath]
--           ,[IsApproved],[ConversionRate],[CurrencyId],[NoOfClicks],[NoOfImpressions]
--           ,[AddedByASeller],[AddedSellerID],[IpAddress],[CreatedBy],[ModifiedBy],[CreatedWhen],[ModifiedWhen])
  
--select 
--Code , b.Id,M.Id,PL.Name,DisplayName,PartNo,Series,
--PL.Name,Code,'',LVL1,LVL2,LVL3,0,
--50,PriceLKR,PriceLKR,Path,
--1,0,1,0,0,
--0,0,'','System','System',GETDATE(),GETDATE()

--from [dbo].[XxX_ProductList] as PL inner join 
--Brands as B on PL.Brand = b.Name inner join
--Series as S on PL.Series = s.Name inner join
--Models as M on PL.Model = M.Name


select * from [dbo].[Products]
select * from [dbo].[XxX_ProductDetails]
select * from [dbo].[SpecProductDetails]


/*add items to specitems that are not in upload list*/

--INSERT INTO [dbo].[SpecItems]
--           ([SpecItemName]
--           ,[SpecItemDisplayName]
--           ,[DataType])
--select distinct attribute , attribute , 'String' from [dbo].[XxX_ProductDetails] where attribute is not null 
--and attribute  not in (select SpecItemName from [dbo].[SpecItems])


--INSERT INTO [dbo].[SpecGroups]
--           ([Name])
--select distinct section from [dbo].[XxX_ProductDetails] where section is not null 


--INSERT INTO [dbo].[SpecProductDetails]
--           (
--            [ProductId]
--           ,[SpecItemId]
--           ,[SpecItemName]
--           ,[SpecItemDisplayName]
--           ,[DataType]
--           ,[Value]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select p.id, si.Id,si.SpecItemName,SI.SpecItemDisplayName,si.DataType,XPD.value,0,'','System','System',GETDATE(),GETDATE() from [dbo].[XxX_ProductDetails] as XPD inner join
--products as P on p.[ProductCode] = XPD.code inner join
--[dbo].[SpecItems] as SI on XPD.attribute = SI.SpecItemName



select * from [dbo].[Products]
select * from [dbo].[SpecProductDetails]
select * from [dbo].[GetProductSpecDetails]
select * from 


select * from [dbo].[XxX_ProductDetails]










