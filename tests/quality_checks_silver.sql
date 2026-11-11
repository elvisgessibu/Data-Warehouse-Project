/*
=============================================================================
Quality Checks
=============================================================================
Script Purpose:
	This script performs various quality checks for data consistency, accuracy 
	and standardization across the 'silver' schemas. It includes checks for:
	- Null or duplicates in primary keys.
	- Unwanted spaces in string fields
	- Data standardization and consistency
	- Invalid data ranges and orders
	- Data consistency between related fields

Usage Notes: 
	- Run these codes after data loading Silver layer.
	- Investigate and resolve any discrepancies found during teh checks.
=============================================================================
*/

-- =============================================================================
-- Checking 'silver.crm_cust_info'
-- =============================================================================
-- Checking for duplicates or nulls in the primary key
-- Expectation: No Results
SELECT
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL
ORDER BY cst_id

-- Checking For Unwanted Spaces
-- Expectation: No results
SELECT 
	cst_firstname,
	cst_lastname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) OR cst_lastname != TRIM(cst_lastname);

-- Data Standardization & Consistency
-- Expectation: Distinct readbale names
SELECT DISTINCT
	cst_marital_status,
	cst_gndr
FROM silver.crm_cust_info;

-- =============================================================================
-- Checking 'silver.crm_prd_info'
-- =============================================================================
-- Checking For Duplicates in Primary key
-- Expectation: No results
SELECT
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Checking For Unwanted Spaces
-- Expectation: No results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Checking For Nulls Or Negative Values
-- Expectation: No results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Data Standardization & Consistency
-- Expectation: Distinct readable names
SELECT DISTINCT(prd_line)
FROM silver.crm_prd_info;

-- Checking for Invalid Date Orders
-- Expectation: No results
SELECT *
FROM silver.crm_prd_info
WHERE prd_start_dt > prd_end_dt

-- =============================================================================
-- Checking 'silver.crm_sales_details'
-- =============================================================================
-- Checking for Unwanted Space
-- Expectation: No results
SELECT * FROM silver.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num)

-- Checking for Invalid Date
-- Expectation: No results
SELECT 
	sls_order_dt, 
	sls_ship_dt,
	sls_due_dt
FROM silver.crm_sales_details
WHERE sls_order_dt > CAST('2050-01-01' AS DATE) OR sls_order_dt < CAST('1900-01-01' AS DATE) OR LEN(sls_order_dt) != 10
	OR sls_ship_dt > CAST('2050-01-01' AS DATE) OR sls_ship_dt < CAST('1900-01-01' AS DATE) OR LEN(sls_ship_dt) != 10
	OR sls_due_dt > CAST('2050-01-01' AS DATE) OR sls_due_dt < CAST('1900-01-01' AS DATE) OR LEN(sls_due_dt) != 10

SELECT * FROM silver.crm_sales_details
WHERE sls_order_dt > sls_due_dt OR sls_order_dt > sls_ship_dt

-- Checking for Data Consistency
-- Sales = Quantity * Price
-- Values must not be null, zero or negative
--Expectation: No results
SELECT DISTINCT
	sls_sales,
	sls_quantity,
	sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_price IS NULL OR sls_quantity IS NULL
OR sls_sales <= 0 OR sls_price <= 0 OR sls_quantity <= 0
ORDER BY sls_sales, sls_quantity, sls_price


-- =============================================================================
-- Checking 'silver.erp_cust_az12'
-- =============================================================================
-- Checking for Duplicates In Primary key
-- Expectation: No results
SELECT
	cid,
	COUNT(*)
FROM silver.erp_cust_az12
GROUP BY cid
HAVING COUNT(*) > 1;

-- Checking for Invalid Dates
-- Expectation: No results
SELECT
	bdate
FROM silver.erp_cust_az12
WHERE bdate > GETDATE();

-- Data Consistency and Standardization
-- Expectation: Distinct readable names
SELECT DISTINCT gen
FROM silver.erp_cust_az12;

-- =============================================================================
-- Checking 'silver.erp_loc_a101'
-- =============================================================================
-- Checking for Duplicates In Primary Key
-- Expectation: No results
SELECT
	cid,
	COUNT(*)
FROM silver.erp_loc_a101
GROUP BY cid
HAVING COUNT(*) > 1;

--Data Consistency & Standardization
-- Expectation: Distinct Country Name
SELECT  DISTINCT cntry
FROM silver.erp_loc_a101;


-- =============================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- =============================================================================
-- Checking for Unwanted Spaces
-- Expectation: No results
SELECT * FROM silver.erp_px_cat_g1v2
WHERE maintenance != TRIM(maintenance)
	OR id != TRIM(id)
	OR cat != TRIM(cat)
	OR subcat != TRIM(subcat)

-- Data Consistency & Standardization
-- Expectation: Distinct Readable names
SELECT DISTINCT 
	cat,
	maintenance 
FROM bronze.erp_px_cat_g1v2
