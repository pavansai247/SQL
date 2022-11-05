CREATE DEFINER=`root`@`localhost` PROCEDURE `route`(in d_code varchar(10),in a_code varchar(10))
BEGIN
select * from
(select c.first_name,c.last_name,c.gender,
p.class_id,p.aircraft_id,p.depart,p.arrival,p.flight_num
from passengers_on_flights p
inner join customer c
on c.customer_id = p.customer_id) as s
where depart = d_code and arrival = a_code;
END