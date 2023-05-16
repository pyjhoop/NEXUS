package com.team.nexus.milestone.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class GitMilestone {
	
/*
 * private String milestoneId;
	private String createDate;
	private String modifyDate;
	private String closeDate;
	private String milestoneTitle;
	private String milestoneDueDate;
	private String milestoneContent;
	private String milestoneAuthor;
	private String status;
	private String progress;
 */
	
	private String title;
	private String[] issues;  	
	private String state;	  	
	private String milestoneId;   	
	private int number;
	private String createdAt; 	
	private String updatedAt; 	
	private String closedAt;  	
	private String user; 		
	private String profile;		
	private String due_on;
	private int openedIssues;
	private int closedIssues;
	
	
	

}
