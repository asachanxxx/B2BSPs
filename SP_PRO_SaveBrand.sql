USE [B2BSystem]
GO
/****** Object:  StoredProcedure [dbo].[SP_PRO_SaveBrand]    Script Date: 6/15/2019 12:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_PRO_SaveBrand]
	-- Add the parameters for the stored procedure here
	@XMLSQL XML, 
	@Action int, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;


BEGIN TRY
	
	DECLARE @hdoc int
	DECLARE @BrandName nvarchar(max)


	EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

	SELECT *
	INTO  #tmp_OBJ
	FROM OPENXML (@hdoc, '/Brand', 2)
	WITH (
		[Id] [int],
		[Name] [nvarchar](max),
		[IsApproved] [bit],
		[IpAddress] [nvarchar](max),
		[CreatedBy] [nvarchar](max),
		[ModifiedBy] [nvarchar](max),
		[CreatedWhen] [datetime],
		[ModifiedWhen] [datetime] 
	)

	--SELECT * FROM #tmp_OBJ

	SELECT @BrandName = Name  FROM  #tmp_OBJ

	IF EXISTS(SELECT * FROM Brands WHERE Name=@BrandName)
	BEGIN
		RAISERROR ('Brand name already exists', 16,  1); 
	END

	IF(@Action =2)
	BEGIN
		UPDATE CP 
		SET CP.Name = TEMP.Name,
		CP.IsApproved = TEMP.IsApproved,
		CP.IpAddress = TEMP.IpAddress,
		CP.ModifiedBy = TEMP.ModifiedBy
		FROM 
		Brands AS CP
		INNER JOIN #tmp_OBJ AS TEMP ON CP.Id = TEMP.id
		WHERE CP.Id = TEMP.id
		SET @Status =2 
	END
	ELSE
	BEGIN
	INSERT INTO [dbo].[Brands]
           ([Name]
           ,[IsApproved])
    SELECT Name,IsApproved FROM #tmp_OBJ

	 set @Status =1
	END



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

