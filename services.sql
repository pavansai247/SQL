CREATE DEFINER=`root`@`localhost` PROCEDURE `services`(in num varchar(10),out service varchar(10))
BEGIN
declare class varchar(15) default 1;
select class_id into class
from ticket_details
where class = num
group by class;

if class = "Bussiness" then
set service = 'yes';
elseif class = "Economy Plus" then
set service = 'yes';
elseif class = "First Class" then
set service = 'no';
elseif class = "Economy" then
set service = 'no';
end if;
END