-- 회원테이블
CREATE TABLE USER_TABLE (
	u_no NUMBER CONSTRAINT n_no_pk PRIMARY KEY,
	poi_id NUMBER,
	u_id VARCHAR2(30) CONSTRAINT u_id_nn NOT NULL,
	u_pw VARCHAR2(30) CONSTRAINT u_pw_nn NOT NULL,
	u_name VARCHAR2(30) CONSTRAINT u_id_name NOT NULL,
	u_phone VARCHAR2(30) CONSTRAINT u_pw_name NOT NULL,
	u_sex VARCHAR2(10),
	u_date DATE,
	u_addr VARCHAR2(50),
	u_tel VARCHAR2(30),
	u_mode CHAR(1),
	u_joindate DATE,
	u_email VARCHAR2(50)
);
-- 데이터 입력
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
 
