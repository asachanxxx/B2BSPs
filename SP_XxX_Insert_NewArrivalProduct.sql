
CREATE PROCEDURE SP_XxX_Insert_NewArrivalProduct
	@productId int
AS
BEGIN
	
	INSERT INTO [dbo].[NewArrivalProducts]
           ([ProductId]
           ,[Name]
           ,[Price]
           ,[CompareAtPrice]
           ,[Reviews]
		   ,[Rating]
           ,[Availability]
           ,[IpAddress]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedWhen]
           ,[ModifiedWhen])

	select  
		Id,ShortName,ProductPrice,ProductPrice,0,Rating,1,'',CreatedBy,ModifiedBy,CreatedWhen,ModifiedWhen
	from Products where id =@productId

END

