Create database Country_And_Polulation;
use  Country_And_Polulation;
--  Create a table named Country with fields: Id, Country_name, Population_Area 

create table Country ( ID int primary Key, Country_name varchar(20) not null, Population int ,Area int );
-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name

Create Table Persons ( ID int , F_name varchar (20) not null ,  Lname varchar (20) , Population int , Rating dec,  Country_Id int ,Country_name varchar (20), foreign key (Country_Id) references Country(ID));

insert into Country(ID, Country_name,Population,Area) values 

(1,'India',1420000000,3287000),
(2,'USA',331000000,9834000),
(3,'UAE',83200000,357022),
(4,'Oman',25600000,3287000),
(5,'Lanka',1428700000,987000),
(6,'China',1444216107,9597000),
(7,'Canada',38000000,9985000),
(8,'Japan',213000000,377975),
(9,'Brazil',67000000,8516000),
(10,'UK',67000000,243610);

insert into Persons ( ID , F_name ,  Lname, Population, Rating,  Country_Id ,Country_name) values
(1,'Sharon','Pindi',331000000, 4,2,'India'),
(2,'Karthika','Nelath',38765890, 5,3,'USA'),
(3,'Giri','Krishna',331000000, 5,5,'UAE'),
(15,'Surya','Kumar',35640000, 3,7,'Oman'),
(5,'Sam','John',331087000, 9,6,'Lanka'),
(6,'Hari','Murali',201000000, 4,2,'China'),
(7,'Prathap','Chandra',101000000, 3,7,'Oman'),
(13,'Manu','Manohar',671000000, 4,8,'Australia'),
(9,'Sree','Kala',381000000, 3,10,'India'),
(12,'Krish','Lol',121000000, 5,1,'UK');

-- 1. Find the number of persons in each country.

select Country_name , Count(*)  as number_of_persons from persons 
group by Country_name ; 

-- 2.Find the number of persons in each country sorted from high to low. 
select Country_Name , count(*) as number_of_persons from persons 
group by Country_name order by number_of_persons  Desc;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0

select Country_Name ,avg(rating) as Average_Rating from Persons
group by Country_Name having avg(rating) >3.00;



--  4. Find the countries with the same rating as the USA. (Use Subqueries)

select Country_Name ,avg(rating) as Average_Rating from Persons
group by Country_Name having avg(rating) = ( Select avg(rating) from persons where Country_Name ='USA' );


--   5. Select all countries whose population is greater than the average population of all nations.

select Country_name ,population from Country where population > (select avg(population)from country);


-- Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 

create database product;
use product;

create table Customer (
Customer_ID int primary key , first_Name varchar(15),Last_Name varchar(15),Email varchar(25),
Phone_no Varchar(15),address varchar(50),city varchar(15),state varchar(15),ZIP_Code Varchar(10),Country varchar(15));

insert into Customer (Customer_ID ,first_Name,Last_Name,Email,Phone_no,address,city,state,ZIP_Code,Country)
values
(2,'Sunil','Kumar','sunilkumar@gmail.com','0976761216','abc villa ,kazakuttam','pulleda','trivandram','688765','US');
-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 2. Create a view named US_Customers that displays customers located in the US. 

create view customer_info as 
select concat(First_name,'',Last_Name) as full_name, Email from customer;

select * from customer_info;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.

Create view US_Customer as 
select * from customer where country='US';

Create view Customer_details as 
select concat(First_Name,'',Last_Name) as full_name, 
 Email,Phone_no,state from Customer;
 -- --  4. Update phone numbers of customers who live in California for Customer_details view.
 
 update Customer set Phone_No = '0987654321' where state = 'california';


-- 5. Count the number of customers in each state and show only states with more than 5 customers.

select state, count(*) as Customer_count from customer
group by state having count(*) >5;

--  Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

select state, count(*) as Customer_Count from customer_details group by state;
--  Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
Select * from customer_details order by state asc;





 




