/*
===========================================================================
Quality Checks
===========================================================================
Script Purpose:
	This scripts performs quality checks to validate teh integtity, consistency
	and accuracy of the Gold Layer. These checks ensure:
	- Uniqueness of surrogate keys in Dimension Tables
	- Referential Integrity between Fact and Dimension Tables
	-Validation of relationship to the data model for analytical purposes.

Usage notes:
	- Run these checks after loading Silver Layer
	- Investigate and resolve any discrepancies found during the checks
===========================================================================
*/
-- ===========================================================================
-- Checking 'gold.dim_customers'
-- ===========================================================================
-- Checking for Uniqueness of Customer key In gold.dim_customers
SELECT
	customer_key,
	COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- ===========================================================================
-- Checking 'gold.dim_products'
-- ===========================================================================
-- Checking for Uniqueness of Product key In gold.dim_products
SELECT
	product_key,
	COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ===========================================================================
-- Checking 'gold.fact_sales'
-- ===========================================================================
-- Checks the data connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;
