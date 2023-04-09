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
public class GitMember {
	
	private int userNo;
	private String id;
	private String userPwd;
	private String avatar_url;
	private String email;
	private String profile;
	private String gender;
	private String social;
	private Date enrollDate;
	private String token;
	private String status;
}
