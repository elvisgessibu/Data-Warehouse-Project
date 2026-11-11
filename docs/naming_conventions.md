# **Naming Conventions**

This document otlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.
--

## **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores ('_') to separate words
- **Language**: Use English for a names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **Bronze Rules**
- All names must start wwith the source system name, and table names must match their original names without renaming.
-  **'<sourcesystem>_<entity>'**
  -  '<sourcesystem>': Name of the source system (e.g., 'crm', 'erp').
  -  '<entity>': Exact table name from the source system.
  -  Example: 'crm_customer_info' -> Customer Information from CRM systems.

### **Silver Rules**
- All names must start wwith the source system name, and table names must match their original names without renaming.
-  **'<sourcesystem>_<entity>'**
  -  '<sourcesystem>': Name of the source system (e.g., 'crm', 'erp').
  -  '<entity>': Exact table name from the source system.
  -  Example: 'crm_customer_info' -> Customer Information from CRM systems.

### **Gold Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
-  **'<category>_<entity>'**
  -  '<category>': Describes the roe of teh table, such as 'dim' (dimension) or 'fact' (fact table)
  -  '<entity>': Exact table name from the source system.
  -  Example: 'crm_customer_info' -> Customer Information from CRM systems.
