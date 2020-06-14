drop database BTL

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

CREATE TABLE [dbo].[tblNews] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [sTitle]      NVARCHAR (MAX) NULL,
    [sContent]    NVARCHAR (MAX) NULL,
    [bIsAproved]  BIT            NULL,
    [sPostedDate] NVARCHAR (50)  NULL default CURRENT_TIMESTAMP,
    [sPostedBy]   NVARCHAR (50)  NULL,
    [imgPicture]  NVARCHAR (50)  NULL,
    [sCategory]   INT            NULL,
    [iViews]      INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

ALTER TABLE tblNews
ALTER COLUMN imgPicture NVARCHAR (MAX)

create proc SP_doQueryIndexContent
as begin 
select top 10 * from tblNews,tblCategories where bIsAproved = 1 and tblCategories.Id=tblNews.sCategory
end

SET IDENTITY_INSERT [dbo].[tblNews] ON
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (1, N'16 ngày không có ca Covid-19, ca nghi ngờ mới nhất mắc sốt xuất huyết', N'16 ngày không có ca Covid-19, ca nghi ngờ mới nhất mắc sốt xuất huyết', 1, N'2012-12-12 00:00:00', N'1', N'xetnghiem-1588417025788.jpg', 1, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (2, N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', N'admin', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg', 1, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (3, N'title test display 1', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg', 1, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (4, N'title test display 2', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'xetnghiem-1588417025788.jpg', 2, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (5, N'title test display 3', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg', 2, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (6, N'title test display 4', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'download.png', 2, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (7, N'title test display 5', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg', 3, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (8, N'title test display 6', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, N'2012-12-12 00:00:00', N'1', N'cuubangapnan.jpeg', 3, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (9, N'title test display  9', N'Cứu bạn đuối nước khi tắm biển, nam thanh niên 18 tuổi tử vong', 1, NULL, N'1', N'cuubangapnan.jpeg', 3, 0)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (1003, N'12', N'2132131231', 1, N'2020-05-03 19:58:00', N'1', N'cuubangapnan.jpeg', 6, 1)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (1004, N'123123123', N'12312312312', 1, N'2020-05-03 20:05:02', N'1', N'cuubangapnan.jpeg', 7, 100)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (1005, N'12333332', N'123123', 1, N'2020-05-03 20:05:23', N'1', N'cuubangapnan.jpeg', 3, 8)
INSERT INTO [dbo].[tblNews] ([Id], [sTitle], [sContent], [bIsAproved], [sPostedDate], [sPostedBy], [imgPicture], [sCategory], [iViews]) VALUES (1006, N'1211111', N'11111111', 1, N'2020-05-03 20:05:41', N'1', N'cuubangapnan.jpeg', 4, 50)
SET IDENTITY_INSERT [dbo].[tblNews] OFF

CREATE TABLE [dbo].[tblCategories] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [sCategoryName] NVARCHAR (MAX) NULL,
    [sImage] NVARCHAR(50) NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

alter table tblCategories add sImage NVARCHAR(50) NULL

SET IDENTITY_INSERT [dbo].[tblCategories] ON
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (1, N'Thể thao', N'sport.png')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (2, N'Y tế', N'yte.jpg')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (3, N'Khoa học', N'khoahoc.png')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (4, N'Chính trị', N'chinhtri.jpg')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (5, N'Pháp luật', N'luat.jpg')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (6, N'Thế giới', N'thegioi.jpg')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (7, N'Du lịch', N'dulich.jpg')
INSERT INTO [dbo].[tblCategories] ([Id], [sCategoryName], [sImage]) VALUES (8, N'Đời sống', N'doisong.jpg')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF

alter proc SP_doGetTrendingNews
as begin
select top 3 * from tblNews,tblCategories
where cast(sPostedDate as Date) = cast(getdate() as Date)
AND tblNews.sCategory = tblCategories.Id
and bIsAproved = 1
order by iViews Desc
end

Create proc SP_doGetCategory
as begin 
select * from tblCategories;
end 

SP_doGetCategory

create proc spGetLastestNews
as begin 
select top 4 * from tblUsers,tblNews,tblCategories 
where tblNews.sCategory = tblCategories.Id and bIsAproved = 1 
order by sPostedDate desc
end 

Create proc SP_doGetTrendingNewsWeek
as begin
select top 10 * from tblNews
where DATEDIFF(DAY, sPostedDate,  cast(getdate() as Date)) < 7
and bIsAproved = 1
order by iViews Desc
end

alter proc SP_doGetNewByCategory
@categoryId int
as begin
select * from tblCategories,tblNews,tblUsers
where tblCategories.Id=@categoryId
and tblCategories.Id=tblNews.sCategory
and tblNews.bIsAproved=1
and tblNews.sPostedBy = tblUsers.iID
end


SP_doGetNewByCategory 1

alter PROCEDURE sp_InsertNewPost
       -- Add the parameters for the stored procedure here
       @sTitle nvarchar(max),
       @sContent nvarchar(max),
       @bIsAproved bit,
       @sPostedDate nvarchar(50),
	   @sPostedBy nvarchar(50),
	   @imgPicture nvarchar(max),
	   @sCategory int
AS
BEGIN
       INSERT INTO tblNews
              (sTitle, sContent, bIsAproved, sPostedDate, sPostedBy, imgPicture, sCategory)
       VALUES
              (@sTitle, @sContent, @bIsAproved, @sPostedDate,@sPostedBy,@imgPicture,@sCategory)
END 