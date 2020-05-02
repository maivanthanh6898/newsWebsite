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

CREATE TABLE [dbo].[tblNews]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [sTitle] NVARCHAR(MAX) NULL, 
    [sContent] NVARCHAR(MAX) NULL, 
    [bIsAproved] BIT NULL, 
    [tPostedDate] DATETIME NULL, 
    [sPostedBy] NVARCHAR(50) NULL,
	[imgPicture] NVARCHAR(50) NULL,
)

Create proc SP_doQueryIndexContent
as begin 
select top 10 * from tblNews where bIsAproved = 1
end


SET IDENTITY_INSERT [dbo].[tblNews] ON
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (1, N'16 ngày không có ca Covid-19, ca nghi ngờ mới nhất mắc sốt xuất huyết', N'16 ngày không có ca Covid-19, ca nghi ngờ mới nhất mắc sốt xuất huyết', 1, N'2012-12-12 00:00:00', N'1', N'xetnghiem-1588417025788.jpg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (2, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'admin', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (3, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (4, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (5, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (6, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (7, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (8, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (9, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (10, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (11, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (12, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (13, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [tPostedDate], [sPostedBy], [imgPicture]) VALUES (14, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg')
SET IDENTITY_INSERT [dbo].[tblNews] OFF
