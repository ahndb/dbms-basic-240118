CREATE DATABASE school;
USE school;
CREATE TABLE department (
	department_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    office_location VARCHAR(150) NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE student(
	student_number VARCHAR(7) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    department_id VARCHAR(5) NOT NULL,
    CONSTRAINT FOREIGN KEY (department_id) REFERENCES department (department_id)
);
CREATE TABLE cousrse (
	course_code VARCHAR(5) PRIMARY KEY,
    title VARCHAR(40) UNIQUE NOT NULL,
    credits FLOAT NOT NULL
    -- 담당교수 컬럼을 하나 만들고 제약조건 설정 후 교수테이블에 교수를 외래키로 잡음
);
CREATE TABLE professor (
	professor_id VARCHAR(7) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    specialization VARCHAR(40) NOT NULL,
    office_location VARCHAR(150) NOT NULL,
    department_id VARCHAR(5) NOT NULL,
    CONSTRAINT FOREIGN KEY (department_id) REFERENCES department (department_id) 
);

