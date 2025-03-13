## instructions will uploaded soon.

here my sql code - 


download the zip file . it render into another page and click on the **view raw** , wait for file download. 



## Project Overview
This document provides instructions to set up and manage a MySQL database named `company`, which includes `employees`, `employeedetails`, and `users` tables. It also covers basic SQL operations like inserting, selecting, altering, and deleting data.

## Prerequisites
- MySQL Server installed (Download: https://dev.mysql.com/downloads/)
- MySQL Workbench or any SQL client tool

## Complete SQL Code
```sql
-- View existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE company;
USE company;

-- Create Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(100),
    salary DOUBLE
);

-- Create Employee Details Table
CREATE TABLE employeedetails (
    id INT PRIMARY KEY,
    address VARCHAR(50),
    phone VARCHAR(50),
    FOREIGN KEY (id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Create Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Insert Data into Employees Table
INSERT INTO employees (name, department, salary) VALUES
    ('david', 'HR', 60000),
    ('dev', 'IT', 80000),
    ('david adair', 'Marketing', 55000),
    ('deva', 'Sales', 72000),
    ('Devanand Utkarsh', 'Finance', 90000);

-- Insert Data into Employee Details Table
INSERT INTO employeedetails (id, address, phone) VALUES
    (1, 'moon', '123-456-7890'),
    (2, 'mars', '987-654-3210'),
    (3, 'jupiter', '555-123-4567'),
    (4, 'Venus', '444-567-8901'),
    (5, 'earth', '666-789-1234');

-- View Data
SELECT * FROM employees;
SELECT * FROM employeedetails;
SELECT * FROM users;
SELECT * FROM students; -- (Assuming students table exists)

-- Drop Database and Tables
DROP DATABASE company;
DROP TABLE users;
DROP TABLE employeedetails;
DROP TABLE employees;

-- Truncate Tables (Remove Data Without Deleting Structure)
TRUNCATE TABLE users;
TRUNCATE TABLE employees;
TRUNCATE TABLE employeedetails;

-- Alter Tables
ALTER TABLE employees MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE employeedetails MODIFY COLUMN id INT PRIMARY KEY;
```

## Notes
- Ensure MySQL is running before executing the commands.
- Use `USE company;` before performing table operations.
- Deleting a row from `employees` will automatically delete corresponding rows from `employeedetails` due to `ON DELETE CASCADE`.
- Be cautious while using `DROP TABLE` and `DROP DATABASE`, as they permanently delete data.

This document provides all necessary SQL commands in one place for easy execution. 🚀

