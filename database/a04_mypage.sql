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
	p_no NUMBER CONSTRAINT basket_p_no_fk REFERENCES PRODUCT(p_no) 
);
CREATE SEQUENCE basket_no_seq;

-- 생성 : 주문(상품)
CREATE TABLE ORDER_PRODUCT (
	o_no NUMBER CONSTRAINT order_product_pk PRIMARY KEY,
	u_no NUMBER CONSTRAINT order_product_u_no_fk REFERENCES MEMBER(u_no),
	p_no NUMBER CONSTRAINT order_product_p_no_fk REFERENCES PRODUCT(p_no),
	o_date DATE CONSTRAINT order_product_date_nn NOT NULL,
	o_phone NUMBER CONSTRAINT order_product_phone_nn NOT NULL,
	o_addr VARCHAR2(100) CONSTRAINT order_product_addr_nn NOT NULL,
	o_cnt NUMBER CONSTRAINT order_product_cnt_nn NOT NULL,
	o_state VARCHAR2(20) CONSTRAINT order_product_state_nn NOT NULL
);
CREATE SEQUENCE order_pr_no_seq;

-- 생성 : 최근 본 상품
CREATE TABLE VIEW_PRODUCT (
	u_no NUMBER,
	p_no NUMBER,
	v_date DATE,
	CONSTRAINT view_product_u_no_fk FOREIGN KEY(u_no) REFERENCES MEMBER(u_no),
	CONSTRAINT view_product_p_no_fk FOREIGN KEY(p_no) REFERENCES PRODUCT(p_no)
);
CREATE SEQUENCE view_pro_no_seq;


DROP TABLE view_product;
SELECT * FROM view_product;

-- 유저 데이터 입력
INSERT INTO USER_TABLE
VALUES(1,1,'test1','1111','테스트','010-1111-2222','남자',to_date('2000-01-01', 'YYYY-MM-DD'),
	   '서울 신림동','031-231-1111','N',sysdate,'aaa@naver.com');
INSERT INTO USER_TABLE
VALUES(2,2,'test2','2222','김스트','010-7777-7777','남자',to_date('1998-08-08', 'YYYY-MM-DD'),
	   '청주 개신동','043-222-1111','N',sysdate,'bbbb@naver.com');
INSERT INTO USER_TABLE
VALUES(3,3,'test3','3333','이스트','010-6666-6666','여자',to_date('2005-05-05', 'YYYY-MM-DD'),
	   '수원 매탄동','031-777-1234','N',sysdate,'cccc@naver.com');	  
DROP TABLE USER_TABLE;
SELECT * FROM USER_TABLE;

-- 포인트 데이터 입력
INSERT INTO POINT_TABLE VALUES(1,1000);
INSERT INTO POINT_TABLE VALUES(2,2000);
INSERT INTO POINT_TABLE VALUES(3,3000);

