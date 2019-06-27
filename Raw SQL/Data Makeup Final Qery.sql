select * from [dbo].[XxX_All]
select * from [dbo].[XxX_ExtractedLevel3s]
select * from [dbo].[XxX_ExtractedSpecItems]
select * from [dbo].[SpecItems]
select * from [dbo].[Level1]
select * from [dbo].[Level2]
select * from [dbo].[Level3] where Name = 'Home Theater Projectors'
select * from [dbo].[SpecMasters]
select * from [dbo].[SpecDetails]
select * from SpecMasterDetailValue
--select 1 as Level3Id , '' as Level3Name , 1 as SpecItem , '' as SpecItemName , '' as SpecValue into XxX_SpecDetails 

select name , count(name) from [dbo].[Level3]
group by name
having count(name) >1

--total records 15542
select * from [dbo].[Level3]


select * from [dbo].[XxX_All] As XA
inner join [dbo].[Level3] as XL on XA.Level3 = XL.Name
inner join [XxX_ExtractedSpecItems] XE on xe.Name = XA.Extended



--insert to spec masters
--INSERT INTO [dbo].[SpecMasters]
--           ([SpecName]       ,[IsApproved]           ,[IpAddress]           ,[CreatedBy]           ,[ModifiedBy]           ,[CreatedWhen]           ,[ModifiedWhen])
--select Name , 1, '', 'System' , 'System' , GETDATE(), GETDATE() from [dbo].[XxX_ExtractedLevel3s]


select * from [dbo].[XxX_All] As XA
inner join SpecItems as XL on XA.Extended = XL.SpecItemName
inner join SpecMasters XS on xS.SpecName = XA.Level3


--INSERT INTO [dbo].[SpecDetails]
--           ([SpecMasterId],[SpecItemId],[DataType],[DefaultValue],[IsApproved],[IpAddress],[CreatedBy],[ModifiedBy],[CreatedWhen],[ModifiedWhen])
--select XS.Id,XL.Id,Xl.DataType,'',1, '', 'System' , 'System' , GETDATE(), GETDATE()   from XxX_All_Filtered As XA
--inner join SpecItems as XL on XA.Extended = XL.SpecItemName
--inner join SpecMasters XS on xS.SpecName = XA.Level3   

--Extended	Level3	ValueX	Id	SpecItemName	SpecItemDisplayName	DataType	Id	SpecName	IsApproved	IpAddress	CreatedBy	ModifiedBy	CreatedWhen	ModifiedWhen

--truncate table [SpecDetails]


select * from XxX_All_Filtered

--level3	Extended	Id	SpecName	IsApproved	IpAddress	CreatedBy	ModifiedBy	CreatedWhen	ModifiedWhen	Id	SpecItemName	SpecItemDisplayName	DataType


--select distinct level3, Extended  into XxX_All_Filtered from [XxX_All]  where extended is not null
select * from [dbo].[SpecMasters]
select * from XxX_All_Filtered
select * from [SpecDetails]

select * from XxX_All_Filtered as AF inner join
[SpecMasters] as SM on Af.level3 = SM.SpecName inner join
SpecItems as SI on AF.Extended = SI.SpecItemName



--INSERT INTO [dbo].[SpecDetails]
--           ([SpecMasterId]
--           ,[SpecItemId]
--           ,[DataType]
--           ,[DefaultValue]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select sm.Id,Si.Id , 'String' , '' ,1, '' ,'System' , 'System' , GETDATE(), GETDATE() from XxX_All_Filtered as AF inner join
--[SpecMasters] as SM on Af.level3 = SM.SpecName inner join
--SpecItems as SI on AF.Extended = SI.SpecItemName

select * from [dbo].[SpecMasters] where Id =1

select si.Id,si.SpecItemName from SpecDetails as SD inner join
SpecItems as SI on SD.SpecItemId = SI.Id
where SpecMasterId = 1


--select Sm.Id as 'SpecMasterID' , SM.SpecName as 'SpecMasterName', SI.Id as 'SpecItemID' , si.SpecItemName as 'SpecItemName' , Af.ValueX as 'Value' into SpecMasterDetailValue from XxX_All as AF inner join
--[SpecMasters] as SM on Af.level3 = SM.SpecName inner join
--SpecItems as SI on AF.Extended = SI.SpecItemName

select * from [dbo].[XxX_All]



select * from SpecItems 
where SpecItemName  in (



)

insert into SpecItems values ( 'String')