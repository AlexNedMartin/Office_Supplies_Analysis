DROP TABLE IF EXISTS student.team_where_offuture;

--Creating table for insertion of Offuture data--
CREATE TABLE student.team_where_offuture (
	"Row ID" SERIAL PRIMARY KEY,
	"Order ID" VARCHAR(50),
	"Order Date" VARCHAR(50),
	"Ship Date" VARCHAR(50),
	"Ship Mode" VARCHAR(50),
	"Customer ID" VARCHAR(50),
	"Customer Name" VARCHAR(50),
	"Segment" VARCHAR(50),
	"City" VARCHAR(50),
	"State" VARCHAR(50), 
	"Country" VARCHAR(50),
	"Postal Code" INT, 
	"Market" VARCHAR(50),
	"Region" VARCHAR(50),
	"Product ID" VARCHAR(50),
	"Category" VARCHAR(50),
	"Sub-Category" VARCHAR(50),
	"Product Name" VARCHAR(225),
	"Sales" FLOAT,
	"Quantity" INT, 
	"Discount" FLOAT,
	"Profit" FLOAT,
	"Shipping Cost" NUMERIC(5,2), 
	"Order Priority" VARCHAR(50)
);

GRANT ALL ON student.team_where_offuture TO da10_oaku, da10_haos, da10_olvi, da10_alma;

SELECT * FROM student.team_where_offuture two;
--QC Checks--
 
--QC1-Count Number of Rows
SELECT
	COUNT(*) AS No_of_Rows
FROM
	student.team_where_offuture two;

--QC2-Count Number of Distinct Rows
SELECT 
	DISTINCT(COUNT(*)) AS No_of_Distinct_Rows
FROM
	student.team_where_offuture two;

--QC3-Count Number of Columns
SELECT 
	COUNT(*) as No_of_Columns 
FROM 
	information_schema.columns 
WHERE 
	table_name ='team_where_offuture';

--QC4-Sum of Column Sums
--QC4.1-1st query- Sums each column that contains INT or numeric values
SELECT 
    SUM ("Row ID") row_ID_sum,
    SUM ("Sales") sales_sum,
    SUM ("Quantity") quantity_sum,
    SUM ("Discount") discount_sum,
    SUM ("Profit") profit_sum,
    SUM ("Shipping Cost") shipping_cost_sum,
    SUM ("Postal Code") postal_code_sum
FROM
    student.team_where_offuture two;
   
--QC4.2-2nd query- Utilise a subquery to sum the sums of each column
SELECT
    SUM(row_ID_sum + sales_sum + quantity_sum + discount_sum + profit_sum + shipping_cost_sum + postal_code_sum) AS Total_Sum
FROM (
	SELECT 
    SUM ("Row ID") row_ID_sum,
    SUM ("Sales") sales_sum,
    SUM ("Quantity") quantity_sum,
    SUM ("Discount") discount_sum,
    SUM ("Profit") profit_sum,
    SUM ("Shipping Cost") shipping_cost_sum,
    SUM ("Postal Code") postal_code_sum
FROM
    student.team_where_offuture two
   
) AS 
	subquery;

--QC5-Sum of Row Sums
SELECT 
	(SUM(row_sum) + SUM("Postal Code")) AS total_sum
FROM
(
SELECT 
	("Row ID" + "Sales" + "Quantity" + "Discount" + "Profit" + "Shipping Cost") AS row_sum,
	"Postal Code"
FROM
	student.team_where_offuture AS two

) AS subquery;

--QC6-Order Date Format Check
SELECT
	"Row ID",
	"Order Date"
FROM
	student.team_where_offuture two
ORDER BY
	RANDOM()
LIMIT 5;


--QC7-Ship Date Format Check
SELECT
	"Row ID",
	"Ship Date"
FROM
	student.team_where_offuture two
ORDER BY
	RANDOM()
LIMIT 5;


--QC8-Eyeball Check
SELECT
	*
FROM
	student.team_where_offuture two
