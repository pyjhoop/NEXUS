package com.team.nexus.member.controller;

import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.nexus.member.model.service.kakaoService;
import com.team.nexus.member.model.service.MailSendService;
import com.team.nexus.member.model.service.MemberService;
import com.team.nexus.member.model.service.MemberServiceImpl;
import com.team.nexus.member.model.vo.Member;


@PropertySource("classpath:git.properties")
@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Value("${git.id}")
	private String gitId;
	
	@Value("${git.secret}")
	private String gitSecret;
	
	@Autowired
    private kakaoService kakaoService;
	
	@RequestMapping("callback.p")
	public String getUserInfo(@RequestParam String code, HttpSession session) {
	    System.out.println(code);
	    
	    RestTemplate restTemplate = new RestTemplate();
	    HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
	    
        
        
	    String url = "https://github.com/login/oauth/access_token";
	    
	    JSONObject jsonObject = new JSONObject();
	    jsonObject.put("client_id", gitId);
	    jsonObject.put("client_secret", gitSecret);
	    jsonObject.put("code", code);

        HttpEntity<String> entity = new HttpEntity<String>(jsonObject.toString(), headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        String[] arr = response.getBody().split(",");
        System.out.println(response.getBody());
        ObjectMapper objectMapper = new ObjectMapper();
//        String token = (arr[0].split(":"))[1].replace("\"", "");
        String token ="";
        try {
			JsonNode jsonNode = objectMapper.readTree(response.getBody());
			token = jsonNode.get("access_token").asText();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        
        
        session.setAttribute("token", token);
        System.out.println(token);
       
        RestTemplate restTemplate1 = new RestTemplate();
        
        String url1 = "https://api.github.com/user";
        HttpHeaders headers1 = new HttpHeaders();
        headers1.set("Authorization", "Bearer "+token);
        
        HttpEntity<String> req = new HttpEntity<String>(headers1);
        
        ResponseEntity<String> res = restTemplate1.exchange(url1, HttpMethod.GET, req, String.class);
        ObjectMapper om = new ObjectMapper();
        
        Member m = new Member();
        
        
        try {
			JsonNode jn = om.readTree(res.getBody());
			System.out.println(jn.asText());
			System.out.println("id  : "+ jn.get("id").asText());
			System.out.println("name : "+jn.get("name").asText());
			System.out.println("url : "+ jn.get("avatar_url").asText());
			m.setUserId(jn.get("id").asText());
			m.setUserName(jn.get("name").asText());
			m.setProfile(jn.get("avatar_url").asText());
			m.setEmail(jn.get("email").asText());
			
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        // 있는지 조회부터
        Member m1 = mService.selectMember(m);
        
        
        
        // 조회된 결과 없을시 insert
        if(m1 == null) {
        	int result = mService.insertMember(m);
        }else {
        	m1.setToken(token);
        	session.setAttribute("member", m1);
        }
        
        
	    return "redirect:nexus.p";
	}
	
	@RequestMapping("nexus.p")
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
		String access_Token = kakaoService.getAccessToken(code);
		Member userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.getUserId());
        System.out.println("###nickname#### : " + userInfo.getUserName());
        System.out.println("###profile_image#### : " + userInfo.getProfile());
		System.out.println(userInfo.getSocial());
        session.setAttribute("loginUser", userInfo);
        
		return "main";	

	
	}
}
