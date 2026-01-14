/*===============================================================================
Stored Procedure: silver.load_silver
===============================================================================
Purpose:
    Loads cleaned and standardized data from Bronze to Silver layer
    for Marketing Analytics tables.

Actions:
    - Truncates Silver tables
    - Inserts cleansed data from Bronze
    - Handles duplicates and invalid values

Usage:
    EXEC silver.dbo_load_silver;
===============================================================================*/
CREATE OR ALTER PROCEDURE silver.dbo_load_silver
AS
BEGIN
    DECLARE 
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

        TRUNCATE TABLE silver.dbo_customers;
        INSERT INTO silver.dbo_customers 
            (customer_id,  
            customer_name,  
            email,  
            gender,  
            age,
            geography_id
            )
            SELECT
                customer_id,  
                customer_name,  
                email,  
                gender,  
                age,
                geography_id
            FROM bronze.dbo_customers;  
            
        TRUNCATE TABLE silver.dbo_products;
        INSERT INTO silver.dbo_products
            (product_id,
            product_name,
            category,
            price
            )
            SELECT
                product_id,
                product_name,
                category,
                TRY_CONVERT(DECIMAL(6,2),NULLIF(REPLACE(TRIM(price), CHAR(13), ''),'')) AS price
            FROM bronze.dbo_products;
       
        TRUNCATE TABLE silver.dbo_geography;
        INSERT INTO silver.dbo_geography
            (geography_id,
            country,
            city
            )
            SELECT
                geography_id,
                country,
                city
            FROM bronze.dbo_geography;

        TRUNCATE TABLE silver.dbo_engagement_data;
        INSERT INTO silver.dbo_engagement_data
            (engagement_id,
            content_id,   
            content_type, 
            likes,  
            engagement_date,   
            campaign_id,    
            product_id,     
            views,       
            clicks
            )
            SELECT
                engagement_id,
                content_id,   
                content_type, 
                likes,  
                engagement_date,   
                campaign_id,    
                product_id,     
                LEFT(views_clicks, CHARINDEX('-', views_clicks) - 1) AS views,       
                RIGHT(views_clicks, LEN(views_clicks) - CHARINDEX('-', views_clicks)) AS clicks
            FROM bronze.dbo_engagement_data

        TRUNCATE TABLE silver.dbo_customer_journey;
        INSERT INTO silver.dbo_customer_journey
            (journey_id,
            customer_id,
            product_id,
            visit_date,
            stage,
            action,
            duration
            )
            SELECT
                t.journey_id,
                t.customer_id,
                t.product_id,
                t.visit_date,
                t.stage,
                t.action,
                COALESCE(t.duration, AVG(t.duration) OVER (
                    PARTITION BY customer_id)) AS duration
            FROM(
                    SELECT
                        journey_id,
                        customer_id,
                        product_id,
                        visit_date,
                        stage,
                        action,
                        TRY_CONVERT(DECIMAL(6,2), duration) AS duration,
                        ROW_NUMBER() OVER (PARTITION BY customer_id, product_id, visit_date, stage, action ORDER BY journey_id) as Flag
                        FROM bronze.dbo_customer_journey
                    ) t
                WHERE Flag = 1;

        TRUNCATE TABLE silver.dbo_customer_reviews;
        INSERT INTO silver.dbo_customer_reviews
            (review_id,
            customer_id,
            product_id,
            review_date,
            rating,
            review_text
            )
            SELECT
                review_id,
                customer_id,
                product_id,
                review_date,
                rating,
                REPLACE(review_text, '  ', ' ') AS review_text
            FROM bronze.dbo_customer_reviews;
                    
        SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Silver Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
		
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END    
