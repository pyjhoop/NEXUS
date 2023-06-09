-----------------肢薦------------------
--羨紗政煽税 乞窮砺戚鷺 貢 薦鉦繕闇 肢薦
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--羨紗政煽税 乞窮 獣碇什 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--羨紗政煽税 乞窮 坂 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--羨紗政煽税 乞窮 闘軒暗 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- 砺戚鷺 持失

create sequence seq_memberDelete
nocache;

---------------------- 噺据 砺戚鷺 -------------------------
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
	status	varchar2(3)	default 'Y' check(status in('Y','N')),
    connect_status char(1) default 'N' check(connect_status in('Y','N'))
);

create sequence seq_member
nocache;

--INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user01','pass01','酵尻層','切郊原什斗','email01@kh.co.kr',null,null,'O',SYSDATE,null,'Y','Y');
--INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user02','pass02','戚駁肯','DB税 含昔','email02@kh.co.kr',null,null,'O',SYSDATE,null,'Y','Y');
--INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user03','pass03','績旦薄','什覗元税瑛仙','email03@kh.co.kr',null,null,'O',SYSDATE,null,'Y','Y');


COMMENT ON COLUMN TB_MEMBER.USER_NO IS '噺据腰硲';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '焼戚巨';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '搾腔腰硲';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS '噺据 戚硯';
COMMENT ON COLUMN TB_MEMBER.USER_NICK IS '莞革績';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '戚五析';
COMMENT ON COLUMN TB_MEMBER.PROFILE IS '覗稽琶爽社';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '失紺';
COMMENT ON COLUMN TB_MEMBER.SOCIAL IS '社屡 食採';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '亜脊析';
COMMENT ON COLUMN TB_MEMBER.TOKEN IS '塘笛';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '纏盗食採';


---------------------- 敢什 砺戚鷺 -------------------------
create table tb_news (
	news_no	number primary key,
	user_no	number references tb_member,
	news_title	varchar2(1000)	NOT NULL,
	news_content CLOB 	NOT NULL,
	create_date date DEFAULT sysdate,
	update_date date DEFAULT sysdate,
	status	varchar2(3) default 'Y'	check(status in('Y','N')),
    thumbnail varchar2(100)
);

create sequence seq_news
nocache;

--insert into tb_news values(seq_news.nextval, 1,'神潅 馬欠 毘級陥','走馬旦拭辞 柵訓幻概澗汽 毘球革推',sysdate,sysdate,'Y',null);
--insert into tb_news values(seq_news.nextval, 2,'壕壱覗陥','繊宿獣娃昔汽 訊 剛聖 公股惟 杯艦猿!!!',sysdate,sysdate,'Y','asdf');
--insert into tb_news values(seq_news.nextval, 3,'焼艦 走馬旦拭辞 獣是岨 益幻 杯獣陥','薦獣娃拭 亀鐸馬壱 粛嬢食ばば',sysdate,sysdate,'Y','asdf');

comment on column tb_news.news_no is '敢什腰硲';
comment on column tb_news.user_no is '噺据腰硲';
comment on column tb_news.news_title is '薦鯉';
comment on column tb_news.news_content is '鎧遂';
comment on column tb_news.create_date is '持失析';
comment on column tb_news.update_date is '呪舛析';
comment on column tb_news.status is '雌殿';
comment on column tb_news.thumbnail is '醇革析';


---------------------- 敢什 奇越 -------------------------
create table tb_news_comments(
    news_no number references tb_news,
    comment_writer varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_date date default sysdate,
    status varchar2(3) default 'Y' check(status in('Y','N'))
);

--insert into tb_news_comments values(1, 'user01','せせせせ',sysdate,'Y');
--insert into tb_news_comments values(1, 'user02','せせせせ',sysdate,'Y');
--insert into tb_news_comments values(1, 'user03','せせせせ',sysdate,'Y');


comment on column tb_news_comments.news_no is '敢什腰硲';
comment on column tb_news_comments.comment_writer is '拙失切 焼戚巨';
comment on column tb_news_comments.comment_content is '鎧遂';
comment on column tb_news_comments.comment_date is '拙失析';
comment on column tb_news_comments.status is '雌殿';

