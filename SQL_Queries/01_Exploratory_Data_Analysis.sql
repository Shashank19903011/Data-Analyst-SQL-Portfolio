-- ==========================================
-- Project: Data Analyst SQL Portfolio
-- File   : 01_EDA_SQL.sql
-- Dataset: HRDATA
-- Purpose : Perform Exploratory Data Analysis (EDA) to
--           understand employee demographics, workforce
--           distribution, and key HR metrics.
-- ============================================================
-- Author : Shashank S
-- ==========================================

-- Question 1
-- How many employees are there in the company?

SELECT COUNT(*) AS TotalEmployees
FROM HRDATA;

------------------------------------------------------------

-- Question 2
-- What columns are available in the dataset?

SELECT COLUMN_NAME,
       DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'HRDATA';

------------------------------------------------------------

-- Question 3
-- Preview the employee data

SELECT TOP 10 *
FROM HRDATA;

------------------------------------------------------------

-- Question 4
-- How many departments does the company have?

SELECT DISTINCT Department
FROM HRDATA;

------------------------------------------------------------

-- Question 5
-- Which department has the most employees?

SELECT Department,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY Department
ORDER BY EmployeeCount DESC;

------------------------------------------------------------

-- Question 6
-- How many male and female employees are there?

SELECT Gender,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY Gender
ORDER BY EmployeeCount DESC;

------------------------------------------------------------

-- Question 7
-- How many employees belong to each marital status?

SELECT MaritalStatus,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY MaritalStatus
ORDER BY EmployeeCount DESC;

------------------------------------------------------------

-- Question 8
-- How many employees belong to each education field?

SELECT EducationField,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY EducationField
ORDER BY EmployeeCount DESC;

------------------------------------------------------------

-- Question 9
-- Which job roles have the highest number of employees?

SELECT JobRole,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY JobRole
ORDER BY EmployeeCount DESC;

------------------------------------------------------------

-- Question 10
-- How often do employees travel for business?

SELECT BusinessTravel,
       COUNT(*) AS EmployeeCount
FROM HRDATA
GROUP BY BusinessTravel
ORDER BY EmployeeCount DESC;


