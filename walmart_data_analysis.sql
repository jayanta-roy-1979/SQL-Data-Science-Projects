-- *** WALMART MYSQL DATA ANALYSIS PROJECT CREATED BY JAYANTA ROY ***

-- ENTIRE DATA SHOW: 
SELECT * FROM walmart_db.walmart_salesdata;

ALTER TABLE walmart_db.walmart_salesdata
DROP COLUMN  day_name, Name_of_Day,month_name;

-- CONDITIONAL STATEMENTS: FOR PRODUCT RATING 
SELECT 
Rating, Product_line,
       (   CASE 
           WHEN Rating >=  7.1 THEN 'Good'
		   WHEN Rating >= 6.5 THEN  'Average'
		   ELSE 'Poor'
		   END
) AS Rating_Review
FROM walmart_db.walmart_salesdata;

UPDATE walmart_db.walmart_salesdata
SET Time_of_Date=( 
	  CASE
			WHEN 'time' BETWEEN '00:00:00'AND '12:00:00' THEN 'Morning'
                     WHEN 'time' BETWEEN '12:01:00' AND '14:00:00' THEN 'AfterNooon'
                     ELSE 'Evening'
		         END
); 
-- TIME OF THE DAY
SELECT Time FROM walmart_db.walmart_salesdata;

-- Day Name 
  SELECT Date,DAYNAME(Date)AS Days_Name
 FROM walmart_db.walmart_salesdata;
 
 ALTER TABLE walmart_db.walmart_salesdata ADD COLUMN Days_Name VARCHAR (10);
 
UPDATE walmart_db.walmart_salesdata
 SET DAYNAME(Date)= Days_Name;

 
 SELECT * FROM walmart_db.walmart_salesdata;
 
-- Month Name
SELECT date,MONTHNAME(date) AS Months_Name
FROM walmart_db.walmart_salesdata;

ALTER TABLE walmart_db.walmart_salesdata ADD COLUMN Months_Name VARCHAR (10);
UPDATE walmart_db.walmart_salesdata
SET Months_Name=MONTHNAME(Date);

-- DROP UNCESSARY COLUMN: 
ALTER TABLE walmart_db.walmart_salesdata DROP COLUMN Days_Name ;

-- DISTINCT BRANCH NAME: 
SELECT DISTINCT branch FROM walmart_db.walmart_salesdata; 

-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT Product_line) AS Distinct_Count_Product_Line FROM walmart_db.walmart_salesdata;

-- HOW MANY UNIQUE CITIES DOES THE DATA HAVE?
SELECT DISTINCT (City) FROM walmart_db.walmart_salesdata;

-- HOW MANY UNIQUE PRODUCT LINE DOES THE DATA HAVE?
SELECT DISTINCT (Product_line) FROM walmart_db.walmart_salesdata;

-- WHAT IS THE MAXIMUM PAYMENT MODE?
SELECT MAX(Payment) FROM walmart_db.walmart_salesdata;

-- TOTAL COUNT OF EACH PAYMENT MODE: 
SELECT Payment,
COUNT(Payment) AS No_of_Count
FROM walmart_db.walmart_salesdata
GROUP BY Payment;

-- WHAT IS THE MOST SELLING PRODUCT LINE?
SELECT Product_line,
COUNT(Product_line) AS No_of_Max_Product
FROM walmart_db.walmart_salesdata
GROUP BY Product_line
ORDER BY No_of_Max_Product DESC;

-- WHAT IS THE TOTAL REVENUE OF THE MONTH?
SELECT Month_Name AS Month, SUM(Total) AS Total_Revenue 
FROM walmart_db.walmart_salesdata
GROUP BY Month_Name
ORDER BY Total_Revenue DESC;

-- WHAT MONTH HAD THE LARGEST COGS?
SELECT Month_Name AS Month, SUM(cogs) AS COGS
FROM walmart_db.walmart_salesdata
GROUP BY Month_Name
ORDER BY COGS DESC;

-- WHAT PRODUCT LINE HAD LARGEST REVENUE?
SELECT Product_line, SUM(Total) AS Total_Product_line_Revenue
FROM walmart_db.walmart_salesdata
GROUP BY Product_line
ORDER BY Total_Product_line_Revenue DESC;

-- WHAT IS THE CITY WITH THE LARGEST REVENUE?
SELECT City, Branch,  SUM(Total) AS Total_Cities_Revenue
FROM walmart_db.walmart_salesdata
GROUP BY City, Branch	
ORDER BY Total_Cities_Revenue DESC;