---------------------- 敢什 択 -------------------------
create table tb_news_zzim(
    news_no	number,
    user_no number,
    update_date date,
    status char(1)
);

comment on column tb_news_zzim.news_no is '敢什腰硲';
comment on column tb_news_zzim.user_no is '噺据腰硲';
comment on column tb_news_zzim.update_date is '呪舛劾促';
comment on column tb_news_zzim.status is '雌殿';

---------------------- 得据 -------------------------
create table tb_collaborator(
    repository_no number not null,
    user_no number references tb_member,
    part varchar2(10)
);

insert into tb_collaborator values(1, 1, '得舌');
insert into tb_collaborator values(1,2,'得据');
insert into tb_collaborator values(1,3,'得据');

comment on column tb_collaborator.repository_no is '傾督走塘軒 腰硲';
comment on column tb_collaborator.user_no is '噺据腰硲';
comment on column tb_collaborator.part is '蝕拝';


---------------------- 超鍵希 -------------------------

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

CREATE SEQUENCE SEQ_CALENDAR NOCACHE;

COMMENT ON COLUMN TB_CALENDAR.CALENDAR_NO IS '析舛 腰硲';
COMMENT ON COLUMN TB_CALENDAR.USER_NO IS '噺据 腰硲';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_TITLE IS '析舛 薦鯉';
COMMENT ON COLUMN TB_CALENDAR.START_DATE IS '獣拙析';
COMMENT ON COLUMN TB_CALENDAR.END_DATE IS '原姶析';
COMMENT ON COLUMN TB_CALENDAR.DATE_COLOR IS '事雌';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_CONTENT IS '析舛 鎧遂';
COMMENT ON COLUMN TB_CALENDAR.CATEGORY IS '朝砺壱軒';
COMMENT ON COLUMN TB_CALENDAR.TEXT_COLOR IS '越事雌';
COMMENT ON COLUMN TB_CALENDAR.ALL_DAY IS '馬欠曽析';
COMMENT ON COLUMN TB_CALENDAR.STATUS IS '肢薦食採';



---------------------- 辰特号 -------------------------
CREATE TABLE TB_CHAT_ROOM(
   ROOM_NO NUMBER PRIMARY KEY,
   NUMBER_PARTICIPANTS NUMBER NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS VARCHAR2(3) DEFAULT 'Y' NOT NULL,
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   ROOM_TITLE VARCHAR2(100),
   LAST_CHAT VARCHAR2(3000),
   LAST_DATE DATE,
   CREATE_USER_NO NUMBER,
   ROOM_TITLE2 VARCHAR2(100),
   CHANGE_NAME2 VARCHAR2(500)
);
CREATE SEQUENCE SEQ_CHAT_ROOM NOCACHE;

COMMENT ON COLUMN TB_CHAT_ROOM.ROOM_NO IS '辰特号 腰硲';
COMMENT ON COLUMN TB_CHAT_ROOM.NUMBER_PARTICIPANTS IS '凧食昔据';
COMMENT ON COLUMN TB_CHAT_ROOM.CREATE_DATE IS '持失析切';
COMMENT ON COLUMN TB_CHAT_ROOM.STATUS IS '肢薦食採';



---------------------- 辰特号 噺据 -------------------------
CREATE TABLE TB_CHAT_USER(
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM, 
   STATUS VARCHAR2(3) DEFAULT 'S' CHECK(STATUS IN('S','G','H')),
   COUNT NUMBER DEFAULT 0
);

CREATE SEQUENCE SEQ_CHAT_USER NOCACHE;

COMMENT ON COLUMN TB_CHAT_USER.USER_NO IS '噺据 腰硲';
COMMENT ON COLUMN TB_CHAT_USER.ROOM_NO IS '辰特号 腰硲';





---------------------- 辰特 -------------------------
CREATE TABLE TB_CHATTING(
   CHATTING_NO NUMBER PRIMARY KEY,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM,
   CHATTING_CONTENT VARCHAR2(3000),
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   INViTE VARCHAR2(100)
);

