--Data Clenning 
select * from gh where transactions_id is null or sale_date is null
or gender is null or category is null  or quantiy is null  or cogs is null or
total_sale is null
/*delete  from gh where transactions_id is null or sale_date is null
or gender is null or category is null  or quantiy is null  or cogs is null or
total_sale is null*/
 /*select count (*) from gh;*/
--DATA EXPLORATION
--how many sales we have
select count(*) as total_sales from gh;
--How many unique customer we have 
select count(DISTINCT customer_id) from  gh;
--How many Diffrent Catagory Present
select count(DISTINCT category) from gh;
--How many diffrent customer_id present
select count(customer_id) from gh where age is null;
--Business Key Probelm 
--Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * from gh where sale_date ='2022-11-05';
--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT 
  *
FROM gh
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantiy >= 4;
--Write a SQL query to calculate the total sales (total_sale) for each category
SELECT 
    category,
    SUM(total_sale) as net_sale
FROM gh
GROUP BY 1;
--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select Round(avg(age),2) from gh where category='Beauty';
--Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select * from gh where total_sale >1000;
--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select count(*) transactions_id,gender from gh group by gender;
--Write a SQL query to find the number of unique customers who purchased items from each category.:
select distinct count(customer_id) as cd,category from gh group by category;
--Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM gh
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
