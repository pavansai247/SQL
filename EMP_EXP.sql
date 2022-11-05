CREATE DEFINER=`root`@`localhost` PROCEDURE `EMP_EXP`(in EXPR int)
BEGIN
SELECT * FROM emp_record_table
where EXP > EXPR;
END