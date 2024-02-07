USE practice_sql;

CREATE TABLE jeju2
AS
SELECT * FROM jeju;

UPDATE jeju2
SET observe_data = '7월 상반기'
WHERE observe_data BETWEEN '2023-07-01' AND '2023-07-15';

UPDATE jeju2
SET observe_data = '7월 하반기'
WHERE observe_data BETWEEN '2023-07-16' AND '2023-07-31';

UPDATE jeju2
SET observe_data = '8월 상반기'
WHERE observe_data BETWEEN '2023-08-01' AND '2023-08-15';

UPDATE jeju2
SET observe_data = '8월 하반기'
WHERE observe_data BETWEEN '2023-08-16' AND '2023-08-31';

UPDATE jeju2
SET observe_data = '9월 상반기'
WHERE observe_data BETWEEN '2023-09-01' AND '2023-09-15';

UPDATE jeju2
SET observe_data = '9월 하반기'
WHERE observe_data BETWEEN '2023-09-16' AND '2023-09-30';

SELECT * FROM jeju2;

-- 그룹화 (GROUP BY): 레코드를 하나 이상의 컬럼으로 그룹하여 결과를 도출하고자 할 때 사용
-- 일반적으로 집계함수와 함께 사용됨
SELECT observe_data FROM jeju2 -- SELECT 위치에서 정확하게 명시해줘야 그룹화가 이루어짐
GROUP BY observe_data; 
SELECT observe_data, speed_80m FROM jeju2 
GROUP BY observe_data; 
SELECT observe_data, speed_80m FROM jeju2 
GROUP BY observe_data, speed_80m; 

SELECT observe_data, AVG(speed_80m) FROM jeju2
GROUP BY observe_data;

-- 필터링 (HAVING): 그룹화된 결과에 필터링을 적용하는 명령어
-- 주의! WHERE 절과 사용방법이 같지만 WHERE절과 다르게 SELECT 이후에 실행됨
SELECT observe_data, AVG(speed_80m) AS avg 
FROM jeju2
GROUP BY observe_data
HAVING avg > 5.5 ;

SELECT observe_data, AVG(speed_80m) AS avg 
FROM jeju2
WHERE speed_80m > 5.5
GROUP BY observe_data;












