/*============================================================
Project     : Data Analyst SQL Portfolio
File        : 04_GroupBy_Having.sql
Dataset     : HRDATA
Author      : Shashank S

Description :
Examples demonstrating GROUP BY and HAVING clauses
for business reporting and analysis.
============================================================*/

/*============================================================
Question 1: Count employees in each department
============================================================*/

SELECT Department,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY Department
ORDER BY EmployeeCount DESC;

/*============================================================
Question 2: Count employees in each job role
============================================================*/

SELECT JobRole,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY JobRole
ORDER BY EmployeeCount DESC;

/*============================================================
Question 3: Average salary by department
============================================================*/

SELECT Department,
       AVG(MonthlyIncome) AS AverageSalary
FROM HRDATA
GROUP BY Department
ORDER BY AverageSalary DESC;

/*============================================================
Question 4: Maximum salary by department
============================================================*/

SELECT Department,
       MAX(MonthlyIncome) AS HighestSalary
FROM HRDATA
GROUP BY Department;

/*============================================================
Question 5: Minimum salary by department
============================================================*/

SELECT Department,
       MIN(MonthlyIncome) AS LowestSalary
FROM HRDATA
GROUP BY Department;

/*============================================================
Question 6: Departments having more than 100 employees
============================================================*/

SELECT Department,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY Department
HAVING COUNT(*) > 100;

/*============================================================
Question 7: Departments where average salary exceeds 6000
============================================================*/

SELECT Department,
       AVG(MonthlyIncome) AS AverageSalary
FROM HRDATA
GROUP BY Department
HAVING AVG(MonthlyIncome) > 6000;

/*============================================================
Question 8: Job roles having more than 50 employees
============================================================*/

SELECT JobRole,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY JobRole
HAVING COUNT(*) > 50;

/*============================================================
Question 9: Education fields with more than 100 employees
============================================================*/

SELECT EducationField,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY EducationField
HAVING COUNT(*) > 100;

/*============================================================
Question 10: Business travel categories with more than
300 employees
============================================================*/

SELECT BusinessTravel,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY BusinessTravel
HAVING COUNT(*) > 300;
