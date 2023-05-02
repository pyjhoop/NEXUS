package com.team.nexus.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNick;
	private String email;
	private String profile;
	private String gender;
	private String social;
	private Date enrollDate;
	private String token;
	private String status;
	private String search;
	private int createUserNo;
	private String roomTitle2;
	private String changeName2;
	private String rollName;
	
}
