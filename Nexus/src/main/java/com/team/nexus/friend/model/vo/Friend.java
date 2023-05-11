package com.team.nexus.friend.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Friend {
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
	private String blockI;
	private String blockMe;
}
