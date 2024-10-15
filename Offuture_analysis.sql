
--SALES BY YEAR 

select
SUBSTRING("Order Date", 7, 4) AS order_year,
SUM("Sales") AS Total_Sales
FROM student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4)
order by order_year;

--SALES BY MONTH 
select
SUBSTRING("Order Date", 4, 2) AS order_month,
SUM("Sales") AS Total_Sales
FROM student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 4, 2)
order by order_month;

--SALES BY QUARTER 
SELECT
CASE
WHEN SUBSTRING("Order Date", 4, 2) IN ('01', '02', '03') THEN 'Q1'
WHEN SUBSTRING("Order Date", 4, 2) IN ('04', '05', '06') THEN 'Q2'
WHEN SUBSTRING("Order Date", 4, 2) IN ('07', '08', '09') THEN 'Q3'
WHEN SUBSTRING("Order Date", 4, 2) IN ('10', '11', '12') THEN 'Q4'
END AS order_Quarter,
SUM("Sales") AS Total_Sales
FROM
student.team_where_offuture
GROUP BY
order_Quarter
ORDER BY
order_Quarter;

--PROFIT BY YEAR
select
SUBSTRING("Order Date", 7, 4) AS order_year,
SUM("Profit") AS Total_Profit 
FROM student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4)
order by order_year;

--PROFIT BY MONTH 
select
SUBSTRING("Order Date", 4, 2) AS order_month,
SUM("Profit") AS Total_Profit
FROM student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 4, 2)
order by order_month;

--PROFIT BY QUARTER 
SELECT
CASE
WHEN SUBSTRING("Order Date", 4, 2) IN ('01', '02', '03') THEN 'Q1'
WHEN SUBSTRING("Order Date", 4, 2) IN ('04', '05', '06') THEN 'Q2'
WHEN SUBSTRING("Order Date", 4, 2) IN ('07', '08', '09') THEN 'Q3'
WHEN SUBSTRING("Order Date", 4, 2) IN ('10', '11', '12') THEN 'Q4'
END AS order_Quarter,
SUM("Profit") AS Total_Profit
FROM
student.team_where_offuture
GROUP BY
order_Quarter
ORDER BY
order_Quarter;

-- SALES EACH YEAR BY CATEGORY

SELECT 
    SUBSTRING("Order Date", 7, 4) sales_year,
    SUM("Sales") yearly_sales ,
    "Category" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Category" 
ORDER BY sales_year ;


--SALES EACH YEAR BY SUB-CATEGORY
SELECT 
    SUBSTRING("Order Date", 7, 4) sales_year,
    SUM("Sales") yearly_sales ,
    "Sub-Category" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Sub-Category" 
ORDER BY sales_year ;


--SALES EACH YEAR BY SEGMENT 
SELECT 
    SUBSTRING("Order Date", 7, 4) sales_year,
    SUM("Sales") yearly_sales ,
    "Segment" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Segment" 
ORDER BY sales_year ;


--PROFIT EACH YEAR BY CATEGORY 

SELECT 
    SUBSTRING("Order Date", 7, 4) profit_year,
    SUM("Profit") yearly_sales ,
    "Category" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Category" 
ORDER BY profit_year ;


--PROFIT EACH YEAR BY SUB-CATEGORY
SELECT 
    SUBSTRING("Order Date", 7, 4) profit_year,
    SUM("Profit") yearly_profit ,
    "Sub-Category" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Sub-Category" 
ORDER BY profit_year ;


--PROFIT EACH YEAR BY SEGMENT
SELECT 
    SUBSTRING("Order Date", 7, 4) profit_year,
    SUM("Profit") yearly_profit ,
    "Segment" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Segment" 
ORDER BY profit_year ;
   

---TOP PERFORMING PRODUCTS---
-- TOP 5 MOST SALES
SELECT 
    "Product ID" ,
    "Product Name" ,
    SUM("Sales") AS total_sales
FROM 
    student.team_where_offuture 
GROUP BY 
    "Product Name", "Product ID" 
ORDER BY
    total_sales DESC
LIMIT 5;

--TOP 5 MOST PROFIT
SELECT
    "Product ID" ,
    "Product Name" ,
    SUM("Profit") AS total_profit
FROM
    student.team_where_offuture two 
GROUP BY
    "Product Name", "Product ID" 
ORDER BY 
    total_profit DESC
LIMIT 5;

--WORST PERFORMING PRODUCTS--

-- LOWEST 5 SALES
SELECT 
    "Product ID" ,
    "Product Name" ,
    SUM("Sales") AS total_sales
FROM 
    student.team_where_offuture 
GROUP BY 
    "Product Name", "Product ID" 
ORDER BY
    total_sales ASC
LIMIT 5;

--LOWEST 5 PROFIT
SELECT
    "Product ID" ,
    "Product Name" ,
    SUM("Profit") AS total_profit
FROM
    student.team_where_offuture two 
GROUP BY
    "Product Name", "Product ID" 
ORDER BY 
    total_profit ASC
LIMIT 5;

SELECT 
	count(DISTINCT "Product ID")
FROM student.team_where_offuture two 

