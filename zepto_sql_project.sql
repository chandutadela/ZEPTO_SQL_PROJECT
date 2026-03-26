--drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) not null,
mrp NUMERIC(8,2),
discoutPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quatity INTEGER

);

-- data exploration

-- count of rows
select count(*) from zepto;

--sample data
select * from zepto

-- null values

select * from zepto
where  name is null
or
category IS NULL
or
mrp IS NULL
or 
discoutpercent IS NULL
or
availablequantity IS NULL
or
discountedsellingPrice IS NULL
or
weightingms IS NULL
or
outofstock IS NULL
or 
quatity IS NULL


--different Product category

select distinct category
from zepto
order by category

-- products in stock vs out of stock

select outofstock,count(sku_id)
from zepto
group by outofstock;

--product names present multiple times
select name, count(sku_id) as "number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count (sku_id) DESC

-- products with price 0
Select * from zepto
where mrp =0 or discountedsellingprice =0;

DELETE from zepto
where mrp = 0

--conversting prices in to standard prices
update zepto
set mrp = mrp/100,
discountedsellingprice= discountedsellingprice/100.0


select  mrp, discountedsellingprice from zepto


--find the top 10 products with discount percentages

select distinct name, mrp, discoutpercent from zepto
order by discoutpercent desc
limit 10;

-- what are the prodicts with high MRP but out of stock

select distinct name, mrp 
from zepto where outofstock = TRUE and mrp >500
order by mrp desc

--calculate estimated revennue for each category
select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue


-- 
