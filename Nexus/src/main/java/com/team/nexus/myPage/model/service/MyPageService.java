package com.team.nexus.myPage.model.service;

import com.team.nexus.member.model.vo.Member;

public interface MyPageService {
	
	int myPageUpdate(Member m);
	
	int memberDelete(Member m);
}
