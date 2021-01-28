-- 생성 : 회원
CREATE TABLE MEMBER (
	u_no NUMBER CONSTRAINT member_pk PRIMARY KEY,
	u_id VARCHAR2(30) CONSTRAINT member_id_nn NOT NULL,
	u_pw VARCHAR2(30) CONSTRAINT member_pw_nn NOT NULL,
	u_name VARCHAR2(30) CONSTRAINT member_name_nn NOT NULL,
	u_phone VARCHAR2(20) CONSTRAINT member_phone_nn NOT NULL,
	u_gender VARCHAR2(10) CONSTRAINT member_gender_nn NOT NULL,
	u_date DATE CONSTRAINT member_date_nn NOT NULL,
	u_addr VARCHAR2(100) CONSTRAINT member_addr_nn NOT NULL,
	u_tel VARCHAR2(20),
	u_mode CHAR(1) CONSTRAINT member_mode_nn NOT NULL,
	u_joindate DATE CONSTRAINT member_joindate_nn NOT NULL,
	u_email VARCHAR2(50) CONSTRAINT member_email_nn NOT NULL,
	u_point NUMBER CONSTRAINT member_point_nn NOT NULL
);
CREATE SEQUENCE member_no_seq;

-- 생성 : 상품
CREATE TABLE PRODUCT (
	p_no NUMBER CONSTRAINT product_pk PRIMARY KEY,
	p_company VARCHAR2(30) CONSTRAINT product_company_nn NOT NULL,
	p_name VARCHAR2(30) CONSTRAINT product_name_nn NOT NULL,
	p_price NUMBER CONSTRAINT product_price_nn NOT NULL,
	p_cnt NUMBER CONSTRAINT product_cnt_nn NOT NULL,
	p_charge NUMBER CONSTRAINT product_charge_nn NOT NULL,
	p_category VARCHAR2(20) CONSTRAINT product_category_nn NOT NULL,
	p_m_img_path VARCHAR2(100) CONSTRAINT product_m_image_path_nn NOT NULL,
	p_s_img_path VARCHAR2(100) CONSTRAINT product_s_image_path_nn NOT NULL,
	p_date DATE CONSTRAINT product_date_nn NOT NULL
);
CREATE SEQUENCE product_no_seq;

-- 생성 : 장바구니 테이블
CREATE TABLE BASKET (
	b_no NUMBER CONSTRAINT basket_pk PRIMARY KEY,
	u_no NUMBER CONSTRAINT basket_u_no_fk REFERENCES MEMBER(u_no),
	p_no NUMBER CONSTRAINT basket_p_no_fk REFERENCES PRODUCT(p_no),
	b_cnt NUMBER CONSTRAINT basket_cnt_nn NOT NULL,
	CONSTRAINT basket_uk UNIQUE(u_no, p_no)
);
CREATE SEQUENCE basket_no_seq;
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 1, 3);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 2, 2);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 1, 3, 4);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 2, 5, 3);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 2, 1, 2);
INSERT INTO BASKET VALUES(basket_no_seq.nextval, 3, 1, 2);

CREATE SEQUENCE basket_no_seq;
DROP TABLE BASKET;
DROP SEQUENCE basket_no_seq;

-- 장바구니 상세내역
SELECT p_name AS 상품이미지,
	   p_company AS 제조사,
	   p_name AS 상품명,
	   p_cnt AS 재고,
	   p_price AS 상품가격,
	   p_charge AS 배송료,
	   b_cnt AS 장바구니갯수
  FROM MEMBER u, PRODUCT pr, BASKET b
 WHERE u.u_no = b.u_no
   AND b.p_no = pr.p_no
   AND u.u_no = 1;
  
-- 생성 : 포인트내역
CREATE TABLE POINT_LOG (
	poi_no NUMBER CONSTRAINT point_log_pk PRIMARY KEY,
	u_no NUMBER CONSTRAINT point_u_no_fk REFERENCES MEMBER(u_no),
	poi_value NUMBER CONSTRAINT point_value_nn NOT NULL,
	poi_action VARCHAR2(10) CONSTRAINT point_action_nn NOT NULL,
	poi_content VARCHAR2(50) CONSTRAINT point_content_nn NOT NULL,
	poi_date DATE CONSTRAINT point_date NOT NULL
);
CREATE SEQUENCE point_log_no_seq;

