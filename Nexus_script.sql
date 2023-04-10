----------------�------------------
--�� 紐⑤대 諛 �쎌“嫄 �
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--�� 紐⑤  �
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--�� 紐⑤ 酉 �
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--�� 紐⑤ 몃━嫄 �
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- 대 

----------------------  대 -------------------------
create table tb_member(
    user_no	number primary key,
	user_id	varchar2(50) not null unique,
	user_pwd varchar2(100),
	user_name varchar2(100)	NOT NULL,
	user_nick varchar2(100),
	email varchar2(100),
	profile	varchar2(200),
	gender varchar2(3) check(gender in('M','W','O')),
	social varchar2(3) check(social in('K','G','O')),
	enroll_date	date default sysdate,
	token	varchar2(200),
	status	varchar2(3)	default 'Y' check(status in('Y','N'))
);

create sequence seq_member
nocache;

INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user01','pass01','諛곗','諛留ㅽ','email01@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user02','pass02','댄誘','DB ъ','email02@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user03','pass03','泥','ㅽ留洹','email03@kh.co.kr',null,null,'O',SYSDATE,null,'Y');


COMMENT ON COLUMN TB_MEMBER.USER_NO IS '踰';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '대';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '鍮諛踰';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS ' 대';
COMMENT ON COLUMN TB_MEMBER.USER_NICK IS 'ㅼ';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '대';
COMMENT ON COLUMN TB_MEMBER.PROFILE IS '濡二쇱';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '깅';
COMMENT ON COLUMN TB_MEMBER.SOCIAL IS ' щ';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '媛';
COMMENT ON COLUMN TB_MEMBER.TOKEN IS '';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '댁щ';


---------------------- 댁 대 -------------------------
create table tb_news (
	news_no	number primary key,
	user_no	number references tb_member,
	news_title	varchar2(1000)	NOT NULL,
	news_content varchar2(4000)	NOT NULL,
	create_date date DEFAULT sysdate,
	update_date date DEFAULT sysdate,
	status	varchar2(3) default 'Y'	check(status in('Y','N')),
	origin_name	varchar2(100)	NULL,
	change_name	varchar2(100)	NULL
);

create sequence seq_news
nocache;

insert into tb_news values(seq_news.nextval, 1,'ㅻ 猷 ㅻ','吏泥 鍮곕щ ㅼ',sysdate,sysdate,'Y','qwe','qwe');
insert into tb_news values(seq_news.nextval, 2,'諛곌�','�ъ媛몃  諛μ 紐삳㉨寃 ⑸源!!!',sysdate,sysdate,'Y','asdf','asdf');
insert into tb_news values(seq_news.nextval, 3,' 吏泥 醫 洹몃 ⑹','�媛 李⑺怨 띠댁с',sysdate,sysdate,'Y','qwe','qwe');

comment on column tb_news.news_no is '댁ㅻ';
comment on column tb_news.user_no is '踰';
comment on column tb_news.news_title is '�紐';
comment on column tb_news.news_content is '댁';
comment on column tb_news.create_date is '깆';
comment on column tb_news.update_date is '�';
comment on column tb_news.status is '';
comment on column tb_news.origin_name is '湲곗〈 쇰';
comment on column tb_news.change_name is '蹂寃쎈 쇰';


---------------------- 댁 湲 -------------------------
create table tb_news_comments(
    news_no number references tb_news,
    comment_writer varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_date date default sysdate,
    status varchar2(3) default 'Y' check(status in('Y','N'))
);

insert into tb_news_comments values(1, 'user01','',sysdate,'Y');
insert into tb_news_comments values(1, 'user02','',sysdate,'Y');
insert into tb_news_comments values(1, 'user03','',sysdate,'Y');



comment on column tb_news_comments.news_no is '뉴스번호';
comment on column tb_news_comments.comment_writer is '작성자 아이디';
comment on column tb_news_comments.comment_content is '내용';
comment on column tb_news_comments.comment_date is '작성일';
comment on column tb_news_comments.status is '상태';