-- WHAT PRODUCT LINE HAD THE LARGEST VAT?
SELECT Product_line, AVG(Tax) AS Avg_Tax
FROM walmart_db.walmart_salesdata
GROUP BY Product_line
ORDER BY Avg_Tax DESC;

-- FETCH EACH PRODUCT LINE AND ADD A COLUMN TO THOSE PRODUCT LINE SHOWING "GOOD" ,"BAD". GOOD IF GREATER THAN AVG SALES:
-- WHICH BRACH SOLD MORE PRODUCTS THAN AVERAGE PRODUCT SOLD?
SELECT Branch, SUM(Quantity) AS Total_Quantity
FROM walmart_db.walmart_salesdata
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM walmart_db.walmart_salesdata);

-- WHAT IS THE MOST COMMON PRODUCT LINE BY GENDER ?
SELECT Gender, Product_line,COUNT(Gender) AS Total_Count_by_Gender
FROM walmart_db.walmart_salesdata
GROUP BY Gender, Product_line
ORDER BY Total_Count_by_Gender;

-- WHAT IS THE HIGHEST RATING OF EACH PRODUCT LINE?
SELECT MAX(Rating) AS Highest_Rating_of_Product_line, Product_line
FROM walmart_db.walmart_salesdata
GROUP BY Product_line
ORDER BY Highest_Rating_of_Product_line DESC;

-- NO. OF SALES MADE IN EACH TIME OF THE DAY PER WEEKDAY
SELECT Time_of_Day, COUNT(*) AS Total_Sales
FROM walmart_db,walmart_salesdata
WHERE Days_Name ='Monday'
GROUP BY Time_of_Day
ORDER BY Total_Sales DESC;

-- WHICH OF THE CUSTOMER TYPE BRINGS THE MOST REVENUE?
SELECT Customer_type, SUM(Total) AS Total_Revenue
FROM walmart_db.walmart_salesdata
GROUP BY Customer_type
ORDER BY Total_Revenue DESC;

-- WHICH CITY HAS THE LARGEST TAX PERCENT/VAT ?
SELECT City, AVG(Tax) AS Total_Tax
FROM Walmart_db.walmart_salesdata
GROUP BY City
ORDER BY Total_Tax DESC;

-- WHICH CUSTOMER TYPE PAYS THE MOST IN TAX?
SELECT Customer_type, AVG(Tax) AS Total_Tax
FROM Walmart_db.walmart_salesdata
GROUP BY Customer_type
ORDER BY Total_Tax DESC;

-- HOW MANY UNIQUE CUSTOMER TYPES DOES THE DATA HAVE?
SELECT DISTINCT Customer_type
FROM walmart_db.walmart_salesdata;

-- HOW MANY UNIQUE PAYMENT METHODS DOES THE DATA HAVE?
SELECT DISTINCT Payment
FROM walmart_db.walmart_salesdata;

-- WHICH CUSTOMER TYPE BUYS THE MOST?
-- WHAT IS THE GENDER OF MOST OF THE CUSTOMERS?
SELECT Gender, COUNT(*)AS Gender_Count
FROM walmart_db.walmart_salesdata
GROUP BY Gender
ORDER BY Gender_Count DESC;

-- WHAT IS THE GENDER DISTRIBUTION PER BRANCH?
SELECT Gender, COUNT(*) AS Gender_Count
FROM walmart_db.walmart_salesdata
WHERE Branch ='C'
GROUP BY Gender
ORDER BY Gender_Count DESC;

-- WHICH TIME OF THE DAY DO CUSTOMERS GIVE MOST RATING?
SELECT Time_of_Day, AVG(Rating) AS Avg_Rating
FROM walmart_db.walmart_salesdata
GROUP BY Time_of_Day
ORDER BY Avg_Rating DESC;

-- WHICH TIME OF THE DAY DO CUSTOMERS GIVE MOST RATING PER BRANCH? 
SELECT Time_of_Day, AVG(Rating) AS Avg_Rating
FROM walmart_db.walmart_salesdata
WHERE Branch ='C'
GROUP BY Time_of_Day
ORDER BY Avg_Rating DESC;

-- WHICH DAY OF THE WEEK HAS THE BEST AVG RATING?
SELECT Day_Name, AVG(Rating) AS Avg_Rating
FROM walmart_db.walmart_salesdata
GROUP BY Day_Name
ORDER BY Avg_Rating DESC;

-- WHICH DAY OF THE WEEK HAS THE BEST AVG RATING PER BRANCH?
SELECT Day_Name, AVG(Rating) AS Avg_Rating
FROM walmart_db.walmart_salesdata
WHERE Branch ='B'
GROUP BY Day_Name
ORDER BY Avg_Rating DESC;



















  
 
 
 
 
 













