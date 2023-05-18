package com.team.nexus.config;

import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team.nexus.member.model.service.MemberServiceImpl;
import com.team.nexus.member.model.vo.Member;


@Controller
@WebListener
public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener{

	@Autowired
	private MemberServiceImpl mService;
	
	//public static ConcurrentHashMap<Integer, String> sessionMap = new ConcurrentHashMap<>();
	public static ArrayList<String> aList = new ArrayList<String>();
//	public ConcurrentHashMap<Integer, String> getmap(){
//		return sessionMap;
//	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		if(event.getName().equals("loginUser")) {
			String name = ((Member)event.getValue()).getUserName();
			
			aList.add(name);
			
			System.out.println(aList);
			
			HttpSession session = event.getSession();
			session.setAttribute("ConnectMembers", aList);
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		if(event.getName().equals("loginUser")) {
			String name = ((Member)event.getValue()).getUserName();
			aList.remove(name);
			
		}
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		if(event.getName().equals("loginUser")) {
//			String nick = ((Member)event.getValue()).getUserNick();
//			int no = ((Member)event.getValue()).getUserNo();
//			sessionMap.replace(no, nick);
//			System.out.println(sessionMap);
//			System.out.println("=================");
//			
//			HttpSession session = event.getSession();
//			session.setAttribute("members", sessionMap);
		}
	}

}
