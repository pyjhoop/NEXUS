package com.team.nexus.chatting.model.vo;

import java.sql.Date;

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
public class ChatRoom {
	
	private int roomNo;
	private String roomTitle;
	private int numberParticipants;
	private Date createDate;
	private String status;
	private int count;
	private int userNo;
	private String userName;
	private String originName;
	private String changeName;
}
