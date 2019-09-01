alter PROCEDURE SP_PRO_EditUserDetailsSPNameSPName
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
	#tmp_OBJ_User
FROM OPENXML 
	(@hdoc, '/User', 2)
WITH 
	[dbo].[Users]



UPDATE 
	U
SET 
	U.Email = O.Email,
	U.Phone = O.Phone,
	U.FirstName = O.FirstName,
	U.LastName = O.LastName,
	U.JobTitle = O.JobTitle,
	U.Address1 = O.Address1,
	U.Address2 = O.Address2,
	U.Address3 = O.Address3
FROM
	Users AS U 
INNER JOIN 
	#tmp_OBJ_User AS O 
ON 
	LTRIM(RTRIM(O.UserId)) = LTRIM(RTRIM(U.UserId))
WHERE 	
	LTRIM(RTRIM(O.UserId)) = LTRIM(RTRIM(U.UserId))



	
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

