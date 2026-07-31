-- ============================================================
-- Project : Data Analyst SQL Portfolio
-- File    : 04_Subqueries_CTEs.sql
-- Dataset : HR Employee Attrition Dataset
-- Table   : HRDATA
-- Author  : Shashank S
-- Tool    : Microsoft SQL Server Management Studio (SSMS)
--
-- Description:
-- This script demonstrates advanced SQL techniques using
-- subqueries, Common Table Expressions (CTEs), HAVING,
-- and Window Functions to solve real-world HR analytics
-- business scenarios.
--
-- SQL Concepts Covered:
-- • Subqueries
-- • Correlated Subqueries
-- • Common Table Expressions (CTEs)
-- • HAVING Clause
-- • DENSE_RANK()
-- • Window Functions
-- • Business KPI Analysis
-- ============================================================
------------------------------------------------------------
-- Question 31
-- Find departments whose average MonthlyIncome is greater
-- than the overall average MonthlyIncome.
------------------------------------------------------------

SELECT
    Department,
    AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HRDATA
GROUP BY Department
HAVING AVG(MonthlyIncome) >
(
    SELECT AVG(MonthlyIncome)
    FROM HRDATA
);

------------------------------------------------------------
-- Question 32
-- Find the top 2 highest-paid employees in each department.
------------------------------------------------------------

WITH SalaryRank AS
(
    SELECT
        Department,
        EmployeeNumber,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS SalaryRank
    FROM HRDATA
)
SELECT *
FROM SalaryRank
WHERE SalaryRank <= 2;

------------------------------------------------------------
-- Question 33
-- Find the department with the highest total MonthlyIncome.
------------------------------------------------------------

SELECT TOP 1
    Department,
    SUM(MonthlyIncome) AS TotalMonthlyIncome
FROM HRDATA
GROUP BY Department
ORDER BY TotalMonthlyIncome DESC;

------------------------------------------------------------
-- Question 34
-- Find employees whose MonthlyIncome is greater than
-- the average MonthlyIncome of their own department.
------------------------------------------------------------

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM HRDATA H1
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM HRDATA H2
    WHERE H1.Department = H2.Department
);

------------------------------------------------------------
-- Question 35
-- Find the department with the highest number of employees
-- who have left the company.
------------------------------------------------------------

SELECT TOP 1
    Department,
    COUNT(*) AS AttritionCount
FROM HRDATA
WHERE Attrition = 1
GROUP BY Department
ORDER BY AttritionCount DESC;

------------------------------------------------------------
-- Question 36
-- Find employee(s) with the longest DistanceFromHome
-- in each department.
------------------------------------------------------------

SELECT
    EmployeeNumber,
    Department,
    DistanceFromHome
FROM HRDATA H1
WHERE DistanceFromHome =
(
    SELECT MAX(DistanceFromHome)
    FROM HRDATA H2
    WHERE H1.Department = H2.Department
);

------------------------------------------------------------
-- Question 37
-- Find the department with the highest average JobSatisfaction.
------------------------------------------------------------

SELECT TOP 1
    Department,
    AVG(JobSatisfaction) AS AverageJobSatisfaction
FROM HRDATA
GROUP BY Department
ORDER BY AverageJobSatisfaction DESC;

------------------------------------------------------------
-- Question 38
-- Find the top 3 departments with the highest
-- average MonthlyIncome.
------------------------------------------------------------

WITH DepartmentSalary AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS AverageMonthlyIncome,
        DENSE_RANK() OVER
        (
            ORDER BY AVG(MonthlyIncome) DESC
        ) AS SalaryRank
    FROM HRDATA
    GROUP BY Department
)
SELECT *
FROM DepartmentSalary
WHERE SalaryRank <= 3;

------------------------------------------------------------
-- Question 39
-- Find employees whose TotalWorkingYears is greater
-- than the overall average TotalWorkingYears.
------------------------------------------------------------

SELECT
    EmployeeNumber,
    TotalWorkingYears
FROM HRDATA
WHERE TotalWorkingYears >
(
    SELECT AVG(TotalWorkingYears)
    FROM HRDATA
);

------------------------------------------------------------
-- Question 40
-- Find the job role with the highest number of employees
-- who have left the company.
------------------------------------------------------------

WITH AttritionRank AS
(
    SELECT
        JobRole,
        COUNT(*) AS EmployeeCount,
        DENSE_RANK() OVER
        (
            ORDER BY COUNT(*) DESC
        ) AS RoleRank
    FROM HRDATA
    WHERE Attrition = 1
    GROUP BY JobRole
)
SELECT *
FROM AttritionRank
WHERE RoleRank = 1;
