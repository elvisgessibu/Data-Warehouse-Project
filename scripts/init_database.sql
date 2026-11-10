/*
==============================================================================================
Create Database and Schemas
==============================================================================================
Script Purpose:
  This scripts creates a new database named 'DataWarehouse' after checking if it aready exists
  If the database exists, it is dropped and recreated. Additionally, the scripts sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'.
*/

USE master;
GO

--Drop and recretae the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO					-- "Go": Used to separate batches when working with multiple SQL statements

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
