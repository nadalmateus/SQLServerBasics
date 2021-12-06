CREATE DATABASE [SQL]

CREATE TABLE [Student] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(120) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Documment] NVARCHAR(20) NULL,
    [Phone] NVARCHAR(20) NULL,
    [Birthdate] DATETIME NULL,
    [CreateDate] DATETIME NOT NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY ([Id])
)
GO

CREATE TABLE [Author] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(80) NOT NULL,
    [Title] NVARCHAR(80) NOT NULL,
    [Image] NVARCHAR(1024) NULL,
    [Bio] NVARCHAR(2000) NULL,
    [Url] NVARCHAR(1024) NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Type] TINYINT NOT NULL,
    CONSTRAINT [PK_Author] PRIMARY KEY ([Id])
)
GO

CREATE TABLE [Career] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(80) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NULL,
    [DurationInMinutes] INT NOT NULL,
    [Active] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Career] PRIMARY KEY ([Id])
)
GO

CREATE TABLE [Category] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(80) NOT NULL,
    [Url] NVARCHAR(1024) NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Order] INT NOT NULL,
    [Featured] BIT NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
)
GO



CREATE TABLE [Course] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Tag] NVARCHAR(20) NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Level] TINYINT NOT NULL,
    [DurationInMinutes] INT NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NOT NULL,
    [Active] BIT NOT NULL,
    [Free] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [AuthorId] UNIQUEIDENTIFIER NULL,
    [CategoryId] UNIQUEIDENTIFIER NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Course_Author_AuthorId] FOREIGN key ([AuthorId]) REFERENCES [Author] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Course_Category_CategoryId] FOREIGN key ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE NO ACTION,
)
GO

CREATE TABLE [CareerItem] (
    [CareerId] UNIQUEIDENTIFIER NOT NULL,
    [CourseId] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Description] TEXT NOT NULL,
    [Order] TINYINT NOT NULL,
    CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId], [CareerId]),
    CONSTRAINT [FK_CareerItem_Career_CareerId] FOREIGN key ([CareerId]) REFERENCES [Career] ([Id]),
    CONSTRAINT [FK_CareerItem_Course_CourseId] FOREIGN key ([CourseId]) REFERENCES [Course] ([Id])
)
GO

CREATE TABLE [StudentCourse] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [CourseId] UNIQUEIDENTIFIER NULL,
    [Progress] TINYINT NOT NULL,
    [Favorite] BIT NOT NULL,
    [StudentId] UNIQUEIDENTIFIER NULL,
    [StartDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NULL,
    CONSTRAINT [PK_StudentCourse] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_StudentCourse_Course_CourseId] FOREIGN key ([CourseId]) REFERENCES [Course] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StudentCourse_Student_StudentId] FOREIGN key ([StudentId]) REFERENCES [Student] ([Id]) ON DELETE NO ACTION,
)
GO