-- 데이터 입력 : 회원
INSERT INTO MEMBER VALUES(member_no_seq.nextval, 'aaaaa', '7777', '김모모', '010-1111-1111', '여자', to_date('1990-01-01','YYYY-MM-DD'),
						  '서울 역삼동', NULL, 'Y', to_date('2021-01-01','YYYY-MM-DD'), 'aaaa@naver.com', 1000);
INSERT INTO MEMBER VALUES(member_no_seq.nextval, 'bbbbb', '2222', '이모모', '010-2222-2222', '여자', to_date('1995-11-15','YYYY-MM-DD'),
						  '청주 개신동', NULL, 'Y', to_date('2021-01-01','YYYY-MM-DD'), 'bbbb@naver.com', 2000);
INSERT INTO MEMBER VALUES(member_no_seq.nextval, 'ccccc', '5555', '신모모', '010-3333-3333', '여자', to_date('2000-06-03','YYYY-MM-DD'),
						  '수원 망포동', NULL, 'Y', to_date('2021-01-01','YYYY-MM-DD'), 'cccc@naver.com', 1500);
INSERT INTO MEMBER VALUES(member_no_seq.nextval, 'ddddd', '4444', '강모모', '010-4444-4444', '남자', to_date('1994-12-08','YYYY-MM-DD'),
						  '서울 신림동', NULL, 'Y', to_date('2021-01-01','YYYY-MM-DD'), 'dddd@naver.com', 3000);
INSERT INTO MEMBER VALUES(member_no_seq.nextval, 'eeeee', '8888', '홍모모', '010-5555-5555', '남자', to_date('1989-04-20','YYYY-MM-DD'),
						  '수원 매탄동', NULL, 'Y', to_date('2021-01-01','YYYY-MM-DD'), 'eeee@naver.com', 5000);
SELECT * FROM MEMBER;

-- 데이터 입력 : 포인트내역
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 1, 100, '적립', '로그인 적립', to_date('2021-01-02 11:20:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 1, 400, '적립', '상품 구매', to_date('2021-02-01 11:20:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 1, -100, '사용', '상품 구매', to_date('2020-12-22 03:20:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 2, 100, '적립', '로그인 적립', to_date('2020-12-23 13:20:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 2, 100, '적립', '로그인 적립', to_date('2020-11-24 03:20:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 2, 100, '적립', '로그인 적립', to_date('2021-01-14 17:20:29','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 3, 300, '적립', '로그인 적립', to_date('2020-01-14 01:22:22','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 3, 200, '적립', '로그인 적립', to_date('2021-01-14 12:03:50','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO POINT_LOG VALUES(point_log_no_seq.nextval, 3, -100, '사용', '상품 구매', to_date('2020-11-15 19:12:59','YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM POINT_LOG;

-- 데이터 입력 : 기업
INSERT INTO COMPANY VALUES(company_no_seq.nextval, '에코빈', 'http://www.ecobin.com',
						   'https://www.instagram.com/', 'https://www.facebook.com/',
						   '/Users/taek/Documents/project/ecobin/database/company',
						   '친환경 제품을 판매하는 ......');
INSERT INTO COMPANY VALUES(company_no_seq.nextval, '그린빈', 'http://www.ecobin.com',
						   'https://www.instagram.com/', 'https://www.facebook.com/',
						   '/Users/taek/Documents/project/ecobin/database/company',
						   '친환경 제품을 판매하는 ......');
INSERT INTO COMPANY VALUES(company_no_seq.nextval, '초록빈', 'http://www.ecobin.com',
						   'https://www.instagram.com/', 'https://www.facebook.com/',
						   '/Users/taek/Documents/project/ecobin/database/company',
						   '친환경 제품을 판매하는 ......');
INSERT INTO COMPANY VALUES(company_no_seq.nextval, '해피빈', 'http://www.ecobin.com',
						   'https://www.instagram.com/', 'https://www.facebook.com/',
						   '/Users/taek/Documents/project/ecobin/database/company',
						   '친환경 제품을 판매하는 ......');
SELECT * FROM COMPANY;
					
-- 데이터 입력 : 공지사항
INSERT INTO NOTICE VALUES(notice_no_seq.nextval, '#공지사항1#', to_date('2021-01-20 06:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용1.......');
INSERT INTO NOTICE VALUES(notice_no_seq.nextval, '#공지사항2#', to_date('2021-01-20 07:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용2.......');
INSERT INTO NOTICE VALUES(notice_no_seq.nextval, '#공지사항3#', to_date('2021-01-20 08:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용3.......');
INSERT INTO NOTICE VALUES(notice_no_seq.nextval, '#공지사항4#', to_date('2021-01-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용4.......');
INSERT INTO NOTICE VALUES(notice_no_seq.nextval, '#공지사항5#', to_date('2021-01-20 10:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용5.......');

SELECT * FROM NOTICE;

-- 데이터 입력 : 자주묻는질문
INSERT INTO QUESTION VALUES(question_no_seq.nextval, '#자주묻는질문1#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용1....');
INSERT INTO QUESTION VALUES(question_no_seq.nextval, '#자주묻는질문2#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용2....');
INSERT INTO QUESTION VALUES(question_no_seq.nextval, '#자주묻는질문3#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용3....');
INSERT INTO QUESTION VALUES(question_no_seq.nextval, '#자주묻는질문4#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용4....');
INSERT INTO QUESTION VALUES(question_no_seq.nextval, '#자주묻는질문5#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용5....');

SELECT * FROM QUESTION;

-- 데이터 입력 : Q&A
INSERT INTO QNA VALUES(qna_no_seq.nextval, 1, '배송관련질문1', '배송', '내용1...', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA VALUES(qna_no_seq.nextval, 1, '배송관련질문2', '배송', '내용2...', to_date('2021-01-22 11:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA VALUES(qna_no_seq.nextval, 2, '배송관련질문3', '배송', '내용3...', to_date('2021-01-23 02:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA VALUES(qna_no_seq.nextval, 3, '상품관련질문1', '상품', '내용4...', to_date('2021-01-24 22:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA VALUES(qna_no_seq.nextval, 5, '상품관련질문2', '상품', '내용5...', to_date('2021-01-25 10:00:00','YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM QNA;

-- 데이터 입력 : Q&A 답변
INSERT INTO QNA_ANSWER VALUES(qna_answer_no_seq.nextval, 1, '답변1', '답변...', to_date('2021-01-26 10:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA_ANSWER VALUES(qna_answer_no_seq.nextval, 2, '답변2', '답변...', to_date('2021-01-26 10:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA_ANSWER VALUES(qna_answer_no_seq.nextval, 3, '답변3', '답변...', to_date('2021-01-26 10:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA_ANSWER VALUES(qna_answer_no_seq.nextval, 4, '답변4', '답변...', to_date('2021-01-26 10:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO QNA_ANSWER VALUES(qna_answer_no_seq.nextval, 5, '답변5', '답변...', to_date('2021-01-26 10:00:00','YYYY-MM-DD HH24:MI:SS'));

SELECT * FROM QNA_ANSWER;