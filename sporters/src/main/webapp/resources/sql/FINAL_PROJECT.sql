USE team;

/** 희라, 정행 DB 쇼핑몰 */
DROP TABLE IF EXISTS PROD_THUMBNAIL;
DROP TABLE IF EXISTS PROD_DETAIL_IMAGE;
DROP TABLE IF EXISTS SHOP_REVIEW;
DROP TABLE IF EXISTS PICK;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS CART;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS PROD_CATEGORY;

/** 지원 DB 신고게시판 */
DROP TABLE IF EXISTS SINGO;

/** 준호 DB 게시판, 댓글 */
DROP TABLE IF EXISTS ATTACH;
DROP TABLE IF EXISTS FREE_IMAGE;
DROP TABLE IF EXISTS LOCALS_IMAGE;
DROP TABLE IF EXISTS SPO_IMAGE;
DROP TABLE IF EXISTS FREE_COMMENT;
DROP TABLE IF EXISTS FREE;
DROP TABLE IF EXISTS SPO_COMMENT;
DROP TABLE IF EXISTS SPO_REVIEW;
DROP TABLE IF EXISTS JOIN_USERS;
DROP TABLE IF EXISTS LOCALS_COMMENT;
DROP TABLE IF EXISTS LOCALS;
DROP TABLE IF EXISTS LOCALS_CATEGORY;

/** 희라 채팅 */
DROP TABLE IF EXISTS CHAT_USERS;
DROP TABLE IF EXISTS CHAT_MESS;
DROP TABLE IF EXISTS CHAT_ROOM;

/** 나영 DB 회원, 질문게시판 */
DROP TABLE IF EXISTS HEART;
DROP TABLE IF EXISTS QNA_COMM;
DROP TABLE IF EXISTS QNA;
DROP TABLE IF EXISTS RETIRE_USERS;
DROP TABLE IF EXISTS ACCESS_LOG;
DROP TABLE IF EXISTS SLEEP_USERS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS FAQ;


/** 테이블 생성 */

CREATE TABLE USERS (
   USER_NO      INT   NOT NULL AUTO_INCREMENT,
   ID         VARCHAR(30)   NOT NULL,
   NICKNAME   VARCHAR(24)   NOT NULL,
   PW         VARCHAR(64)   NOT NULL,
   NAME      VARCHAR(20)   NOT NULL,
   GENDER      VARCHAR(2)   NOT NULL,
   EMAIL      VARCHAR(50)   NOT NULL,
   MOBILE      VARCHAR(11)   NOT NULL,
   BIRTHYEAR   VARCHAR(4)   NOT NULL,
   BIRTHMONTH   VARCHAR(2)   NOT NULL,
   BIRTHDAY   VARCHAR(2)   NOT NULL,
   POSTCODE   VARCHAR(5)   NULL,
   ROAD_ADDRESS   VARCHAR(100)   NULL,
   JIBUN_ADDRESS   VARCHAR(100)   NULL,
   DETAIL_ADDRESS   VARCHAR(100)   NULL,
   AGREE_CODE      INT   NOT NULL,
   SNS_TYPE      VARCHAR(10)   NULL,
   JOIN_DATE      DATE   NOT NULL,
   INFO_MODIFY_DATE   DATE   NULL,
   PW_MODIFY_DATE       DATE NULL,
   SESSION_ID         VARCHAR(32)   NULL,
   SESSION_LIMIT_DATE   DATE   NULL,
   BANNED_STATE       INT NOT NULL,
PRIMARY KEY(USER_NO)
);


CREATE TABLE SLEEP_USERS (
   USER_NO         INT      NOT NULL,
   SLEEP_USER_ID   VARCHAR(30)      NOT NULL,
   SLEEP_USER_PW   VARCHAR(64)      NOT NULL,
   SLEEP_USER_NICKNAME   VARCHAR(24)      NOT NULL,
   SLEEP_USER_NAME      VARCHAR(20)      NOT NULL,
   SLEEP_USER_GENDER   VARCHAR(2)      NOT NULL,
   SLEEP_USER_EMAIL      VARCHAR(50)      NOT NULL,
   SLEEP_USER_MOBILE      VARCHAR(11)      NOT NULL,
   SLEEP_USER_BIRTHYEAR   VARCHAR(4)      NOT NULL,
   SLEEP_USER_BIRTHMONTH   VARCHAR(4)      NOT NULL,
   SLEEP_USER_BIRTHDAY   VARCHAR(4)      NOT NULL,
   POSTCODE      VARCHAR(5)      NULL,
   ROAD_ADDRESS   VARCHAR(100)      NULL,
   JIBUN_ADDRESS   VARCHAR(100)      NULL,
   DETAIL_ADDRESS   VARCHAR(100)      NULL,
   AGREE_CODE      INT      NOT NULL,
   SNS_TYPE      VARCHAR(10)      NULL,
   JOIN_DATE      DATE      NOT NULL,
   LAST_LOGIN_DATE   DATE      NULL,
   SLEEP_DATE      DATE      NULL,
PRIMARY KEY(USER_NO)
);

