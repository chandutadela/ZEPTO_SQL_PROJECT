# ZEPTO_SQL_PROJECT
A comprehensive SQL project analyzing Zepto data to uncover sales trends, customer behavior, and key business insights using advanced queries and data exploration techniques.
.

📌 Project Highlights
✔️ Real-world e-commerce inventory use case
✔️ 20+ SQL queries for revenue, pricing, and inventory analytics
✔️ Industry-grade data cleaning, EDA, and performance optimization
✔️ Built for job interviews, portfolios, and real analyst workflow simulation
🧠 Project Objectives
The aim is to simulate the end-to-end process that data analysts perform in real-world scenarios:

Design and create the inventory database schema
Load and clean a large inventory dataset
Perform structured EDA (Exploratory Data Analysis)
Derive actionable business insights using advanced SQL queries
Present metrics such as turnover ratio, stock-outs, and profitability
📁 Dataset Overview
The dataset used for this project is sourced from Kaggle: Zepto Inventory Dataset. It closely replicates the structure of a real-world e-commerce inventory system, scraped from Zepto's official product listings.

Each row corresponds to a unique SKU (Stock Keeping Unit) — a granular representation of a product as listed in a typical inventory database. Products may appear multiple times due to variations in weight, packaging, or discount schemes — mirroring how catalog data is structured in real-time retail platforms.

🧾 Columns Description
Column Name	Description
sku_id	Unique identifier for each SKU (Synthetic Primary Key)
name	Product name as listed on the Zepto app
category	Product category (e.g., Fruits, Snacks, Beverages)
mrp	Maximum Retail Price (converted to ₹ from paise)
discountPercent	Percentage of discount applied on MRP
discountedSellingPrice	Final price after applying the discount (in ₹)
availableQuantity	Inventory count indicating stock availability
weightInGms	Net product weight in grams
outOfStock	Boolean flag (TRUE/FALSE) indicating stock status
quantity	Quantity per unit/package (mixed format — integers or grams for loose items)
🛠️ Tools & Technologies
PostgreSQL (SQL)
pgAdmin 4
CSV (UTF-8 Format)
Git & GitHub
🔧 Step-by-Step Project Workflow
1. Database Schema Creation
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
2️⃣ Data Import
Used pgAdmin 4’s import feature to load the CSV
Solved encoding issues by saving the CSV as CSV UTF-8 (Comma delimited)
Alternate method using \copy:

\copy zepto(category,name,mrp,discountPercent,availableQuantity,
            discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
🔍 Data Exploration
Counted the total number of rows in the dataset
Displayed a sample of records to understand structure
Checked for null/missing values across all columns
Identified all unique product categories
Analyzed in-stock vs out-of-stock SKU distribution
Found duplicate product names with different SKUs
🧹 Data Cleaning
Removed rows where MRP or selling price was zero
Converted prices from paise to rupees for clarity
Rounded values for better readability
Checked for discrepancies in discount calculations
Ensured no NULLs in primary analytical columns
📊 Business Insights
Ranked top 10 products with highest discount %
Listed high-MRP products that are currently out of stock
Estimated potential revenue per category
Found expensive products (MRP > ₹500) with low discount
Identified categories with highest average discounts
Calculated price per gram to compare product value
Segmented products into Low, Medium, and Bulk by weight
Measured total inventory weight across categories
Detected out-of-stock items with high demand
Found SKUs with very low demand but high stock
Estimated days to stock-out based on quantity sold
Analyzed overall stock availability by category
Calculated lost revenue due to out-of-stock items
Found most common product weight sizes
Flagged mismatches between actual and reported discounts
Suggested pricing correction where actual discount < shown
Ranked categories by estimated revenue contribution
Flagged products with 0 quantity sold but still stocked
Identified top-selling items based on quantity
Compared high-weight but low-value products
Created SKU Profitability Score (price-to-weight ratio)
✅ Conclusion
Through this analysis, we uncovered valuable insights into Zepto’s inventory. We identified the most discounted products, top-value categories, high-MRP out-of-stock items, and estimated potential revenue by category. Additionally, we highlighted price-per-gram trends and inventory distribution based on weight—enabling smarter inventory and pricing strategies.

