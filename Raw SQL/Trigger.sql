--CREATE TRIGGER trigger_name
--ON table_name
--AFTER  {[INSERT],[UPDATE],[DELETE]}
--[NOT FOR REPLICATION]
--AS
--{sql_statements}


CREATE TRIGGER TbFixTb_Trg 
ON  XxX_SpecItems
AFTER INSERT 
AS  
BEGIN 
   
   insert into  [dbo].[XxX_All]
   values('Trigger', 'LVL Trigger' , 'Val Trigger')

END  
GO



select * from XxX_All where Extended = 'Trigger'


INSERT INTO [dbo].[XxX_SpecItems]
           ([Id]
           ,[Name])
     VALUES
           (1300 , 'Delete This')

