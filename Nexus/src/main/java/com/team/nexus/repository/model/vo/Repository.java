package com.team.nexus.repository.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Repository {

	private int userNo;
	private String userName;
	private String repoName;
	private String token;
}
