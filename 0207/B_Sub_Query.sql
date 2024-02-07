USE practice_sql;

-- 서브쿼리: 쿼리 내부에 위치하는 또 다른 쿼리, 쿼리 결과를 조건이나 테이블로 사용할 수 있도록 함

-- WHERE 절에서 서브쿼리: 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정
-- WHERE 절에서 비교 연산으로 사용될 때 조회하는 컬럼의 개수 및레코드 개수 주의
SELECT * FROM employee
WHERE department_code = (							-- 비교연산자 이기 때문에 *사용이 불가능 1개의 비교만 가능
	SELECT code FROM department WHERE name ='인사부' -- , 조건식이 없으면 여러개의 값이 리턴값이 생기기 때문에 안됨
);

-- FROM 절에서의 서브쿼리 : 쿼리 결과 테이블을 다시 FROM 절에 사용하여 복합적인 테이블 조회
SELECT * 
FROM (
	SELECT name AS employee_name, department_code 
    FROM employee 
    WHERE department_code IS NULL
) AS SQ -- 모든 반환 테이블에는 반드시 이름이 있어야 되서 FROM에 서버쿼리시 AS로 임의 이름 지정해 줘야함
		-- Error Code: 1248. Every derived table must have its own alias
WHERE employee_name = '홍길동'; -- FROM에서 서브쿼리사용시 이름바꾸면 외부 조건식에서 이름도 맞춰야 함 안그러면 조회 불가능
							-- Error Code: 1054. Unknown column 'name' in 'where clause'

-- 부서 이름이 '개발부'인 사원이름, 부서코드, 부서명을 조회
SELECT E.name, E.department_code, D.name 
FROM department D INNER JOIN employee E
ON D.name = '개발부';

SELECT * FROM employee;
SELECT * FROM department;

-- 부서 이름이 '개발부'인 사원이름, 부서코드를 조회
SELECT name, department_code
FROM employee
WHERE department_code = (
	SELECT code FROM department WHERE name = '인사부'
);






