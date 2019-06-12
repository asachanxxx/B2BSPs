
ALTER PROCEDURE SP_PRO_AddLevel3
	-- Add the parameters for the stored procedure here
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;


BEGIN TRY
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Level3] ([Level1Id],[Level12d],[Code],[Level3Name],[NoOfClicks],[NoOfImpressions],[IpAddress],[CreatedBy],[ModifiedBy],[CreatedWhen],[ModifiedWhen])
     SELECT 
	 objectVM.value('(Level1Id/text())[1]','int') as Level1Name,
	 objectVM.value('(Level12d/text())[1]','int') as Level1Name,
	 objectVM.value('(Code/text())[1]','nvarchar(max)') as code,
	 objectVM.value('(Level3Name/text())[1]','nvarchar(max)') as Level1Name,
	 0,0,
	 objectVM.value('(IpAddress/text())[1]','nvarchar(max)') as Level1Name,
	 objectVM.value('(CreatedBy/text())[1]','nvarchar(max)') as Level1Name,
	 objectVM.value('(ModifiedBy/text())[1]','nvarchar(max)') as Level1Name,
	 objectVM.value('(CreatedWhen/text())[1]','datetime') as Level1Name,
	 objectVM.value('(ModifiedWhen/text())[1]','datetime') as Level1Name
	 FROM @XMLSQL.nodes('Level3VM') AS TEMPTEBLE(objectVM)

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