CREATE TABLE RETIRE_USERS (
   RETIRE_USER_NO      INT      NOT NULL,
   RETIRE_USER_ID      VARCHAR(50)      NOT NULL,
   RETIRE_JOIN_DATE   DATE      NULL,
   RETIRE_DATE         DATE      NULL,
PRIMARY KEY(RETIRE_USER_NO)
);



CREATE TABLE HEART (
   USER_NO      INT,
   IS_HEART   INT      DEFAULT 0   NOT NULL,
   LOVE      INT      NULL,
   HATE      INT      NULL,
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);



CREATE TABLE ACCESS_LOG (
   ACCESS_LOG_NO   INT      NOT NULL AUTO_INCREMENT,
   USER_NO         INT,
   LAST_LOGIN_DATE   DATE      NULL,
PRIMARY KEY(ACCESS_LOG_NO),
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);


CREATE TABLE QNA (
   QNA_NO      INT      NOT NULL AUTO_INCREMENT,
   USER_NO      INT,
   QNA_TITLE   VARCHAR(100)      NOT NULL,
   QNA_PW      VARCHAR(64)      NOT NULL,
   QNA_CONTENT   TEXT(20000)      NOT NULL,
   QNA_CREATE_DATE   DATE      NOT NULL,
   STATE      INT      NOT NULL,
   DEPTH      INT      NOT NULL,
   GROUP_NO   INT      NOT NULL,
PRIMARY KEY(QNA_NO),
FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL
);

CREATE TABLE QNA_COMM (
   QNA_COMM_NO      INT      NOT NULL AUTO_INCREMENT,
   QNA_NO            INT,
   QNA_COMM_CONTENT   TEXT(20000)      NOT NULL,
   QNA_COMM_CREATE_DATE   DATE      NOT NULL,
   STATE      INT      NOT NULL,
   DEPTH      INT      NOT NULL,
   GROUP_NO   INT      NOT NULL,
PRIMARY KEY(QNA_COMM_NO),
FOREIGN KEY(QNA_NO) REFERENCES QNA(QNA_NO) ON DELETE CASCADE
);

CREATE TABLE FAQ (
   FAQ_NO   INT   NOT NULL AUTO_INCREMENT,
   FAQ_TITLE   VARCHAR(100),
   FAQ_CONTENT   TEXT(20000), 
   PRIMARY KEY(FAQ_NO)
);



CREATE TABLE PROD_CATEGORY (
    PROD_CATEGORY_NO INT  NOT NULL AUTO_INCREMENT,
    PROD_CATEGORY_NAME  VARCHAR(30)   NOT NULL,
    PRIMARY KEY(PROD_CATEGORY_NO)
);

CREATE TABLE PRODUCT (
    PROD_NO INT   NOT NULL AUTO_INCREMENT,
    PROD_CATEGORY_NO INT,
    PROD_NAME   VARCHAR(100)   NOT NULL,
    PRICE      INT   NOT NULL,
    DISCOUNT   INT   NULL,
    PROD_CONTENT   TEXT(20000)   NULL,
    ORIGIN   VARCHAR(100),
    STOCK   INT,
    PROD_CREATE_DATE DATE,
    PRIMARY KEY(PROD_NO),
    FOREIGN KEY(PROD_CATEGORY_NO) REFERENCES PROD_CATEGORY(PROD_CATEGORY_NO) ON DELETE SET NULL
);



CREATE TABLE CART (
    CART_NO   INT   NOT NULL AUTO_INCREMENT,
    USER_NO INT,
    PROD_NO INT,
    PROD_CNT INT NOT NULL,
    PRIMARY KEY(CART_NO),
    FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE,
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE
);

