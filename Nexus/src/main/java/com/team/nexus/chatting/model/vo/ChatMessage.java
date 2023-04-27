package com.team.nexus.chatting.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor      // 기본생성자
@AllArgsConstructor     // 매개변수 생성자
@Setter                 // setter 메소드
@Getter                 // getter 메소드
@ToString
public class ChatMessage {
	private int chattingNo;
	private int roomNo;
	private String chattingContent;
	private Date createDate;
	private String originName;
	private String changeName;
	private int userNo;
	private String userName;
	private String profile;
	private String today;
	private String invite;
	
}
