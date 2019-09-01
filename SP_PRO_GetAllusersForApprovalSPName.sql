
				
ALTER PROCEDURE SP_PRO_GetAllusersForApprovalSPName

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
DECLARE @UserId varchar(100)
DECLARE @OrgId varchar(100)


EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

--initialize status to normal 
set @Status =1

/***********Insert User from incoming XML stream **************************************/
SELECT *
INTO  
	#tmp_OBJ_User
FROM OPENXML 
	(@hdoc, '/GetAllusersForApprovalVM', 2)
WITH 
	(UserId varchar(100), OrgId int)

SELECT 
	@UserId =UserId , 
	@OrgId= OrgId 
FROM 
	#tmp_OBJ_User

--Check if the userid is a Supper user
--then Get all the users in approval table where isapprove = false and user.active = false;

IF NOT EXISTS(SELECT * FROM Users WHERE OrganizationID = @OrgId and UserId = @UserId)
BEGIN
	set @Status =-1
	RAISERROR ('Given user not found in the organization', 16,  1); 
END


--Check if the userid is a Supper user

IF EXISTS( SELECT * FROM Users WHERE UserId = @UserId AND IsSupperUser = 1 AND OrganizationID = @OrgId)
BEGIN

	SELECT
		Approvals.UserID as 'UserId' , Users.DisplayName, Users.Approved as 'IsApproved'   
	FROM
		Approvals 
	INNER JOIN
		Users 
	ON
		Users.UserId = Approvals.UserID
	WHERE 
		users.OrganizationID = @OrgId 
	AND 
		Approvals.IsApproved = 0


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