CREATE TABLE ORDERS (
    ORDER_NO INT NOT NULL AUTO_INCREMENT,
    USER_NO   INT,
    CART_NO INT  NOT NULL,
    PAYMENT   INT   NULL,
    NAME   VARCHAR(100) NOT NULL,
    MOBILE  VARCHAR(11)  NOT NULL,
    POSTCODE VARCHAR(5),
    LOAD_ADDRESS VARCHAR(100),
    JIBUN_ADDRESS VARCHAR(100),
    DETAIL_ADDRESS VARCHAR(100),
    ORDER_DATE   DATE NOT NULL,
    PRIMARY KEY(ORDER_NO),
    FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE,
    FOREIGN KEY(CART_NO) REFERENCES CART(CART_NO) ON DELETE CASCADE
);


CREATE TABLE PICK (
    USER_NO   INT,
    PROD_NO   INT,
    FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE SET NULL
);

CREATE TABLE SHOP_REVIEW (
    REVIEW_NO   INT   NOT NULL,
    ORDER_NO   INT,
    STAR      DECIMAL(2,1)   NOT NULL,
    CONTENT   TEXT(20000)   NULL,
    REVIEW_DATE   DATE   NULL,
    PRIMARY KEY(REVIEW_NO),
    FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO) ON DELETE SET NULL
);

CREATE TABLE PROD_DETAIL_IMAGE (
    PROD_DETAIL_IMAGE_NO INT NOT NULL,
    PROD_NO INT,
    FILESYSTEM  VARCHAR(40),
    PRIMARY KEY(PROD_DETAIL_IMAGE_NO),
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE
);

CREATE TABLE PROD_THUMBNAIL(
    TN_NO INT NOT NULL,
    PROD_NO INT,
    TN_PATH VARCHAR(300),
    TN_ORIGIN VARCHAR(300),
    TN_FILESYSTEM VARCHAR(42),
    IS_THUMBNAIL INT,
    PRIMARY KEY(TN_NO),
    FOREIGN KEY(PROD_NO) REFERENCES PRODUCT(PROD_NO) ON DELETE CASCADE
);

CREATE TABLE LOCALS_CATEGORY(
    LOCAL_NO INT NOT NULL AUTO_INCREMENT,
    LOCAL VARCHAR(30),
    PRIMARY KEY(LOCAL_NO)
);

CREATE TABLE LOCALS(
    LOCAL_BOARD_NO INT NOT NULL AUTO_INCREMENT,
    TITLE VARCHAR(100) NOT NULL,
    CONTENT TEXT(20000) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    HIT DOUBLE NOT NULL,
    USER_NO INT,
    STATE INT NOT NULL,
    MAX_USER INT NULL,
    LOCAL_NO INT,
    IP VARCHAR(30) NULL,
    MODIFY_DATE  DATE NULL,
    JOIN_START VARCHAR(100),
    JOIN_END VARCHAR(100),
    PRIMARY KEY(LOCAL_BOARD_NO),
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL,
    FOREIGN KEY (LOCAL_NO) REFERENCES LOCALS_CATEGORY(LOCAL_NO) ON DELETE SET NULL    
    );
            
INSERT INTO LOCALS_CATEGORY
	(LOCAL_NO, LOCAL)
VALUES
	(1, '서울');
INSERT INTO LOCALS_CATEGORY
	(LOCAL_NO, LOCAL)
VALUES
	(2, '경기');
INSERT INTO LOCALS_CATEGORY
	(LOCAL_NO, LOCAL)
VALUES
	(3, '부산');
COMMIT;
CREATE TABLE LOCALS_COMMENT(
    LOCAL_CO_NO INT NOT NULL AUTO_INCREMENT,
    LOCAL_BOARD_NO INT,
    COMM_CONTENT VARCHAR(1000) NOT NULL,
    COMM_CREATE_DATE DATETIME NOT NULL,
    STATE INT NOT NULL,
    DEPTH INT NOT NULL,
    GROUP_NO INT NOT NULL,
    GROUP_ORDER INT NOT NULL,
    USER_NO INT,
    PRIMARY KEY (LOCAL_CO_NO),
    FOREIGN KEY(LOCAL_BOARD_NO) REFERENCES LOCALS (LOCAL_BOARD_NO) ON DELETE CASCADE,  
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL
);

