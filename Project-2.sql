create database airline;
use airline;
desc routes;

/# Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.
create table route_details(
route_id int,
flight_num int,
origine_airpoart varchar(20),
Destination_airport varchar(10),
Aircraft_id varchar(20),
Distance_miles int,
check(flight_num is not null),
unique(route_id),
check(distance_miles > 0)
);

/# Write a query to display all the passengers (customers) who have travelled in routes 01 to 25. Take data  from the passengers_on_flights table.
select * from passengers_on_flights
where route_id between 1 and 25;

/# Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.
select *,count(class_id) as passengers,
sum(Price_per_ticket) as total_revenue
from ticket_details
where class_id = 'Bussiness'
group by class_id;

/# Write a query to display the full name of the customer by extracting the first name and last name from the customer table.
select *, concat(first_name,last_name) as full_name
from customer;

/# Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.
select c.first_name,c.last_name,c.gender,
t.customer_id,t.class_id
from customer c
inner join ticket_details t 
on c.customer_id = t.customer_id
order by customer_id;

/# Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.
call customer_id_brand(4,'Emirates');

/# Write a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.
select *,count(class_id) over(partition by class_id) 
from passengers_on_flights
group by customer_id
having class_id = 'Economy Plus';

/# Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.
select *,if(sum(Price_per_ticket) > 10000,'crossed','not crossed')
as Renevue
from ticket_details;

/# Write a query to create and grant access to a new user to perform operations on a database.
create user 'pavan'@'localhost' identified by 'Pavansai';
grant all privileges on airline. * to 'pavan'@'localhost';

/# Write a query to find the maximum ticket price for each class using window functions on the ticket_details table.
select *,max(Price_per_ticket) 
over(partition by class_id) as max_price
from ticket_details;

/# Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.
create index index_route
on passengers_on_flights(route_id);
select * from passengers_on_flights
where route_id = 4;

/#  For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.
explain  select * from passengers_on_flights
where route_id = 4;

/# Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.
select *,sum(Price_per_ticket) as total_price
from ticket_details
group by aircraft_id with rollup;

/# Write a query to create a view with only business class customers along with the brand of airlines.
create view business_view_ as 
select * from ticket_details
where class_id = 'Bussiness';
select * from business_view_;

/# Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.
call route('HNL','DEN');

/# Write a query to create a stored procedure that extracts all the details from the routes table where the travelled distance is more than 2000 miles.
call distance_details(2000);

/# Write a query to create a stored procedure that groups the distance travelled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.
call distance(@travel);

/# Write a query to extract ticket purchase date, customer ID, class ID and specify if the complimentary services are provided for the specific class using a stored function in stored procedure on the ticket_details table.
/#Condition:
/#If the class is Business and Economy Plus, then complimentary services are given as Yes, else it is No
call services('Bussiness',@com);
select @com;

/# Write a query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.
select * from customer 
where last_name = 'Scott';