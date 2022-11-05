CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_id_brand`(in id int,in airline varchar(20))
BEGIN
select * from
(select c.first_name,c.last_name,
t.customer_id,t.brand
from ticket_details t
inner join customer c
on c.customer_id = t.customer_id) as p
where customer_id = id and brand = airline;
END