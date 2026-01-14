/*
===============================================================================
DDL Script: Create silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

IF OBJECT_ID('silver.dbo_products', 'U') IS NOT NULL
    DROP TABLE silver.dbo_products;
GO

CREATE TABLE silver.dbo_products (
    product_id        INT          NOT NULL       PRIMARY KEY,
    product_name      VARCHAR(250),
    category          VARCHAR(100),
    price             DECIMAL(6,2),
);
GO


IF OBJECT_ID('silver.dbo_geography', 'U') IS NOT NULL
    DROP TABLE silver.dbo_geography;
GO

CREATE TABLE silver.dbo_geography (
    geography_id      SMALLINT     NOT NULL       PRIMARY KEY,
    country           VARCHAR(100),
    city              VARCHAR(100)
);
GO


IF OBJECT_ID('silver.dbo_customers', 'U') IS NOT NULL
    DROP TABLE silver.dbo_customers;
GO

CREATE TABLE silver.dbo_customers (
    customer_id           INT          NOT NULL       PRIMARY KEY,
    customer_name         VARCHAR(255),
    email                 VARCHAR(255),
    gender                VARCHAR(20),
    age                   TINYINT,
    geography_id          SMALLINT
);
GO


IF OBJECT_ID('silver.dbo_engagement_data', 'U') IS NOT NULL
    DROP TABLE silver.dbo_engagement_data;
GO

CREATE TABLE silver.dbo_engagement_data (
    engagement_id           INT         NOT NULL       PRIMARY KEY,
    content_id              INT,
    content_type            VARCHAR(50),
    likes                   INT,
    engagement_date         DATE,
    campaign_id             INT,
    product_id              INT,
    views                   INT,
    clicks                  INT
);
GO


IF OBJECT_ID('silver.dbo_customer_journey', 'U') IS NOT NULL
    DROP TABLE silver.dbo_customer_journey;
GO

CREATE TABLE silver.dbo_customer_journey (
    journey_id          INT           NOT NULL       PRIMARY KEY,
    customer_id         INT,
    product_id          INT,
    visit_date          DATE,
    stage               VARCHAR(50),
    action              VARCHAR(50),
    duration            DECIMAL(6,2)
);
GO


IF OBJECT_ID('silver.dbo_customer_reviews', 'U') IS NOT NULL
    DROP TABLE silver.dbo_customer_reviews;
GO

CREATE TABLE silver.dbo_customer_reviews (
    review_id     INT          NOT NULL       PRIMARY KEY,
    customer_id   INT,
    product_id    INT,
    review_date   DATE,
    rating        TINYINT,
    review_text   VARCHAR(MAX)
);
GO

