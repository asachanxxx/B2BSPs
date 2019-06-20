--drop table [dbo].[Level1OEM]
--drop table  [dbo].[Level2OEM]
--drop table [dbo].[Level3OEM]

--truncate table   Level1
--truncate table   Level2
--truncate table   Level3

--SET IDENTITY_INSERT Level1 off;  

--INSERT INTO [dbo].[Level1]
--           (Id,
--		   [Code]
--           ,[Level1Name]
--           ,[NoOfClicks]
--           ,[NoOfImpressions]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--SELECT [Id]
--      ,[Code]
--      ,[Level1Name],0,0,'SystemIP', 'SystemUser','',GETDATE(),GETDATE()
--  FROM [dbo].[Level1OEM]

--SET IDENTITY_INSERT Level2 ON;  
--INSERT INTO [dbo].[Level2]
--           (id,
--		   [Level1Id]
--           ,[Code]
--           ,[Level2Name]
--           ,[SpecMasterId]
--           ,[NoOfClicks]
--           ,[NoOfImpressions]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--SELECT [Id]
--      ,[Level1Id]
--      ,[Code]
--      ,[Level2Name], 1,0,0,'SystemIP', 'SystemUser','',GETDATE(),GETDATE()
--  FROM [dbo].[Level2OEM]
--SET IDENTITY_INSERT Level2 off;  

--SET IDENTITY_INSERT Level3 ON;  
--INSERT INTO [dbo].[Level3]
--           (id,[Level1Id]
--           ,[Level12d]
--           ,[Code]
--           ,[Level3Name]
--           ,[NoOfClicks]
--           ,[NoOfImpressions]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--SELECT [Id]
--      ,[Level1Id]
--      ,[Level12d]
--      ,[Code]
--      ,[Level3Name], 0,0,'SystemIP', 'SystemUser','',GETDATE(),GETDATE()
--  FROM [dbo].[Level3OEM]

--SET IDENTITY_INSERT Level3 off; 



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
   
--SELECT [SpecItemName]
--      ,[SpecItemDisplayName]
--      ,[DataType] ,1 ,'SystemIP', 'SystemUser','',GETDATE(),GETDATE()
--FROM [dbo].[SpecItemsOEM]