ORDER BY 
	RANDOM()
LIMIT 5;

--QC8-Count of Nulls
SELECT
	COUNT(*) - COUNT("Row ID") AS null_row_id_count,
	COUNT(*) - COUNT("Order ID") AS null_order_id_count,
	COUNT(*) - COUNT("Order Date") AS null_order_date_count,
	COUNT(*) - COUNT("Ship Date") AS null_ship_date_count,
	COUNT(*) - COUNT("Ship Mode") AS null_ship_mode_count,
	COUNT(*) - COUNT("Customer ID") AS null_customer_id_count,
	COUNT(*) - COUNT("Customer Name") AS null_customer_name_count,
	COUNT(*) - COUNT("Segment") AS null_segment_count,
	COUNT(*) - COUNT("City") AS null_city_count,
	COUNT(*) - COUNT("State") AS null_state_count,
	COUNT(*) - COUNT("Country") AS null_country_count,
	COUNT(*) - COUNT("Postal Code") AS null_postal_code_count,
	COUNT(*) - COUNT("Region") AS null_region_count,
	COUNT(*) - COUNT("Product ID") AS null_product_id_count,
	COUNT(*) - COUNT("Category") AS null_category_count,
	COUNT(*) - COUNT("Sub-Category") AS null_sub_category_count,
	COUNT(*) - COUNT("Product Name") AS null_product_name_count,
	COUNT(*) - COUNT("Sales") AS null_sales_count,
	COUNT(*) - COUNT("Quantity") AS null_quantity_count,
	COUNT(*) - COUNT("Discount") AS null_discount_count,
	COUNT(*) - COUNT("Profit") AS null_profit_count,
	COUNT(*) - COUNT("Shipping Cost") AS null_sc_count,
	COUNT(*) - COUNT("Order Priority") AS null_op_count
FROM
	student.team_where_offuture two;

--QC9-SUM/MIN/MAX For Each Column--

--QC9.1-Sum/Min/Max for Row ID column
SELECT 
	SUM("Row ID"), 
	MIN("Row ID"), 
	MAX("Row ID"),
	AVG("Row ID")
FROM 
	student.team_where_offuture two;

--QC9.2-Sum/Min/Max for Sales column
SELECT 
	SUM("Sales"), 
	MIN("Sales"), 
	MAX("Sales"),
	AVG("Sales")
FROM 
	student.team_where_offuture two;

--QC9.3-Sum/Min/Max for Quantity column
SELECT 
	SUM("Quantity"), 
	MIN("Quantity"), 
	MAX("Quantity"),
	AVG("Quantity")
FROM 
	student.team_where_offuture two;

--QC9.4-Sum/Min/Max for Discount column
SELECT 
	SUM("Discount"), 
	MIN("Discount"), 
	MAX("Discount"),
	AVG("Discount")
FROM 
	student.team_where_offuture two;

--QC9.5-Sum/Min/Max for Profit column
SELECT 
	SUM("Profit"), 
	MIN("Profit"), 
	MAX("Profit"),
	AVG("Profit")
FROM 
	student.team_where_offuture two;

--QC9.6-Sum/Min/Max for Shipping Cost column
SELECT 
	SUM("Shipping Cost"), 
	MIN("Shipping Cost"), 
	MAX("Shipping Cost"),
	AVG("Shipping Cost")
FROM 
	student.team_where_offuture two;

--QC9.7- Sum/Min/Max length for Postal Code
SELECT 
	sum("Postal Code"),
	min("Postal Code"),
	max("Postal Code"),
	AVG("Postal Code")
FROM
	student.team_where_offuture;

--QC10- Checking for truncation of strings--

--QC10.1- Sum/Min/Max string length for Order ID
SELECT 
	sum(length("Order ID")),
	min(length("Order ID")),
	max(length("Order ID")),
	AVG(LENGTH("Order ID"))
FROM
	student.team_where_offuture;

