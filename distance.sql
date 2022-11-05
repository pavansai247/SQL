CREATE DEFINER=`root`@`localhost` PROCEDURE `distance`(out term varchar(20))
BEGIN
declare distance int default 1;
select distance_miles into distance
from route;
if distance <= 2000 then
set term = 'short distance travel';
elseif distance between 2000 and 6500 then
set term = 'intermediate distance travel';
elseif distance > 6500 then
set term = 'long distance travel';
end if;
END