CREATE TABLE JOIN_USERS(
    USER_NO INT NOT NULL  AUTO_INCREMENT,
    LOCAL_BOARD_NO INT,    
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (LOCAL_BOARD_NO) REFERENCES LOCALS(LOCAL_BOARD_NO) ON DELETE CASCADE
);


CREATE TABLE SPO_REVIEW(
    SPO_REVIEW_NO INT NOT NULL  AUTO_INCREMENT,
    TITLE VARCHAR(100) NOT NULL,
    CONTENT TEXT(20000) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    HIT INT NOT NULL,
    USER_NO INT,
    STATE INT NULL,
    LOCAL_BOARD_NO INT,
    IP VARCHAR(30) NOT NULL,
    MODIFY_DATE DATE NULL,
    PRIMARY KEY (SPO_REVIEW_NO),
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL,
    FOREIGN KEY (LOCAL_BOARD_NO) REFERENCES LOCALS(LOCAL_BOARD_NO) ON DELETE SET NULL    
);

CREATE TABLE SPO_COMMENT(
    SPO_CO_NO INT NOT NULL  AUTO_INCREMENT,
    SPO_REVIEW_NO INT,
    COMM_CONTENT VARCHAR(1000)NOT NULL,
    COMM_CREATE_DATE DATE NOT NULL,
    STATE INT NOT NULL,
    DEPTH INT NOT NULL,
    GROUP_NO INT NOT NULL,
    GROUP_ORDER INT NOT NULL,
    USER_NO INT,
    PRIMARY KEY (SPO_CO_NO),
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL,
    FOREIGN KEY (SPO_REVIEW_NO) REFERENCES SPO_REVIEW (SPO_REVIEW_NO) ON DELETE SET NULL    
);

CREATE TABLE FREE(
    FREE_NO INT NOT NULL  AUTO_INCREMENT,
    TITLE VARCHAR(100) NOT NULL,
    CONTENT TEXT(20000) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    HIT INT NOT NULL,
    USER_NO INT,
    STATE INT NOT NULL,
    IP VARCHAR(30) NULL,
    MODIFY_DATE DATE NULL,
    PRIMARY KEY (FREE_NO),
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL
);


CREATE TABLE FREE_COMMENT(
    FREE_CO_NO INT NOT NULL  AUTO_INCREMENT,
    FREE_NO INT,
    COMM_CONTENT VARCHAR(1000)NOT NULL,
    COMM_CREATE_DATE DATE NOT NULL,
    STATE INT NOT NULL,
    DEPTH INT NOT NULL,
    GROUP_NO INT NOT NULL,
    GROUP_ORDER INT NOT NULL,
    USER_NO INT,
    PRIMARY KEY (FREE_CO_NO),
    FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL,
    FOREIGN KEY (FREE_NO) REFERENCES FREE (FREE_NO) ON DELETE CASCADE
);

CREATE TABLE FREE_IMAGE(
    FREE_IMAGE_NO INT NOT NULL  AUTO_INCREMENT,    
    FREE_NO INT,
    FILESYSTEM VARCHAR(40),
    PRIMARY KEY (FREE_IMAGE_NO),
    FOREIGN KEY (FREE_NO) REFERENCES FREE(FREE_NO) ON DELETE CASCADE
);

CREATE TABLE SINGO(
   SINGO_NO INT NOT NULL AUTO_INCREMENT,
   SINGO_TITLE VARCHAR(1000) NOT NULL,
   SINGO_CONTENT VARCHAR(4000) NOT NULL,
   SINGO_CREATE_DATE DATE NOT NULL,
   SINGO_HIT INT NOT NULL,
   USER_NO INT,
   FREE_NO INT,
   PRIMARY KEY (SINGO_NO),
   FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO) ON DELETE SET NULL,
   FOREIGN KEY (FREE_NO) REFERENCES FREE(FREE_NO) ON DELETE CASCADE
);

CREATE TABLE LOCALS_IMAGE(
    LOCAL_IMAGE_NO INT NOT NULL  AUTO_INCREMENT,
    LOCAL_BOARD_NO INT,   
    FILESYSTEM VARCHAR(40),
    PRIMARY KEY (LOCAL_IMAGE_NO),
    FOREIGN KEY (LOCAL_BOARD_NO) REFERENCES LOCALS(LOCAL_BOARD_NO) ON DELETE CASCADE    
);

