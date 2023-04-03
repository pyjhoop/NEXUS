-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- 테이블 생성

---------------------- 회원 테이블 -------------------------
create table tb_member(
    user_no	number primary key,
	user_id	varchar2(50) not null unique,
	user_pwd varchar2(100),
	user_name varchar2(100)	NOT NULL,
	user_nick varchar2(100),
	email varchar2(100),
	profile	varchar2(200),
	gender char(3) check(gender in('M','W','O')),
	social char(3) check(social in('K','G','O')),
	enroll_date	date default sysdate,
	token	varchar2(200),
	status	char(3)	default 'Y' check(status in('Y','N'))
);

create sequence seq_member
nocache;

INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user01','pass01','박연준','자바마스터','email01@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user02','pass02','이혜민','DB의 달인','email02@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user03','pass03','임철현','스프링의귀재','email03@kh.co.kr',null,null,'O',SYSDATE,null,'Y');


COMMENT ON COLUMN TB_MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '아이디';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS '회원 이름';
COMMENT ON COLUMN TB_MEMBER.USER_NICK IS '닉네임';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN TB_MEMBER.PROFILE IS '프로필주소';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '성별';
COMMENT ON COLUMN TB_MEMBER.SOCIAL IS '소셜 여부';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '가입일';
COMMENT ON COLUMN TB_MEMBER.TOKEN IS '토큰';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '탈퇴여부';


---------------------- 뉴스 테이블 -------------------------
create table tb_news (
	news_no	number primary key,
	user_no	number references tb_member,
	news_title	varchar2(1000)	NOT NULL,
	news_content varchar2(4000)	NOT NULL,
	create_date date DEFAULT sysdate,
	update_date date DEFAULT sysdate,
	status	char(3) default 'Y'	check(status in('Y','N')),
	origin_name	varchar2(100)	NULL,
	change_name	varchar2(100)	NULL
);

create sequence seq_news
nocache;

insert into tb_news values(seq_news.nextval, 1,'오늘 하루 힘들다','지하철에서 빌런만났는데 힘드네요',sysdate,sysdate,'Y','qwe','qwe');
insert into tb_news values(seq_news.nextval, 2,'배고프다','점심시간인데 왜 밥을 못먹게 합니까!!!',sysdate,sysdate,'Y','asdf','asdf');
insert into tb_news values(seq_news.nextval, 3,'아니 지하철에서 시위좀 그만 합시다','제시간에 도착하고 싶어여ㅠㅠ',sysdate,sysdate,'Y','qwe','qwe');

comment on column tb_news.news_no is '뉴스번호';
comment on column tb_news.user_no is '회원번호';
comment on column tb_news.news_title is '제목';
comment on column tb_news.news_content is '내용';
comment on column tb_news.create_date is '생성일';
comment on column tb_news.update_date is '수정일';
comment on column tb_news.status is '상태';
comment on column tb_news.origin_name is '기존 파일명';
comment on column tb_news.change_name is '변경된 파일명';


---------------------- 뉴스 댓글 -------------------------
create table tb_news_comments(
    news_no number references tb_news,
    comment_writer varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_date date default sysdate,
    status char(3) default 'Y' check(status in('Y','N'))
);

insert into tb_news_comments values(1, 'user01','ㅋㅋㅋㅋ',sysdate,'Y');
insert into tb_news_comments values(1, 'user02','ㅋㅋㅋㅋ',sysdate,'Y');
insert into tb_news_comments values(1, 'user03','ㅋㅋㅋㅋ',sysdate,'Y');

comment on column tb_news_comments.news_no is '뉴스번호';
comment on column tb_news_comments.comment_writer is '작성자 아이디';
comment on column tb_news_comments.comment_content is '내용';
comment on column tb_news_comments.comment_date is '작성일';
comment on column tb_news_comments.status is '상태';

---------------------- 팀원 -------------------------
create table tb_collaborator(
    repository_no number not null,
    user_no number references tb_member,
    part varchar2(10)
);

