
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/30/2018 19:53:55
-- Generated from EDMX file: C:\Users\cweng\Documents\TheHRM\TheHRM\Models\ModelHRM.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TheHrmdata];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Employee_Log_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee_Log] DROP CONSTRAINT [FK_Employee_Log_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_Leave_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Leave] DROP CONSTRAINT [FK_Leave_Employee];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Employee_Log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee_Log];
GO
IF OBJECT_ID(N'[dbo].[Leave]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Leave];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [IDNumber] bigint  NOT NULL,
    [FName] nvarchar(50)  NULL,
    [LName] nvarchar(50)  NULL,
    [Gender] char(10)  NULL,
    [Email] nvarchar(50)  NULL,
    [Role] nchar(10)  NULL,
    [Password] nvarchar(50)  NULL,
    [Pin] nchar(10)  NULL
);
GO

-- Creating table 'Employee_Log'
CREATE TABLE [dbo].[Employee_Log] (
    [logID] int  NOT NULL,
    [EmpID] bigint  NULL,
    [Date] datetime  NULL,
    [StartTime] time  NULL,
    [EndTime] time  NULL
);
GO

-- Creating table 'Leaves'
CREATE TABLE [dbo].[Leaves] (
    [LeaveID] int  NOT NULL,
    [EmpID] bigint  NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IDNumber] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([IDNumber] ASC);
GO

-- Creating primary key on [logID] in table 'Employee_Log'
ALTER TABLE [dbo].[Employee_Log]
ADD CONSTRAINT [PK_Employee_Log]
    PRIMARY KEY CLUSTERED ([logID] ASC);
GO

-- Creating primary key on [LeaveID] in table 'Leaves'
ALTER TABLE [dbo].[Leaves]
ADD CONSTRAINT [PK_Leaves]
    PRIMARY KEY CLUSTERED ([LeaveID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EmpID] in table 'Employee_Log'
ALTER TABLE [dbo].[Employee_Log]
ADD CONSTRAINT [FK_Employee_Log_Employee]
    FOREIGN KEY ([EmpID])
    REFERENCES [dbo].[Employees]
        ([IDNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_Log_Employee'
CREATE INDEX [IX_FK_Employee_Log_Employee]
ON [dbo].[Employee_Log]
    ([EmpID]);
GO

-- Creating foreign key on [EmpID] in table 'Leaves'
ALTER TABLE [dbo].[Leaves]
ADD CONSTRAINT [FK_Leave_Employee]
    FOREIGN KEY ([EmpID])
    REFERENCES [dbo].[Employees]
        ([IDNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Leave_Employee'
CREATE INDEX [IX_FK_Leave_Employee]
ON [dbo].[Leaves]
    ([EmpID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------