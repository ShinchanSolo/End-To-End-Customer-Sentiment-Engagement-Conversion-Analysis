/*
===============================================================================
Create Data Base: Marketing Analytics
===============================================================================
Purpose:
    - Create database
    - Create layered schemas (bronze, silver, gold)
===============================================================================
*/

------------------------------------------------------------
-- Create Database 
------------------------------------------------------------
IF DB_ID('marketing_db') IS NULL
    CREATE DATABASE marketing_db;
GO

USE marketing_db;
GO

------------------------------------------------------------
-- Create Schemas 
------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO