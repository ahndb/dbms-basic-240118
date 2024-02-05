-- qatar asian cup 데이터베이스

-- A, B, C, D

-- 참가국 (국가명, 조, 감독, 피파랭킹)
-- 경기장 (경기장명, 수용인원, 주소)
-- 축구선수 (이름, 나이, 포지션, 소속프로팀, 등번호, 국가)
-- 심판 (이름, 나이, 포지션)

-- 경기 (경기일정, 국가1, 국가2, 경기장, 주심, 선심, 경기결과)

CREATE DATABASE qatar_asian_cup;
USE qatar_asian_cup;
CREATE TABLE country(
	name VARCHAR(30),
    group VARCHAR(1),
    manager VARCHAR(30),
    lanking int
);

CREATE TABLE stadium(
	name VARCHAR(50),
    capacity int,
    address VARCHAR(255)
);

CREATE TABLE player (
	name VARCHAR(30),
    age int,
    position VARCHAR(15),
    pro_team VARCHAR(30),
    uniform_number int,
    country VARCHAR(30)
);

CREATE TABLE referee (
	name VARCHAR(30),
    age int,
    position VARCHAR(15)
);

CREATE TABLE game (
	schedule DATETIME,
    country1 VARCHAR(30),
    country2 VARCHAR(30),
    stadium VARCHAR(50),
    chief_referee VARCHAR(30),
    second_referee VARCHAR(30),
    winning_country VARCHAR(30)
);



