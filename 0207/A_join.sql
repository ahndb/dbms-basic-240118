USE practice_sql;

CREATE TABLE employee (
	employee_number INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT 지정시 값 않넣는게 좋음
    name VARCHAR(30),
    department_code VARCHAR(5)
);

CREATE TABLE department(
	code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    tel_number VARCHAR(15) NOT NULL
);

ALTER TABLE employee
ADD CONSTRAINT FOREIGN KEY (department_code) REFERENCES department (code);

INSERT INTO department VALUES ('HR', '인사부', '051-111-1111');
INSERT INTO department VALUES ('FI', '재무부', '051-111-1112');
INSERT INTO department VALUES ('DV', '개발부', '051-111-1113');

INSERT INTO employee (name, department_code) VALUES ('홍길동',null);
INSERT INTO employee (name, department_code) VALUES ('김서준',null);
INSERT INTO employee (name, department_code) VALUES ('이민준','HR');
INSERT INTO employee (name, department_code) VALUES ('최시우','HR');
INSERT INTO employee (name, department_code) VALUES ('강지호','FI');
INSERT INTO employee (name, department_code) VALUES ('박도현','FI');

-- JOIN: 두 개 이상의 테이블의 특정 조건에 따라 조합하여 결과를 조회하고자 할 때 사용하는 명령어

-- INNER JOIN: 두 테이블에서 조건이 일치하는 레코드만 반환
SELECT 
	E.employee_number AS employee_number,
    E.name AS employee_name,  -- * 찍으면 중복된 값이 나와서 원하는 값만 적는게 좋음
    D.code AS department_code,
    D.name AS department_name,
    D.tel_number AS department_tel_number
FROM employee AS E INNER JOIN department AS D
ON E.department_code = D.code;

-- LEFT OUTER JOIN(LEFT JOIN): 첫 번째 테이블의 모든 레코드와 두 번째 테이블의 조건이 일치하는 레코드를 반환,
-- 							첫 번째 테이블의 레코드에서 조건이 일치하는 값이 없으면 null을 반환
SELECT 
	E.employee_number AS employee_number,
    E.name AS employee_name,  
    D.code AS department_code,
    D.name AS department_name,
    D.tel_number AS department_tel_number
FROM employee AS E LEFT JOIN department AS D
ON E.department_code = D.code;

-- RIGHT OUTER JOIN(RIGHT JOIN): 두 번째 테이블의 모든 레코드와 첫 번째 테이블의 조건이 일치하는 레코드를 반환,
-- 								두 번째 테이블의 레코드에서 일치하는 값이 없다면 null을 반환
SELECT 
	E.employee_number AS employee_number,
    E.name AS employee_name,  -- * 찍으면 중복된 값이 나와서 원하는 값만 적는게 좋음
    D.code AS department_code,
    D.name AS department_name,
    D.tel_number AS department_tel_number
FROM employee AS E RIGHT JOIN department AS D -- FROM 다음이 첫번째 테이블 JOIN 다음이 두번째 테이블
ON E.department_code = D.code;


















