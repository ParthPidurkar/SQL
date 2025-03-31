 -- Construct an ER Diagram for Company having following details: 
 create database Company_Construct;
 use Company_Construct;
 
 CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    start_date DATE
);

CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    ssno VARCHAR(15),
    address VARCHAR(255),
    salary DECIMAL(10, 2),
    sex VARCHAR(10),
    birth_date DATE,
    dept_id INT,
    supervisor_id INT
);

CREATE TABLE Project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    location VARCHAR(100)
);

CREATE TABLE Employee_Project (
    emp_id INT,
    project_id INT,
    hours_per_week DECIMAL(5, 2),
    PRIMARY KEY (emp_id, project_id)
);

CREATE TABLE Dependent (
    dependent_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    name VARCHAR(100),
    birth_date DATE,
    relationship VARCHAR(50)
);

ALTER TABLE Department ADD FOREIGN KEY (manager_id) REFERENCES Employee(emp_id);
ALTER TABLE Employee ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id);
ALTER TABLE Employee ADD FOREIGN KEY (supervisor_id) REFERENCES Employee(emp_id);
ALTER TABLE Project ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id);
ALTER TABLE Employee_Project ADD FOREIGN KEY (emp_id) REFERENCES Employee(emp_id);
ALTER TABLE Employee_Project ADD FOREIGN KEY (project_id) REFERENCES Project(project_id);
ALTER TABLE Dependent ADD FOREIGN KEY (emp_id) REFERENCES Employee(emp_id);

