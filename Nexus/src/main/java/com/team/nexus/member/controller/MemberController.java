package com.team.nexus.member.controller;

import java.util.Collections;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;


@Controller
public class MemberController {
	
	@RequestMapping("callback")
	public String getUserInfo(@RequestParam String code) {
	    System.out.println(code);
	    
	    RestTemplate restTemplate = new RestTemplate();
	    HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
	    
        
        
	    String url = "https://github.com/login/oauth/access_token";
	    
	    JSONObject jsonObject = new JSONObject();
	    jsonObject.put("client_id", "3b8e80bc4dbc71a39f57");
	    jsonObject.put("client_secret", "bc1c89f230d674b06dcdb1d0ab553c083c8f8c79");
	    jsonObject.put("code", code);

        HttpEntity<String> entity = new HttpEntity<String>(jsonObject.toString(), headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        String[] arr = response.getBody().split(",");
        System.out.println(response);
        String token = (arr[0].split(":"))[1].replace("\"", "");
//        System.out.println(arr[0]);
        System.out.println(token);
       
        RestTemplate restTemplate1 = new RestTemplate();
        
        String url1 = "https://api.github.com/repos/pyjhoop/NEXUS/issues";
        HttpHeaders headers1 = new HttpHeaders();
        headers1.set("Authorization", "Bearer "+token);
        
        HttpEntity<String> req = new HttpEntity<String>(headers1);
        
        ResponseEntity<String> res = restTemplate1.exchange(url1, HttpMethod.GET, req, String.class);
        
        System.out.println(res);
        
	    return "nexus";
	}
	
	@RequestMapping("test")
	public String test() {
		return "test";
	}
	

	
	
}
