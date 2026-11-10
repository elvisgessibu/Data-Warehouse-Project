# Data Cataog For Gold Layer

## Overview
The Gold layer is the business-level representation, structure to support analytica and reporting use cases. It consists of **dimension table**
and **fact tables** for specific business metrics.

--

### 1. **gold.dim_customers**
 - **Purpose:** Stores customer details and enriched with demographic and geographic data
 - **Columns:**

 | Column Name   | Data Type     | Description 
 |---------------|---------------|------------------------------------------------------------------------------------|
 |customer_key   | INT           | Surrogate key uniquely identifying each customer record in the dimension table     |
 |customer_id    | INT           | Unique numerical identifer assigned to each customer.                              |
 |customer_name  | NVARCHAR(50)  | Alphanumric identifier representing the customer, used for travking and referencing|
 |first_name     | NVARCHAR(50)  | The customer's first name, as recorded in the system.                              |
 |last_name      | NVARCHAR(50)  | The customer's last name or family name.                                           |
 |country        | NVARCHAR(50)  | The country of recidence for the customer (e.g., 'Germany').                       |
 |marital_status | NVARCHAR(50)  | The marital status of the customer (e.g., 'Single', 'Married').                    |
 |gender         | NVARCHAR(50)  | The gender of the customer (e.g., 'Male', 'Female', 'n/a')                         |
 |birhtdate      | DATE          | The birth date of teh customer, formatted as YYYY-MM-DD (e.g, 1971-10-26)          |
 |create_date    | DATE          | The date and time when the customer record was created in the system               |

--

### 2. **gold.dim_products**
 - **Purpose:** Provides infpormation about the products and their attributes.
 - **Columns:**

 | Column Name   | Data Type     | Description 
 |---------------|---------------|--------------------------------------------------------------------------------------------------|
 |product_key    | INT           | Surrogate key uniquely identifying each products record in the product dimension table           |
 |product _id    | INT           | A Unique numerical identifer assigned to the product for internal r=tracking and referencing.    |                              |
 |product_number | NVARCHAR(50)  | A structure alphanumric code representing the product, often used for categorization or inventory|
 |product_name   | NVARCHAR(50)  | Descriptive name of teh product, including key details such as type, color, and size             |
 |category_id    | NVARCHAR(50)  | A unique identifier for the product's category, linking to it's high-level classification        |
 |category       | NVARCHAR(50)  | The broader classification of products (e.g., Bikes, Components) to group related items          |
 |subcategory    | NVARCHAR(50)  | A more detailed classification of products within the category such as product types             |
 |maintenace     | NVARCHAR(50)  | Indicates whether the product requires maintenance (e.g., 'Yes', 'No').                          |
 |cost           | INT           | The cost or base price of teh product, measured in monetary units.                               |
 |product_line   | NVARCHAR(50)  | The specific product line or series to which teh products belongs (e.g., Road, Mountain).        |
 |start_date     | DATE          | The date when the product bacame available for sale or use, stored in.                            |

--

### 3. **gold.fact_sales**
 - **Purpose:** Stores transactional sales data for anlytical purposes.
 - **Columns:**

 | Column Name   | Data Type     | Description 
 |---------------|---------------|------------------------------------------------------------------------------------|
 |order_number   | NVARCHAR(50)  | A unique alphanumeric identifier for eahc sales order (e.g., 'S054496').           |
 |product_key    | INT           | Surrogate Key linking the order to the product dimension table.                    |
 |customer_key   | INT           | Surrogate Key linking the order to the customer dimension table.                   |
 |order_date     | DATE          | The date when the order was placed.                                                |
 |shipping_date  | DATE          | The date when the order was shipped to the customer.                               |
 |due_date       | DATE          | The date that the order payment was due.                                           |
 |sales_amount   | INT           | The total monetary vaue of the sale of teh line item, in whole currency units (e.g., 25).|
 |quantity       | INT           | The number of units of teh product ordered  for the ine item (e.g., 1).             |
 |price          | INT           | The price per unit of the product for the line item, in whole currency units (e.g., 25). |
