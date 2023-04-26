package com.team.nexus.pr.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PersonalPr {

	private int psnPrNo;
	private String psnPrStack;
	private String psnPrContent;
	private String psnPrAvlPrd;
	private String psnPrTitle;
	private String psnPrContact;
	private String createDate;
	private int userNo;
	private String userName;
	private String category;


}