-- 포인트 전체 내역
SELECT u_name AS 회원이름,
	   u_point AS 포인트,
	   poi_value AS 값,
	   poi_date AS 날짜,
	   poi_action AS "적립/사용",
	   poi_content AS "포인트내역"
  FROM MEMBER u, POINT_LOG pl
 WHERE u.u_no = pl.u_no
   AND u.u_no = 1;

-- 포인트 적립 내역
SELECT u_name AS 회원이름,
	   u_point AS 포인트,
	   poi_value AS 값,
	   poi_date AS 날짜,
	   poi_action AS "적립/사용",
	   poi_content AS "포인트내역"
  FROM MEMBER u, POINT_LOG pl
 WHERE u.u_no = pl.u_no
   AND u.u_no = 1
   AND poi_action = '적립';
  
-- 포인트 사용 내역
SELECT u_name AS 회원이름,
	   u_point AS 포인트,
	   poi_value AS 값,
	   poi_date AS 날짜,
	   poi_action AS "적립/사용",
	   poi_content AS "포인트내역"
  FROM MEMBER u, POINT_LOG pl
 WHERE u.u_no = pl.u_no
   AND u.u_no = 1
   AND poi_action = '사용';
 
SELECT * FROM POINT_LOG;

-- 1번 회원정보조회
SELECT u_id AS 아이디,
	   u_pw AS 비밀번호,
	   u_name AS 왕성택,
	   u_addr AS 주소,
	   u_phone AS 휴대전화,
	   u_email AS 이메일
  FROM MEMBER
 WHERE u_no = 1;

UPDATE MEMBER
   SET u_email = 'ssss@naver.com'
 WHERE u_no = 1;

-- 회원번호 1의 이름, 가입일, 포인트
SELECT u_name AS 회원이름,
	   u_joindate AS 가입일,
	   u_point AS 포인트
  FROM MEMBER
 WHERE u_no = 1;

-- 장바구니 갯수
SELECT COUNT(*)
  FROM MEMBER u, PRODUCT pr, BASKET b
 WHERE u.u_no = b.u_no
   AND pr.p_no = b.p_no
   AND u.u_no = 1;

  
SELECT * FROM PRODUCT;
SELECT * FROM MEMBER;
SELECT * FROM BASKET;

-- 생성 : 펀딩
CREATE TABLE FUNDING (
	f_no NUMBER CONSTRAINT funding_f_no_pk primary KEY,
	f_name VARCHAR2(100) CONSTRAINT funding_name_nn NOT NULL,
	f_company VARCHAR2(60) CONSTRAINT funding_company_nn NOT NULL,
	f_goal NUMBER CONSTRAINT funding_goal_nn NOT NULL,
	f_category VARCHAR2(15) CONSTRAINT funding_category_nn NOT NULL,
	f_m_img_path VARCHAR2(100) CONSTRAINT funding_m_img_nn NOT NULL,
	f_s_img_path VARCHAR2(100) CONSTRAINT funding_s_img_nn NOT NULL,
	f_content VARCHAR2(200) CONSTRAINT funding_content_nn NOT NULL,
	f_payment_date DATE CONSTRAINT funding_payment_date_nn NOT NULL,
	f_date DATE CONSTRAINT funding_date NOT NULL,
	f_enddate DATE CONSTRAINT funding_enddate NOT NULL,
	f_charge NUMBER CONSTRAINT funding_charge NOT NULL
);
CREATE SEQUENCE funding_no_seq;

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
   
SELECT * FROM funding;

