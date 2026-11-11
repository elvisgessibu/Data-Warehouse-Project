# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.
--

## **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores ('_') to separate words
- **Language**: Use English for names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **Bronze Rules**
- All names must start wwith the source system name, and table names must match their original names without renaming.
-  **`<sourcesystem>_<entity>`**
  -  `<sourcesystem>`: Name of the source system (e.g., 'crm', 'erp').
  -  `<entity>`: Exact table name from the source system.
  -  Example: 'crm_customer_info' -> Customer Information from CRM systems.

### **Silver Rules**
- All names must start wwith the source system name, and table names must match their original names without renaming.
-  **`<sourcesystem>_<entity>`**
  -  `<sourcesystem>`: Name of the source system (e.g., 'crm', 'erp').
  -  `<entity>`: Exact table name from the source system.
  -  Example: 'crm_customer_info' -> Customer Information from CRM systems.

### **Gold Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
-  **`<category>_<entity>`**
  -  `<category>`: Describes the roe of teh table, such as 'dim' (dimension) or 'fact' (fact table)
  -  `<entity>`: Exact table name from the source system.
  -  Examples:
    - `dim_customers` -> Dimension table for customer data.
    - `fact_sales` -> Fact table for sales transcations.

#### **Glossary of Category Patterns**

| Pattern  | Meaning        | Examples                                  |
|----------| ---------------| ------------------------------------------|
| `dim_`   | Dimension Table| `dim_customers`, `dim_products`           |
| `fact_`  | Fact Table     | `fact_sales`                              |
| `report_`| Report table   | `report_customers`, `report_sales_monthly`|

## **Column Naming Conventions**

### **Surrogate Keys**
- All primary keys in the dimension keys must use the suffix '_key'.
- **`<table_name>_key`**
  - `<table_name>`: Refers to the name of table or entity the key belongs to.
  -  `_key`: A suffix indicating that this column is a surrogate key.
  -  Example: 'customer_key' -> Surrogate key in the `dim_customers` table.

### **Technical Columns**
- All technical columns must start with the prefix 'dwh_'.
- **`dwh_<column_name>`**
  - `dwh`: Prefix exclusively for system-generated metadata.
  -  `<column_name>`: Descriptive name indicating teh column's purpose. 
  -  Example: 'dwh_create_date' -> System genrated column used to store the date when the record was loaded into the warehouse.

### **Stored Procedure**
- All stored procedures used for loading data must follow the naming pattern:.
- **`load_<layer>`**
  - Example:
  -  `load_bronze` -> Stored Procedure for loading data into the Bronze layer.
  -  `load_siver` -> Stored Procedure for loading data into the Silver layer.
