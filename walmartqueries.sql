SELECT * FROM walmart_db.walmart;

SELECT * FROM walmart;
SELECT COUNT(*) FROM walmart;




SELECT COUNT(DISTINCT Branch)
FROM walmart;

SELECT max(quantity) FROM WALMART;
SELECT min(quantity) FROM walmart;

-- Business problem
-- 1. find different payment methods and number of transactions, no. of quantity sold
SELECT payment_method,
COUNT(*) as no_payments,
SUM(quantity) AS total_quantity_sold
FROM walmart
GROUP BY payment_method;

-- 2. identify the highest rated category in each branch, displaying the branch, category, avg rating

SELECT Branch, category, AVG(rating) as avg_rating
FROM walmart
GROUP by Branch, category
order by Branch, avg_rating DESC;

-- 3. identify the busiest day for each branch based on the number of transactions
-- SELECT Branch, To_date(date, 'mm/dd/yyyy'), 'Day' as day_name,
-- COUNT(*) as no_transactions
-- FROM walmart

-- 4.determine the average, min, max rating of category for each city, list the city, avg_rating, min_rating, max_rating
select City, category, min(rating) as min_rating,
max(rating) as max_rating,
round(avg(rating),2) as avg_rating
from walmart
group by City, category;

-- 5.calculate the total profit for each category by considering total profit as (unit_price* quantity*profit_margin).
-- list category and total profit ordered from highest to lowest profit_margin
select category, Round(sum(Total* profit_margin),2) as Total_profit,
sum(total) as total_revenue
from walmart
group by category
order by Total_profit DESC;

-- 6. determine the most common payment method for each branch display branch and preferrd_payment_method
select branch, payment_method,
count(*) as preferrd_payment_method 
from walmart
group by branch, payment_method
order by preferrd_payment_method desc;

-- 7. categorize sales into 3 groups morning, aftnoon, evening
-- find out each shift and number of invoices
SELECT branch,
       TIME(time) AS time_of_sale,
CASE 
    WHEN HOUR(time) < 12 THEN 'Morning'
    WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS daytime,
count(*)
FROM walmart
group by branch, time
order by branch, daytime;


























