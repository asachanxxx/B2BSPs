--SP_PRO_AddOrganization


alter PROCEDURE SP_PRO_AddOrganization
	@XMLSQL XML, 
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;
BEGIN TRY

/*
OrgUserFullVM/OrganisazionDet
OrgUserFullVM/UserDet
*/

DECLARE @hdoc int
DECLARE @objName nvarchar(max)
DECLARE @OrgName nvarchar(max)


EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

--initialize status to normal 
set @Status =1

/***********Insert User from incoming XML stream **************************************/
SELECT *
INTO  
	#tmp_OBJ_User
FROM OPENXML 
	(@hdoc, '/OrgUserFullVM/UserDet', 2)
WITH 
	[dbo].[Users]


INSERT INTO 
		Users
	SELECT * 
		FROM
		#tmp_OBJ_User	

/***********Insert Organizations from incoming XML stream **************************************/

SELECT *
INTO  
	#tmp_OBJ_Org
FROM OPENXML 
	(@hdoc, '/OrgUserFullVM/OrganisazionDet', 2)
WITH [dbo].[Organizations]

--Extract OrgName from incoming XML stram
SELECT 
	@OrgName = OrganizationName 
FROM 
	#tmp_OBJ_Org   	

--Check if Organization name is exists. is so Raise an error

IF EXISTS(SELECT * FROM Organizations WHERE OrganizationName = @OrgName)
BEGIN
	set @Status =-1
	RAISERROR ('Organization name already exists', 16,  1); 
END
ELSE
BEGIN
	INSERT INTO 
		Organizations
	SELECT * 
		FROM
		#tmp_OBJ_Org	
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

