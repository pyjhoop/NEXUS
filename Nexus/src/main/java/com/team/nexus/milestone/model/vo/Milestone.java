package com.team.nexus.milestone.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Milestone {
	
	
	
	private String milestoneId;
	private String createDate;
	private String modifyDate;
	private String closeDate;
	private String milestoneTitle;
	private String milestoneDueDate;
	private String milestoneContent;
	private String milestoneAuthor;
	private String status;
	private String progress;
	

}
