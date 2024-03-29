USE [B2BSystem]
GO
/****** Object:  StoredProcedure [dbo].[SP_PRO_AddCatelogProduct]    Script Date: 6/14/2019 11:14:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_PRO_AddCatelogProduct]
	-- Add the parameters for the stored procedure here
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;


BEGIN TRY
	
	DECLARE @hdoc int
	DECLARE @BrandId int
	DECLARE @ModelId int
	DECLARE @SeriesId int

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

	SELECT *
	INTO  #tmp_OBJ
	FROM OPENXML (@hdoc, '/Brand', 2)
	WITH (
		[Id] [int],
		[Name] [nvarchar](max) ,
		[IpAddress] [nvarchar](max) ,
		[CreatedBy] [nvarchar](max) ,
		[ModifiedBy] [nvarchar](max) ,
		[CreatedWhen] [datetime] ,
		[ModifiedWhen] [datetime] ,
		[BrandId] [int] ,
		[ModelId] [int] ,
		[SeriesId] [int],
		[UserId] [nvarchar](max) ,
		[CategoryId] [int]
	)

	EXEC sp_xml_removedocument @hdoc

	SELECT @BrandId = BrandId ,@ModelId= ModelId,@SeriesId= SeriesId  FROM  #tmp_OBJ

	IF EXISTS(SELECT * FROM CateglogProducts WHERE BrandId=@BrandId AND SeriesId = @SeriesId AND ModelId=@ModelId)
	BEGIN
		SET @Status =2 --UPDATE
		UPDATE CP 
		SET CP.Name = TEMP.Name
		FROM 
		CateglogProducts AS CP
		INNER JOIN #tmp_OBJ AS TEMP ON CP.Id = TEMP.id
		WHERE CP.Id = TEMP.id

	END
	ELSE
	BEGIN
		SET @Status =1 --UPDATE
		INSERT INTO [dbo].[CateglogProducts]
           ([Name]
           ,[IpAddress]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedWhen]
           ,[ModifiedWhen]
           ,[BrandId]
           ,[ModelId]
           ,[SeriesId]
           ,[UserId]
           ,[CategoryId])
		SELECT [Name]
           ,[IpAddress]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedWhen]
           ,[ModifiedWhen]
           ,[BrandId]
           ,[ModelId]
           ,[SeriesId]
           ,[UserId]
           ,[CategoryId] FROM #tmp_OBJ


	END


	DROP TABLE #tmp_OBJ


	
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION trans;
    DECLARE @ErrorMessage NVARCHAR(4000); DECLARE @ErrorSeverity INT; DECLARE @ErrorState INT;
    SELECT  @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState );
	set @Status =0
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION trans;

END