CREATE SEQUENCE SEQ_CHATTING NOCACHE;

COMMENT ON COLUMN TB_CHATTING.CHATTING_NO IS '辰特 腰硲';
COMMENT ON COLUMN TB_CHATTING.ROOM_NO IS '辰特号 腰硲';
COMMENT ON COLUMN TB_CHATTING.CHATTING_CONTENT IS '五室走 鎧遂';
COMMENT ON COLUMN TB_CHATTING.ORIGIN_NAME IS '据沙 督析誤';
COMMENT ON COLUMN TB_CHATTING.CHANGE_NAME IS '郊駕 督析誤';
COMMENT ON COLUMN TB_CHATTING.CHAT_WRITER IS '拙失切';
COMMENT ON COLUMN TB_CHATTING.CREATE_DATE IS '拙失析切';




--------------------------------------------------
--------------     ISSUE 淫恵 	------------------	
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



COMMENT ON COLUMN TB_ISSUE.ISSUE_NO IS '戚輯腰硲(炎拭辞閤焼身)';
COMMENT ON COLUMN TB_ISSUE.LABEL IS '戚輯 虞婚';
COMMENT ON COLUMN TB_ISSUE.CREATE_DATE IS '戚輯 持失析';
COMMENT ON COLUMN TB_ISSUE.MODIFY_DATE IS '戚輯 呪舛析';
COMMENT ON COLUMN TB_ISSUE.CLOSE_DATE IS '戚輯 曽戟析';
COMMENT ON COLUMN TB_ISSUE.STATUS IS '戚輯 雌殿葵';
COMMENT ON COLUMN TB_ISSUE.REPOSITORY_ID IS '戚輯亜 紗廃 傾督走塘軒';
COMMENT ON COLUMN TB_ISSUE.MILESTONE_ID IS '戚輯亜 紗廃 原析什宕';
COMMENT ON COLUMN TB_ISSUE.ISSUE_TITLE IS '戚輯 薦鯉';
COMMENT ON COLUMN TB_ISSUE.ISSUE_CONTENT IS '戚輯 鎧遂';
COMMENT ON COLUMN TB_ISSUE.ISSUE_AUTHOR IS '戚輯 拙失切';
COMMENT ON COLUMN TB_ISSUE.ISSUE_ASSIGNEE IS '戚輯 拝雁 閤精 紫寓';
COMMENT ON COLUMN TB_ISSUE.PRIORITY IS '戚輯 酔識授是';

-- 獣碇什
CREATE SEQUENCE SEQ_ISSUE_NO NOCACHE;




ALTER TABLE TB_ISSUE
  ADD CONSTRAINT PK_ISSUE_NO PRIMARY KEY (ISSUE_NO);


ALTER TABLE TB_ISSUE
ADD CONSTRAINT FK_ISU_AUTHOR FOREIGN KEY(ISSUE_AUTHOR) REFERENCES TB_MEMBER (USER_NO);



-- 乞窮葵 隔奄 - 巨虹闘
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
				, '傾督走塘軒 ID 123'
				, '原析什宕ID 123'
				, '獄益 呪舛 推諺'
				, '嬢村姥煽村姥 呪舛背爽室推. 察軒推 覗稽詮闘 遭楳 災亜'
				, 1
				, '得据穿端' -- 得据穿端析凶澗 酔属 拝走
				, 1
			)
	;
				
				
				

		

-- NULL 皐壱 隔奄
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
				, '傾督走塘軒 ID 456'
				, '硝寓 奄管 姥薄'
				, '馬馬馬�K 設 背醤鎧醤走 章推'
				, 1 -- 噺据 幻窮 焼戚巨 隔嬢醤背唇
                , 1

			)
	;

	
-- 乞窮葵 隔奄 - 呪舛獄穿
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
				, '傾督走塘軒 ID 78910'
				, '原析什宕ID 456'
				, '戚輯 嬢形雀 美'
				, '美美 披披 窪聖廃陥 畠畠畠'
				, 3
				, 'user02' -- 得据穿端析凶澗 酔属 拝走
				, 2
			)
	;
	
	
	
