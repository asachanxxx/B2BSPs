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

	There can be only one supper user for given company. and can be more than one Moderators 
	also one or more Users may be there.

All users can raise Qutations and Only Supper User and Moderators can be Accept those Quatations 


If User wants to create a new user then he has two choices 
	-Create Organization and the Supper User
	-Create a User and Link it to existing organization

In the first option the user becomes the first and Supper user. So he can acccept other users and can change title to 
Moderator or User.

When user creates a new user and wants to like to existing org Supper user of that company must accept the user and put relevent titles
And Supper user can grant Supper power to another user and can leave from the Supper user.

DashBoard:
=========
<Organization Name> <TP No> <Email Address>







GetUserDetails(String UserID)
EditUserDetails(User obj)
EditOrgDetails(User obj)
ChangeSupperUser(string CurrentId , string ChangeToId)
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



select * from [dbo].[Organizations]
select * from [dbo].[Users]

/*
New Menues
==========
Approve Qutations
*/