----------------------  -------------------------
create table tb_collaborator(
    repository_no number not null,
    user_no number references tb_member,
    part varchar2(10)
);

insert into tb_collaborator values(1, 1, '');
insert into tb_collaborator values(1,2,'');
insert into tb_collaborator values(1,3,'');

comment on column tb_collaborator.repository_no is '�吏由 踰';
comment on column tb_collaborator.user_no is '踰';
comment on column tb_collaborator.part is '�';


---------------------- 罹由곕 移댄怨由 -------------------------
CREATE TABLE TB_CALENDAR_CATEGORY(
   CATEGORY_NO NUMBER PRIMARY KEY,
   CATEGORY_NAME VARCHAR2(30)
);

COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NO IS '移댄怨由 踰';
COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NAME IS '移댄怨由 대';

INSERT INTO TB_CALENDAR_CATEGORY VALUES(1,'臾');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(2,'媛 쇱');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(3,' 쇱');

---------------------- 罹由곕 -------------------------

CREATE TABLE TB_CALENDAR(
   CALENDAR_NO NUMBER PRIMARY KEY,
   USER_NO NUMBER REFERENCES TB_MEMBER,
   SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
   START_DATE VARCHAR2(50) NOT NULL,
   END_DATE VARCHAR2(50) NOT NULL,
   DATE_COLOR VARCHAR2(30),
   SCHEDULE_CONTENT VARCHAR2(1000),
   CATEGORY VARCHAR2(50),
   TEXT_COLOR VARCHAR2(50),
   ALL_DAY CHAR(1),
   STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN TB_CALENDAR.USER_NO IS ' 踰';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_TITLE IS '쇱 �紐';
COMMENT ON COLUMN TB_CALENDAR.START_DATE IS '';
COMMENT ON COLUMN TB_CALENDAR.END_DATE IS '留媛';
COMMENT ON COLUMN TB_CALENDAR.DATE_COLOR IS '';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_CONTENT IS '쇱 댁';
COMMENT ON COLUMN TB_CALENDAR.CATEGORY_NO IS '移댄怨由 踰';

INSERT INTO TB_CALENDAR VALUES(1,'濡� ',SYSDATE,'2023-04-04','鍮④','5 NEXUS ',1);
INSERT INTO TB_CALENDAR VALUES(2,'泥�湲',SYSDATE,'2023-04-04','','3 吏泥�',2);
INSERT INTO TB_CALENDAR VALUES(3,'以 ','2023-05-05','2023-05-05','珥濡','以몄 ',3);


---------------------- 梨諛 -------------------------
CREATE TABLE TB_CHAT_ROOM(
   ROOM_NO NUMBER PRIMARY KEY,
   NUMBER_PARTICIPANTS NUMBER NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS VARCHAR2(3) DEFAULT 'Y' NOT NULL
);
COMMENT ON COLUMN TB_CHAT_ROOM.ROOM_NO IS '梨諛 踰';
COMMENT ON COLUMN TB_CHAT_ROOM.NUMBER_PARTICIPANTS IS '李몄ъ몄';
COMMENT ON COLUMN TB_CHAT_ROOM.CREATE_DATE IS '깆쇱';
COMMENT ON COLUMN TB_CHAT_ROOM.STATUS IS '�щ';

INSERT INTO TB_CHAT_ROOM VALUES(1,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(2,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(3,2,SYSDATE,'Y');

---------------------- 梨諛  -------------------------
CREATE TABLE TB_CHAT_USER(
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM 
);
COMMENT ON COLUMN TB_CHAT_USER.USER_NO IS ' 踰';
COMMENT ON COLUMN TB_CHAT_USER.ROOM_NO IS '梨諛 踰';

INSERT INTO TB_CHAT_USER VALUES(1,2);
INSERT INTO TB_CHAT_USER VALUES(2,1);
INSERT INTO TB_CHAT_USER VALUES(3,3);


---------------------- 梨 -------------------------
CREATE TABLE TB_CHATTING(
   CHATTING_NO NUMBER PRIMARY KEY,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM,
   CHATTING_CONTENT VARCHAR2(3000),
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   CHAT_WRITER VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN TB_CHATTING.CHATTING_NO IS '梨 踰';
COMMENT ON COLUMN TB_CHATTING.ROOM_NO IS '梨諛 踰';
COMMENT ON COLUMN TB_CHATTING.CHATTING_CONTENT IS '硫몄 댁';
COMMENT ON COLUMN TB_CHATTING.ORIGIN_NAME IS '蹂 쇰';
COMMENT ON COLUMN TB_CHATTING.CHANGE_NAME IS '諛 쇰';
COMMENT ON COLUMN TB_CHATTING.CHAT_WRITER IS '깆';
COMMENT ON COLUMN TB_CHATTING.CREATE_DATE IS '깆쇱';


INSERT INTO TB_CHATTING VALUES(1,1,'',NULL,NULL,'곗',SYSDATE);
INSERT INTO TB_CHATTING VALUES(2,1,'',NULL,NULL,'誘',SYSDATE);
INSERT INTO TB_CHATTING VALUES(3,2,'泥 肄⑹쇱..',NULL,NULL,'泥',SYSDATE);

--------------------------------------------------
--------------     ISSUE 愿� 	------------------	
--------------------------------------------------

CREATE TABLE TB_ISSUE (
	ISSUE_NO	number	NOT NULL,
	LABEL	number	NULL,
	CREATE_DATE	date DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE	date	NULL,
	CLOSE_DATE	date	NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REPOSITORY_ID	varchar2(100)	NOT NULL,
	MILESTONE_ID	varchar2(100)	NULL,
	ISSUE_TITLE	varchar2(500)	NOT NULL,
	ISSUE_CONTENT	varchar2(1000)	NOT NULL,
	ISSUE_AUTHOR	NUMBER	,
	ISSUE_ASSIGNEE	varchar2(100)	NULL,
	PRIORITY	number	NULL 
);



COMMENT ON COLUMN TB_ISSUE.ISSUE_NO IS '댁踰(源諛)';
COMMENT ON COLUMN TB_ISSUE.LABEL IS '댁 쇰꺼';
COMMENT ON COLUMN TB_ISSUE.CREATE_DATE IS '댁 깆';
COMMENT ON COLUMN TB_ISSUE.MODIFY_DATE IS '댁 �';
COMMENT ON COLUMN TB_ISSUE.CLOSE_DATE IS '댁 醫猷';
COMMENT ON COLUMN TB_ISSUE.STATUS IS '댁 媛';
COMMENT ON COLUMN TB_ISSUE.REPOSITORY_ID IS '댁媛  �吏由';
COMMENT ON COLUMN TB_ISSUE.MILESTONE_ID IS '댁媛  留쇱ㅽ';
COMMENT ON COLUMN TB_ISSUE.ISSUE_TITLE IS '댁 �紐';
COMMENT ON COLUMN TB_ISSUE.ISSUE_CONTENT IS '댁 댁';
COMMENT ON COLUMN TB_ISSUE.ISSUE_AUTHOR IS '댁 깆';
COMMENT ON COLUMN TB_ISSUE.ISSUE_ASSIGNEE IS '댁  諛 щ';
COMMENT ON COLUMN TB_ISSUE.PRIORITY IS '댁 곗';

-- 
CREATE SEQUENCE SEQ_ISSUE_NO NOCACHE;




ALTER TABLE TB_ISSUE
  ADD CONSTRAINT PK_ISSUE_NO PRIMARY KEY (ISSUE_NO);


ALTER TABLE TB_ISSUE
ADD CONSTRAINT FK_ISU_AUTHOR FOREIGN KEY(ISSUE_AUTHOR) REFERENCES TB_MEMBER (USER_NO);



-- 紐⑤媛 ｊ린 - 댄
INSERT 
	INTO 	TB_ISSUE
			(
				ISSUE_NO
				, LABEL
				, CREATE_DATE
				, MODIFY_DATE
				, CLOSE_DATE
				, STATUS
				, REPOSITORY_ID
				, MILESTONE_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, ISSUE_ASSIGNEE
				, PRIORITY
			)
	VALUES
			(
				
				SEQ_ISSUE_NO.NEXTVAL
				, 1
				, DEFAULT
				, SYSDATE
				, SYSDATE
				, DEFAULT
				, '�吏由 ID 123'
				, '留쇱ㅽID 123'
				, '踰洹 � 留'
				, '댁援ъ姨援 �댁＜몄. 鍮⑤━ 濡� 吏 遺媛'
				, 1
				, '�泥' -- �泥댁쇰 곗㎏ 吏
				, 1
			)
	;
				
				
				

		

-- NULL 鍮쇨� ｊ린
INSERT 
	INTO 	TB_ISSUE
			(
				  ISSUE_NO
				, CREATE_DATE
				, STATUS
				, REPOSITORY_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, PRIORITY
			)
	VALUES
			(
				
				 SEQ_ISSUE_NO.NEXTVAL
				, DEFAULT
				, DEFAULT
				, '�吏由 ID 456'
				, ' 湲곕 援ы'
				, 'K  댁쇰댁쇱 '
				, 1 --  留 대 ｌ댁쇳댁
                , 1

			)
	;

	
-- 紐⑤媛 ｊ린 - �踰�
INSERT 
	INTO 	TB_ISSUE
			(
				ISSUE_NO
				, LABEL
				, CREATE_DATE
				, MODIFY_DATE
				, CLOSE_DATE
				, STATUS
				, REPOSITORY_ID
				, MILESTONE_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, ISSUE_ASSIGNEE
				, PRIORITY
			)
	VALUES
			(
				
				SEQ_ISSUE_NO.NEXTVAL
				, 3
				, '20230101'
				, '20230110'
				, '20230210'
				, 'N'
				, '�吏由 ID 78910'
				, '留쇱ㅽID 456'
				, '댁 대ㅼ '
				, '  ⑹ '
				, 3
				, 'user02' -- �泥댁쇰 곗㎏ 吏
				, 2
			)
	;
	
	
	
--------------------------------------------------
-------------    ISSUE_REPLY 愿� 	--------------
--------------------------------------------------

CREATE TABLE TB_ISU_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	REPLY_CONTENT	VARCHAR2(1000)	NOT NULL,
	REPLY_WRITER	NUMBER,
	CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REF_ISSUE_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_ISU_REPLY.REPLY_NO IS '湲 踰';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_CONTENT IS '湲 댁';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_WRITER IS '湲 깆';
COMMENT ON COLUMN TB_ISU_REPLY.CREATE_DATE IS '湲 깆';
COMMENT ON COLUMN TB_ISU_REPLY.STATUS IS '湲 媛';
COMMENT ON COLUMN TB_ISU_REPLY.REF_ISSUE_NO IS '李몄“ 댁 踰';

--
CREATE SEQUENCE SEQ_ISU_REPLY_NO NOCACHE;



ALTER TABLE TB_ISU_REPLY
  ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_ISSUENO FOREIGN KEY(REF_ISSUE_NO) REFERENCES TB_ISSUE (ISSUE_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES TB_MEMBER (USER_NO);


-- 紐⑤媛 ｊ린

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '닿굅 湲곗レ댁 대 諛轅二쇱몄'
				, 1
				, DEFAULT
				, DEFAULT
				, 1
			)
	;


-- NULL � 媛 ｊ린


INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '닿 留 띠댁~'
				, 2
				, '20230314'
				, 2
			)
	;
	
	
-- 紐⑤媛 ｊ린 - �踰�

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '留?? 닿???'
				, 1
				, SYSDATE
				, 'N'
				, 1
			)
	;
	
-- 紐⑤媛 ｊ린 - �踰�2

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '踰吏몃湲 ㅽ몄'
				, 1
				, SYSDATE
				, DEFAULT
				, 2
			)
	;
	



--------------------------------------------------
-------------    ㅼ媛 由 鍮 愿� 	--------------
--------------------------------------------------	


CREATE TABLE TB_NOTIFICATIONS (
	user_no	number	NOT NULL,
	category_no	number	CHECK (category_no IN (1,2,3,4,5,6)),
	noti_content	varchar2(1000)	NOT NULL,
	ocu_time	date	NOT NULL,
	post_no 	number	NOT NULL,
	STATUS char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) 
);

