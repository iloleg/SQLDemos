--- YOU MUST EXECUTE THE FOLLOWING SCRIPT IN SQLCMD MODE.
:Connect SQLSERVER-0

USE master
GO

-- AutoseedDb01
CREATE DATABASE [AutoseedDb01] CONTAINMENT = NONE
ON PRIMARY (NAME = N'AutoseedDb01_data', FILENAME = N'F:\DATA\AutoseedDb01_data.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
LOG ON ( NAME = N'AutoseedDb01_log', FILENAME = N'F:\LOG\AutoseedDb01_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AutoseedDb01] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [AutoseedDb01] SET PAGE_VERIFY CHECKSUM  
GO
USE [AutoseedDb01]
GO
CREATE TABLE [dbo].[DemoData] (id INT IDENTITY PRIMARY KEY, demoData VARCHAR(200));
GO
INSERT INTO [dbo].[DemoData] (demoData) VALUES ('Test data prior to configuring AG membership, this db has the same data and log path');
GO 20000

-- AutoseedDb02 (NOTE: G:\ for TransLog)
CREATE DATABASE [AutoseedDb02] CONTAINMENT = NONE
ON PRIMARY (NAME = N'AutoseedDb02_data', FILENAME = N'F:\DATA\AutoseedDb02_data.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
LOG ON ( NAME = N'AutoseedDb02_log', FILENAME = N'G:\LOG\AutoseedDb02_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AutoseedDb02] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [AutoseedDb02] SET PAGE_VERIFY CHECKSUM  
GO
USE [AutoseedDb02]
GO
CREATE TABLE [dbo].[DemoData] (id INT IDENTITY PRIMARY KEY, demoData VARCHAR(200));
GO
INSERT INTO [dbo].[DemoData] (demoData) VALUES ('Test data prior to configuring AG membership, this db has different log path');
GO 20000