insert into tb_collaborator values(1, 1, '팀장');
insert into tb_collaborator values(1,2,'팀원');
insert into tb_collaborator values(1,3,'팀원');

comment on column tb_collaborator.repository_no is '레파지토리 번호';
comment on column tb_collaborator.user_no is '회원번호';
comment on column tb_collaborator.part is '역할';


---------------------- 캘린더 카테고리 -------------------------
CREATE TABLE TB_CALENDAR_CATEGORY(
   CATEGORY_NO NUMBER PRIMARY KEY,
   CATEGORY_NAME VARCHAR2(30)
);

COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NO IS '카테고리 번호';
COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NAME IS '카테고리 이름';

INSERT INTO TB_CALENDAR_CATEGORY VALUES(1,'업무');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(2,'개인 일정');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(3,'소셜 일정');

---------------------- 캘린더 -------------------------

CREATE TABLE TB_CALENDAR(
   USER_NO NUMBER REFERENCES TB_MEMBER,
   SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
   START_DATE DATE NOT NULL,
   END_DATE DATE NOT NULL,
   DATE_COLOR VARCHAR2(30),
   SCHEDULE_CONTENT VARCHAR2(1000),
   CATEGORY_NO NUMBER REFERENCES TB_CALENDAR_CATEGORY
);

COMMENT ON COLUMN TB_CALENDAR.USER_NO IS '회원 번호';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_TITLE IS '일정 제목';
COMMENT ON COLUMN TB_CALENDAR.START_DATE IS '시작일';
COMMENT ON COLUMN TB_CALENDAR.END_DATE IS '마감일';
COMMENT ON COLUMN TB_CALENDAR.DATE_COLOR IS '색상';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_CONTENT IS '일정 내용';
COMMENT ON COLUMN TB_CALENDAR.CATEGORY_NO IS '카테고리 번호';

INSERT INTO TB_CALENDAR VALUES(1,'프로젝트 회의',SYSDATE,'2023-04-04','빨강','5시 NEXUS 회의',1);
INSERT INTO TB_CALENDAR VALUES(2,'청소하기',SYSDATE,'2023-04-04','파랑','3시 집청소',2);
INSERT INTO TB_CALENDAR VALUES(3,'준호 생일','2023-05-05','2023-05-05','초록','준호의 생일',3);


---------------------- 채팅방 -------------------------
CREATE TABLE TB_CHAT_ROOM(
   ROOM_NO NUMBER PRIMARY KEY,
   NUMBER_PARTICIPANTS NUMBER NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS CHAR(3) DEFAULT 'Y' NOT NULL
);
COMMENT ON COLUMN TB_CHAT_ROOM.ROOM_NO IS '채팅방 번호';
COMMENT ON COLUMN TB_CHAT_ROOM.NUMBER_PARTICIPANTS IS '참여인원';
COMMENT ON COLUMN TB_CHAT_ROOM.CREATE_DATE IS '생성일자';
COMMENT ON COLUMN TB_CHAT_ROOM.STATUS IS '삭제여부';