-- ㅼ媛 由 醫 �ㅺ 쇰㈃  N泥由?  吏� X 瑜멸굔留 N 泥由??

COMMENT ON COLUMN TB_NOTIFICATIONS.user_no IS ' 踰';
COMMENT ON COLUMN TB_NOTIFICATIONS.category_no IS '移댄怨由 踰 (댁,移援,댁,媛명蹂,濡�,留쇱ㅽ)';
COMMENT ON COLUMN TB_NOTIFICATIONS.noti_content IS 'ㅼ媛 由 댁';
COMMENT ON COLUMN TB_NOTIFICATIONS.ocu_time IS 'ㅼ媛 由 諛 媛';
COMMENT ON COLUMN TB_NOTIFICATIONS.post_no IS '댁 踰';
COMMENT ON COLUMN TB_NOTIFICATIONS.STATUS IS 'ㅼ媛 由 媛';

ALTER TABLE TB_NOTIFICATIONS
  ADD CONSTRAINT PK_USER_NO PRIMARY KEY (user_no);
  
  
 -- 紐⑤媛ｊ린 
 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				1
				, 2
				, 'XXX 移援 泥� 듬'
				, SYSDATE
				, 2 -- 洹  移댄怨由ъ 대밸 댁瑜 대산 媛�몄ㅼ? 而щ쇱 ｋ寃 留?
				, DEFAULT
			)
	;
	

 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				2
				, 1
				, 'XXX  @@@ 濡� 댁 깅듬'
				, '20230401'
				, 1
				, 'Y'
			)
	;
	
 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				3
				, 5
				, '### 濡�몄 李멸듬.'
				, '20230403'
				, 1
				, 'N'
			)
	;
    
    


