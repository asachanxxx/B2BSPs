

ALTER PROCEDURE SP_PRO_CreateOrganizationOnlySPName
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
DECLARE @OrgName varchar(100)



EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

--initialize status to normal 
set @Status =1

--EXTRACT the incoming xml data
SELECT *
INTO  
	#tmp_OBJ_oRG
FROM OPENXML 
	(@hdoc, '/Organization', 2)
WITH 
	[dbo].[Organizations]

--set value of the org name to variable to use later
SELECT 
	@OrgName = OrganizationName 
from 
	#tmp_OBJ_oRG

	select * from #tmp_OBJ_oRG 
--check existance of the orgname

IF EXISTS (select * from Organizations where LTRIM(RTRIM(OrganizationName)) = LTRIM(RTRIM(@OrgName)))
BEGIN
--if exists raise error
set @Status =-1
RAISERROR ('Organization name already exists', 16,  1); 

END
ELSE
BEGIN
--if not insert the org
INSERT INTO 
	Organizations
SELECT 
	* 
FROM 
	#tmp_OBJ_oRG

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