-- 포인트내역 데이터 입력
INSERT INTO POINT_LOG_TABLE VALUES(1,200,'적립','새해보너스',to_date('2021/01/01', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(1,-200,'사용','상품 구매',to_date('2021/01/02', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(1,200,'적립','로그인보너스',to_date('2021/01/03', 'YYYY/MM/DD'));

INSERT INTO POINT_LOG_TABLE VALUES(2,200,'적립','새해보너스',to_date('2021/01/01', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(2,-100,'사용','상품 구매',to_date('2021/01/02', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(2,300,'적립','로그인보너스',to_date('2021/01/03', 'YYYY/MM/DD'));

INSERT INTO POINT_LOG_TABLE VALUES(3,200,'적립','새해보너스',to_date('2021/01/01', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(3,-100,'사용','상품 구매',to_date('2021/01/02', 'YYYY/MM/DD'));
INSERT INTO POINT_LOG_TABLE VALUES(3,500,'적립','로그인보너스',to_date('2021/01/03', 'YYYY/MM/DD'));

-- 상품테이블 데이터 입력
INSERT INTO PRODUCT VALUES(1,'사과','에코빈',1000,100,2500,'과일','메인이미지','상세이미지',to_date('2020/11/01', 'YYYY/MM/DD'));
INSERT INTO PRODUCT VALUES(2,'바나나','에코빈',2500,30,2500,'과일','메인이미지','상세이미지',to_date('2020/11/01', 'YYYY/MM/DD'));
INSERT INTO PRODUCT VALUES(3,'샴푸','에코빈',5500,20,2500,'욕실용품','메인이미지','상세이미지',to_date('2020/12/01', 'YYYY/MM/DD'));
INSERT INTO PRODUCT VALUES(4,'체리','에코빈',5000,10,2500,'과일','메인이미지','상세이미지',to_date('2021/01/01', 'YYYY/MM/DD'));
INSERT INTO PRODUCT VALUES(5,'바나나','카카오',3500,30,2500,'과일','메인이미지','상세이미지',to_date('2020/11/01', 'YYYY/MM/DD'));

-- 장바구니 데이터 입력
INSERT INTO basket VALUES(1,1,3);
INSERT INTO basket VALUES(1,2,3);
INSERT INTO basket VALUES(1,3,3);
INSERT INTO basket VALUES(2,1,3);
INSERT INTO basket VALUES(2,2,3);

-- 입력 : 주문 테이블
INSERT INTO ORDER_TABLE VALUES(1,1,1,to_date('2020.06.01','YYYY/MM/DD'),'010-5032-1111','충북 청주시 서원구 111',3,'결재완료');
INSERT INTO ORDER_TABLE VALUES(2,1,2,to_date('2020.06.03','YYYY/MM/DD'),'010-5032-2222','충북 청주시 서원구 222',1,'배송완료');
INSERT INTO ORDER_TABLE VALUES(3,1,3,to_date('2020.07.02','YYYY/MM/DD'),'010-5032-3333','충북 청주시 서원구 222',5,'배송완료');
INSERT INTO ORDER_TABLE VALUES(4,2,3,to_date('2020.07.02','YYYY/MM/DD'),'010-5032-3333','충북 청주시 서원구 222',5,'배송완료');
INSERT INTO ORDER_TABLE VALUES(5,2,3,to_date('2020.07.02','YYYY/MM/DD'),'010-5032-3333','충북 청주시 서원구 222',5,'배송완료');
INSERT INTO ORDER_TABLE VALUES(6,3,4,to_date('2020.07.02','YYYY/MM/DD'),'010-5032-3333','충북 청주시 서원구 222',5,'배송완료');
INSERT INTO ORDER_TABLE VALUES(7,1,4,to_date('2018.07.02','YYYY/MM/DD'),'010-5032-3333','충북 청주시 서원구 222',5,'배송완료');

--입력 : 최근 본 상품
INSERT INTO VIEW_PRODUCT VALUES(1,1,to_date('2021-01-25 12:11:05','YYYY-MM-DD hh:mi:ss'));
INSERT INTO VIEW_PRODUCT VALUES(1,2,to_date('2021-01-25 12:12:05','YYYY-MM-DD hh:mi:ss'));
INSERT INTO VIEW_PRODUCT VALUES(1,3,to_date('2021-01-25 12:13:05','YYYY-MM-DD hh:mi:ss'));
INSERT INTO VIEW_PRODUCT VALUES(2,1,to_date('2021-01-25 12:14:05','YYYY-MM-DD hh:mi:ss'));

-- select
SELECT * FROM USER_TABLE;
SELECT * FROM POINT_TABLE;
SELECT * FROM POINT_LOG_TABLE;
SELECT * FROM PRODUCT;
SELECT * FROM BASKET;
SELECT * FROM ORDER_TABLE;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'USER_TABLE';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'POINT_TABLE';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'POINT_LOG_TABLE';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PRODUCT';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'BASKET';
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'ORDER_TABLE';


-- 이름, 가입일, 포인트 표시
SELECT u_name AS 회원이름,
	   u_date AS 가입일,
	   poi_point AS 포인트
  FROM USER_TABLE u, POINT_TABLE p
 WHERE u.u_no = p.u_no;

-- 마이페이지 장바구니 품목 개수 표시
SELECT count(*) AS "장바구니 개수"
  FROM USER_TABLE u, BASKET b
 WHERE u.u_no = b.u_no
   AND b.u_no = 1;

-- 장바구니 안에 품목 내역
SELECT pr.p_m_image AS 상품이미지,
	   pr.p_company AS 제조사,
	   pr.p_name AS 상품이름,
	   pr.p_cnt AS 재고,
	   pr.p_price AS 상품가격,
	   b.cnt AS 구매수량,
	   pr.p_charge AS 배송료
  FROM USER_TABLE u, PRODUCT pr, BASKET b
 WHERE pr.p_no = b.p_no
   AND u.u_no = b.u_no
   AND u.u_no = 1;

-- 주문내역 확인 전체
SELECT pr.p_name AS 상품이름,
	   o.o_date AS 결제일,
	   o.o_no AS 주문번호,
	   pr.p_price * o.o_cnt AS 결제금액,
	   o.o_state AS 주문상태
  FROM USER_TABLE u, PRODUCT pr, ORDER_TABLE o
 WHERE u.u_no = o.u_no
   AND pr.p_no = o.p_no
   AND u.u_no = 1;
  
-- 주문내역 확인 (1년전)
SELECT pr.p_name AS 상품이름,
	   o.o_date AS 결제일,
	   o.o_no AS 주문번호,
	   pr.p_price * o.o_cnt AS 결제금액,
	   o.o_state AS 주문상태
  FROM USER_TABLE u, PRODUCT pr, ORDER_TABLE o
 WHERE u.u_no = o.u_no
   AND pr.p_no = o.p_no
   AND u.u_no = 1
   AND o.o_date > ADD_MONTHS(sysdate,-12);  
  
-- 최근 본 상품
SELECT pr.p_m_image AS 상품이미지,
	   pr.p_company AS 제조사,
	   pr.p_name AS 상품이름,
	   pr.p_price AS 상품가격,
	   v.v_date AS 쇼핑시간
  FROM USER_TABLE u, PRODUCT pr, VIEW_PRODUCT v
 WHERE u.u_no = v.u_no
   AND v.p_no = pr.p_no
   AND u.u_no = 1
ORDER BY v.v_date DESC;

SELECT * FROM USER_TABLE;
SELECT * FROM POINT_TABLE;
SELECT * FROM POINT_LOG_TABLE;
SELECT * FROM PRODUCT;
SELECT * FROM BASKET;
SELECT * FROM ORDER_TABLE;
SELECT * FROM VIEW_PRODUCT;




-- 포인트 전체 조회
SELECT POI_POINT AS 포인트,
	   POI_CONTENT AS 내용,
	   POI_ACTION AS "획득/사용",
	   POI_DATE AS 날짜
  FROM USER_TABLE U, POINT_TABLE P
 WHERE U.POI_ID = P.POI_ID;

-- 포인트 흭득 조회
SELECT POI_POINT AS 포인트,
	   POI_CONTENT AS 내용,
	   POI_ACTION AS "획득/사용",
	   POI_DATE AS 날짜
  FROM USER_TABLE U, POINT_TABLE P
 WHERE U.POI_ID = P.POI_ID
   AND POI_ACTION = '흭득';
  
-- 포인트 사용 조회
SELECT POI_POINT AS 포인트,
	   POI_CONTENT AS 내용,
	   POI_ACTION AS "획득/사용",
	   POI_DATE AS 날짜
  FROM USER_TABLE U, POINT_TABLE P
 WHERE U.POI_ID = P.POI_ID
   AND POI_ACTION = '사용';

-- VIEW 상품 조회
SELECT P_COMPANY AS 판매기업,
	   P_NAME AS 상품명,
	   P_OPTION AS 상품옵션명,
	   P_PRICE AS 상품가격,
	   P_M_IMAGE AS 상품이미지
  FROM USER_TABLE U, PRODUCT P
 WHERE U.P_NO = P.P_NO;
 