CREATE TABLE SPO_IMAGE(
    SPO_IMAGE_NO INT NOT NULL  AUTO_INCREMENT,   
    SPO_REVIEW_NO INT,  
    FILESYSTEM VARCHAR(40) NULL,
    PRIMARY KEY (SPO_IMAGE_NO),    
    FOREIGN KEY (SPO_REVIEW_NO) REFERENCES SPO_REVIEW(SPO_REVIEW_NO) ON DELETE CASCADE
);


CREATE TABLE ATTACH(
    ATTACH_NO INT NOT NULL  AUTO_INCREMENT,
    LOCAL_BOARD_NO INT,
    SPO_REVIEW_NO INT,
    FREE_NO INT,
    PATH VARCHAR(300) NOT NULL,
    ORIGIN VARCHAR(300),
    FILESYSTEM VARCHAR(40),
    DOWNLOAD_CNT INT NULL,
    PRIMARY KEY (ATTACH_NO),
    FOREIGN KEY (LOCAL_BOARD_NO) REFERENCES LOCALS(LOCAL_BOARD_NO) ON DELETE CASCADE,
    FOREIGN KEY (SPO_REVIEW_NO) REFERENCES SPO_REVIEW(SPO_REVIEW_NO) ON DELETE CASCADE,
    FOREIGN KEY (FREE_NO) REFERENCES FREE(FREE_NO) ON DELETE CASCADE
);

CREATE TABLE CHAT_ROOM (
    CHAT_ROOM_ID INT NOT NULL AUTO_INCREMENT,
    CHAT_ROOM_TITLE VARCHAR(100),
    MAX_USERS_CNT INT,
    CREATE_DATE DATE,
    IS_PW INT,
    ROOM_PW INT,
    PRIMARY KEY(CHAT_ROOM_ID)
);

CREATE TABLE CHAT_USERS (
    CHAT_ROOM_ID INT,
    USER_NO INT,
    FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    FOREIGN KEY(CHAT_ROOM_ID) REFERENCES CHAT_ROOM(CHAT_ROOM_ID)
);

CREATE TABLE CHAT_MESS (
    MESS_ID INT NOT NULL AUTO_INCREMENT,
    MESS_CONTENT VARCHAR(1000) NOT NULL,
    REC_MESS_TIME DATE,
    USER_NO INT,
    CHAT_ROOM_ID INT,
    PRIMARY KEY(MESS_ID),
    FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    FOREIGN KEY(CHAT_ROOM_ID) REFERENCES CHAT_ROOM(CHAT_ROOM_ID)
);



/** 데이터 삽입 */

/** ADMIN */
INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('admin', '관리자', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', 'ADMIN', 'F', 'admin@gmail.com', '01011111111', '1989', '02', '11', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

/** USER */
INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('user01', '회원1', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', 'USER1', 'M', 'user01@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('user99', '휴면', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '휴면', 'M', 'user99@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20201111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('1', '준호', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '준호', 'M', '1@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('2', '나영', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '나영', 'M', '2@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('3', '지원', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '지원', 'M', '3@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('4', '정행', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '정행', 'M', '4@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);

INSERT INTO USERS
   (ID, NICKNAME, PW, NAME, GENDER, EMAIL, MOBILE, BIRTHYEAR, BIRTHMONTH, BIRTHDAY, POSTCODE, ROAD_ADDRESS, JIBUN_ADDRESS, DETAIL_ADDRESS, AGREE_CODE, SNS_TYPE, JOIN_DATE, INFO_MODIFY_DATE, PW_MODIFY_DATE, SESSION_ID, SESSION_LIMIT_DATE, BANNED_STATE) 
VALUES
   ('5', '희라', ' FFE1ABD1A 8215353C233D6E0 9613E95EEC4253832A761AF28FF37AC5A15 C', '희라', 'M', '5@gmail.com', '01011111111', '1958', '01', '01', NULL, NULL, NULL, NULL, 0, NULL, DATE('20221111'), NULL, NULL, NULL, NULL, 0);


/** CATEGORY */
INSERT INTO PROD_CATEGORY (PROD_CATEGORY_NAME)
    VALUES ('음식');
INSERT INTO PROD_CATEGORY (PROD_CATEGORY_NAME)
    VALUES ('의류');
INSERT INTO PROD_CATEGORY (PROD_CATEGORY_NAME)
    VALUES ('물건');
    
commit;