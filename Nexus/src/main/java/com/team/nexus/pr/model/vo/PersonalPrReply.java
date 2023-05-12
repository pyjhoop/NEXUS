package com.team.nexus.pr.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class PersonalPrReply {
	
	private int psnPrReplyNo;
	private int psnPrNo2;
	private String psnPrReplyDate;
	private String psnPrReplyContent;
	private int psnPrNo;
	private int userNo;
	private String userName;

}
