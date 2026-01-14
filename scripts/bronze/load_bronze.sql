USE marketing_db;
GO

/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates bronze tables
    - Loads raw CSV data using BULK INSERT

Usage Example:
    EXEC bronze.dbo_load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.dbo_load_bronze
AS
BEGIN
    DECLARE 
        @start_time DATETIME,
        @end_time DATETIME,
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        PRINT '------------------------------------------------';
        PRINT 'Loading Product & Customer Domain Tables';
        PRINT '------------------------------------------------';

        /* ================= PRODUCTS ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_products';
        TRUNCATE TABLE bronze.dbo_products;

        PRINT '>> Inserting Data Into: bronze.dbo_products';
        BULK INSERT bronze.dbo_products
        FROM 'C:\Users\solom\Downloads\dbo.products.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= GEOGRAPHY ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_geography';
        TRUNCATE TABLE bronze.dbo_geography;

        PRINT '>> Inserting Data Into: bronze.dbo_geography';
        BULK INSERT bronze.dbo_geography
        FROM 'C:\Users\solom\Downloads\dbo.geography.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        --ROWTERMINATOR = '0x0A',
        --DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= CUSTOMERS ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_customers';
        TRUNCATE TABLE bronze.dbo_customers;

        PRINT '>> Inserting Data Into: bronze.dbo_customers';
        BULK INSERT bronze.dbo_customers
        FROM 'C:\Users\solom\Downloads\dbo.customers.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        --ROWTERMINATOR = '0x0A',
        --DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= ENGAGEMENT DATA ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_engagement_data';
        TRUNCATE TABLE bronze.dbo_engagement_data;

        PRINT '>> Inserting Data Into: bronze.dbo_engagement_data';
        BULK INSERT bronze.dbo_engagement_data
        FROM 'C:\Users\solom\Downloads\dbo.engagement_data.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        --ROWTERMINATOR = '0x0A',
        --DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= CUSTOMER JOURNEY ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_customer_journey';
        TRUNCATE TABLE bronze.dbo_customer_journey;

        PRINT '>> Inserting Data Into: bronze.dbo_customer_journey';
        BULK INSERT bronze.dbo_customer_journey
        FROM 'C:\Users\solom\Downloads\dbo.customer_journey.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        --ROWTERMINATOR = '0x0A',
        --DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= CUSTOMER REVIEWS ================= */
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.dbo_customer_reviews';
        TRUNCATE TABLE bronze.dbo_customer_reviews;

        PRINT '>> Inserting Data Into: bronze.dbo_customer_reviews';
        BULK INSERT bronze.dbo_customer_reviews
        FROM 'C:\Users\solom\Downloads\dbo.customer_reviews.csv'
        WITH (
        FIRSTROW = 1,
        FIELDTERMINATOR = ',',
        FIELDQUOTE = '"',
        --ROWTERMINATOR = '0x0A',
        --DATAFILETYPE = 'char',
        TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '>> -------------';

        /* ================= FINAL ================= */
        SET @batch_end_time = GETDATE();

        PRINT '==========================================';
        PRINT 'Loading Bronze Layer Completed Successfully';
        PRINT 'Total Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) 
            + ' seconds';
        PRINT '==========================================';

    END TRY
    BEGIN CATCH
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message : ' + ERROR_MESSAGE();
        PRINT 'Error Number  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State   : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';
    END CATCH
END;
GO

