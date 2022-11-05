CREATE DEFINER=`root`@`localhost` PROCEDURE `JOB_PROFILE`(in EXP_X int,in EXP_Y int)
BEGIN
SELECT * FROM data_science_team
where EXP BETWEEN EXP_X+1 AND EXP_Y;
END