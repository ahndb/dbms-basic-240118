CREATE DATABASE test1;
USE test1;

-- 1
INSERT INTO user
(email, password, nickname, tel_number, address, address_detail, agreed_personal) 
VALUES 
('email@email.com', 'P!ssw0rd', 'rose', '010-1234-5678', '부산광역시 사하구', '낙동대로', true);

-- 2
UPDATE user
SET email = 'email@email.com' ,profile_image = ('https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg')
WHERE email = 'email@email.com';

-- 3
INSERT INTO board 
(title, contents, writer_email)
VALUES
('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', 'email2@email.com');
-- writer_email은 user의 외래키로 잡혀있는데 'email2@email.com'은 user 테이블에 없는 데이터라 삽입 불가능

-- 4
INSERT INTO board 
(title, contents, writer_email)
VALUES
('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', 'email@email.com');

-- 5
INSERT INTO board_image
(board_number, image_url)
VALUES
(7, 'https://image.van-go.co.kr/place_main/2022/04/04/12217/035e1737735049018a2ed2964dda596c_750S.jpg');
-- borad테이블 초기화가 안되어 board_number 7로 잡아서 작성하였습니다.

-- 6
UPDATE board
SET favorite_count = favorite_count + 1
WHERE board_number = 7;
-- 5번문제의 이유로 board_number 7로 잡았습니다.

-- 7
SELECT 
	B.board_number, 
    B.title, 
    B.contents, 
    B.view_count, 
    B.favorite_count, 
    B.write_datetime, 
    B.writer_email, 
    U.profile_image AS writer_profile_image, 
    U.nickname AS writer_nickname
FROM user U INNER JOIN board B
ON U.email = B.writer_email;

-- 8
CREATE VIEW board_view AS
SELECT 
	B.board_number, 
    B.title, 
    B.contents, 
    B.view_count, 
    B.favorite_count, 
    B.write_datetime, 
    B.writer_email, 
    U.profile_image AS writer_profile_image, 
    U.nickname AS writer_nickname
FROM user U INNER JOIN board B
ON U.email = B.writer_email;

-- 9
SELECT title, contents 
FROM board_view
WHERE title OR contents LIKE '%반갑%';

-- 10
CREATE INDEX board_title_idx 
ON board (title);






