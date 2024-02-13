-- 1. 로그인 화면
-- 아이디와 비밀번호를 입력하여 로그인/ 카카오, 네이버로 SNS 로그인을 할 수 있음

-- 2. 회원가입 화면
-- 아이디, 비밀번호, 비밀번호확인, 이메일, 인증번호를 입력하여 회원가입
-- 아이디에 대한 중복확인이 필요
-- 이메일 인증을 통해서 인증코드를 지정한 이메일로 전송
-- 전송받은 인증 코드를 입력하여 이메일 인증 처리를 함
-- 카카오 네이버로 SNS 회원가입을 할 수 있음

-- 3. QnA email_authenticationemail_authentication게시판 목록 화면
-- 관리자 계정만 미완료 보기를 할 수 있음
-- 미완료 보기 체크시 답변이 미완료된 게시물을 조회
-- 게시물 목록은 하나의 아이템에 대하여 접수번호, 상태, 제목, 작성자 아이디, 작성일, 조회수를 보여줌
-- (접수번호 기준으로 내림차순 정렬하여 보여줌)
-- 게시물 제목으로 검색을 할 수 있음

-- 4. QnA 게시물 작성 화면
-- 제목, 내용을 작성할 수 있음

-- 5. 게시물 보기 화면
-- 제목, 작성자 아이디, 작성일, 조회수, 내용, 답변 내용을 조회
-- 만약 관리자로 로그인 상태이면 답변 내용으로 답변을 작성할 수 있음.
-- 게시물을 삭제 할 수 있음

-- 6. 게시물 수정 화면
-- 제목과 내용을 수정할 수 있음.

-- Entity, Attribute --
-- User(회원) - id, password, email, join_path, role, authentication_code
-- QnA (qna게시물) - reception_number, title, write_datetime, contents, view_count, writer_id, reply, reply_status

-- Relationship --
-- User - QnA: 일반 회원이 게시물을 작성한다.
-- User - QnA: 관리자 회원이 답변을 작성한다.


-- Table
-- User
-- 	user_id VARCHAR(20) PRIMARY KEY,
-- 	password VARCHAR(13) NOT NULL,
-- 	email VARCHAR(50) UNIQUE NOT NULL,
-- 	join_path VARCHAR(5) NOT NULL DEFAULT'HOME'CHECK( join_path IN('HOME', 'KAKAO', 'NAVER')),
-- 	role VARCHAR(5) NOT NULL DEFAULT'NOMAL' CHECK( role IN('ADMIN', 'NOMAL'))

-- Email_Authentication
-- 	email VARCHAR(50) UNIQUE NOT NULL,
-- 	authentication_code VARCHAR(4) NOT NULL
    
-- 접수번호, 상태, 제목, 작성자 아이디, 작성일, 조회수
-- 제목, 작성자 아이디, 작성일, 조회수, 내용, 답변 내용을 조회

-- QnA
-- 	reception_number INT PRIMARY KEY AUTO_INCREMENT, 
--     title TEXT NOT NULL, 
--     contents TEXT NOT NULL,
--     write_datetime DATETIME NOT NULL DEFAULT now(), 
--     view_count INT NOT NULL DEFAULT 0, 
--     writer_id VARCHAR(20) NOT NULL, 
--     reply TEXT,
--     replyer VARCHAR(20), 
--     reply_status BOOLEAN NOT NULL DEFAULT false

-- Relationship --
-- User - QnA : 회원은 여러 개의 게시물을 작성할 수 있고 게시물은 반드시 한 명의 회원에의해 작성되어짐
-- User - QnA : 관리자 회원은 여러 개의 게시물에 답변을 작성할 수 있고 게시물은 한 명의 관리자에의해 작성되어짐

-- FK writer User (id) - QnA (writer_id)
-- FK replyer User (id) - QnA (replyer)
-- FK email_auth Email_Authentication (email) - User (email)














