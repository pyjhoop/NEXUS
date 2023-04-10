package com.team.nexus.news.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class NewsReply {
	
	private int newsNo;
	private String commentWriter;
	private String commentContent;
	private String commentDate;
	private String status;
	private String profile;
}
