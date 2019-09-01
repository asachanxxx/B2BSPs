
ALTER PROCEDURE SP_PRO_GetUserDetailsSPName
	-- Add the parameters for the stored procedure here
	@UserID int,
	@Status int output
AS
BEGIN

BEGIN TRANSACTION trans;
BEGIN TRY

DECLARE @OrgId INT


SELECT 
	@OrgId =OrganizationID 
FROM 
	Users
WHERE 
	Id = @UserID

SELECT 
	Id,UserId,UserName,Email,Phone,Address1,Address2,Address3,FirstName,LastName,JobTitle
FROM 
	Users
WHERE 
	Id = @UserID

SELECT 
	Id,	BusinessType,	OrganizationName,	MainPhone,	AddressLine1,	AddressLine2,	District,	City,	Email, IsSeller
FROM 
	Organizations
WHERE 
	Id = @OrgId


		
	--DECLARE @hdoc int
	--DECLARE @objName nvarchar(max)


	--EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLSQL

	--SELECT *
	--INTO  #tmp_OBJ
	--FROM OPENXML (@hdoc, '/Model', 2)
	--WITH (
	--	[Id] [int],
	--	[Name] [nvarchar](max),
	--	[IsApproved] [bit]
	--)

	----SELECT * FROM #tmp_OBJ

	--SELECT @objName  = Name  FROM  #tmp_OBJ

	--IF EXISTS(SELECT * FROM Models WHERE Name=@objName)
	--BEGIN
	--	RAISERROR ('Model name already exists', 16,  1); 
	--END

	--IF(@Action =2)
	--BEGIN
	--	UPDATE CP 
	--	SET CP.Name = TEMP.Name,
	--	CP.IsApproved = TEMP.IsApproved
	--	FROM 
	--	Models AS CP
	--	INNER JOIN #tmp_OBJ AS TEMP ON CP.Id = TEMP.id
	--	WHERE CP.Id = TEMP.id
	--	SET @Status =2 
	--END
	--ELSE
	--BEGIN
	--INSERT INTO [dbo].[Models]
 --          ([Name]
 --          ,[IsApproved])
 --   SELECT Name,IsApproved FROM #tmp_OBJ

	-- set @Status =1
	--END

	 
	
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

