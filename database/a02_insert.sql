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

-- 데이터 입력 : 상품
INSERT INTO PRODUCT values(product_no_seq.nextval, 'BRING CLEAN', '할로윈 컵슬리브',
   11500, 50, 2500, '패션/잡화', 'img/bc_cs_main.png', 'img/bc_cs_detail.png','2020-12-12');
INSERT INTO product values(product_no_seq.nextval, '마이 아일랜드', '순면 패브릭 3종 세트',
   13000, 300, 3500, '생활용품', 'img/mi_fabric3_main.png', 'img/mi_fabric3_detail.png', sysdate);
INSERT INTO product values(product_no_seq.nextval, '조정치고구마', '고구마 말랭이 60g',
   3000, 100, 3000, '식품', 'img/jg_spmal_main.png', 'img/jg_spmal_detail.png', '2021-01-10');
INSERT INTO product values(product_no_seq.nextval, '(주)투포투', '플라스틱 리버시블 백',
   39000, 50, 0, '패션/잡화', 'img/tpt_prb_main.png', 'img/tpt_prb_detail.png', '2020-11-29');
INSERT INTO product values(product_no_seq.nextval, '에코빈', '다회용 화장솜', 
   11000, 200, 3500, '생활용품', 'imp/ecob_dh_main.png', 'img/ecob_dh_detail.png', sysdate);

SELECT * FROM PRODUCT;
  
-- 데이터 입력 : 펀딩
INSERT INTO funding values(funding_no_seq.nextval, '어르신에 의한, 어르신을 위한 향초', '링크앤라이프', 1000000, '생활용품',
   'img/linknlife_candle_main.png', 'img/linknlife_candle_detail.png',
   '예비사회적기업 비유니크에서 운영하는 브랜드 [링크앤라이프 릴리]',
   '2021-02-25', '2021-01-20', '2021-02-24', 0);
INSERT INTO funding values(funding_no_seq.nextval, '환경을 지키는 ‘돌고돌아 블루베리 잼’', '차카다', 2000000, '식품',
   'img/chakada_jam_main.png', 'img/chakada_jam_detail.png',
   '환경을 지키며 기꺼이 불편을 감수하는 사람들',
   '2021-03-24', '2021-01-24', '2021-03-20', 3000);
INSERT INTO funding values(funding_no_seq.nextval, '루게릭병 환우를 응원하는 패션 아이템', '승일희망재단', 1000000, '패션/잡화',
   'img/sihope_fashionitem_main.png', 'img/sihope_fashionitem_detail.png',
   '일상적인 패션 아이템으로 전하는 희망',
   '2021-02-05', '2020-12-16', '2021-02-03', 0);
INSERT INTO funding values(funding_no_seq.nextval, '버려진 것들에서 새롭게 탄생한 다이어리', '그레이프랩', 2000000, '생활용품',
   'img/grapelabb_diary_main.png', 'img/grapelabb_diary_detail.png',
   '버려진 것들에서 발견한 새로운 가치', 
   '2021-01-29', '2020-12-20', '2021-01-27', 0);
INSERT INTO FUNDING values(funding_no_seq.nextval, '고체치약과 대나무 칫솔로 친환경 실천!', '피스온테이블', 2000000, '생활용품',
   'img/peaceontable_bbtb_main.png', 'img/peaceontable_bbtb_detail.png',
   '이미 599명이 실천한 간편한 제로라이프',
   '2021-02-22', '2021-01-20', '2021-02-25', 3000);

-- 데이터 입력 : 리워드
INSERT INTO reward values(reward_no_seq.nextval, 200, 15000, '시그니처 캔들 1종', 1);
INSERT INTO reward VALUES(reward_no_seq.nextval, 200, 30000, '시그니처 캔들 2종', 1);
INSERT INTO reward VALUES(reward_no_seq.nextval, 100, 43000, '시그니처 캔들 3종 SET', 1);
INSERT INTO reward VALUES(reward_no_seq.nextval, 70, 24000, '블루베리잼 2병', 2);
INSERT INTO reward VALUES(reward_no_seq.nextval, 50, 47000, '블루베리잼 4병', 2);
INSERT INTO reward VALUES(reward_no_seq.nextval, 50, 86000, '블루베리잼 8병', 2);
INSERT INTO reward VALUES(reward_no_seq.nextval, 100, 13000, '양말 1세트', 3);
INSERT INTO reward VALUES(reward_no_seq.nextval, 80, 22000, '양말 1세트+더블호프 팔찌 1개', 3);
INSERT INTO reward VALUES(reward_no_seq.nextval, 45, 55000, '양말 1세트+기모맨투맨', 3);
INSERT INTO reward VALUES(reward_no_seq.nextval, 150, 26000, '인쇄소 골판지 업사이클링 커버+기본 내지 6종', 4);
INSERT INTO reward VALUES(reward_no_seq.nextval, 75, 39000, '플라스틱 병뚜껑 업사이클링 커버+기본 내지 6종', 4);
INSERT INTO reward VALUES(reward_no_seq.nextval, 300, 2800, '대나무칫솔 1개', 5);
INSERT INTO reward VALUES(reward_no_seq.nextval, 300, 9900, '고체치약 150정', 5);

-- 데이터 입력 : 주문(펀딩)
INSERT INTO order_funding values(order_funding_no_seq.nextval, 1, 13, sysdate, 
   (SELECT rew_price*2+f_charge FROM reward a, funding b WHERE a.f_no=b.f_no AND rew_no=13), 2);
UPDATE reward 
   SET rew_cnt=rew_cnt-(SELECT pa_cnt FROM order_funding WHERE rew_no=13)
   WHERE rew_no=13;
INSERT INTO order_funding values(order_funding_no_seq.nextval, 2, 12, '2021-01-20',
   (SELECT rew_price*1+f_charge FROM reward a, funding b WHERE a.f_no=b.f_no AND rew_no=12), 1);
UPDATE reward 
   SET rew_cnt=rew_cnt-(SELECT pa_cnt FROM order_funding WHERE rew_no=12)
   WHERE rew_no=12;
INSERT INTO order_funding values(order_funding_no_seq.nextval, 3, 1, '2021-01-22',
   (SELECT rew_price*5+f_charge FROM reward a, funding b WHERE a.f_no=b.f_no AND rew_no=1), 5);
UPDATE reward 
   SET rew_cnt=rew_cnt-(SELECT pa_cnt FROM order_funding WHERE rew_no=1)
   WHERE rew_no=1;
INSERT INTO order_funding values(order_funding_no_seq.nextval, 2, 4, sysdate,
   (SELECT rew_price*1+f_charge FROM reward a, funding b WHERE a.f_no=b.f_no AND rew_no=4), 1);
UPDATE reward 
   SET rew_cnt=rew_cnt-(SELECT pa_cnt FROM order_funding WHERE rew_no=4)
   WHERE rew_no=4;
INSERT INTO order_funding values(order_funding_no_seq.nextval, 5, 8, '2021-01-04',
   (SELECT rew_price*2+f_charge FROM reward a, funding b WHERE a.f_no=b.f_no AND rew_no=8), 2);
UPDATE reward 
   SET rew_cnt=rew_cnt-(SELECT pa_cnt FROM order_funding WHERE rew_no=8)
   WHERE rew_no=8;
  
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

-- 데이터 입력 : 장바구니
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 1);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 2);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 3);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 1);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 2, 4);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 2, 1);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 1);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 2, 2);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 3, 1);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 1);

SELECT * FROM BASKET;

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