--------------------------------------------------
-------------    ISSUE_REPLY 淫恵 	--------------
--------------------------------------------------

CREATE TABLE TB_ISU_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	REPLY_CONTENT	VARCHAR2(1000)	NOT NULL,
	REPLY_WRITER	NUMBER,
	CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REF_ISSUE_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_ISU_REPLY.REPLY_NO IS '奇越 腰硲';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_CONTENT IS '奇越 鎧遂';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_WRITER IS '奇越 拙失切';
COMMENT ON COLUMN TB_ISU_REPLY.CREATE_DATE IS '奇越 拙失析';
COMMENT ON COLUMN TB_ISU_REPLY.STATUS IS '奇越 雌殿葵';
COMMENT ON COLUMN TB_ISU_REPLY.REF_ISSUE_NO IS '凧繕 戚輯 腰硲';

--獣碇什
CREATE SEQUENCE SEQ_ISU_REPLY_NO NOCACHE;



ALTER TABLE TB_ISU_REPLY
  ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_ISSUENO FOREIGN KEY(REF_ISSUE_NO) REFERENCES TB_ISSUE (ISSUE_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES TB_MEMBER (USER_NO);


-- 乞窮葵 隔奄

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
				, '戚暗 馬奄夙嬢遂 眼雁 郊蚊爽室遂'
				, 1
				, DEFAULT
				, DEFAULT
				, 1
			)
	;


-- NULL 薦須 葵 隔奄


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
				, '戚惟 限蟹 粛嬢遂~'
				, 2
				, '20230314'
				, 2
			)
	;
	
	
-- 乞窮葵 隔奄 - 呪舛獄穿

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
				, '限焼唇?? 戚惟???'
				, 1
				, SYSDATE
				, 'N'
				, 1
			)
	;
	
-- 乞窮葵 隔奄 - 呪舛獄穿2

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
				, '砧腰属奇越 砺什闘掻脊艦��'
				, 1
				, SYSDATE
				, DEFAULT
				, 2
			)
	;
	



--------------------------------------------------
-------------    叔獣娃 硝顕 辞搾什 淫恵 	--------------
--------------------------------------------------	


CREATE TABLE TB_NOTIFICATIONS (
	user_no	number	NOT NULL,
	category_no	number	CHECK (category_no IN (1,2,3,4,5,6)),
	noti_content	varchar2(1000)	NOT NULL,
	ocu_time	date	NOT NULL,
	post_no 	number	NOT NULL,
	STATUS char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) 
);

-- 叔獣娃 硝顕 曽 喚袈陥亜 脅檎 陥 N坦軒? 焼還 送羨 X 刊献闇幻 N 坦軒??

COMMENT ON COLUMN TB_NOTIFICATIONS.user_no IS '噺据 腰硲';
COMMENT ON COLUMN TB_NOTIFICATIONS.category_no IS '朝砺壱軒 腰硲 (戚輯,庁姥,敢什,鯵昔畠左,覗稽詮闘,原析什宕)';
COMMENT ON COLUMN TB_NOTIFICATIONS.noti_content IS '叔獣娃 硝顕 鎧遂';
COMMENT ON COLUMN TB_NOTIFICATIONS.ocu_time IS '叔獣娃 硝顕 降持 獣娃';
COMMENT ON COLUMN TB_NOTIFICATIONS.post_no IS '戚輯 腰硲';
COMMENT ON COLUMN TB_NOTIFICATIONS.STATUS IS '叔獣娃 硝顕 雌殿葵';