--QC10.2- Sum/Min/Max string length for Order Date
SELECT 
	sum(length("Order Date")),
	min(length("Order Date")),
	max(length("Order Date")),
	AVG(LENGTH("Order Date"))
FROM
	student.team_where_offuture;

--QC10.3- Sum/Min/Max string length for Ship Date
SELECT 
	sum(length("Ship Date")),
	min(length("Ship Date")),
	max(length("Ship Date")),
	AVG(LENGTH("Ship Date"))
FROM
	student.team_where_offuture;

--QC10.4- Sum/Min/Max string length for Ship Mode
SELECT 
	sum(length("Ship Mode")),
	min(length("Ship Mode")),
	max(length("Ship Mode")),
	AVG(LENGTH("Ship Mode"))
FROM
	student.team_where_offuture;

--QC10.5- Sum/Min/Max string length for Customer ID
SELECT 
	sum(length("Customer ID")),
	min(length("Customer ID")),
	max(length("Customer ID")),
	AVG(LENGTH("Customer ID"))
FROM
	student.team_where_offuture;

--QC10.6- Sum/Min/Max string length for Customer Name
SELECT 
	sum(length("Customer Name")),
	min(length("Customer Name")),
	max(length("Customer Name")),
	AVG(LENGTH("Customer Name"))
FROM
	student.team_where_offuture;
	
--QC10.7- Sum/Min/Max string length for Segment
SELECT 
	sum(length("Segment")),
	min(length("Segment")),
	max(length("Segment")),
	AVG(LENGTH("Segment"))
FROM
	student.team_where_offuture;

--QC10.8- Sum/Min/Max string length for City
SELECT 
	sum(length("City")),
	min(length("City")),
	max(length("City")),
	AVG(LENGTH("City"))
FROM
	student.team_where_offuture;

--QC10.9- Sum/Min/Max string length for State
SELECT 
	sum(length("State")),
	min(length("State")),
	max(length("State")),
	AVG(LENGTH("State"))
FROM
	student.team_where_offuture;
	
--QC10.10- Sum/Min/Max string length for Country
SELECT 
	sum(length("Country")),
	min(length("Country")),
	max(length("Country")),
	AVG(LENGTH("Country"))
FROM
	student.team_where_offuture;
	
--QC10.11- Sum/Min/Max string length for Market
SELECT 
	sum(length("Market")),
	min(length("Market")),
	max(length("Market")),
	AVG(LENGTH("Market"))
FROM
	student.team_where_offuture;

--QC10.12- Sum/Min/Max string length for Region
SELECT 
	sum(length("Region")),
	min(length("Region")),
	max(length("Region")),
	AVG(LENGTH("Region"))
FROM
	student.team_where_offuture;

--QC10.13- Sum/Min/Max string length for Product ID
SELECT 
	sum(length("Product ID")),
	min(length("Product ID")),
	max(length("Product ID")),
	AVG(LENGTH("Product ID"))
FROM
	student.team_where_offuture;

--QC10.14- Sum/Min/Max string length for Catergory
SELECT 
	sum(length("Category")),
	min(length("Category")),
	max(length("Category")),
	AVG(LENGTH("Category"))
FROM
	student.team_where_offuture;

--QC10.15- Sum/Min/Max string length for Sub Category
SELECT 
	sum(length("Sub-Category")),
	min(length("Sub-Category")),
	max(length("Sub-Category")),
	AVG(LENGTH("Sub-Category"))
FROM
	student.team_where_offuture;

--QC10.16- Sum/Min/Max string length for Product Name
SELECT 
	sum(length("Product Name")),
	min(length("Product Name")),
	max(length("Product Name")),
	AVG(LENGTH("Product Name"))
FROM
	student.team_where_offuture;
	
--QC10.17- Sum/Min/Max string length for Order Priority
SELECT 
	sum(length("Order Priority")),
	min(length("Order Priority")),
	max(length("Order Priority")),
	AVG(LENGTH("Order Priority"))
FROM
	student.team_where_offuture;


