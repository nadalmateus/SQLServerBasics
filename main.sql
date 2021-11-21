CREATE DATABASE [Curso]
USE [Curso]

DROP TABLE [Aluno]

CREATE TABLE [Aluno]
(
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(80) NOT NULL,
    [Nascimento] DATETIME NULL,
    [Ativo] BIT DEFAULT (0)

        CONSTRAINT [PK_Aluno]  PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Aluno_Email]  UNIQUE([Email]),

)
GO

