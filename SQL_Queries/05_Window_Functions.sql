-- ============================================================
-- Project : Data Analyst SQL Portfolio
-- File    : 05_Window_Functions.sql
-- Dataset : HR Employee Attrition Dataset
-- Table   : HRDATA
-- Author  : Shashank S
-- Tool    : Microsoft SQL Server Management Studio (SSMS)
--
-- Description:
-- This script demonstrates advanced SQL analytics using
-- Common Table Expressions (CTEs) and Window Functions
-- to solve real-world HR business scenarios.
--
-- SQL Concepts Covered:
-- • Common Table Expressions (CTEs)
-- • DENSE_RANK()
-- • PARTITION BY
-- • Window Aggregate Functions
-- • Business KPI Analysis
-- ============================================================

------------------------------------------------------------
-- Question 41
-- Find the department with the highest average monthly income.
------------------------------------------------------------

WITH DepartmentIncome AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS AverageMonthlyIncome,
        DENSE_RANK() OVER
        (
            ORDER BY AVG(MonthlyIncome) DESC
        ) AS IncomeRank
    FROM HRDATA
    GROUP BY Department
)
SELECT
    Department,
    AverageMonthlyIncome
FROM DepartmentIncome
WHERE IncomeRank = 1;

------------------------------------------------------------
-- Question 42
-- Find the employee(s) with the highest monthly income
-- in each department.
------------------------------------------------------------

WITH EmployeeSalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS SalaryRank
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM EmployeeSalaryRank
WHERE SalaryRank = 1;

------------------------------------------------------------
-- Question 43
-- Find the employee(s) with the second highest monthly
-- income in each department.
------------------------------------------------------------

WITH EmployeeSalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS SalaryRank
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM EmployeeSalaryRank
WHERE SalaryRank = 2;

------------------------------------------------------------
-- Question 44
-- Find the top three highest-paid employees in each
-- department.
------------------------------------------------------------

WITH EmployeeSalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS SalaryRank
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM EmployeeSalaryRank
WHERE SalaryRank <= 3;

------------------------------------------------------------
-- Question 45
-- Find employees whose monthly income is greater than
-- the company-wide average monthly income.
------------------------------------------------------------

WITH CompanyAverage AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        AVG(MonthlyIncome) OVER() AS CompanyAverageIncome
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM CompanyAverage
WHERE MonthlyIncome > CompanyAverageIncome;

------------------------------------------------------------
-- Question 46
-- Find the department with the maximum number of employees.
------------------------------------------------------------

WITH DepartmentEmployeeCount AS
(
    SELECT
        Department,
        COUNT(*) AS EmployeeCount,
        DENSE_RANK() OVER
        (
            ORDER BY COUNT(*) DESC
        ) AS DepartmentRank
    FROM HRDATA
    GROUP BY Department
)
SELECT
    Department,
    EmployeeCount
FROM DepartmentEmployeeCount
WHERE DepartmentRank = 1;

------------------------------------------------------------
-- Question 47
-- Find the employee(s) who earn the highest salary
-- in the entire company.
------------------------------------------------------------

WITH CompanySalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            ORDER BY MonthlyIncome DESC
        ) AS SalaryRank
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM CompanySalaryRank
WHERE SalaryRank = 1;

------------------------------------------------------------
-- Question 48
-- Find employees whose monthly income is greater than
-- the average monthly income of their job role.
------------------------------------------------------------

WITH JobRoleAverage AS
(
    SELECT
        EmployeeNumber,
        JobRole,
        MonthlyIncome,
        AVG(MonthlyIncome) OVER
        (
            PARTITION BY JobRole
        ) AS AverageJobRoleIncome
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome
FROM JobRoleAverage
WHERE MonthlyIncome > AverageJobRoleIncome;

------------------------------------------------------------
-- Question 49
-- Find the department with the lowest average monthly income.
------------------------------------------------------------

WITH DepartmentIncome AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS AverageMonthlyIncome,
        DENSE_RANK() OVER
        (
            ORDER BY AVG(MonthlyIncome)
        ) AS IncomeRank
    FROM HRDATA
    GROUP BY Department
)
SELECT
    Department,
    AverageMonthlyIncome
FROM DepartmentIncome
WHERE IncomeRank = 1;

------------------------------------------------------------
-- Question 50
-- Find the employee(s) with the lowest monthly income
-- in each department.
------------------------------------------------------------

WITH EmployeeSalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome
        ) AS SalaryRank
    FROM HRDATA
)
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM EmployeeSalaryRank
WHERE SalaryRank = 1;
