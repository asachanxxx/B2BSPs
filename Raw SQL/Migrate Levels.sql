select * from [dbo].[Level1]
select * from [dbo].[Level2]
select * from [dbo].[Level3]
select * from [dbo].[XxX_Level2]
select * from [dbo].[XxX_Level3]

SET IDENTITY_INSERT Level1 ON

--INSERT INTO [dbo].[Level1]
--           (id
--		   ,[Code]
--           ,[Level1Name]
--           ,[NoOfClicks]
--           ,[NoOfImpressions]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])

--SELECT [ID],'LVL2-'+ CONVERT(varchar , id),[Name] ,
--	   0,0,'','System','System',GETDATE(),GETDATE()
--FROM [dbo].[XxX_Level1]

--SET IDENTITY_INSERT Level1 off


--SET IDENTITY_INSERT Level2 ON

--INSERT INTO [dbo].[Level2]
--           (id
--		   ,[Level1Id]
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

--SELECT [ID], catid ,'LVL2-'+ CONVERT(varchar , id),[Name] ,
--	   0,0,0,'','System','System',GETDATE(),GETDATE()
--FROM [dbo].[XxX_Level2]

--SET IDENTITY_INSERT Level2 off



--SET IDENTITY_INSERT Level3 ON
--INSERT INTO [dbo].[Level3]
--           (id
--		   ,[Level1Id]
--           ,[Level12d]
--           ,[Code]
--           ,[Level3Name]
--           ,[NoOfClicks]
--           ,[NoOfImpressions]
--           ,[SpecMasterId]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
   
--SELECT [ID], catid , subcatid,'LVL3-'+ CONVERT(varchar , id),[Name] ,
--	   0,0,0,'','System','System',GETDATE(),GETDATE()
--FROM [dbo].[XxX_Level3]

--SET IDENTITY_INSERT Level3 off