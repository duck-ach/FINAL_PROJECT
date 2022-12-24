
DROP TABLE HEART;
DROP TABLE QNA;
DROP TABLE RETIRE_USERS;
DROP TABLE ACCESS_LOG;
DROP TABLE SLEEP_USERS;
DROP TABLE USERS;

CREATE TABLE USERS (
    USER_NO		NUMBER	NOT NULL,
    ID		VARCHAR2(30 BYTE)	NOT NULL,
	NICKNAME	VARCHAR2(24 BYTE)	NOT NULL,
	PW		VARCHAR2(64 BYTE)	NOT NULL,
	NAME		VARCHAR2(20 BYTE)	NOT NULL,
	GENDER		VARCHAR2(2 BYTE)	NOT NULL,
	EMAIL		VARCHAR2(50 BYTE)	NOT NULL,
	MOBILE		VARCHAR2(11 BYTE)	NOT NULL,
	BIRTHYEAR	VARCHAR2(4 BYTE)	NOT NULL,
	BIRTHMONTH	VARCHAR2(2 BYTE)	NOT NULL,
	BIRTHDAY	VARCHAR2(2 BYTE)	NOT NULL,
	POSTCODE	VARCHAR2(5 BYTE)	NULL,
	ROAD_ADDRESS	VARCHAR2(100 BYTE)	NULL,
	JIBUN_ADDRESS	VARCHAR2(100 BYTE)	NULL,
	DETAIL_ADDRESS	VARCHAR2(100 BYTE)	NULL,
	AGREE_CODE	NUMBER	NOT NULL,
	SNS_TYPE	VARCHAR2(10 BYTE)	NULL,
	JOIN_DATE		DATE	NOT NULL,
	INFO_MODIFY_DATE	DATE	NULL,
    PW_MODIFY_DATE 		DATE NULL,
	SESSION_ID	VARCHAR2(32 BYTE)	NULL,
	SESSION_LIMIT_DATE	DATE	NULL,
    BANNED_STATE 	NUMBER(1) NOT NULL,
PRIMARY KEY(USER_NO)
);


CREATE TABLE SLEEP_USERS (
	USER_NO		NUMBER		NOT NULL,
	SLEEP_USER_ID	VARCHAR2(30 BYTE)		NOT NULL,
	SLEEP_USER_PW	VARCHAR2( 64 BYTE)		NOT NULL,
	SLEEP_USER_NICKNAME	VARCHAR2(24 BYTE)		NOT NULL,
	SLEEP_USER_NAME		VARCHAR2(20 BYTE)		NOT NULL,
	SLEEP_USER_GENDER	VARCHAR2(2 BYTE)		NOT NULL,
	SLEEP_USER_EMAIL		VARCHAR2(50 BYTE)		NOT NULL,
	SLEEP_USER_MOBILE	VARCHAR2(11 BYTE)		NOT NULL,
	SLEEP_USER_BIRTHYEAR	VARCHAR2(4 BYTE)		NOT NULL,
	SLEEP_USER_BIRTHMONTH	VARCHAR2(4 BYTE)		NOT NULL,
	SLEEP_USER_BIRTHDAY	VARCHAR2(4 BYTE)		NOT NULL,
	POSTCODE	VARCHAR2(5 BYTE)		NULL,
	ROAD_ADDRESS	VARCHAR2(100 BYTE)		NULL,
	JIBUN_ADDRESS	VARCHAR2(100 BYTE)		NULL,
	DETAIL_ADDRESS	VARCHAR2(100 BYTE)		NULL,
	AGREE_CODE	NUMBER		NOT NULL,
	SNS_TYPE	VARCHAR2(10 BYTE)		NULL,
	JOIN_DATE	DATE		NOT NULL,
	LAST_LOGIN_DATE	DATE		NULL,
	SLEEP_DATE	DATE		NULL,
PRIMARY KEY(USER_NO)
);

CREATE TABLE RETIRE_USERS (
	RETIRE_USER_NO	NUMBER		NOT NULL,
	RETIRE_USER_ID	VARCHAR2(50 BYTE)		NOT NULL,
	RETIRE_USER_NICKNAME	VARCHAR2(24 BYTE)		NOT NULL,
	RETIRE_JOIN_DATE	DATE		NULL,
	RETIRE_DATE	DATE		NULL,
PRIMARY KEY(RETIRE_USER_NO)
);



CREATE TABLE HEART (
	USER_NO	NUMBER		NOT NULL,
	IS_HEART	NUMBER(1)	DEFAULT 0	NOT NULL,
	LOVE	NUMBER		NULL,
	HATE	NUMBER		NULL,
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);



CREATE TABLE ACCESS_LOG (
	ACCESS_LOG_NO	NUMBER		NOT NULL,
	USER_NO		NUMBER		NOT NULL,
	LAST_LOGIN_DATE	DATE		NULL,
PRIMARY KEY(ACCESS_LOG_NO),
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);


CREATE TABLE QNA (
	QNA_NO		NUMBER		NOT NULL,
	USER_NO		NUMBER		NOT NULL,
	QNA_TITLE	VARCHAR2(100 BYTE)		NOT NULL,
	QNA_PW		VARCHAR2(64 BYTE)		NOT NULL,
	QNA_CONTENT	VARCHAR2(4000 BYTE)		NOT NULL,
	QNA_CREATE_DATE	DATE		NOT NULL,
	STATE		NUMBER(1)		NOT NULL,
	DEPTH		NUMBER(2)		NOT NULL,
	GROUP_NO	NUMBER		NOT NULL,
	FAQ_STATE	NUMBER(1)		NOT NULL,
PRIMARY KEY(QNA_NO),
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL
);


-- SEQUENCE

-- USERS SEQUENCE
DROP SEQUENCE USERS_SEQ;
DROP SEQUENCE ACCESS_LOG_SEQ;
DROP SEQUENCE RETIRE_USERS_SEQ;
DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE USERS_SEQ NOCACHE;
CREATE SEQUENCE ACCESS_LOG_SEQ NOCACHE;
CREATE SEQUENCE RETIRE_USERS_SEQ NOCACHE;
CREATE SEQUENCE QNA_SEQ NOCACHE;

-- ADMIN
INSERT INTO USERS
	(USER_NO, ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
	(USERS_SEQ.NEXTVAL, 'admin', '관리자', 'FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', 'ADMIN', 'F', 'admin@gmail.com', '01011111111', '1989', '02', '11', NULL, NULL, NULL, NULL, 0, NULL, TO_DATE('20221111', 'YYYYMMDD'), NULL, NULL, NULL, NULL, 0);
COMMIT;