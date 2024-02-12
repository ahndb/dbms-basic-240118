CREATE DATABASE company;
USE company;
CREATE TABLE department (
	department_code VARCHAR(3) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL,
    office_locatiomn VARCHAR(150) NOT NULL,
    head_employee_number INT
);
CREATE TABLE employee (
	employee VARCHAR(8) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    position_id VARCHAR(100) NOT NULL,
    department_id VARCHAR(100) NOT NULL,
    spervisor_id VARCHAR(100) NOT NULL
);
CREATE TABLE position (
	position_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(20) UNIQUE NOT NULL,
    rolo TEXT
);
