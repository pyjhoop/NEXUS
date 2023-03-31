package com.team.nexus.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private String email;
}
