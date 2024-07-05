CREATE DATABASE board;

USE board;

# User 테이블
# email 문자열 100 / PK NN UQ
# password 문자열 255 / NN
# nickname 문자열 30 / NN UQ
# tel_number 문자열 15 / NN UQ
# address 길이제한없는 문자열 / NN
# address_detail 길이제한없는 문자열
# profile_image_url 길이제한없는 문자열
CREATE TABLE user (
  email VARCHAR(100) PRIMARY KEY NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  nickname VARCHAR(30) NOT NULL UNIQUE,
  tel_number VARCHAR(15) NOT NULL UNIQUE,
  address TEXT NOT NULL,
  address_detail TEXT,
  profile_image_url TEXT
);

# Board 테이블
# board_number 정수형 / PK NN UQ AI
# title 길이제한없는 문자열 / NN
# contents 길이제한없는 문자열 / NN
# image_url 길이제한없는 문자열
# view_count 정수 / NN DF 0
# comment_count 정수 / NN DF 0
# favorite_count 정수 / NN DF 0
# write_datetime 날짜및시간 / NN DF now()
# writer_email 문자열 100 / NN FK user(email)
CREATE TABLE board (
  board_number INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
  title TEXT NOT NULL,
  contents TEXT NOT NULL,
  image_url TEXT,
  view_count INT NOT NULL DEFAULT 0,
  comment_count INT NOT NULL DEFAULT 0,
  favorite_count INT NOT NULL DEFAULT 0,
  write_datetime DATETIME NOT NULL DEFAULT now(),
  writer_email VARCHAR(100) NOT NULL,
  FOREIGN KEY (writer_email) REFERENCES user (email)
);

# Favorite 테이블
# board_number 정수 / NN
# user_email 문자열 100 / NN
# board_number + user_email / PK
CREATE TABLE favorite (
  board_number INT NOT NULL,
  user_email VARCHAR(100) NOT NULL,
  PRIMARY KEY (board_number, user_email),
  FOREIGN KEY (board_number) REFERENCES board (board_number),
  FOREIGN KEY (user_email) REFERENCES user (email)
);

# Comment 테이블
# comment_number 정수 / PK NN UNIQUE AI
# board_number 정수 / NN FK board(board_number)
# user_email 문자열 100 / NN FK user(email)
# contents 길이제한이없는 문자열 / NN
# write_datetime 날짜및시간 / NN DF now()
CREATE TABLE comment (
  comment_number INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
  board_number INT NOT NULL,
  user_email VARCHAR(100) NOT NULL,
  contents TEXT NOT NULL,
  write_datetime DATETIME NOT NULL DEFAULT now(),
  FOREIGN KEY (board_number) REFERENCES board (board_number),
  FOREIGN KEY (user_email) REFERENCES user (email)
);


# Search Log 테이블
# log_sequence 정수 / PK NN UQ AI
# search_word 길이제한이없는 문자열 / NN
# relation_word 길이제한이없는 문자열
CREATE TABLE search_log (
  log_sequence INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
  search_word TEXT NOT NULL,
  relation_word TEXT,
  relation BOOLEAN
);

CREATE TABLE borad_image (
	sequence INT PRIMARY KEY AUTO_INCREMENT,
    board_number INT NOT NULL,
    image_url TEXT,
    FOREIGN KEY (board_number) REFERENCES board(board_number)
);