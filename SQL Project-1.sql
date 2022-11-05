/# Create a database named employee, then import data_science_team.csv proj_table.csv and emp_record_table.csv into the employee database from the given resources.
create database employee; 
use employee;
select * from emp_record_table;

/# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.
SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT FROM emp_record_table;

/# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: less than two
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING 
FROM emp_record_table
where EMP_RATING < 2;

/# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: greater than four 
SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
FROM emp_record_table
where EMP_RATING > 4;

/# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:between two and four 
SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
FROM emp_record_table
where EMP_RATING BETWEEN 2 AND 4;

/# Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.
SELECT *,concat(FIRST_NAME,LAST_NAME) AS NAME 
FROM emp_record_table
where DEPT = "FINANCE";

/# Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).
SELECT * FROM
(select *,COUNT(DEPT) 
over (partition by DEPT) AS REPORTINGS  
FROM emp_record_table) AS P
WHERE ROLE IN('MANAGER','PRESIDENT');

/# Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.
SELECT * FROM emp_record_table 
where DEPT ='HEALTHCARE'
UNION
SELECT * FROM emp_record_table
where DEPT = 'FINANCE';

/# Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.
SELECT EMP_ID,FIRST_NAME,LAST_NAME,ROLE,DEPT,EMP_RATING,
sum(EMP_RATING) AS T_RATING,
max(EMP_RATING) AS M_RATING
FROM emp_record_table
group by dept;

/# Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
SELECT *,max(SALARY),min(SALARY) 
FROM emp_record_table
group by ROLE;

/# Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
SELECT *,dense_rank() over(order by EXP desc) as 'RANK'
from emp_record_table;

/# Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
create view employeeview as
select * from emp_record_table
where SALARY > 6000;
select * from employeeview;

/# Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.
select * from 
(select * from emp_record_table
where EXP > 10) AS P;

/# Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.
call EMP_EXP(3);

/# Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
/#The standard being:
/#For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
/#For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
/#For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
/#For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
/#For an employee with the experience of 12 to 16 years assign 'MANAGER'.
call JOB_PROFILE(0,2);
CALL JOB_PROFILE(2,5);
CALL JOB_PROFILE(5,10);
CALL JOB_PROFILE(10,12);
CALL JOB_PROFILE(12,16);

/# Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
use employee;
create index index_first_name
on emp_record_table(FIRST_NAME);
select * from emp_record_table
where FIRST_NAME like 'Eric';

/# Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
SELECT *,(SALARY * 0.05 * EMP_RATING) AS BONUS
FROM emp_record_table;

/# Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.
 select *,avg(SALARY) as avg_salary 
 from emp_record_table
 group by CONTINENT,COUNTRY with rollup;