ALTER TABLE TB_NOTIFICATIONS
  ADD CONSTRAINT PK_USER_NO PRIMARY KEY (user_no);
  
  
 -- 乞窮葵隔奄 
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
				, 'XXX還戚 庁姥 重短聖 梅柔艦陥'
				, SYSDATE
				, 2 -- 益 噺据税 朝砺壱軒拭 背雁鞠澗 戚輯研 嬢胸惟 亜閃神走? 鎮軍拭 隔澗惟 限蟹?
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
				, 'XXX還戚 噺据還聖 @@@ 覗稽詮闘 戚輯拭 去系梅柔艦陥'
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
				, '### 覗稽詮闘拭 凧亜鞠醸柔艦陥.'
				, '20230403'
				, 1
				, 'N'
			)
	;
    
    


CREATE SEQUENCE SEQ_INQUIRY
NOCACHE;

CREATE SEQUENCE SEQ_QUESTION
NOCACHE;

------------- 霜庚-----------------
CREATE TABLE TB_QUESTION (
	question_no number primary key,
	inquiry_no number NOT NULL,
	question_content varchar2(4000) NULL,
	question_date	date NOT NULL,
	user_no number NOT NULL
);



COMMENT ON COLUMN TB_QUESTION.question_no IS '霜庚 腰硲';
COMMENT ON COLUMN TB_QUESTION.inquiry_no IS '庚税 腰硲';
COMMENT ON COLUMN TB_QUESTION.question_content IS '霜庚 鎧遂';
COMMENT ON COLUMN TB_QUESTION.question_date IS '霜庚 劾促';
COMMENT ON COLUMN TB_QUESTION.user_no IS '庚税廃 噺据 腰硲';

INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.nextval, '還焼 企岩背', SYSDATE, 1);
INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.currval, '鎖爽薦拭 鯵姥顕 せ', SYSDATE, 1);
INSERT INTO TB_QUESTION VALUES(SEQ_QUESTION.nextval, SEQ_INQUIRY.nextval, '纏盗 嬢追馬蟹推', SYSDATE, 2);

------------------- 庁姥 ------------------------------

CREATE TABLE TB_FRIEND (
	user_no number references TB_MEMBER on delete cascade,
	user_add_no number references TB_MEMBER on delete cascade,
	user_blocked varchar2(3) DEFAULT 'N' NOT NULL,
    primary key(user_no, user_add_no)
);

COMMENT ON COLUMN TB_FRIEND.user_no IS '庁蓄 左浬戚 腰硲';
COMMENT ON COLUMN TB_FRIEND.user_add_no IS '庁蓄 閤精戚 腰硲';
COMMENT ON COLUMN TB_FRIEND.user_blocked IS '託舘  食採("Y", "N")';

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
   "PJT_PR_CREATEDATE"   VARCHAR2(500)     NOT NULL,
    "USER_NO"    NUMBER REFERENCES TB_MEMBER,
   "PJT_PR_FIELD"   VARCHAR2(100)     NULL,
   "COUNT" NUMBER NOT NULL
);

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_NO" IS '覗詮畠左 惟獣越 腰硲';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_TITLE" IS '惟獣越 薦鯉';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_START" IS '覗稽詮闘 獣拙析';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_PERIOD" IS '森雌 奄娃';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_DEADLINE" IS '昔据乞増 原姶析';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_STACK" IS '紫遂 奄綬 什澱';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_FACE" IS '遭楳号縦';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CONTACT" IS '尻喰号狛';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CAPACITY" IS '覗稽詮闘 舛据';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CONTENT" IS '覗稽詮闘 社鯵越';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_RECRUITS" IS '乞増昔据';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_CREATEDATE" IS '惟獣越 去系析';

COMMENT ON COLUMN "PJT_PR_BOARD"."USER_NO" IS '噺据腰硲';

COMMENT ON COLUMN "PJT_PR_BOARD"."PJT_PR_FIELD" IS '乞増歳醤';

COMMENT ON COLUMN "PJT_PR_BOARD"."COUNT" IS '繕噺呪';



INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL,   '珠芭侯 覗稽詮闘 得据姥背推', '4杉源', '3含舛亀', '5杉段', 'ORACLE,JAVA', 'FULL搾企檎', '奇越含焼爽室推', '10誤鎧須', '煽費澗 珠芭侯聖 鯵降馬壱切 杯艦陥', '3誤',  to_char(sysdate,'yy/MM/dd HH24:mi'), 1, '拷殖球',0);

INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL,   '惟績朕溝艦銅 覗稽詮闘 得据姥背推', '4杉15析', '6鯵杉', '4杉源', 'PYHTON,JAVASCRIPT', '企檎', '朝套神蚤辰特号', '5誤舛亀', '煽費澗 惟績朕溝艦銅研 鯵降馬壱切 杯艦陥', '4誤',  to_char(sysdate,'yy/MM/dd HH24:mi'), 2, '覗経闘殖球,拷殖球',0);

INSERT INTO PJT_PR_BOARD VALUES(SEQ_PJT_PR.NEXTVAL,  '紫戚球 覗稽詮闘 得据姥背推', '5杉掻授', '3鯵杉', '5杉段', 'JAVA,SPRING', 'FULL搾企檎', '010-1234-5678', '10誤', '煽費澗 庁鯉朕溝艦銅研 鯵降馬壱切 杯艦陥', '5誤',  to_char(sysdate,'yy/MM/dd HH24:mi'), 3, '拷殖球',0);

-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "SAVED_PJT_PR" (
   "user_no"   number      NOT NULL,
   "PJT_PR_SAVED_DATE"   DATE      NOT NULL,
   "PJT_PR_NO"   number      NOT NULL
);

COMMENT ON COLUMN "SAVED_PJT_PR"."user_no" IS 'seq';

COMMENT ON COLUMN "SAVED_PJT_PR"."PJT_PR_SAVED_DATE" IS '択廃 劾促';

COMMENT ON COLUMN "SAVED_PJT_PR"."PJT_PR_NO" IS '畠左 惟獣越 腰硲';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PSN_PR_BOARD (
   PSN_PR_NO   number    PRIMARY KEY,
   PSN_PR_STACK   VARCHAR2(300)      NULL,
   PSN_PR_CONTENT   VARCHAR2(4000),
   PSN_PR_AVLPRD   VARCHAR2(100)    NULL,
   PSN_PR_TITLE   VARCHAR2(198)      NOT NULL,
   PSN_PR_CONTACT   VARCHAR2(500)    ,
   CREATE_DATE  VARCHAR2(500) NOT NULL,
   USER_NO    NUMBER REFERENCES TB_MEMBER,
   CATEGORY VARCHAR2(100),
   COUNT NUMBER
);

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_NO" IS '鯵昔畠左 惟獣越 腰硲';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_STACK" IS '奄綬什澱';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_CONTENT" IS '切奄社鯵越';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_AVLPRD" IS '覗稽詮闘 凧食 亜管奄娃';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_TITLE" IS '惟獣越 薦鯉';

COMMENT ON COLUMN "PSN_PR_BOARD"."PSN_PR_CONTACT" IS '尻喰号狛';

COMMENT ON COLUMN "PSN_PR_BOARD"."USER_NO" IS '噺据腰硲';

COMMENT ON COLUMN "PSN_PR_BOARD"."CATEGORY" IS '朝砺壱軒';

COMMENT ON COLUMN "PSN_PR_BOARD"."COUNT" IS '繕噺呪';

INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'AJAX,HTML,CSS,REACT', '切重赤柔艦陥', '4杉掻授~10杉源', '覗経闘殖球 鯵降切脊艦陥', '辰特', to_char(sysdate,'yy/MM/dd HH24:mi'),  1, '拷殖球', 2 );
INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'ORACLE,JAVA,SPRING', '拷殖球 覗稽詮闘 凧食井径 弦柔艦陥.','4杉段 戚板', '拷殖球 鯵降切脊艦陥', '010-1234-5678', to_char(sysdate,'yy/MM/dd HH24:mi'), 2, '熱什澱', 12 );
INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'FLUTTER,JAVA,CSS,FIGMA', '切重赤柔艦陥', '4杉源~', '熱什澱 鯵降切脊艦陥', '辰特',  to_char(sysdate,'yy/MM/dd HH24:mi'), 3, '乞郊析', 39);
INSERT INTO PSN_PR_BOARD VALUES(SEQ_PSN_PR.NEXTVAL, 'FLUTTER,JAVA,CSS,FIGMA', '切重赤柔艦陥', '4杉源~', '熱什澱 鯵降切脊艦陥', '辰特',  to_char(sysdate,'yy/MM/dd HH24:mi'), 4, '乞郊析', 67);

