package com.team.nexus.issue.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class GitIssue {

	private String title;
	private String[] rabels;  	// 라벨 배열
	private String state;	  	// open - closed - all
	private String milestone; 	// 마일스톤
	private int number;		  	// 이슈 생성 번호
	private String[] assignees; // 담당자
	private String createdAt; 	// 생성일
	private String updatedAt; 	// 수정일
	private String closedAt;  	// 종료일
	private String issudId;   	// 이슈아이디
	
	
	
	
	
	
}
