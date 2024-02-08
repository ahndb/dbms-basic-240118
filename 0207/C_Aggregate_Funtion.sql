USE practice_sql;

-- 집계 함수: 레코드를 '그룹화'하여 하나의 결과를 반환하는 함수

-- COUNT() : 특정 조건에 맞는 행의 개수를 반환
SELECT COUNT(*) FROM jeju;
SELECT COUNT(*) FROM jeju WHERE speed_80m > 3;

-- SUM() : 특정 컬럼의 값을 모두 합한 결과를 반환
SELECT SUM(speed_80m) FROM jeju;
SELECT SUM(speed_80m), SUM(speed_70m) FROM jeju WHERE observe_data LIKE '2023-08-__';
SELECT SUM(speed_80m) / COUNT(speed_80m) FROM jeju;

-- AVG() : 특정 컬럼의 값의 평균을 반환
SELECT AVG(speed_80m) FROM jeju;

-- MIN(), MAX() : 특정 컬럼의 최소값과 최대값을 반환
SELECT MIN(speed_80m), MAX(speed_80m) FROM jeju;


