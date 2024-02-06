USE practice_sql;

-- 제약조건: 데이터베이스 컬럼에 적용되는 규칙
-- 데이터의 정확성, 일관성, 무결성을 보장

-- NOT NULL 제약조건: 해당 컬럼에 null을 포함하지 못 하도록 함
-- INSERT, UPDATE에 영향을 미침
CREATE TABLE not_null_table (
	null_column INT,
    not_null_column INT NOT NULL
);

-- NOT NULL 제약조건이 걸린 not_null_column에가 값을 지정하지 않음
INSERT INTO not_null_table (null_column) VALUES(1);
-- NOT NULL이 지정된 컬럼은 INSERT시에 '반드시'null이 아닌 값이 입력되어야 함
-- Error Code: 1364. 
-- Field 'not_null_column' doesn't have a default value	
-- not null컬럼에는 무조껀 값을 넣어줘야하는데 지정을 안해서 실행이 안되는 것

INSERT INTO not_null_table (not_null_column) VALUES(1);
INSERT INTO not_null_table (not_null_column) VALUES(null);
-- Error Code: 1048. Column 'not_null_column' cannot be null 

UPDATE not_null_table SET not_null_column = null;
-- NOT NULL이 지정된 컬럼은 UPDATE시에 null을 지정할 수 없음.
-- Error Code: 1048. Column 'not_null_column' cannot be null

-- UNIQUE 제약조건 : 특정 컬럼에 들어오는 모든 값들이 중복없이 들어오도록 함
-- INSERT, UPDATE에 영향을 미침
CREATE TABLE unique_table (
	unique_column INT UNIQUE,
    not_unique_column INT
);

INSERT INTO unique_table VALUES (1, 1);
-- UNIQUE로 지정된 컬럼은 INSERT시 중복된 데이터를 지정할 수 없음
INSERT INTO unique_table VALUES (1, 1);
-- Error Code: 1062. 
-- Duplicate entry '1' for key 'unique_table.unique_column'
INSERT INTO unique_table VALUES (2, 1);
UPDATE unique_table SET unique_column = 3;
-- UNIQUE로 지정된 컬럼은 UPDATE시 중복된 값으로 변경할 수 없음

-- NOT NULL + UNIQUE = 후보키
CREATE TABLE candidate_table (
	candidate_column INT NOT NULL UNIQUE,
    unique_column INT UNIQUE
);

INSERT candidate_table VALUES (1, null);

-- PRIMARY KEY: 특정 컬럼을 기본키로 지정함
-- 기본키: 후보키 중에 기능상 선택한 하나의 컬럼
-- 자신 테의블에서의 INSERT, UPDATE / 참조되어지는 테이블의 INSERT와 UPDATE에 영향을 미침

CREATE TABLE primary_table (
	primary_column INT PRIMARY KEY,
    nomal_column INT
	);

CREATE TABLE composite_table (
	-- primary1 INT PRIMARY KEY,
    -- primary2 INT PRIMARY KEY
	primary1 INT,
	primary2 INT,
    CONSTRAINT primary_key PRIMARY KEY(primary1, primary2)
);
    
SELECT * FROM information_schema.table_constraints;   
    
-- PRIMARY KEY 제약조건은 INSERT시에 NOT NULL의 조건과 UNIQUE의 조건을 만족해야함
INSERT INTO primary_table VALUES (null, null);
INSERT INTO primary_table VALUES (1, null);
INSERT INTO primary_table VALUES (1, null);
-- PRIMARY KEY 제약조건은 UPDATE시에 NOT NULL의 조건과 UNIQUE의 조건을 만족해야함
UPDATE primary_table SET primary_column = null;
UPDATE primary_table SET primary_column = 2;

