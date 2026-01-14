/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Dimension: gold.dim_customers
-- =============================================================================
CREATE OR ALTER VIEW gold.dim_customers AS
SELECT 
    c.customer_id,  
    c.customer_name, 
    c.email,  
    c.gender,  
    c.age,  
    g.country,  
    g.city  
FROM silver.dbo_customers as c  
LEFT JOIN silver.dbo_geography g  
ON c.geography_id = g.geography_id;  
GO

-- =============================================================================
-- Dimension: gold.dim_products
-- =============================================================================
CREATE OR ALTER VIEW gold.dim_products AS
SELECT 
    product_id,  
    product_name,  
    price,  
    CASE 
        WHEN price < 50 THEN 'Low'  
        WHEN price BETWEEN 50 AND 200 THEN 'Medium'  
        ELSE 'High'  
    END AS price_category  
FROM silver.dbo_products;  
GO

-- =============================================================================
-- Fact: gold.fact_customer_reviews
-- =============================================================================
CREATE OR ALTER VIEW gold.fact_customer_reviews AS
SELECT
    review_id,
    customer_id,
    product_id,
    FORMAT(CONVERT(DATE, review_date), 'dd-MM-yyyy') AS review_date,
    rating,
    review_text
FROM silver.dbo_customer_reviews;
GO

-- =============================================================================
-- Fact: gold.fact_engagement_data 
-- =============================================================================
CREATE OR ALTER VIEW gold.fact_engagement_data AS
SELECT
    engagement_id,
    content_id,   
    UPPER(REPLACE(content_type, 'Socialmedia', 'Social Media')) AS content_type,  
    campaign_id,    
    product_id,    
    views,       
    clicks,
    likes,
    FORMAT(CONVERT(DATE, engagement_date), 'dd-MM-yyyy') AS engagement_date
FROM silver.dbo_engagement_data
WHERE content_type != 'NEWSLETTER';
GO

-- =============================================================================
-- Fact: gold.fact_customer_journey
-- =============================================================================
CREATE OR ALTER VIEW gold.fact_customer_journey AS
SELECT
    journey_id,
    customer_id,
    product_id,
    FORMAT(CONVERT(DATE, visit_date), 'dd-MM-yyyy') AS visit_date,
    stage,
    action,
    duration
FROM silver.dbo_customer_journey;
GO