INSERT INTO TB_CHAT_ROOM VALUES(1,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(2,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(3,2,SYSDATE,'Y');

---------------------- 채팅방 회원 -------------------------
CREATE TABLE TB_CHAT_USER(
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM 
);
COMMENT ON COLUMN TB_CHAT_USER.USER_NO IS '회원 번호';
COMMENT ON COLUMN TB_CHAT_USER.ROOM_NO IS '채팅방 번호';

INSERT INTO TB_CHAT_USER VALUES(1,2);
INSERT INTO TB_CHAT_USER VALUES(2,1);
INSERT INTO TB_CHAT_USER VALUES(3,3);


---------------------- 채팅 -------------------------
CREATE TABLE TB_CHATTING(
   CHATTING_NO NUMBER PRIMARY KEY,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM,
   CHATTING_CONTENT VARCHAR2(3000),
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   CHAT_WRITER VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN TB_CHATTING.CHATTING_NO IS '채팅 번호';
COMMENT ON COLUMN TB_CHATTING.ROOM_NO IS '채팅방 번호';
COMMENT ON COLUMN TB_CHATTING.CHATTING_CONTENT IS '메세지 내용';
COMMENT ON COLUMN TB_CHATTING.ORIGIN_NAME IS '원본 파일명';
COMMENT ON COLUMN TB_CHATTING.CHANGE_NAME IS '바뀐 파일명';
COMMENT ON COLUMN TB_CHATTING.CHAT_WRITER IS '작성자';
COMMENT ON COLUMN TB_CHATTING.CREATE_DATE IS '작성일자';


INSERT INTO TB_CHATTING VALUES(1,1,'ㅎㅇㅎㅇ',NULL,NULL,'연준',SYSDATE);
INSERT INTO TB_CHATTING VALUES(2,1,'ㅋㅋㅋㅋ',NULL,NULL,'혜민',SYSDATE);
INSERT INTO TB_CHATTING VALUES(3,2,'철현의 코딩일지..',NULL,NULL,'철현',SYSDATE);

--------------------------------------------------
--------------     ISSUE 관련 	------------------	
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



COMMENT ON COLUMN TB_ISSUE.ISSUE_NO IS '이슈번호(깃에서받아옴)';
COMMENT ON COLUMN TB_ISSUE.LABEL IS '이슈 라벨';
COMMENT ON COLUMN TB_ISSUE.CREATE_DATE IS '이슈 생성일';
COMMENT ON COLUMN TB_ISSUE.MODIFY_DATE IS '이슈 수정일';
COMMENT ON COLUMN TB_ISSUE.CLOSE_DATE IS '이슈 종료일';
COMMENT ON COLUMN TB_ISSUE.STATUS IS '이슈 상태값';
COMMENT ON COLUMN TB_ISSUE.REPOSITORY_ID IS '이슈가 속한 레파지토리';
COMMENT ON COLUMN TB_ISSUE.MILESTONE_ID IS '이슈가 속한 마일스톤';
COMMENT ON COLUMN TB_ISSUE.ISSUE_TITLE IS '이슈 제목';
COMMENT ON COLUMN TB_ISSUE.ISSUE_CONTENT IS '이슈 내용';
COMMENT ON COLUMN TB_ISSUE.ISSUE_AUTHOR IS '이슈 작성자';
COMMENT ON COLUMN TB_ISSUE.ISSUE_ASSIGNEE IS '이슈 할당 받은 사람';
COMMENT ON COLUMN TB_ISSUE.PRIORITY IS '이슈 우선순위';

-- 시퀀스
CREATE SEQUENCE SEQ_ISSUE_NO NOCACHE;




ALTER TABLE TB_ISSUE
  ADD CONSTRAINT PK_ISSUE_NO PRIMARY KEY (ISSUE_NO);


ALTER TABLE TB_ISSUE
ADD CONSTRAINT FK_ISU_AUTHOR FOREIGN KEY(ISSUE_AUTHOR) REFERENCES TB_MEMBER (USER_NO);



-- 모든값 넣기 - 디폴트
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
				, '레파지토리 ID 123'
				, '마일스톤ID 123'
				, '버그 수정 요망'
				, '어쩌구저쩌구 수정해주세요. 빨리요 프로젝트 진행 불가'
				, 1
				, '팀원전체' -- 팀원전체일때는 우째 할지
				, 1
			)
	;
				
				
				

		

-- NULL 빼고 넣기
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
				, '레파지토리 ID 456'
				, '알람 기능 구현'
				, '하하하핳 잘 해야내야지 암요'
				, 1 -- 회원 만든 아이디 넣어야해염
                , 1

			)
	;

	
-- 모든값 넣기 - 수정버전
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
				, '레파지토리 ID 78910'
				, '마일스톤ID 456'
				, '이슈 어려웡 힝'
				, '힝힝 흉흉 랩을한다 홍홍홍'
				, 3
				, 'user02' -- 팀원전체일때는 우째 할지
				, 2
			)
	;
	
	
	
