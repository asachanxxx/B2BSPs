select * from [dbo].[SpecItems]
select * from [dbo].[SpecDetails]
select * from [dbo].[SpecDetails]
select * from [dbo].[XxX_SpecDetails]
select * from [dbo].[XxX_ExtractedSpecItems]
select * from [dbo].[XxX_ProductDetails]
select * from [dbo].[SpecProductDetails] --989
select * from [dbo].[XxX_ProductDetails]




INSERT INTO [dbo].[SpecGroups]
           ([Name])
select distinct Section from [dbo].[XxX_ProductDetails]


select * from [dbo].[SpecProductDetails] as SPD
inner join  [XxX_ProductDetails] as PD on spd.SpecItemName = pd.Attribute
inner join [SpecGroups] as SG on sg.name = PD.Section


select spd.ProductId, spd.SpecItemName,pd.Attribute,pd.Section,sg.name , sg.id , spd.SpecGroupId from [dbo].[SpecProductDetails] as SPD
inner join  [XxX_ProductDetails] as PD on spd.SpecItemName = pd.Attribute
inner join [SpecGroups] as SG on sg.name = PD.Section 


update SPD
set spd.SpecGroupId = sg.id  from [dbo].[SpecProductDetails] as SPD
inner join  [XxX_ProductDetails] as PD on spd.SpecItemName = pd.Attribute
inner join [SpecGroups] as SG on sg.name = PD.Section 


SELECT        SPD.ProductId, SPD.SpecItemId, SPD.SpecItemName, SPD.SpecItemDisplayName, SPD.Value, SG.Id AS GroupID, SG.Name AS GroupName
FROM            dbo.SpecProductDetails AS SPD INNER JOIN
                         dbo.SpecGroups AS SG ON SPD.SpecGroupId = SG.Id

SP_Get_SpecificationForGivenProduct 15