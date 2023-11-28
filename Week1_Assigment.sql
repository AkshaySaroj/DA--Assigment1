-- Identify the primary keys and foreign keys in maven movies db. Discuss the differences 
describe actor;  -- primary key: actor_id, Foreign Key: Last name
describe actor_award;
describe address;
describe advisor;
describe category;
describe city;
describe country;
describe customer;
describe film;
describe film_actor;
describe film_category;
describe film_text;
describe inventory;
describe investor;
describe language;
describe payment;
describe staff;
describe store;

/*
Primary Key: the primary key is the data of column which can be used to identify the unique row/data of the table.
Foreign key: Foreign key is similar to the Primary key which is used to identify the data of another table and in another table, it will work as primary key.
In another words, foreign key is primary key of another table that can be used it identify unique row within the table.
*/

-- List all details of actors 
select * from actor;

-- List all customer information from DB. 
select * from customer;

-- List different countries. 
select *from country;
select distinct country from country;

-- Display all active customers. 
select *from customer;

--  considering the active = 1 show the result of active customer

select first_name , last_name from customer where active=1;

-- List of all rental IDs for customer with ID 1.
select * from rental;
select rental_id from  rental where customer_id=1;

-- Display all the films whose rental duration is greater than 5 . 
select * from film;
select title  from film 
where rental_duration>5;

-- List the total number of films whose replacement cost is greater than $15 and less than $20.
select *from film;
select title from film where  replacement_cost > 15 and replacement_cost<20;

-- Find the number of films whose rental rate is less than $1. 
Select * from film;
select count(*) from film 
where rental_rate<1;

-- Display the count of unique first names of actors. 
select * from actor;
Select distinct count(first_name) from actor;

-- Display the first 10 records from the customer table .
select * from customer limit 10;

-- Display the first 3 records from the customer table whose first name starts with ‘b’. 
select * from customer;
select * from customer where first_name like "b%" limit 3;

-- Display the names of the first 5 movies which are rated as ‘G’. 
select * from film;
select * from film 
where rating="G" LIMIT 5;

-- Find all customers whose first name starts with "a". 
Select * from customer;
Select * from customer where first_name like "a%";

-- Find all customers whose first name ends with "a". 
select * from  customer where first_name like "%a";

-- Display the list of first 4 cities which start and end with ‘a’ . 
Select * from city;
select city from city where city like "%a" limit 4;

-- Find all customers whose first name have "NI" in any position. 
select * from customer;
select * from customer where first_name like "%NI%" ;

-- Find all customers whose first name have "r" in the second position 
Select * from customer;
select * from customer where first_name like "_r%";

-- Find all customers whose first name starts with "a" and are at least 5 characters in length.
Select *from customer where first_name like "a____%"; -- 4 _ 

-- Find all customers whose first name starts with "a" and ends with "o". 
Select * from customer;
select * from customer where first_name like "a%o";

-- Get the films with pg and pg-13 rating using IN operator. 
select * from film;
select * from film where rating IN ('PG' , 'PG-13');

-- Get the films with length between 50 to 100 using between operator. 
select * from film;
select * from film where length between 50 and 100;

-- Get the top 50 actors using limit operator. 
select * from actor limit 50;

-- Get the distinct film ids from inventory table. 
select * from inventory;
select distinct film_id from film;