CREATE SEQUENCE SEQ_INQUIRY
NOCACHE;

CREATE SEQUENCE SEQ_QUESTION
NOCACHE;

------------- 吏臾-----------------
CREATE TABLE TB_QUESTION (
	question_no number primary key,
	inquiry_no number NOT NULL,
	question_content varchar2(4000) NULL,
	question_date	date NOT NULL,
	user_no number NOT NULL
);



COMMENT ON COLUMN TB_QUESTION.question_no IS '吏臾 踰';
COMMENT ON COLUMN TB_QUESTION.inquiry_no IS '臾몄 踰';
COMMENT ON COLUMN TB_QUESTION.question_content IS '吏臾 댁';
COMMENT ON COLUMN TB_QUESTION.question_date IS '吏臾 吏';
COMMENT ON COLUMN TB_QUESTION.user_no IS '臾몄  踰';

INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.nextval, ' 듯', SYSDATE, 1);
INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.currval, '遊二쇱 媛援щ┝ ', SYSDATE, 1);
INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.nextval, ' 댁', SYSDATE, 2);

------------------- 移援 ------------------------------

CREATE TABLE TB_FRIEND (
	user_no number references TB_MEMBER on delete cascade,
	user_add_no number references TB_MEMBER on delete cascade,
	user_blocked varchar2(3) DEFAULT 'N' NOT NULL,
    primary key(user_no, user_add_no)
);

