select * from [dbo].[Users]

--BuyersCase
/*
Case is this . if any user not been loged in to the system one can log in 
so they can enter user name password and logged in . in the settings logged one will show his company name and details
as well as his details. and place to edit His details only

Organization has a primary user and he can change org details as well as his details
There must be a place to give this propirty to some one else in his company

There should be User groups 
	-Supper User
	-Moderators
	-Users

	Mark User Group name on top of the Prpfile ([Supper User])

	There can be only one supper user for given company. and can be more than one Moderators 
	also one or more Users may be there.

All users can raise Qutations and Only Supper User and Moderators can be Accept those Quatations 


If User wants to create a new user then he has two choices 
	-Create Organization and the Supper User[More Details] (Active =fasle)
	-Create a User and Link it to existing organization (Active =fasle)

In the first option the user becomes the first and Supper user. So he can acccept other users and can change title to 
Moderator or User.

When user creates a new user and wants to like to existing org Supper user of that company must accept the user and put relevent titles
And Supper user can grant Supper power to another user and can leave from the Supper user.

DashBoard:
=========
<Organization Name> <TP No> <Email Address>

Once logged in Direct to the Dashboard page
Need a item on the dashboard for Tasks (ex: accept a user to Supper user , Other non seller related messages)





GetUserDetails(String UserID)
EditUserDetails(User obj)
EditOrgDetails(User obj)
+(string CurrentId , string ChangeToId)
RaiseQutations(Qutation Obj)
ApproveQutations(int QutationId, string UserId){
	--First check the UserID is A moderator or SupperUser
	--If User Valid then Approve the qutation
}

CreateUserWithOrganisation(OrgUserVM obj)
CreateUserOnly(USer obj,int OrgID){
	-First check orgId is a valied one.
	-Create the user and set active = false
	-Create Approval Entry for given Org to visible to Supper User 
}

ApproveUser(string UserIdToApprove , int OrgId, string ApprovalUserId){
	-first check if approvaluserId is a supper user 
	-If he passes then Set active = true
	-also set approve =true in approval table
}

GetAllusersForApproval(int OrgId , string UserId){
	-Check if the userid is a Supper user
	- then Get all the users in approval table where isapprove = false and user.active=false;
}

*/

/*
if any seller mark as a  product in stock then main product display should be In-Stock



*/

select * from [dbo].[Organizations]
select * from [dbo].[Users]

/*
New Menues
==========
Approve Qutations
*/

--truncate table  Users
--truncate table  Organizations
--delete from  [B2BSystem_Security].dbo.AspNetUsers

--Id	BusinessType	OrganizationName	MainPhone	AddressLine1	AddressLine2	District	City	Email	FRPerson	FRPEmail	SRPerson	SRPEmail	HandlerName	HandlerEmail	IsSeller	IpAddress	CreatedBy	ModifiedBy	CreatedWhen	ModifiedWhen

SELECT * FROM Organizations
SELECT * FROM Users  
select * from [B2BSystem_Security].dbo.AspNetUsers
SELECT * FROM Approvals
/*
TODO
=====
1. create a table call business type (id Name . Description) - OK
2. create class and Lists District , City (hardcode this) - OK
3. Make logout creen fancy -OK
4. Make Create account page -OK
5. create Subscribe for exclusive e-mail offers and discounts process if it clicks -ok
6. Create fogottten password portals
7. when you add details on the Username or password and hit enter it should log in - ok
8. Make new customer description (tell org and other stuff)
9. if user clicks login and there is system error display it to user -ok
	(track http://localhost:50965/owin/Token net::ERR_CONNECTION_REFUSED)
10. if username or password wrong track 400 bad request and display error to user - ok
11. find out a method to overide authontication on the Main page (remove auth in API) - ok
12. Add spiner to main page loadings  
13. Add link to confirm users 
14. Active users only can log in to the system --ok
15. when supper user logged show users on the dashboard somewhere

*/


select Id, OrganizationName as 'Name' from Organizations order by OrganizationName desc

select Activated from Users where UserId = 'e4eb925b-50da-46c9-a846-82f117c24213'




update Users set IsSubscribed =0 where UserId = 'e4eb925b-50da-46c9-a846-82f117c24213'
SELECT IsSubscribed,* FROM Users  