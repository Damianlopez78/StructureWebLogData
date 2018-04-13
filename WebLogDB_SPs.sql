
/*Create a schema named dbo*/
CREATE SCHEMA Weblog;
GO

/*The SQL commands that create your tables*/
if exists (select * from Weblog.sysobjects where id = object_id(N'[Weblog].[Login]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Weblog].[Login]
GO

CREATE TABLE [Weblog].[Login] 
(
     	[UserId] [INT] IDENTITY (1,1) NOT NULL AUTO_INCREMENT,
		[Username] [NVARCHAR] (30) NOT NULL,
     	[UserPassword] [NVARCHAR] (30) NOT NULL
		
) ENGINE = InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


if exists (select * from Weblog.sysobjects where id = object_id(N'[Weblog].[User_Details]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Weblog].[User_Details]
GO

CREATE TABLE [Weblog].[User_Details] 
(
		[UserId] [INT] IDENTITY (1,1) NOT NULL AUTO_INCREMENT,  
    		[FirstName] [NVARCHAR] (200) NOT NULL,
		[LastName] [NVARCHAR] (200) NULL,
		[Email] [NVARCHAR] (100) NULL 
) ON [PRIMARY]
GO

/*The SQL commands & data that populate the tables*/

INSERT INTO [Weblog].[Login] (UserId, Username, UserPassword)
VALUES (1, 'rtaha', 'Rt123')

INSERT INTO [Weblog].[User_Details] (FirstName, LastName, Email);  
VALUES ( 'Rehab’, ‘Taha’, ‘ret7@njit.edu' )

/*Execute the following statements:*/
/*To view the schemas in this database:*/
SELECT * FROM sys.schemas;

/*To view the user details in this database:*/
SELECT * FROM User_Details;

/*To view rtaha details in this database:*/
SELECT * FROM Login WHERE UserId = 1 AND Username LIKE 'rtaha';*/


/*Create Procedure statements:*/
/*Create a Login stored procedure*/

Create PROCEDURE UserAddLogin [ @loginame = ] 'Username'
    [ , [ @UserPassword = ] 'UserPassword' ]
    [ , [ @defdb = ] 'Weblog' ]
    [ , [ @deflanguage = ] 'language' ]
    [ , [ @UserId = ] 'UserId' ]
Go

/* Create a new user in the database */

CREATE LOGIN rtaha
    WITH PASSWORD = 'Rt123';
USE Weblog;
CREATE USER Rehab FOR LOGIN rtaha
GO

/* Removes the user from the system */
DROP LOGIN Taha;
GO
DROP USER Taha;
GO


/*Create Stored Procedure that will return a user name*/
Create PROCEDURE GetUserName(
@UserId INT
)
As
Begin
SELECT FirstName+‘ ’+LastName From User_Details WHERE UserId=@UserId
End


/* Create a stored procedure that collect the user name returns by GetUserName
stored procedure*/

Create  PROCEDURE GetUserNameInOutputVariable
(

@UserId INT,                       
@UserName VARCHAR (200)  OUT       
)
AS
BEGIN
SELECT @UserName= FirstName+' '+LastName FROM User_Details WHERE UserId=@UserId
END


/*Create Stored procedure that Insert value into the table User_Details. */

Create PROCEDURE InsertUserInfo
(
 @UserFirstName Varchar(200),
 @UserLastName  Varchar(200),
 @UserEmail     Varchar(50)
) 
As
 Begin
   Insert into User_Details (FirstName, LastName, Email)
   Values(@UserFirstName, @UserLastName,@UserEmail)
 End


/* Create a stored procedure that collect the user email address by modifying the GetUserNameInOutputVariable  */

Alter  PROCEDURE GetUserNameInOutputVariable
(

@UserId INT,                       
@UserName VARCHAR (200)  OUT,
@UserEmail VARCHAR (200)  OUT
)
AS
BEGIN
SELECT @UserName= FirstName+' '+LastName,
			@ UserEmail=email FROM User_Details WHERE UserId=@UserId
END