COMMENT ON COLUMN TB_FRIEND.user_no IS '移異 蹂대몄 踰';
COMMENT ON COLUMN TB_FRIEND.user_add_no IS '移異 諛 踰';
COMMENT ON COLUMN TB_FRIEND.user_blocked IS '李⑤  щ("Y", "N")';

INSERT INTO TB_FRIEND VALUES(1, 2, DEFAULT);
INSERT INTO TB_FRIEND VALUES(1, 3, DEFAULT);
INSERT INTO TB_FRIEND VALUES(2, 1, DEFAULT);

CREATE SEQUENCE SEQ_PJT_PR
       INCREMENT BY 1
       START WITH 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
       
CREATE SEQUENCE SEQ_PSN_PR
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
CREATE SEQUENCE SEQ_PJT_PR_REPLY
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
CREATE SEQUENCE SEQ_PSN_PR_REPLY
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
CREATE SEQUENCE SEQ_MILEST_NO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
CREATE SEQUENCE SEQ_PROJECT_NO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       ORDER;
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PJT_PR_BOARD" (
   "PJT_PR_NO"   number      NOT NULL,
   "user_no"   number      NOT NULL,
   "PJT_PR_TITLE"   VARCHAR2(100)      NOT NULL,
   "PJT_PR_START"   VARCHAR2(100)      NOT NULL,
   "PJT_PR_PERIOD"   VARCHAR2(100)      NULL,
   "PJT_PR_DEADLINE"   VARCHAR2(100)      NULL,
   "PJT_PR_STACK"   VARCHAR2(500)      NULL,
   "PJT_PR_FACE"   VARCHAR2(100)      NULL,
   "PJT_PR_CONTACT"   VARCHAR2(4000)      NOT NULL,
   "PJT_PR_CAPACITY"   VARCHAR2(100)      NULL,
   "PJT_PR_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "PJT_PR_RECRUITS"   VARCHAR2(100)      NULL,
   "PJT_PR_CREATEDATE"   date   DEFAULT SYSDATE   NOT NULL,
   "user_id"   varchar2(50)      NOT NULL,
   "PJT_PR_FIELD"   VARCHAR2(100)     NULL
);

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_NO" IS '�蹂 寃湲 踰';

