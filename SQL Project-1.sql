/# 1ST QUERY
create database employee; 
use employee;
select * from emp_record_table;

/#3RD QUERY
SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT FROM emp_record_table;

/# 4TH QUERY
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING 
FROM emp_record_table
where EMP_RATING < 2;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
FROM emp_record_table
where EMP_RATING > 4;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
FROM emp_record_table
where EMP_RATING BETWEEN 2 AND 4;

/# 5TH QUERY
SELECT *,concat(FIRST_NAME,LAST_NAME) AS NAME 
FROM emp_record_table
where DEPT = "FINANCE";

/# 6TH QUERY
SELECT * FROM
(select *,COUNT(DEPT) 
over (partition by DEPT) AS REPORTINGS  
FROM emp_record_table) AS P
WHERE ROLE IN('MANAGER','PRESIDENT');

/# 7TH QUERY 
SELECT * FROM emp_record_table 
where DEPT ='HEALTHCARE'
UNION
SELECT * FROM emp_record_table
where DEPT = 'FINANCE';

/# 8TH QUERY
SELECT EMP_ID,FIRST_NAME,LAST_NAME,ROLE,DEPT,EMP_RATING,
sum(EMP_RATING) AS T_RATING,
max(EMP_RATING) AS M_RATING
FROM emp_record_table
group by dept;

/# 9TH QUERY
SELECT *,max(SALARY),min(SALARY) 
FROM emp_record_table
group by ROLE;

/# 10TH QUERY
SELECT *,dense_rank() over(order by EXP desc) as 'RANK'
from emp_record_table;

/# 11TH QUERY
create view employeeview as
select * from emp_record_table
where SALARY > 6000;
select * from employeeview;

/# 12TH QUERY
select * from 
(select * from emp_record_table
where EXP > 10) AS P;

/# 13TH QUERY
call EMP_EXP(3);

/# 14TH QUERY
call JOB_PROFILE(0,2);
CALL JOB_PROFILE(2,5);
CALL JOB_PROFILE(5,10);
CALL JOB_PROFILE(10,12);
CALL JOB_PROFILE(12,16);

/# 15TH QUERY
use employee;
create index index_first_name
on emp_record_table(FIRST_NAME);
select * from emp_record_table
where FIRST_NAME like 'Eric';

/# 16TH QUERY
SELECT *,(SALARY * 0.05 * EMP_RATING) AS BONUS
FROM emp_record_table;

/# 17TH QUERY
 select *,avg(SALARY) as avg_salary 
 from emp_record_table
 group by CONTINENT,COUNTRY with rollup;
