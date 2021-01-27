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


-- 생성 : 결제(상품)
CREATE TABLE PAYMENT_PRODUCT (
	pay_p_no NUMBER CONSTRAINT pay_pr_pk PRIMARY KEY,
	o_no NUMBER CONSTRAINT pay_pr_no_fk REFERENCES ORDER_PRODUCT(o_no),
	pay_p_state VARCHAR2(20) CONSTRAINT pay_pr_state_nn NOT NULL,
	pay_p_way VARCHAR2(20) CONSTRAINT pay_pr_way_nn NOT NULL,
	pay_p_date DATE CONSTRAINT pay_pr_date_nn NOT NULL,
	pay_p_home VARCHAR2(100) CONSTRAINT pay_pr_home_nn NOT NULL,
	pay_p_msg VARCHAR2(200) CONSTRAINT pay_pr_msg_nn NOT NULL
);
CREATE SEQUENCE payment_pr_no_seq;


-- 생성 : 리뷰
CREATE TABLE REVIEW (
	rev_no NUMBER CONSTRAINT review_pk PRIMARY KEY,
	pay_no NUMBER CONSTRAINT review_pay_no REFERENCES PAYMENT_PRODUCT(pay_p_no),
	rev_name VARCHAR2(20) CONSTRAINT review_name_nn NOT NULL,
	rev_title VARCHAR2(50) CONSTRAINT review_title_nn NOT NULL,
	rev_content VARCHAR2(200) CONSTRAINT review_content_nn NOT NULL,
	rev_date DATE CONSTRAINT review_date_nn NOT NULL,
	rev_img_path VARCHAR2(100),
	rev_grade VARCHAR2(20) CONSTRAINT review_grade_nn NOT NULL
);
CREATE SEQUENCE rev_no_seq;

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
CREATE SEQUENCE payment_funding_no_seq;

-- 생성 : Q&A
CREATE TABLE QNA (
	q_no NUMBER CONSTRAINT qna_pk PRIMARY KEY,
	u_no NUMBER CONSTRAINT qna_u_no_fk REFERENCES MEMBER(u_no),
	q_title VARCHAR2(50) CONSTRAINT qna_title_nn NOT NULL,
	q_category VARCHAR2(20) CONSTRAINT qna_category_nn NOT NULL,
	q_content VARCHAR2(200) CONSTRAINT qna_content_nn NOT NULL,
	q_date DATE CONSTRAINT qua_date_nn NOT NULL
);
CREATE SEQUENCE qna_no_seq;

-- 생성 : Q&A 답변
CREATE TABLE QNA_ANSWER (
	qa_no NUMBER CONSTRAINT qna_answer_pk PRIMARY KEY,
	q_no NUMBER CONSTRAINT qna_answer_q_no_fk REFERENCES QNA(q_no),
	qa_title VARCHAR2(50) CONSTRAINT qna_answer_tilte_nn NOT NULL,
	qa_content VARCHAR2(200) CONSTRAINT qna_answer_content_nn NOT NULL,
	qa_date DATE CONSTRAINT qna_answer_date_nn NOT NULL
);
CREATE SEQUENCE qna_answer_no_seq;

-- 생성 : 기업
CREATE TABLE COMPANY (
	c_no NUMBER CONSTRAINT company_pk PRIMARY KEY,
	c_name VARCHAR2(30) CONSTRAINT company_name_nn NOT NULL,
	c_homepage VARCHAR2(100) CONSTRAINT company_homepage_nn NOT NULL,
	c_instargram VARCHAR2(100) CONSTRAINT company_instargram_nn NOT NULL,
	c_facebook VARCHAR2(100) CONSTRAINT company_fecebook_nn NOT NULL,
	c_img_path VARCHAR2(100) CONSTRAINT company_img_path_nn NOT NULL,
	c_content VARCHAR2(200) CONSTRAINT company_content_nn NOT NULL
);
CREATE SEQUENCE company_no_seq;

-- 생성 : 공지사항
CREATE TABLE NOTICE (
	ntc_no NUMBER CONSTRAINT notice_pk PRIMARY KEY,
	ntc_title VARCHAR(100) CONSTRAINT notice_title_nn NOT NULL,
	ntc_date DATE CONSTRAINT notice_date_nn NOT NULL,
	ntc_content VARCHAR(200) CONSTRAINT notice_content_nn NOT NULL
);
CREATE SEQUENCE notice_no_seq;

-- 생성 : 자주묻는질문
CREATE TABLE QUESTION (
	que_no NUMBER CONSTRAINT question_pk PRIMARY KEY,
	que_title VARCHAR(100) CONSTRAINT question_title_nn NOT NULL,
	que_date DATE CONSTRAINT question_date_nn NOT NULL,
	que_content VARCHAR(200) CONSTRAINT question_content_nn NOT NULL
);
CREATE SEQUENCE question_no_seq;

-- 생성 : 최근 본 상품
CREATE TABLE VIEW_PRODUCT (
	u_no NUMBER,
	p_no NUMBER,
	v_date DATE,
	CONSTRAINT view_product_u_no_fk FOREIGN KEY(u_no) REFERENCES MEMBER(u_no),
	CONSTRAINT view_product_p_no_fk FOREIGN KEY(p_no) REFERENCES PRODUCT(p_no)
);
CREATE SEQUENCE view_pro_no_seq;

--
DROP TABLE MEMBER;
DROP TABLE POINT_LOG;
DROP TABLE PRODUCT;
DROP TABLE BASKET;
DROP TABLE ORDER_PRODUCT;
DROP TABLE PAYMENT_PRODUCT;
DROP TABLE REVIEW;
DROP TABLE FUNDING;
DROP TABLE REWARD;
DROP TABLE ORDER_FUNDING;
DROP TABLE PAYMENT_FUNDING;
DROP TABLE QNA;
DROP TABLE QNA_ANSWER;
DROP TABLE NOTICE;
DROP TABLE QUESTION;
DROP TABLE VIEW_PRODUCT;