COMMENT ON COLUMN "PJT_PR_BOARD"."user_no" IS 'seq';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_TITLE" IS '寃湲 �紐';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_START" IS '濡� ';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_PERIOD" IS ' 湲곌';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_DEADLINE" IS '몄紐⑥ 留媛';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_STACK" IS 'ъ 湲곗 ㅽ';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_FACE" IS '吏諛⑹';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CONTACT" IS '곕쎈갑踰';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CAPACITY" IS '濡� �';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CONTENT" IS '濡� 媛湲';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_RECRUITS" IS '紐⑥몄';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CREATEDATE" IS '寃湲 깅';

COMMENT ON COLUMN "PJT_PR_BOARD"."user_id" IS '깆 ID';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_FIELD" IS '紐⑥遺';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "SAVED_PJT_PR" (
   "user_no"   number      NOT NULL,
   "PJT_PR_SAVED_DATE"   DATE      NOT NULL,
   "PJT_PR_NO"   number      NOT NULL
);

COMMENT ON COLUMN "SAVED_PJT_PR"."user_no" IS 'seq';

COMMENT ON COLUMN "SAVED_PJT_PR"."PJT_PR_SAVED_DATE" IS '李 吏';

COMMENT ON COLUMN "SAVED_PJT_PR"."PJT_PR_NO" IS '蹂 寃湲 踰';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PSN_PR_BOARD" (
   "PSN_PR_NO"   number      NOT NULL,
   "PSN_PR_STACK"   VARCHAR2(300)      NULL,
   "PSN_PR_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "PSN_PR_AVLPRD"   VARCHAR2(100)    NULL,
   "PSN_PR_TITLE"   VARCHAR2(200)      NOT NULL,
   "PSN_PR_CONTACT"   VARCHAR2(500)      NULL,
   "user_id"   VARCHAR2(50)      NOT NULL,
   "user_no"   number      NOT NULL
);


COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_NO" IS '媛명蹂 寃湲 踰';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_STACK" IS '湲곗ㅽ';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_CONTENT" IS '湲곗媛湲';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_AVLPRD" IS '濡� 李몄 媛κ린媛';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_TITLE" IS '寃湲 �紐';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_CONTACT" IS '곕쎈갑踰';

COMMENT ON COLUMN "PSN_PR_BOARD"."user_id" IS '깆 ID';

COMMENT ON COLUMN "PSN_PR_BOARD"."user_no" IS 'seq';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "SAVED_PSN_PR" (
   "user_no"   number      NOT NULL,
   "PSN_PR_NO"   number      NOT NULL,
   "PSN_PR_SAVED_DATE"   DATE      NOT NULL
);

COMMENT ON COLUMN "SAVED_PSN_PR"."user_no" IS 'seq';

COMMENT ON COLUMN "SAVED_PSN_PR"."PSN_PR_SAVED_DATE" IS '李 吏';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PJT_PR_REPLY" (
   "PJT_PR_REPLY_NO"   number      NOT NULL,
   "PJT_PR_NO2"   number      NOT NULL,
   "PJT_PR_REPLY_DATE"   DATE      NOT NULL,
   "PJT_PR_REPLY_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "PJT_PR_NO"   number      NOT NULL,
   "user_id"   number      NOT NULL
);

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_NO2" IS '�蹂 寃湲 踰';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_REPLY_DATE" IS '湲깆';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_REPLY_CONTENT" IS '湲댁';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_NO" IS '李몄“寃湲踰';

COMMENT ON COLUMN "PJT_PR_REPLY"."user_id" IS '湲깆 ID';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PSN_PR_REPLY" (
   "PSN_PR_REPLY_NO"   number      NOT NULL,
   "PSN_PR_NO2"   number      NOT NULL,
   "PSN_PR_REPLY_DATE"   DATE      NOT NULL,
   "PSN_PR_REPLY_CONTENT"   VARCHAR2(4000)   NOT NULL,
   "PSN_PR_NO"   number      NOT NULL,
   "user_id"   number      NOT NULL
);

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_NO" IS '湲踰';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_NO2" IS '媛명蹂 寃湲 踰';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_DATE" IS '湲깆';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_CONTENT" IS '湲댁';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_NO" IS '李몄“寃湲踰';

COMMENT ON COLUMN "PSN_PR_REPLY"."user_id" IS '湲깆ID';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PROJECT" (
   "PJT_NO"   number      NOT NULL,
   "PJT_TITLE"   varchar2(100)      NOT NULL,
   "PJT_DATE"   date      NOT NULL,
   "PJT_ CONTENT"   varchar2(4000)      NULL,
   "PJT_CREATOR"   varchar2(100)      NOT NULL
);

COMMENT ON COLUMN "PROJECT"."PJT_NO" IS '濡� 踰';

COMMENT ON COLUMN "PROJECT"."PJT_TITLE" IS '濡� 대';

COMMENT ON COLUMN "PROJECT"."PJT_DATE" IS '濡� 깆';

COMMENT ON COLUMN "PROJECT"."PJT_ CONTENT" IS '濡� ㅻ';

COMMENT ON COLUMN "PROJECT"."PJT_CREATOR" IS '濡� 깆';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "MILESTONE" (
   "milest_no"   number      NULL,
   "user_no"   number      NOT NULL,
   "PJT_NO"   number      NOT NULL,
   "milest_title"   varchar2(100)      NOT NULL,
   "milest_createdate"   date      NULL,
   "milest_start"   date      NULL,
   "milest_end"   date      NULL,
   "milest_status"   varchar2(50)      NULL
);


COMMENT ON COLUMN "MILESTONE"."milest_no" IS '留쇱ㅽ 踰';

COMMENT ON COLUMN "MILESTONE"."user_no" IS 'seq';

