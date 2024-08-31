use sale;

#Q1 => Total Sales
select sum(Sales) from sales_report;    # 2297200.8558493257
#or
select round(sum(Sales)/1000000,2) from sales_report;		# 2.3M

#Q2 => Total Profite
select sum(Profit) from sales_report;	# 286397.020810917
#or
select round(sum(Profit)/1000,2) from sales_report;			# 286.4K

#Q3 => Total unite sales
select sum(Quantity) from sales_report;			# 37873
#or
select round(sum(Quantity)/1000,2) from sales_report;    #37.87K

#Q4 => Avg Profite per unite sales
select sum(Profit)/sum(Quantity) as avg_profite_per_unite_sales from sales_report; 			# 7.562036828635625

#Q5 => Total discount given to customer 
select sum(Discount) from sales_report;					# 1561.0900168418884 
#or
select round(sum(Discount)/1000,2) as Discount from sales_report;			#1.56K

#Q6 => Avg discount per unite sales
select sum(Discount)/sum(Quantity) as avg_discount_per_unite_sales from sales_report;			#0.04121907471924296

#Q7 => Profit Margin 
select ((sum(Profit)/sum(sales))*100) as Profit_Margin from sales_report;						#12.46721722576713

#Q8 Annual sales and profite and profite margin 

#(year 2018)
select round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin from sales_report
where year(Order_Date) = 2018;

#( all years )
select round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin , year(Order_Date) as year from sales_report
group by year
order by year;
 
#Q9 Annual sales and profite and profite margin ( month wise ) 
 
 select round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin , month(Order_Date) as month from sales_report
 group by month
 order by month;
 
#Q10 Annual sales and profite and profite margin ( month wise by year ) 
 
 select round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin , month(Order_Date) as month, year(Order_Date) as year from sales_report
 group by month , year
 order by year , month ;
 
#Q11 Annual sales and profite and profite margin ( Date wise )
 
select round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin , date(Order_Date) as date from sales_report
group by date
order by date;

#Q12 Total Sales and Profit by Category and Sub-Category

select Category , Sub_Category , round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin from sales_report
group by Category , Sub_Category
order by Category , Sub_Category;

#Q13 Total Sales, Profit, and Profit Margin by Region

select Region ,round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin from sales_report
group by Region
order by Total_Profit desc;

#Q14 Customer vise Profit and Sales Overview

select Customer_Name , round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin from sales_report
group by Customer_Name
order by Total_Sales desc
limit 100;

#Q15 Profit and Sales by state , city
select State , City , round(sum(sales),2) as Total_Sales, round(sum(Profit),2) as Total_Profit, round(((sum(Profit)/sum(sales))*100),2) as Profit_Margin from sales_report
group by State , City
order by Total_Profit desc;

create database if not exists music;

create database pizza;

use pizza;

describe orders;
select * from orders; 