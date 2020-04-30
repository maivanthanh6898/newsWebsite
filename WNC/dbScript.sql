CREATE TABLE [dbo].[tblUsers]
(
    [iID] INT PRIMARY KEY IDENTITY(1,1), 
	[sUsername] NVARCHAR(MAX) NOT NULL ,
    [sPassword] NVARCHAR(MAX) NOT NULL, 
    [isAdmin] BIT NOT NULL, 
    [sName] NVARCHAR(MAX) NOT NULL, 
    [dBirth] DATE NULL, 
    [sDesc] NVARCHAR(MAX) NULL, 
    [sAddress] NVARCHAR(MAX) NULL, 
)

SET IDENTITY_INSERT [dbo].[tblUsers] ON
INSERT INTO [dbo].[tblUsers] ([iID], [sUsername], [sPassword], [isAdmin], [sName], [dBirth], [sDesc], [sAddress]) VALUES (1, N'admin@gmail.com', N'admin', 1, N'Admin', NULL, NULL, NULL)
INSERT INTO [dbo].[tblUsers] ([iID], [sUsername], [sPassword], [isAdmin], [sName], [dBirth], [sDesc], [sAddress]) VALUES (2, N'test@gmail.com', N'test', 0, N'Test', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF;

Create proc DoLogin
@username nvarchar(max),
@password nvarchar(max)
as begin
select * from tblUsers where [sUsername]= @username and  [sPassword]=@password
end