-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "SAVED_PSN_PR" (
   "user_no"   number      NOT NULL,
   "PSN_PR_NO"   number      NOT NULL,
   "PSN_PR_SAVED_DATE"   DATE      NOT NULL
);

COMMENT ON COLUMN "SAVED_PSN_PR"."user_no" IS 'seq';

COMMENT ON COLUMN "SAVED_PSN_PR"."PSN_PR_SAVED_DATE" IS '択廃 劾促';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PJT_PR_REPLY" (
   "PJT_PR_REPLY_NO"   number      NOT NULL,
   "PJT_PR_NO2"   number      NOT NULL,
   "PJT_PR_REPLY_DATE"   DATE      NOT NULL,
   "PJT_PR_REPLY_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "PJT_PR_NO"   number      NOT NULL,
   "user_id"   number      NOT NULL
);

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_NO2" IS '覗詮畠左 惟獣越 腰硲';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_REPLY_DATE" IS '奇越拙失析';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_REPLY_CONTENT" IS '奇越鎧遂';

COMMENT ON COLUMN "PJT_PR_REPLY"."PJT_PR_NO" IS '凧繕惟獣越腰硲';

COMMENT ON COLUMN "PJT_PR_REPLY"."user_id" IS '奇越拙失切 ID';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PSN_PR_REPLY" (
   "PSN_PR_REPLY_NO"   number      NOT NULL,
   "PSN_PR_NO2"   number      NOT NULL,
   "PSN_PR_REPLY_DATE"   DATE      NOT NULL,
   "PSN_PR_REPLY_CONTENT"   VARCHAR2(4000)   NOT NULL,
   "PSN_PR_NO"   number      NOT NULL,
   "user_id"   number      NOT NULL
);

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_NO" IS '奇越腰硲';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_NO2" IS '鯵昔畠左 惟獣越 腰硲';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_DATE" IS '奇越拙失析';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_REPLY_CONTENT" IS '奇越鎧遂';

COMMENT ON COLUMN "PSN_PR_REPLY"."PSN_PR_NO" IS '凧繕惟獣越腰硲';

COMMENT ON COLUMN "PSN_PR_REPLY"."user_id" IS '奇越拙失切ID';
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE "PROJECT" (
   "PJT_NO"   number      NOT NULL,
   "PJT_TITLE"   varchar2(100)      NOT NULL,
   "PJT_DATE"   date      NOT NULL,
   "PJT_ CONTENT"   varchar2(4000)      NULL,
   "PJT_CREATOR"   varchar2(100)      NOT NULL
);

COMMENT ON COLUMN "PROJECT"."PJT_NO" IS '覗稽詮闘 腰硲';

COMMENT ON COLUMN "PROJECT"."PJT_TITLE" IS '覗稽詮闘 戚硯';

COMMENT ON COLUMN "PROJECT"."PJT_DATE" IS '覗稽詮闘 持失析';

COMMENT ON COLUMN "PROJECT"."PJT_ CONTENT" IS '覗稽詮闘 竺誤';

COMMENT ON COLUMN "PROJECT"."PJT_CREATOR" IS '覗稽詮闘 持失切';
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


COMMENT ON COLUMN "MILESTONE"."milest_no" IS '原析什宕 腰硲';

COMMENT ON COLUMN "MILESTONE"."user_no" IS 'seq';

COMMENT ON COLUMN "MILESTONE"."PJT_NO" IS '覗稽詮闘 腰硲';

COMMENT ON COLUMN "MILESTONE"."milest_title" IS '原析什宕 薦鯉';

COMMENT ON COLUMN "MILESTONE"."milest_createdate" IS '原析什宕 拙失析切';

