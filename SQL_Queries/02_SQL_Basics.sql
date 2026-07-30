/*============================================================
Project     : Data Analyst SQL Portfolio
File        : 02_SQL_Basics.sql
Dataset     : HRDATA
Author      : Shashank S

Description :
Basic SQL queries covering SELECT, WHERE, DISTINCT,
ORDER BY, TOP, BETWEEN, IN, LIKE, and NULL handling.
============================================================*/

/*============================================================
Question 1: Display Employee Number, Department and Monthly Income
============================================================*/

SELECT EmployeeNumber,
       Department,
       MonthlyIncome
FROM HRDATA;

/*============================================================
Question 2: Display employees whose salary is greater than 5000
============================================================*/

SELECT EmployeeNumber,
       MonthlyIncome
FROM HRDATA
WHERE MonthlyIncome > 5000;

/*============================================================
Question 3: Display employees whose salary is between 5000 and 10000
============================================================*/

SELECT EmployeeNumber,
       MonthlyIncome
FROM HRDATA
WHERE MonthlyIncome BETWEEN 5000 AND 10000;

/*============================================================
Question 4: Display employees working in Sales department
============================================================*/

SELECT EmployeeNumber,
       Department
FROM HRDATA
WHERE Department = 'Sales';

/*============================================================
Question 5: Display employees working in Sales or Human Resources
============================================================*/

SELECT EmployeeNumber,
       Department
FROM HRDATA
WHERE Department IN ('Sales', 'Human Resources');

/*============================================================
Question 6: Display distinct job roles
============================================================*/

SELECT DISTINCT JobRole
FROM HRDATA;

/*============================================================
Question 7: Display the top 10 highest-paid employees
============================================================*/

SELECT TOP 10
       EmployeeNumber,
       MonthlyIncome
FROM HRDATA
ORDER BY MonthlyIncome DESC;

/*============================================================
Question 8: Display employees whose salary is NOT between
5000 and 10000
============================================================*/

SELECT EmployeeNumber,
       MonthlyIncome
FROM HRDATA
WHERE MonthlyIncome NOT BETWEEN 5000 AND 10000;

/*============================================================
Question 9: Display employees sorted by Department
and Monthly Income
============================================================*/

SELECT EmployeeNumber,
       Department,
       MonthlyIncome
FROM HRDATA
ORDER BY Department,
         MonthlyIncome DESC;

/*============================================================
Question 10: Display employees with monthly income greater
than the company average salary
============================================================*/

SELECT EmployeeNumber,
       MonthlyIncome
FROM HRDATA
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM HRDATA
);
