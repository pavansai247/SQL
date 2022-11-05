CREATE DEFINER=`root`@`localhost` PROCEDURE `distance_details`(in distance int)
BEGIN
select * from routes
where Distance_miles > distance;
END