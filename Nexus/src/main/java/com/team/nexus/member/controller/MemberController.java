package com.team.nexus.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.team.nexus.member.model.service.kakaoService;
import com.team.nexus.member.model.service.GithubService;
import com.team.nexus.member.model.service.MailSendService;
import com.team.nexus.member.model.service.MemberServiceImpl;
import com.team.nexus.member.model.vo.Member;



@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	
	@Autowired
    private kakaoService kakaoService;
	
	@Autowired
	private GithubService gService;
	
	
	private String token = "";
	
	@RequestMapping("callback.p")
	public String getUserInfo(@RequestParam String code, HttpSession session) {
	    
		// access_token 
		String token = gService.getToken(code);
		
		System.out.println("token : " + token);
	    
		session.setAttribute("assigneeToken", token);
		
		// access_token을 이용한 유저 정보 얻어오기
		Member m = gService.getUserInfo(token);
		
		
        Member m1 = mService.selectMember(m);
        
        // 조회된 결과 없을시 insert
        if(m1 == null) {
        	int result = mService.insertMember(m);
        	m1 = mService.selectMember(m);
        	m1.setToken(token);
        }else {
        	m1 = mService.selectMember(m);
        	m1.setToken(token);
        }
        session.setAttribute("loginUser", m1);
        
        
	    return "redirect:main.p";
	}
	
	@RequestMapping("main.p")
	public String nexusPage() {
		return "main";
	}
	
	@RequestMapping("register.p")
	public String toRegister() {
		return "member/register";
	}
	
	@RequestMapping("login.p")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("forgotPwd.p")
	public String forgotPwd() {
		return "member/forgotPwd";
	}
	
	
	
	@RequestMapping(value="idCheck.me.p", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(Member m) {
		int checkCount = mService.idCheck(m.getUserId());
		return checkCount+"";
	}
	
	@RequestMapping("mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메인 인증 요청이 들어옴");
		System.out.println(email);
		
		return mailService.joinEmail(email);
		
	}
	
	@RequestMapping("insert.me.p")
	public String insertMember(Member m) {
		
		m.setUserPwd(bcrypt.encode(m.getUserPwd()));
		m.setSocial("O");
		m.setProfile("/nexus/resources/image/user-circle-solid-48.png");
		
		int result = mService.insertMember(m);
		if(result>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		return "redirect:login.p";
	}
	
	
	@RequestMapping(value = "/kakao", method = RequestMethod.GET, produces = "application/hal+json; charset=UTF-8" )
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Throwable {
		if(token == "") {
		String access_Token = kakaoService.getAccessToken(code);
		token = access_Token;
		}
		Member userInfo = kakaoService.getUserInfo(token);
		session.setAttribute("loginUser", userInfo);
		
		return "main";		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET, produces = "application/hal+json; charset=UTF-8" )
	public String kakaoLogout(HttpSession session) {
		token = "";
//		session.removeAttribute("loginUser");
		
		session.invalidate();
		return "redirect:login.p";
	}
	
	@RequestMapping("login.ih")
	public String nexusLogin(Member m,HttpSession session,Model model) {
		Member loginUser = mService.selectMember(m);
		
		if(loginUser != null && bcrypt.matches(m.getUserPwd(), loginUser.getUserPwd())){
			session.setAttribute("loginUser", loginUser);
			return "main";
		}else {
			session.setAttribute("alertMsg", "아이디나 비밀번호가 일치하지 않습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("resetPwd.p")
	public String resetPwd(Member m, HttpSession session) {
		
		int count = mService.resetPwd(m);
		
		if(count>0) {
			System.out.println("비번 변경 페이지 이동");
			return "redirect:login.p";
		}else {
			System.out.println("정보가 일치지 않습니다.");
			session.setAttribute("alertMsg", "정보가 일치하지 않습니다.");
			return "redirect:forgotPwd.p";
		}
		
	}
	
	@RequestMapping(value="enrollToken", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String enrollToken(Member m, HttpSession session) {
		
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int result = mService.enrollToken(m);
		
		if(result>0) {
			((Member)session.getAttribute("loginUser")).setToken(m.getToken());
			return "토큰 등록에 성공했습니다.";
		}else {
			return "토큰 등록에 실패했습니다. 다시 등록해주세요";
		}
		
		
		
	}
	
}
