USE marketing_db;
GO

/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.dbo_products', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_products;
GO

CREATE TABLE bronze.dbo_products (
    product_id        VARCHAR(50),
    product_name      VARCHAR(250),
    category          VARCHAR(100),
    price             VARCHAR(50),
);
GO


IF OBJECT_ID('bronze.dbo_geography', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_geography;
GO

CREATE TABLE bronze.dbo_geography (
    geography_id      VARCHAR(50),
    country           VARCHAR(100),
    city              VARCHAR(100)
);
GO


IF OBJECT_ID('bronze.dbo_customers', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_customers;
GO

CREATE TABLE bronze.dbo_customers (
    customer_id           VARCHAR(50),
    customer_name         VARCHAR(255),
    email                 VARCHAR(255),
    gender                VARCHAR(50),
    age                   VARCHAR(50),
    geography_id          VARCHAR(50)
);
GO


IF OBJECT_ID('bronze.dbo_engagement_data', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_engagement_data;
GO

CREATE TABLE bronze.dbo_engagement_data (
    engagement_id           VARCHAR(50),
    content_id              VARCHAR(50),
    content_type            VARCHAR(50),
    likes                   VARCHAR(100),
    engagement_date         VARCHAR(100),
    campaign_id             VARCHAR(50),
    product_id              VARCHAR(50),
    views_clicks            VARCHAR(100)
);
GO


IF OBJECT_ID('bronze.dbo_customer_journey', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_customer_journey;
GO

CREATE TABLE bronze.dbo_customer_journey (
    journey_id          VARCHAR(50),
    customer_id         VARCHAR(50),
    product_id          VARCHAR(100),
    visit_date          VARCHAR(50),
    stage               VARCHAR(50),
    action              VARCHAR(50),
    duration            VARCHAR(50)
);
GO


IF OBJECT_ID('bronze.dbo_customer_reviews', 'U') IS NOT NULL
    DROP TABLE bronze.dbo_customer_reviews;
GO

CREATE TABLE bronze.dbo_customer_reviews (
    review_id     VARCHAR(50),
    customer_id   VARCHAR(50),
    product_id    VARCHAR(50),
    review_date   VARCHAR(50),
    rating        VARCHAR(50),
    review_text   VARCHAR(MAX)
);
GO
