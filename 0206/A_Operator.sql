USE practice_sql;

ALTER TABLE jeju ADD above_avg_spd BOOLEAN;
ALTER TABLE jeju ADD above_avg_dir BOOLEAN;
ALTER TABLE jeju ADD null_column1 DOUBLE;
ALTER TABLE jeju ADD null_column2 DOUBLE;

UPDATE jeju
SET above_avg_spd = true
WHERE speed_80m > 5.5;
UPDATE jeju
SET above_avg_spd = false
WHERE speed_80m < 5.5;

UPDATE jeju
SET above_avg_dir = true
WHERE direction_50m > 160;
UPDATE jeju
SET above_avg_dir = false
WHERE direction_50m < 160;

UPDATE jeju
SET null_column1 = speed_80m
WHERE speed_80m > 5.5;

UPDATE jeju
SET null_column2 = direction_50m
WHERE direction_50m > 160;

-- 연산자
-- 산술연산자: +, - , * , / , %
SELECT speed_80m + speed_76m + speed_70m + speed_35m AS total_speed
FROM jeju;

SELECT (speed_80m + speed_76m + speed_70m + speed_35m) / 4 AS avg_speed
FROM jeju;

-- 비교연산자 (WHERE절에서 자주 사용)
-- = : 좌항이 우항과 같으면 true
SELECT * FROM jeju WHERE observe_data = '2023-07-05';

-- <>, != : 좌항과 우항이 다르면 true
SELECT * FROM jeju WHERE observe_data <> '2023-07-05';
SELECT * FROM jeju WHERE observe_data != '2023-07-05';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM jeju WHERE speed_80m < 3.5;
SELECT * FROM jeju WHERE speed_80m <= 3.5;

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
SELECT * FROM jeju WHERE speed_80m > 3.5 ;
SELECT * FROM jeju WHERE speed_80m >= 3.5 ;

-- <=> : 좌항과 우항이 모두 null 이면 true
SELECT * FROM jeju WHERE null_column1 <=> null_column2;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)
SELECT * FROM jeju WHERE above_avg_spd IS TRUE;
SELECT * FROM jeju WHERE above_avg_dir IS NOT FALSE;

-- IS NULL : 좌항이 NULL이면 true
-- IS NOT NULL : 좌항이 NULL이 아니면 true
SELECT * FROM jeju WHERE null_column1 IS NULL;
SELECT * FROM jeju WHERE null_column1 IS NOT NULL;

-- BETWEEN min AND max : 좌항이 min보다 크거나 같으면서 max보다 작거나 같으면 true
-- NOT BETWEEN min AND max: 좌항이 min보다 작거나 max보다 크면 true  
SELECT * FROM jeju WHERE direction_50m BETWEEN 270 AND 360;
SELECT * FROM jeju WHERE direction_50m NOT BETWEEN 270 AND 360;

-- IN() : 주어진 값중에 하나라도 일치하는 값이 존재하면 true
-- NOT IN() : 주어진 값 들이 모두 일치하지 않으면 true
SELECT * FROM jeju WHERE observe_data 
IN ('2023-07-01','2023-08-01', '2023-09-01', '2023-10-01','2023-11-01','2023-12-01');

-- 논리연산자
-- AND (&&): 좌항과 우항이 모두 true이면 true
SELECT * FROM jeju WHERE speed_80m > 4 AND direction_50m < 180;

-- OR (||): 좌항과 우항중 하나라도 true이면 true;
SELECT * FROM jeju WHERE speed_80m > 4 OR direction_50m < 180;

-- XOR : 좌항과 우항이 다르면 true
SELECT * FROM jeju WHERE speed_80m > 4 XOR direction_50m < 180;

-- LIKE 연산자: 문자열을 비교할 때 패턴을 기준으로 비교

-- % : 임의의 개수 (0 ~ 무한대)의 문자
-- _ : 임의의 한 개 문자
SELECT * FROM jeju WHERE observe_data LIKE '20%'; -- % 앞에 넣으면 시작하는 값
SELECT * FROM jeju WHERE observe_data LIKE '%08'; -- % 뒤로 넣으면 끝나는 값
SELECT * FROM jeju WHERE observe_data LIKE '%08%'; -- %% 사이에 넣으면 포함하는 값 
SELECT * FROM jeju WHERE observe_data LIKE '20_'; -- 20@ 글자가 없어서 안나옴

SELECT * FROM jeju WHERE observe_data LIKE '2023-__-08'; -- 패턴만들기 가능

-- 정렬
-- ORDER BY: 쿼리 결과 기준으로 정렬
-- ASC : 오름차순 정렬
-- DESC : 내림차순 정렬
SELECT * FROM jeju ORDER BY speed_80m ASC;
SELECT * FROM jeju ORDER BY speed_80m DESC;
SELECT observe_data FROM jeju ORDER BY speed_80m DESC;

# 1. FROM 2. WHERE 3. ORDER BY 4. SELECT 순서로 진행

# ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
# 콤마로 정렬이 2개 이상 될때 첫번째 줄에서 정렬후 두번째 줄에서 그안에 값에서 정렬시작

-- 중복 제거
-- DISTINCT: SELECT 결과 테이블에서 컬럼의 조합의 중복을 제거하여 출력
SELECT DISTINCT above_avg_spd FROM jeju;
SELECT DISTINCT above_avg_spd, above_avg_dir FROM jeju;







