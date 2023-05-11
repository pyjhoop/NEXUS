package com.team.nexus.issue.controller;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.team.nexus.chatting.controller.ChatWebsocketHandler;
import com.team.nexus.issue.model.service.IssueService;

public class IssueWebHandler extends TextWebSocketHandler {

	@Autowired
	private IssueService iService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	// message 메세지 처리하는 메소드
	   @Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		 
		   
	   }

	   // connection established 세션 접속, 처리
	   @Override
	   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		   System.out.println("이게되나유~~~~~~~~~~~~~");
		   
		   
			// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
			logger.info(session.getId() + "연결됨"); // 세션아이디 확인
	        
			sessions.add(session); // 전달받은 webSocketSession을 set에 추가
	   }

	   // connection closed 세션 접속 해제 , 처리
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		   sessions.remove(session);
	   }
	
	
	
	
}
