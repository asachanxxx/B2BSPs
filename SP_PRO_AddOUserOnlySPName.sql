alter PROCEDURE SP_PRO_AddOUserOnlySPName
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
	(@hdoc, '/User', 2)
WITH 
	[dbo].[Users]


INSERT INTO 
		Users
	SELECT * 
		FROM
	#tmp_OBJ_User	

--Create Approval Entry for given Org to visible to Supper User


INSERT INTO [dbo].[Approvals]
           ([UserID]
           ,[OrgId]
           ,[IsApproved]
           ,[ApprovedBy]
           ,[ApprovedDate]
           ,[IpAddress]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedWhen]
           ,[ModifiedWhen])
SELECT
			[UserId]
           ,[OrganizationID]
           ,0
           ,''
           ,GETDATE()
           ,[IpAddress]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedWhen]
           ,[ModifiedWhen]
 FROM #tmp_OBJ_User

	
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