COMMENT ON COLUMN "MILESTONE"."milest_start" IS '原析什宕獣拙析切';

COMMENT ON COLUMN "MILESTONE"."milest_end" IS '原析什宕 曽戟析切';

COMMENT ON COLUMN "MILESTONE"."milest_status" IS '原析什宕 雌殿';


INSERT INTO SAVED_PJT_PR VALUES (1, SYSDATE, 1);
INSERT INTO SAVED_PJT_PR VALUES (2, SYSDATE,2);
INSERT INTO SAVED_PJT_PR VALUES (3, SYSDATE,3);



INSERT INTO SAVED_PSN_PR VALUES(1, 1, SYSDATE );

INSERT INTO SAVED_PSN_PR VALUES(2, 2, SYSDATE );

INSERT INTO SAVED_PSN_PR VALUES(3, 3, SYSDATE );

INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 1, SYSDATE, '煽 淫宿赤柔艦陥', 1, 1 );
INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 2, SYSDATE, '010-1234-5677 尻喰爽室推', 2, 2 );
INSERT INTO PJT_PR_REPLY VALUES (SEQ_PJT_PR_REPLY.NEXTVAL, 3, SYSDATE, '仙衡嬢左食推!', 3, 3 );

INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 1, SYSDATE, '覗稽詮闘 姥馬写嬢推?', 1, 1 );
INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 2, SYSDATE, '覗経闘亀 亜管馬室推?', 2, 2 );
INSERT INTO PSN_PR_REPLY VALUES(SEQ_PSN_PR_REPLY.NEXTVAL, 3, SYSDATE, '4杉20析採斗 亜管馬室推?', 3, 3 );

INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'OVCOS', SYSDATE, '含軒奄!', 'USER01' );
INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'FLUERYOUNG', SYSDATE, '寡独奄!', 'USER02' );
INSERT INTO PROJECT VALUES(SEQ_PROJECT_NO.NEXTVAL, 'MEAL', SYSDATE, '剛股奄!', 'USER03' );

INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 1, 1, '含軒奄覗詮 遭担亀', SYSDATE, SYSDATE, '2023-07-15', 'OPEN');
INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 2, 2, 'FLUERYOUNG', SYSDATE, SYSDATE, '2023-09-17', 'OPEN');
INSERT INTO MILESTONE VALUES(SEQ_MILEST_NO.NEXTVAL, 3, 3, '縦紫覗稽詮闘', SYSDATE, SYSDATE, '2023-04-01', 'CLOSED');


---------------------- TB_REPOSITORY -------------------------------------
CREATE TABLE TB_REPOSITORY(
    REPO_NO NUMBER,
    USER_NO NUMBER REFERENCES TB_MEMBER,
    USER_NAME VARCHAR2(1000),
    REPO_NAME VARCHAR2(1000),
    REPO_CONTENT VARCHAR2(4000),
    REPO_STATUS VARCHAR2(10),
    CREATE_DATE DATE DEFAULT SYSDATE,
    ACCESS_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(3) DEFAULT 'N',
    CONSTRAINT MULTIPK PRIMARY KEY(USER_NO, USER_NAME, REPO_NAME)
);

COMMENT ON COLUMN TB_REPOSITORY.REPO_NO IS 'REPOSITORY_NO';
COMMENT ON COLUMN TB_REPOSITORY.USER_NO IS '政煽 腰硲';
COMMENT ON COLUMN TB_REPOSITORY.USER_NAME IS 'REPO社政切誤';
COMMENT ON COLUMN TB_REPOSITORY.REPO_NAME IS 'REPO 戚硯';
COMMENT ON COLUMN TB_REPOSITORY.REPO_CONTENT IS 'REPO 鎧遂';
COMMENT ON COLUMN TB_REPOSITORY.REPO_STATUS IS 'REPO 因鯵 雌殿';
COMMENT ON COLUMN TB_REPOSITORY.STATUS IS '肢薦食採';

CREATE SEQUENCE SEQ_REPOSITORY NOCACHE;




COMMIT;