-- 생성 : 리워드
CREATE TABLE REWARD (
	rew_no NUMBER CONSTRAINT reward_pk PRIMARY KEY,
	rew_cnt NUMBER CONSTRAINT reward_cnt_nn NOT NULL,
	rew_price NUMBER CONSTRAINT reward_price_nn NOT NULL,
	rew_title VARCHAR2(100) CONSTRAINT reward_title_nn NOT NULL,
	f_no NUMBER CONSTRAINT reward_f_no_nn NOT NULL,
	CONSTRAINT reward_no_fk FOREIGN KEY(f_no) REFERENCES FUNDING(f_no)
);
CREATE SEQUENCE reward_no_seq;
-- 생성 : 주문(펀딩)
CREATE TABLE ORDER_FUNDING (
	pa_no NUMBER CONSTRAINT order_funding_pa_no_pk PRIMARY KEY,
	u_no NUMBER CONSTRAINT order_funding_u_no_fk REFERENCES MEMBER(u_no),
	rew_no NUMBER CONSTRAINT order_funding_rew_no_fk REFERENCES REWARD(rew_no),
	pa_date DATE CONSTRAINT order_funding_date_nn NOT NULL,
	pa_price NUMBER CONSTRAINT order_funding_price_nn NOT NULL,
	pa_cnt NUMBER CONSTRAINT order_funding_cnt_nn NOT NULL 
);
CREATE SEQUENCE order_funding_no_seq;
-- 생성 : 결제(펀딩)
CREATE TABLE PAYMENT_FUNDING (
	pay_f_no NUMBER CONSTRAINT payment_funding_pk PRIMARY KEY,
	pa_no NUMBER CONSTRAINT payment_funding_pa_no_fk REFERENCES ORDER_FUNDING(pa_no),
	rew_no NUMBER CONSTRAINT payment_funding_rew_no_fk  REFERENCES REWARD(rew_no),
	pay_f_state VARCHAR2(20) CONSTRAINT payment_funding_state_nn NOT NULL,
	pay_f_way VARCHAR2(20) CONSTRAINT payment_funding_way_nn NOT NULL,
	pay_f_home VARCHAR2(100) CONSTRAINT payment_funding_home_nn NOT NULL,
	pay_f_msg VARCHAR2(100) CONSTRAINT payment_funding_msg_nn NOT NULL
);
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
 
SELECT * FROM ORDER_FUNDING;
SELECT * FROM REWARD;
SELECT * FROM FUNDING;
SELECT * FROM PAYMENT_FUNDING;
INSERT INTO PAYMENT_FUNDING VALUES(1, 1, 1, '예약완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(2, 2, 2, '예약완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(3, 3, 3, '결재완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(4, 1, 4, '결재실패', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(5, 2, 3, '결재완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(6, 1, 3, '예약완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(7, 1, 4, '결재완료', '카드계산', '청주', '빠른배송 부탁드립니다.');
INSERT INTO PAYMENT_FUNDING VALUES(8, 1, 2, '결재실패', '카드계산', '청주', '빠른배송 부탁드립니다.');
DROP TABLE PAYMENT_FUNDING;

-- 펀딩 수, 총 금액
SELECT COUNT(*) AS 펀딩수,
	   SUM(o.pa_price) AS 총금액
  FROM MEMBER u, ORDER_FUNDING o, PAYMENT_FUNDING pf
 WHERE u.u_no = o.u_no
   AND o.pa_no = pf.pa_no
   AND u.u_no = 1;
  
-- 예약완료 카운터
SELECT COUNT(*) AS 예약완료
  FROM MEMBER u, ORDER_FUNDING o, PAYMENT_FUNDING pf
 WHERE u.u_no = o.u_no
   AND o.pa_no = pf.pa_no
   AND u.u_no = 1
   AND pf.PAY_F_STATE = '예약완료';
-- 결재완료 카운터
SELECT COUNT(*) AS 결제완료
  FROM MEMBER u, ORDER_FUNDING o, PAYMENT_FUNDING pf
 WHERE u.u_no = o.u_no
   AND o.pa_no = pf.pa_no
   AND u.u_no = 1
   AND pf.PAY_F_STATE = '결제완료';
-- 결재실패 카운터
SELECT COUNT(*) AS 결제완료
  FROM MEMBER u, ORDER_FUNDING o, PAYMENT_FUNDING pf
 WHERE u.u_no = o.u_no
   AND o.pa_no = pf.pa_no
   AND u.u_no = 1
   AND pf.PAY_F_STATE = '결재실패';
  
  
  