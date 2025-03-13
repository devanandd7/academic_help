# Experiment 4 - Employee Database Setup

## Requirements
Before you begin, ensure you have the following installed:

- **MySQL Workbench**  
  [Download MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

- **NetBeans / IntelliJ IDEA Ultimate**  
  [Download NetBeans](https://netbeans.apache.org/download/index.html)  
  [Download IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/) (If you are a student, activate your account using your university/college official email. Otherwise, you can opt for a 30-day trial.)

## Step 1: Create a Database
Once MySQL Workbench is installed and running, execute the following SQL commands to set up the database:

```sql
-- Show existing databases
SHOW DATABASES;

-- Create database
CREATE DATABASE company;
USE company;

-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(100),
    salary DOUBLE
);

-- Create employeedetails table
CREATE TABLE employeedetails (
    id INT PRIMARY KEY,
    address VARCHAR(50),
    phone VARCHAR(50),
    FOREIGN KEY (id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Insert sample data into employees table
INSERT INTO employees (name, department, salary) VALUES
    ('david', 'HR', 60000),
    ('dev', 'IT', 80000),
    ('david adair', 'Marketing', 55000),
    ('deva', 'Sales', 72000),
    ('Devanand Utkarsh', 'Finance', 90000);

-- Insert sample data into employeedetails table
INSERT INTO employeedetails (id, address, phone) VALUES
    (1, 'moon', '123-456-7890'),
    (2, 'mars', '987-654-3210'),
    (3, 'jupiter', '555-123-4567'),
    (4, 'Venus', '444-567-8901'),
    (5, 'earth', '666-789-1234');

-- Retrieve data from tables
SELECT * FROM employees;
SELECT * FROM employeedetails;
SELECT * FROM users;

-- Drop database and tables if needed
DROP DATABASE company;
DROP TABLE users;
DROP TABLE employeedetails;
DROP TABLE employees;

-- Truncate tables (clear data without deleting structure)
TRUNCATE TABLE users;
TRUNCATE TABLE employees;
TRUNCATE TABLE employeedetails;

-- Modify table columns
ALTER TABLE employees MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE employeedetails MODIFY COLUMN id INT PRIMARY KEY;
```

## Step 2: Download Required Files
Download the provided ZIP file containing the project structure:

- **NetBeans Project**: `./Experiment_4/`

## Step 3: Extract and Paste the Files
### For NetBeans:
1. Unzip the downloaded file.
2. Copy the extracted folder.
3. Paste it in the following directory:
   ```
   C:/Documents/NetBeansProjects/Experiment_4/
   ```

## Step 4: Open Your IDE
1. Open NetBeans or IntelliJ IDEA.
2. Import the project and ensure it is recognized correctly.

## Step 5: Set Permissions (For IntelliJ IDEA Users)
If you are using IntelliJ IDEA, allow any permission pop-ups to enable necessary dependencies to be downloaded in the background.

## Step 6: Watch Setup Video
For detailed instructions, refer to the setup video (if available):

> **[Video Uploaded Soon]**

## Step 7: All Done!
Your setup is now complete. You can start working on the project. If you encounter issues, verify your MySQL configurations and project structure.

