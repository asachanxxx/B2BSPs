--select * from [dbo].[XxX_All] where Extended = 'Model' and ValueX like '%Core i9 X-Series%'

--INSERT INTO [dbo].[Brands]
--           ([Name]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select distinct ValueX , 1, '' , 'System' , 'System' , getdate() , getdate()  
--from XxX_All where Extended = 'Manufacturer' and  ValueX is not null


select * from Brands


--INSERT INTO [dbo].[Series]
--           ([Name]
--           ,[IsApproved]
--           ,[IpAddress]
--           ,[CreatedBy]
--           ,[ModifiedBy]
--           ,[CreatedWhen]
--           ,[ModifiedWhen])
--select distinct ValueX , 1, '' , 'System' , 'System' , getdate() , getdate()  
--from XxX_All where Extended = 'Series' and  ValueX is not null

select * from Series