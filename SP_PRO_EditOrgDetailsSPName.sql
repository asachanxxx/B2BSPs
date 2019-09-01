alter PROCEDURE SP_PRO_EditOrgDetailsSPName
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;
BEGIN TRY

/*
User
*/

DECLARE @hdoc int



EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

--initialize status to normal 
set @Status =1

/***********Insert User from incoming XML stream **************************************/
SELECT *
INTO  
	#tmp_OBJ_oRG
FROM OPENXML 
	(@hdoc, '/Organization', 2)
WITH 
	[dbo].[Organizations]


	select * from #tmp_OBJ_oRG

UPDATE 
	U
SET 
	U.Email = O.Email,
	U.MainPhone = O.MainPhone,
	U.District = O.District,
	U.City = O.City,
	U.AddressLine1 = O.AddressLine1,
	U.AddressLine2 = O.AddressLine2
FROM
	Organizations AS U 
INNER JOIN 
	#tmp_OBJ_oRG AS O 
ON 
	O.id = U.id
WHERE 	
	O.id = U.id



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

