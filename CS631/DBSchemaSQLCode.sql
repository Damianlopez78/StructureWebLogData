/*Create a schema named weblog*/
PRINT N'Creating weblog...';
CREATE SCHEMA [Weblog];
	AUTHORIZATION [dbo];
GO

/*The SQL commands that create the tables*/
/*login table*/
PRINT N'Creating weblog.login...';
GO

/*if exists (select * from dbo.sysobjects where id = object_id(N'[weblog].[Login]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [weblog].[Login]
GO*/
CREATE TABLE [weblog].[Login] 
(
     	[UserId] INT IDENTITY (1,1) NOT NULL AUTO_INCREMENT,
	[Username] NVARCHAR (30) NOT NULL,
     	[UserPassword] NVARCHAR (30) NOT NULL
		
) ENGINE = InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1
GO

/*The SQL commands & data that populate the table*/
INSERT INTO [weblog].[Login] (UserId, Username, UserPassword)
VALUES (1, 'rtaha', 'Rt123')
GO

/*The SQL commands that create the tables*/
/*User_Details table*/
PRINT N'Creating weblog.User_Details...';
GO

/*If exists (select * from dbo.sysobjects where id = object_id(N'[weblog].[User_Details]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [weblog].[User_Details]
GO*/
CREATE TABLE [weblog].[User_Details] 
(
	[UserId] INT IDENTITY (1,1) NOT NULL AUTO_INCREMENT,  
    	[FirstName] NVARCHAR (200) NOT NULL,
	[LastName] NVARCHAR (200) NULL,
	[Email] NVARCHAR (100) NULL 
) ON [PRIMARY]
GO

/*The SQL commands & data that populate the tables*/
INSERT INTO [weblog].[User_Details] (FirstName, LastName, Email);  
	VALUES ( 'Rehab’, ‘Taha’, ‘ret7@njit.edu' )
GO

PRINT N'Creating weblog.PK_User_Details_uId...';
GO
ALTER TABLE [weblog].[User_Details]
	ADD CONSTRAINT [PK_User_Details_uId] PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NONCOMPUTE = OFF);
GO

/*SELECT * FROM User_Details;
SELECT * FROM Login WHERE UserId = 1 AND Username LIKE 'rtaha';*/

/*Create Procedure statements:*/
/*Create Stored procedure that Insert value into the table User_Details. */
PRINT N'Creating weblog.InsertNewUserInfo...';
GO
Create PROCEDURE [weblog].[InsertNewUserInfo]
 @UserFirstName Varchar(200),
 @UserLastName  Varchar(200),
 @UserEmail     Varchar(50)
AS
BEGIN
INSERT INTO [weblog].[User_Details] (FirstName, LastName, Email)
   VALUES(@UserFirstName, @UserLastName,@UserEmail)
END
GO

/*Create Stored Procedure that will return a user name*/
PRINT N'Creating weblog.GetUserName...';
GO
Create PROCEDURE [weblog].[GetUserName]
@UserId INT
AS
BEGIN
SELECT FirstName+‘ ’+LastName FROM [weblog].[User_Details] WHERE [UserId] = @UserId
END
GO

/* Create a stored procedure that collect the user name returns by GetUserName
stored procedure*/
PRINT N'Creating weblog.GetUserNameInOutputVariable...';
GO
Create  PROCEDURE [weblog].[GetUserNameInOutputVariable]
@UserId INT,                       
@UserName VARCHAR (200)  OUT       
AS
BEGIN
SELECT @UserName= FirstName+' '+LastName 
FROM [weblog].[User_Details] 
WHERE [UserId]= @UserId
END
GO

/* Create a stored procedure that collect the user email address by modifying the GetUserNameInOutputVariable  */
PRINT N'Creating weblog.GetUserNameInOutputVariable...';
GO
ALTER  PROCEDURE [weblog].[GetUserNameInOutputVariable]
@UserId INT,                       
@UserName VARCHAR (200)  OUT,
@UserEmail VARCHAR (200)  OUT
AS
BEGIN
SELECT @UserName= FirstName+' '+LastName, @ UserEmail=email 
FROM [weblog].[User_Details] 
WHERE [UserId]=@UserId
END
GO

/*Create Stored procedure that show user details in the weblogInfo table. */
PRINT N'Creating weblog.ShowUserInfo...';
GO
Create PROCEDURE [weblog].[ShowUserInfo]
@UserId INT = 0
AS
BEGIN
SELECT [C].[UserName]FROM [weblog].[GetUserName] AS C
INNER JOIN [weblog].[weblogInfo] AS W
ON [W].[UserId] = [C].[UserId]
WHERE [C].[UserId]=@UserId
END
GO
