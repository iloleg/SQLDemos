--- YOU MUST EXECUTE THE FOLLOWING SCRIPT IN SQLCMD MODE.
:Connect SQLSERVER-0
USE [master]
GO
SELECT name, db_failover FROM sys.availability_groups
GO