-- FOREIGN KEY: 특정 컬럼을 다른 테이블 혹은 같은 테이블의 기본키 컬럼과 연결
CREATE TABLE foreign_table (
	primary_column INT PRIMARY KEY,
    foreign_column INT,
    CONSTRAINT foreign_key FOREIGN KEY(foreign_column) 
    REFERENCES primary_table (primary_column)
);
-- FOREGIN KEY 제약조건이 걸린 컬럼에 INSERT 작업시 
-- 참조하고 있는 테이블의 컬럼에 값이 존재하지 않으면 지정 할 수 없음
INSERT INTO foreign_table VALUES (1, 1);
INSERT INTO foreign_table VALUES (2, 3);

SELECT * FROM primary_table;
SELECT * FROM foreign_table;
-- FOREGIN KEY 제약조건이 걸린 컬럼에 UPDATE 작업시 
-- 참조하고 있는 테이블의 컬럼에 값이 존재하지 않으면 지정 할 수 없음
UPDATE foreign_table SET foreign_column = 3;

-- 특정 테이블에서 기본키를 참조하고 있는 레코드가 존재한다면 해당 레코드를 삭제하지 못 함
DELETE FROM primary_table WHERE primary_column = 1;
DELETE FROM foreign_table;

SELECT * FROM primary_table;

-- 특정 테이블을 참조하고 있는 테이블이 존재한다면 테이블 구조를 제거할 수 없음
DROP TABLE primary_table;

-- 특정 테이블에서 기본키를 참조하고 있는 레코드가 존재한다면 해당 레코드를 수정하지 못 함
UPDATE primary_table 
SET primary_column = 3 
WHERE primary_column = 1;


-- ON UPDATE / ON DELETE 옵션
-- ON UPDATE: 참조하고 있는 테이블의 기본키가 변경되었을 때 동작
-- ON DELETE: 참조하고 있는 테이블의 기본키가 삭제되었을 때 동작

-- CASCADE : 참조하고 있는 테이블에서 데이터를 삭제하거나 수정했을 때, 
-- 			참조하는 테이블에서도 삭제와 수정이 같이 일어남(편의상 많이 씀)

-- SET NULL : 참조하고 있는 테이블에서 데이터를 삭제하거나 수정했을 때,
-- 		   참조하는 테이블의 해당 데이터를 null로 지정

-- RESTRICT : 참조하는 테이블에 참조하는 데이터가 존재한다면 수정, 삭제가 불가능(기본값임)

CREATE TABLE optional_foreign_table (
	primary_column INT,
    foreign_column INT,
    FOREIGN KEY (foreign_column)
    REFERENCES primary_table (primary_column)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

INSERT INTO primary_table VALUES (1, 1);
INSERT INTO optional_foreign_table VALUES (1, 1);
SELECT * FROM optional_foreign_table;

UPDATE primary_table SET primary_column = 3
WHERE primary_column = 1;
SELECT * FROM optional_foreign_table;

DELETE FROM primary_table WHERE primary_column = 3;

-- CHECK 제약조건: 특정 컬럼에 값을 제한함
CREATE TABLE check_table (
	primary_column INT PRIMARY KEY,
    check_column VARCHAR(10) CHECK(check_column IN('남', '여'))
);

INSERT INTO check_table VALUES (1, '남');

-- CHECK로 지정된 컬럼은 지정 조건에 부합하지 않으면 INSERT 불가능
-- INSERT INTO check_table VALUES (2, '남자'); //Check constraint 'check_table_chk_1' is violated.

-- CHECK로 지정된 컬럼은 지정 조건에 부합하지 않으면 UPDATE 불가능
-- UPDATE check_table SET check_column = '남자'; // Check constraint 'check_table_chk_1' is violated.

-- DEFAULT 제약조건: 컬럼에 데이터가 지정되지 않았을 때 사용할 기본값 지정
CREATE TABLE default_table (
	primary_column INT PRIMARY KEY,
    default_column VARCHAR(10) DEFAULT'기본값'
);
INSERT INTO default_table (primary_column) VALUES (1);
INSERT INTO default_table VALUES (2, null);
SELECT * FROM default_table;

