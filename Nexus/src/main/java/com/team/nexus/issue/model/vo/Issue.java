package com.team.nexus.issue.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Issue {

	
	 private int issueNo; 			// 이슈번호 - 깃
	 private int label; 			// 이슈 라벨
	 private String createDate;		// 이슈 생성일
	 private String modifyDate;		// 이슈 수정일
	 private String closeDate;		// 이슈 종료일
	 private String status;			// 이슈 상태값
	 private String repositoryId;	// 이슈 속한 레파지토리
	 private String milestoneId;	// 이슈 속한 마일스톤
	 private String issueTitle;		// 이슈 제목
	 private String issueContent;	// 이슈 내용
	 private String issueAuthor;	// 이슈 작성자
	 private String issueAssigne;	// 이슈 할당 받은 사람
	 private String priority;		// 이슈 우선순위(중요도)
	 private String profile;		// 이슈 프로필 (담당자)
	
	

}
