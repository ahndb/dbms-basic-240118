USE practice_sql;

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






