package com.team.nexus.news.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class News {

	private int newsNo;
	private String userNo;
	private String newsTitle;
	private String newsContent;
	private String createDate;
	private String updateDate;
	private String status;
	private String originName;
	private String thumbnail;
	private String profile;
	private int likeCount;
}
