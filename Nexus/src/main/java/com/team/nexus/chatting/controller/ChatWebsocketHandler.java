package com.team.nexus.chatting.controller;

import java.sql.Date;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.team.nexus.calendar.model.service.CalendarServiceImpl;
import com.team.nexus.chatting.model.service.ChatService;
import com.team.nexus.chatting.model.service.ChatServiceImpl;
import com.team.nexus.chatting.model.vo.ChatMessage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatWebsocketHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	@Autowired
	private ChatServiceImpl cService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
		logger.info(session.getId() + "연결됨"); // 세션아이디 확인
        
		sessions.add(session); // 전달받은 webSocketSession을 set에 추가
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		sessions.remove(session);
		// 웹소켓 연결이 종료되는 경우, sessions안에 저장되어있던 클라이언트의 session정보를 삭제
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		// TextMessage : 웹소켓을 이용해 전달된 텍스트가 담겨있는 객체
		// payload : 전송되는 데이터 (Json객체)
		logger.info("전달된 메세지; : " + message.getPayload()); 
		
		// Jackson-databind : ObjectMapper 를 이용해서 JSON형태로 넘어온 데이터를 특정VO필드에 맞게 자동매핑
		ObjectMapper objectMapper = new ObjectMapper();
        
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		chatMessage.setCreateDate(new Date(System.currentTimeMillis()));
		//logger.info(chatMessage);
        
		// 전달 받은 채팅메세지를 db에 삽입
		int result = cService.insertMessage(chatMessage);
		if(result > 0) {
			// 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기
			for(WebSocketSession s : sessions) {
				//반복을 진행중인 websocketSession안에 담겨있는 방번호
				int chatRoomNo = (Integer)s.getAttributes().get("chatRoomNo");
            	
				//메세지에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
				if(chatMessage.getRoomNo() == chatRoomNo) {
					//같은 방 클라이언트에게 JSON형식으로 메세지를 보냄
					
				 	// s.sendMessage(new TextMessage( message.getPayload()));
					s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
				}
			}
        
		}
    }
}
