CREATE TABLE FUNDING (
	f_no NUMBER CONSTRAINT funding_f_no_pk primary KEY,
	f_name VARCHAR2(100) NOT NULL,
	f_company VARCHAR2(60) NOT NULL,
	f_goal NUMBER NOT NULL,
	f_category VARCHAR2(15) NOT NULL,
	f_m_image VARCHAR2(30) NOT NULL,
	f_s_image VARCHAR2(30) NOT NULL,
	f_content VARCHAR2(30) NOT NULL,
	f_payment_date DATE NOT NULL,
	f_date DATE NOT NULL,
	f_enddate DATE NOT NULL,
	f_charge NUMBER NOT NULL
);
CREATE SEQUENCE f_no_sequence;

INSERT INTO funding VALUES (f_no_sequence.nextval, '에코텀블러', '에코빈', 2000000, '생활용품', 'ecotumbler_m',
	'ecotumbler_s', 'ecotumber_content', '2021-02-20', sysdate, '2021-02-15', 0);
SELECT * FROM funding;

CREATE TABLE REWARD (
	rew_no NUMBER CONSTRAINT reward_rew_no_pk primary KEY,
	rew_cnt NUMBER NOT NULL,
	rew_price NUMBER NOT NULL,
	rew_title VARCHAR2(100) NOT NULL,
	f_no NUMBER NOT NULL constraint reward_f_no_fk references funding(f_no)
);
CREATE SEQUENCE rew_no_sequence;
INSERT INTO reward values(rew_no_sequence.nextval, 50, 10000, '에코텀블러-green', 1);


CREATE TABLE ORDER_FUNDING (
	pa_no NUMBER CONSTRAINT order_funding_pa_no_pk PRIMARY KEY,
	u_no2 NUMBER CONSTRAINT order_funding_u_no2_fk references users(u_no),
	rew_no NUMBER CONSTRAINT order_funding_rew_no_fk REFERENCES reward(rew_no),
	pa_date DATE NOT NULL,
	pa_price NUMBER NOT NULL,
	pa_cnt NUMBER NOT NULL 
);
CREATE SEQUENCE pa_no_sequence;
INSERT INTO order_funding values(pa_no_sequence.nextval, 1, 1, sysdate, 10000, 1);