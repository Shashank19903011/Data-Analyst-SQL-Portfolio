-- ============================================================
-- Project : Data Analyst SQL Portfolio
-- File    : 02_Aggregate_Functions.sql
-- Dataset : HR Employee Attrition
-- Table   : HRDATA
-- Author  : Shashank S
-- Tool    : Microsoft SQL Server Management Studio (SSMS)
--
-- Purpose :
-- Demonstrate the use of SQL aggregate functions to analyze
-- employee demographics, salary statistics, overtime,
-- job levels, and attrition metrics.
--
-- Concepts Covered :
-- • COUNT()
-- • AVG()
-- • MIN()
-- • MAX()
-- • GROUP BY
-- • ORDER BY
-- • CASE Expression
-- • Business KPI Analysis
-- ============================================================
------------------------------------------------------------
-- Question 11
-- How many employees work overtime?
------------------------------------------------------------

SELECT
    OverTime,
    COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY OverTime
ORDER BY EmployeeCount DESC;

------------------------------------------------------------
-- Question 12
-- How many employees are in each job level?
------------------------------------------------------------

SELECT
    JobLevel,
    COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY JobLevel
ORDER BY EmployeeCount DESC;

------------------------------------------------------------
-- Question 13
-- What is the average monthly income of employees?
------------------------------------------------------------

SELECT
    AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HRDATA;

-----------------------------------------------------------_
-- Question 14
-- What are the minimum and maximum employee ages?
------------------------------------------------------------

SELECT
    MIN(Age) AS MinimumAge,
    MAX(Age) AS MaximumAge
FROM HRDATA;

------------------------------------------------------------
-- Question 15
-- What is the average monthly income by gender?
------------------------------------------------------------

SELECT
    Gender,
    AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HRDATA
GROUP BY Gender
ORDER BY AverageMonthlyIncome DESC;

------------------------------------------------------------
-- Question 16
-- Which department has the highest average monthly income?
------------------------------------------------------------

SELECT
    Department,
    AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HRDATA
GROUP BY Department
ORDER BY AverageMonthlyIncome DESC;

------------------------------------------------------------
-- Question 17
-- Which job role has the highest average monthly income?
------------------------------------------------------------

SELECT
    JobRole,
    AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HRDATA
GROUP BY JobRole
ORDER BY AverageMonthlyIncome DESC;

------------------------------------------------------------
-- Question 18
-- How many employees have left the company?
------------------------------------------------------------

SELECT
    COUNT(*) AS EmployeesLeft
FROM HRDATA
WHERE Attrition = 1;

------------------------------------------------------------
-- Question 19
-- What is the overall employee attrition rate (%)?
------------------------------------------------------------

SELECT
    CAST(
        SUM(CASE
                WHEN Attrition = 1 THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*)
    AS DECIMAL(5,2)) AS AttritionRate
FROM HRDATA;

------------------------------------------------------------
-- Question 20
-- Which department has the highest attrition rate?
------------------------------------------------------------

SELECT
    Department,
    CAST(
        SUM(CASE
                WHEN Attrition = 1 THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*)
    AS DECIMAL(5,2)) AS AttritionRate
FROM HRDATA
GROUP BY Department
ORDER BY AttritionRate DESC;
