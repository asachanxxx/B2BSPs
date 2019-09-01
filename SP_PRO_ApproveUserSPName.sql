
ALTER PROCEDURE SP_PRO_ApproveUserSPName
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
DECLARE @ApprovalUserId varchar(100)
DECLARE @UserIdToApprove varchar(100)
DECLARE @OrgId varchar(100)


EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

--initialize status to normal 
set @Status =1

/***********Insert User from incoming XML stream **************************************/
SELECT *
INTO  
	#tmp_OBJ_User
FROM OPENXML 
	(@hdoc, '/ApproveUserVM', 2)
WITH 
	(UserIdToApprove varchar(100), OrgId int ,ApprovalUserId varchar(100))

SELECT 
	@ApprovalUserId =ApprovalUserId , 
	@UserIdToApprove = UserIdToApprove , 
	@OrgId= OrgId 
FROM 
	#tmp_OBJ_User

IF NOT EXISTS(SELECT * FROM Users WHERE OrganizationID = @OrgId and UserId = @ApprovalUserId)
BEGIN
	set @Status =-1
	RAISERROR ('Approval user is not belong to given organization', 16,  1); 
END

IF NOT EXISTS(SELECT * FROM Users WHERE OrganizationID = @OrgId and UserId = @UserIdToApprove)
BEGIN
	set @Status =-1
	RAISERROR ('User who needs approval is not belong to given organization', 16,  1); 
END

 --first check if approvaluserId is a supper user

IF EXISTS( SELECT * FROM Users WHERE UserId = @ApprovalUserId AND IsSupperUser = 1 AND OrganizationID = @OrgId)
BEGIN
	 -- If he passes then Set active = true
	UPDATE 
		Users 
	SET 
		Activated = 1 , 
		Approved = 1 
	WHERE 
		UserId = @UserIdToApprove

	 -- set approve = true in approval table

	 UPDATE 
		Approvals
	SET 
		IsApproved = 1,
		ApprovedBy = @ApprovalUserId,
		ApprovedDate = GETDATE()
	WHERE 
		UserID = @UserIdToApprove
END
ELSE
BEGIN
	set @Status =-1
	RAISERROR ('Given user is not a supper user on given organization to approve..', 16,  1); 
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
