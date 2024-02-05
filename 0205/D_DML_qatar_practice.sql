USE qatar_asian_cup;

-- 참가국에 데이터 삽입
-- 1. 대한민국, E, 위르겐 클리스만, 23
-- 2. 요르단, E, 후세인 아모타, 87
INSERT INTO country
VALUES ('대한민국', 'E', '위르겐 클리스만', 23) ;
INSERT INTO country
VALUES ('요르단', 'E', '후세인 아모타', 87) ;
-- 경기장에 데이터 삽입
-- 1. 아흐메드 빈 알리, 45032, 카타르 알라이얀
INSERT INTO stadium
VALUES ('아흐메드 빈 알리', 45032, '카타르 알라이얀');
-- 선수에 데이터 삽입
-- 1. 손흥민, 34, MF, 토트넘 홋스퍼, 7, 대한민국
-- 2. 올완, 24, FW, 알 샤말 SC, 9, 요르단
INSERT INTO player
VALUES ('손흥민', 32, 'MF', '토트넘 홋스퍼', 7, '대한민국');
INSERT INTO player 
VALUES ('올완', 24, 'FW', '알 샤말 SC', 9, '요르단');
-- 경기에 데이터 삽입
--	schedule, country1, country2, stadium
-- 1. 2024-02-07 00:00:00, 요르단, 대한민국, 아흐메드 빈 알리,
INSERT INTO game (schedule, country1, country2, stadium)
VALUES ('2024-02-07 00:00:00', '요르단', '대한민국', '아흐메드 빈 알리');


