COMMENT ON COLUMN "MILESTONE"."PJT_NO" IS '濡� 踰';

COMMENT ON COLUMN "MILESTONE"."milest_title" IS '留쇱ㅽ �紐';

COMMENT ON COLUMN "MILESTONE"."milest_createdate" IS '留쇱ㅽ 깆쇱';

COMMENT ON COLUMN "MILESTONE"."milest_start" IS '留쇱ㅽㅼ쇱';

COMMENT ON COLUMN "MILESTONE"."milest_end" IS '留쇱ㅽ 醫猷쇱';

COMMENT ON COLUMN "MILESTONE"."milest_status" IS '留쇱ㅽ ';

INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL, 1,  '쇳紐 濡� 援ы댁', '4留', '3ъ', '5珥', 'ORACLE,JAVA', 'FULL鍮硫', '湲ъ二쇱몄', '10紐댁', '�щ 쇳紐곗 媛諛怨 ⑸', '3紐', SYSDATE, 'user01', '諛깆');

INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL, 2,  '寃而ㅻ� 濡� 援ы댁', '415', '6媛', '4留', 'PYHTON,JAVASCRIPT', '硫', '移댄≪ㅽ梨諛', '5紐�', '�щ 寃而ㅻ�곕� 媛諛怨 ⑸', '4紐', SYSDATE, 'user02', '濡몄,諛깆');

INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL, 3,  'ъ대 濡� 援ы댁', '5以', '3媛', '5珥', 'JAVA,SPRING', 'FULL鍮硫', '010-1234-5678', '10紐', '�щ 移紐⑹빱裕ㅻ곕� 媛諛怨 ⑸', '5紐', SYSDATE, 'user03', '諛깆');

INSERT INTO SAVED_PJT_PR VALUES (1, SYSDATE, 1);
INSERT INTO SAVED_PJT_PR VALUES (2, SYSDATE,2);
INSERT INTO SAVED_PJT_PR VALUES (3, SYSDATE,3);

INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'AJAX,HTML,CSS,REACT', '듬', '4以~10留', '濡몄 媛諛', '梨', 'user01', 1 );
INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'ORACLE,JAVA,SPRING', '諛깆 濡� 李몄ш꼍� 留듬.','4珥 댄', '諛깆 媛諛', '010-1234-5678', 'user02', 2 );
INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'FLUTTER,JAVA,CSS,FIGMA', '듬', '4留~', 'ㅽ 媛諛', '梨', 'user02', 3 );

INSERT INTO SAVED_PSN_PR VALUES(1, 1, SYSDATE );

INSERT INTO SAVED_PSN_PR VALUES(2, 2, SYSDATE );

INSERT INTO SAVED_PSN_PR VALUES(3, 3, SYSDATE );

INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 1, SYSDATE, '� 愿ъ듬', 1, 1 );
INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 2, SYSDATE, '010-1234-5677 곕쎌＜몄', 2, 2 );
INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 3, SYSDATE, 'щ대낫ъ!', 3, 3 );

INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 1, SYSDATE, '濡� 援ы⑥댁?', 1, 1 );
INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 2, SYSDATE, '濡몃 媛ν몄?', 2, 2 );
INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 3, SYSDATE, '420쇰 媛ν몄?', 3, 3 );

INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'OVCOS', SYSDATE, 'щ━湲!', 'USER01' );
INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'FLUERYOUNG', SYSDATE, '苑湲!', 'USER02' );
INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'MEAL', SYSDATE, '諛λ㉨湲!', 'USER03' );

INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 1, 1, 'щ━湲고� 吏泥', SYSDATE, SYSDATE, '2023-07-15', 'OPEN');
INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 2, 2, 'FLUERYOUNG', SYSDATE, SYSDATE, '2023-09-17', 'OPEN');
INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 3, 3, 'ы濡�', SYSDATE, SYSDATE, '2023-04-01', 'CLOSED');

COMMIT;
