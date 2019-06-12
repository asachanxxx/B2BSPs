Alter PROCEDURE SP_PRO_AddBrand
	-- Add the parameters for the stored procedure here
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;


BEGIN TRY
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Brands] ([Name])
     SELECT 
	objectVM.value('(Name/text())[1]','[nvarchar](max)') as BrandName
    FROM @XMLSQL.nodes('Brands') AS TEMPTEBLE(objectVM)

	 SET NOCOUNT off;
	 set @Status =1
	 
	
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