-- SALES/SEGMENT (YEARLY)
SELECT 
    "Segment" ,
    SUBSTRING("Order Date", 7, 4) sales_year ,
    ROUND(SUM("Sales")::NUMERIC , 2) total_sales
FROM 
    student.team_where_offuture two 
GROUP BY "Segment", sales_year 
ORDER BY sales_year , "Segment";


-- PROFIT/SEGMENT (YEARLY)
SELECT 
    "Segment" ,
    SUBSTRING("Order Date", 7, 4) profit_year ,
    ROUND(SUM("Profit")::NUMERIC , 2)  total_sales
FROM 
    student.team_where_offuture two 
GROUP BY "Segment", profit_year 
ORDER BY profit_year , "Segment";
   

-- SALES REVENUE BY MARKET

SELECT 
    SUM("Sales") Total_sales_revenue ,
    "Market" 
FROM
    student.team_where_offuture
GROUP by "Market" 
ORDER BY Total_sales_revenue desc ;

-- SALES REVENUE EACH YEAR BY MARKET 

SELECT 
    SUBSTRING("Order Date", 7, 4) sales_year,
    SUM("Sales") sales_revenue ,
    "Market" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Market" 
ORDER BY sales_year, sales_revenue desc ;

-- SALES (AMOUNT) BY MARKET

SELECT 
    SUM("Quantity") Total_sales_amount ,
    "Market" 
FROM
    student.team_where_offuture
GROUP by "Market" 
ORDER BY Total_sales_amount desc ;

-- SALES (AMOUNT) EACH YEAR BY MARKET 

SELECT 
    SUBSTRING("Order Date", 7, 4) sales_year,
    SUM("Quantity") sales_amount ,
    "Market" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Market" 
ORDER BY sales_year, sales_amount desc ;

-- PROFIT BY MARKET

SELECT 
    SUM("Profit") Total_profit ,
    "Market" 
FROM
    student.team_where_offuture
GROUP by "Market" 
ORDER BY Total_profit desc ;


--PROFIT EACH YEAR BY MARKET 

SELECT 
    SUBSTRING("Order Date", 7, 4) profit_year,
    SUM("Profit") profit ,
    "Market" 
FROM
    student.team_where_offuture
GROUP BY SUBSTRING("Order Date", 7, 4) , "Market" 
ORDER BY profit_year , profit desc ;

--SQL to see how discounts affect sales/profits
SELECT
    "Discount",
    AVG("Profit") AS average_profit,
    AVG("Sales") AS average_sales,
    COUNT() AS number_of_items_with_discount_applied
FROM
    student.team_where_offuture two
GROUP BY
    "Discount"
ORDER BY
    "Discount" ASC;

--SQL to see discounts by country
SELECT 
    "Country",
    "Discount",
    AVG("Profit") AS avg_profit,
    AVG("Sales") AS avg_sales,
    COUNT() AS order_count
FROM student.team_where_offuture two
GROUP BY "Country", "Discount"
ORDER BY "Country" ASC, "Discount" ASC;


--SQL to see what discount was applied to each order along with total profit and sales from each order
SELECT 
      "Order ID",
      "Discount",
       SUM("Profit") AS total_profit,
       SUM("Sales") AS total_sales,
       COUNT(*) AS item_count
FROM 
    student.team_where_offuture
GROUP BY 
    "Order ID", "Discount";
   
   --TOP 5 COUNTRIES WITH HIGHEST PROFITS PER YEAR----

(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2011' 
ORDER BY 
    total_profit DESC
LIMIT 5)
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2012' 
ORDER BY 
    total_profit DESC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2013' 
ORDER BY 
    total_profit DESC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2014' 
ORDER BY 
    total_profit DESC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2015' 
ORDER BY 
    total_profit DESC
LIMIT 5) ;

-- Bottom 5 countries with lowest profits per year (e.g top 5 with biggest losses)--

(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2011' 
ORDER BY 
    total_profit ASC
LIMIT 5)
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2012' 
ORDER BY 
    total_profit ASC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2013' 
ORDER BY 
    total_profit ASC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2014' 
ORDER BY 
    total_profit ASC
LIMIT 5) 
UNION ALL
(SELECT
   SUBSTRING("Order Date", 7, 4) AS YEAR ,
   "Country" ,
    SUM("Profit") AS total_profit 
FROM
    student.team_where_offuture two 
GROUP BY
   SUBSTRING("Order Date", 7, 4), "Country"
HAVING
     SUBSTRING("Order Date", 7, 4) = '2015' 
ORDER BY 
    total_profit ASC
LIMIT 5) ;

-- SALES/SEGMENT (YEARLY)
SELECT 
    "Segment" ,
    SUBSTRING("Order Date", 7, 4) sales_year ,
    ROUND(SUM("Sales")::NUMERIC , 2) total_sales
FROM 
    student.team_where_offuture two 
GROUP BY "Segment", sales_year 
ORDER BY sales_year , "Segment";


-- PROFIT/SEGMENT (YEARLY)
SELECT 
    "Segment" ,
    SUBSTRING("Order Date", 7, 4) "year" ,
    ROUND(SUM("Profit")::NUMERIC , 2)  total_profit
FROM 
    student.team_where_offuture two 
GROUP BY "Segment", "year" 
ORDER BY "year" , "Segment";


