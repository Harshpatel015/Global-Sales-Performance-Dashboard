use sale;

#-----------------------------------------------------------------------

#Q1 => Total Sales
SELECT 
    SUM(Sales)
FROM
    sales_report;    # 2297200.8558493257
#or
SELECT 
    ROUND(SUM(Sales) / 1000000, 2)
FROM
    sales_report;		# 2.3M

#-----------------------------------------------------------------------

#Q2 => Total Profite
SELECT 
    SUM(Profit)
FROM
    sales_report;	# 286397.020810917
#or
SELECT 
    ROUND(SUM(Profit) / 1000, 2)
FROM
    sales_report;			# 286.4K

#-----------------------------------------------------------------------

#Q3 => Total unite sales
SELECT 
    SUM(Quantity)
FROM
    sales_report;			# 37873
#or
SELECT 
    ROUND(SUM(Quantity) / 1000, 2)
FROM
    sales_report;    #37.87K

#-----------------------------------------------------------------------

#Q4 => Avg Profite per unite sales
SELECT 
    SUM(Profit) / SUM(Quantity) AS avg_profite_per_unite_sales
FROM
    sales_report; 			# 7.562036828635625

#-----------------------------------------------------------------------

#Q5 => Total discount given to customer 
SELECT 
    SUM(Discount)
FROM
    sales_report;					# 1561.0900168418884 
#or
SELECT 
    ROUND(SUM(Discount) / 1000, 2) AS Discount
FROM
    sales_report;			#1.56K

#-----------------------------------------------------------------------

#Q6 => Avg discount per unite sales
SELECT 
    SUM(Discount) / SUM(Quantity) AS avg_discount_per_unite_sales
FROM
    sales_report;			#0.04121907471924296

#-----------------------------------------------------------------------

#Q7 => Profit Margin 
SELECT 
    ((SUM(Profit) / SUM(sales)) * 100) AS Profit_Margin
FROM
    sales_report;						#12.46721722576713

#-----------------------------------------------------------------------

#Q8 Annual sales and profite and profite margin 

#(year 2018)
SELECT 
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin
FROM
    sales_report
WHERE
    YEAR(Order_Date) = 2018;

#( all years )
SELECT 
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin,
    YEAR(Order_Date) AS year
FROM
    sales_report
GROUP BY year
ORDER BY year;
 
 #-----------------------------------------------------------------------

#Q9 Annual sales and profite and profite margin ( month wise ) 
 
 SELECT 
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin,
    MONTH(Order_Date) AS month
FROM
    sales_report
GROUP BY month
ORDER BY month;
 
 #-----------------------------------------------------------------------

#Q10 Annual sales and profite and profite margin ( month wise by year ) 
 
SELECT 
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin,
    MONTH(Order_Date) AS month,
    YEAR(Order_Date) AS year
FROM
    sales_report
GROUP BY month , year
ORDER BY year , month;
 
 #-----------------------------------------------------------------------

#Q11 Annual sales and profite and profite margin ( Date wise )
 
SELECT 
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin,
    DATE(Order_Date) AS date
FROM
    sales_report
GROUP BY date
ORDER BY date;

#-----------------------------------------------------------------------

#Q12 Total Sales and Profit by Category and Sub-Category

SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin
FROM
    sales_report
GROUP BY Category , Sub_Category
ORDER BY Category , Sub_Category;

#-----------------------------------------------------------------------

#Q13 Total Sales, Profit, and Profit Margin by Region

SELECT 
    Region,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin
FROM
    sales_report
GROUP BY Region
ORDER BY Total_Profit DESC;

#-----------------------------------------------------------------------

#Q14 Customer vise Profit and Sales Overview

SELECT 
    Customer_Name,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin
FROM
    sales_report
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 100;

#-----------------------------------------------------------------------

#Q15 Profit and Sales by state , city
SELECT 
    State,
    City,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(((SUM(Profit) / SUM(sales)) * 100), 2) AS Profit_Margin
FROM
    sales_report
GROUP BY State , City
ORDER BY Total_Profit DESC;