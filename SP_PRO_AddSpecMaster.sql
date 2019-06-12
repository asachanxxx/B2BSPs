ALTER PROCEDURE SP_PRO_AddSpecMaster
	-- Add the parameters for the stored procedure here
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;


BEGIN TRY
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[SpecMasters]([SpecName],[IpAddress],[CreatedBy],[ModifiedBy],[CreatedWhen],[ModifiedWhen])
     SELECT 
	objectVM.value('(SpecName/text())[1]','[nvarchar](max)') as PartNumber,
	objectVM.value('(IpAddress/text())[1]','[nvarchar](max)') as IpAddress,
	objectVM.value('(CreatedBy/text())[1]','[nvarchar](max)') as CreatedBy,
	objectVM.value('(ModifiedBy/text())[1]','[nvarchar](max)') as ModifiedBy,
	objectVM.value('(CreatedWhen/text())[1]','[datetime]') as CreatedWhen,
	objectVM.value('(ModifiedWhen/text())[1]','[datetime]') as ModifiedWhen
    FROM @XMLSQL.nodes('SpecMaster') AS TEMPTEBLE(objectVM)

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

