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
	-- 부서테이블에 부서 코드를 왜래키로 잡음
);
CREATE TABLE position (
	position_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(20) UNIQUE NOT NULL,
    rolo TEXT
);
-- 다대다의 경우 테이블 하나를 추가해서 기본값들을 기본키로 넣고 추가로 넣을 값을 넣음.