--------------------------------------------------
-------------    ISSUE_REPLY 관련 	--------------
--------------------------------------------------

CREATE TABLE TB_ISU_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	REPLY_CONTENT	VARCHAR2(1000)	NOT NULL,
	REPLY_WRITER	NUMBER,
	CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REF_ISSUE_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_ISU_REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_WRITER IS '댓글 작성자';
COMMENT ON COLUMN TB_ISU_REPLY.CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN TB_ISU_REPLY.STATUS IS '댓글 상태값';
COMMENT ON COLUMN TB_ISU_REPLY.REF_ISSUE_NO IS '참조 이슈 번호';

--시퀀스
CREATE SEQUENCE SEQ_ISU_REPLY_NO NOCACHE;



ALTER TABLE TB_ISU_REPLY
  ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_ISSUENO FOREIGN KEY(REF_ISSUE_NO) REFERENCES TB_ISSUE (ISSUE_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES TB_MEMBER (USER_NO);


-- 모든값 넣기

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
				, '이거 하기싫어용 담당 바꿔주세용'
				, 1
				, DEFAULT
				, DEFAULT
				, 1
			)
	;


-- NULL 제외 값 넣기


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
				, '이게 맞나 싶어용~'
				, 2
				, '20230314'
				, 2
			)
	;
	
	
-- 모든값 넣기 - 수정버전

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
				, '맞아염?? 이게???'
				, 1
				, SYSDATE
				, 'N'
				, 1
			)
	;
	
-- 모든값 넣기 - 수정버전2

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
				, '두번째댓글 테스트중입니댱'
				, 1
				, SYSDATE
				, DEFAULT
				, 2
			)
	;
	



--------------------------------------------------
-------------    실시간 알림 서비스 관련 	--------------
--------------------------------------------------	


CREATE TABLE TB_NOTIFICATIONS (
	user_no	number	NOT NULL,
	category_no	number	CHECK (category_no IN (1,2,3,4,5,6)),
	noti_content	varchar2(1000)	NOT NULL,
	ocu_time	date	NOT NULL,
	post_no 	number	NOT NULL,
	STATUS char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) 
);

-- 실시간 알림 종 눌렀다가 떼면 다 N처리? 아님 직접 X 누른건만 N 처리??

COMMENT ON COLUMN TB_NOTIFICATIONS.user_no IS '회원 번호';
COMMENT ON COLUMN TB_NOTIFICATIONS.category_no IS '카테고리 번호 (이슈,친구,뉴스,개인홍보,프로젝트,마일스톤)';
COMMENT ON COLUMN TB_NOTIFICATIONS.noti_content IS '실시간 알림 내용';
COMMENT ON COLUMN TB_NOTIFICATIONS.ocu_time IS '실시간 알림 발생 시간';
COMMENT ON COLUMN TB_NOTIFICATIONS.post_no IS '이슈 번호';
COMMENT ON COLUMN TB_NOTIFICATIONS.STATUS IS '실시간 알림 상태값';

ALTER TABLE TB_NOTIFICATIONS
  ADD CONSTRAINT PK_USER_NO PRIMARY KEY (user_no);
  
  
 -- 모든값넣기 
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
				, 'XXX님이 친구 신청을 했습니다'
				, SYSDATE
				, 2 -- 그 회원의 카테고리에 해당되는 이슈를 어떻게 가져오지? 컬럼에 넣는게 맞나?
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
				, 'XXX님이 회원님을 @@@ 프로젝트 이슈에 등록했습니다'
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
				, '### 프로젝트에 참가되었습니다.'
				, '20230403'
				, 1
				, 'N'
			)
	;
COMMIT;






