-- ============================================================
-- Project : Data Analyst SQL Portfolio
-- File    : 03_Filtering_and_Sorting.sql
-- Dataset : HR Employee Attrition Dataset
-- Table   : HRDATA
-- Author  : Shashank S
-- Tool    : Microsoft SQL Server Management Studio (SSMS)
--
-- Description:
-- This script demonstrates SQL filtering and sorting
-- techniques using WHERE, ORDER BY, comparison operators,
-- and conditional filtering to answer HR business questions.
--
-- SQL Concepts Covered:
-- • WHERE
-- • ORDER BY
-- • Comparison Operators (=, >, <)
-- • Filtering Data
-- • TOP
-- • Business Data Analysis
-- ============================================================

------------------------------------------------------------
-- Question 21
-- Which employees have left the company?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE Attrition = 1;

------------------------------------------------------------
-- Question 22
-- Which employees are currently working in the company?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE Attrition = 0;

------------------------------------------------------------
-- Question 23
-- Which employees earn more than 50,000 per month?
------------------------------------------------------------

SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM HRDATA
WHERE MonthlyIncome > 50000
ORDER BY MonthlyIncome DESC;

------------------------------------------------------------
-- Question 24
-- Which employees are younger than 30 years?
------------------------------------------------------------

SELECT
    EmployeeNumber,
    Age,
    Department
FROM HRDATA
WHERE Age < 30
ORDER BY Age ASC;

------------------------------------------------------------
-- Question 25
-- Which employees are older than 50 years?
------------------------------------------------------------

SELECT
    EmployeeNumber,
    Age,
    Department
FROM HRDATA
WHERE Age > 50
ORDER BY Age DESC;

------------------------------------------------------------
-- Question 26
-- Which employees belong to the Sales department?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE Department = 'Sales';

------------------------------------------------------------
-- Question 27
-- Which employees belong to the Research & Development department?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE Department = 'Research & Development';

------------------------------------------------------------
-- Question 28
-- Which employees belong to the Human Resources department?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE Department = 'Human Resources';

------------------------------------------------------------
-- Question 29
-- Which employees work overtime?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE OverTime = 'Yes';

------------------------------------------------------------
-- Question 30
-- Which employees do not work overtime?
------------------------------------------------------------

SELECT *
FROM HRDATA
WHERE OverTime = 'No';
