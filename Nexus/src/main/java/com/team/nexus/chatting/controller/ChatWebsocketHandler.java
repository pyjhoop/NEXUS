package com.team.nexus.chatting.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.team.nexus.chatting.model.vo.ChatUser;



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
		ChatUser checkUser = null;
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String now_dt = format.format(new Date(System.currentTimeMillis()));
		chatMessage.setToday(now_dt);
		//logger.info(chatMessage);
		// 전달 받은 채팅메세지를 db에 삽입
		System.out.println(chatMessage);
		if(chatMessage.getInvite() != null) {
			if(chatMessage.getInvite().equals("Z")) {
				int exit = cService.exitRoom(chatMessage);
				chatMessage.setChattingContent(chatMessage.getUserName()+"님이 방을 나가셨습니다.");
				int inviteChatting = cService.insertMessage(chatMessage);
				for(WebSocketSession s : sessions) {
					int roomNo = (Integer)s.getAttributes().get("rno");
					if(chatMessage.getRoomNo() == roomNo) {
					
						s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
					}
				}
				return;
			}else {
				checkUser = cService.checkUser(chatMessage);
				if(checkUser != null) {
					chatMessage.setInvite("X");
					session.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
					return;
				}else{
					
					int invite = cService.inviteUser(chatMessage);
					chatMessage.setChattingContent(chatMessage.getUserName()+"님이 입장하였습니다.");
					System.out.println("chatmessage: "+ chatMessage );
					int inviteChatting = cService.insertMessage(chatMessage);
					for(WebSocketSession s : sessions) {
						int roomNo = (Integer)s.getAttributes().get("rno");
						if(chatMessage.getRoomNo() == roomNo) {
						
							s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
						}
					}
					return;
				}
			}
					
			}
				
			
		
		
		int result = cService.insertMessage(chatMessage);
		int result2 =  cService.updateMessage(chatMessage);
		ChatUser opponent = cService.opponentUser(chatMessage);
		int displayRoom = cService.displayRoom(opponent);	
		int count = 0;
		if(result > 0) {
			// 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기
			for(WebSocketSession s : sessions) {
				//반복을 진행중인 websocketSession안에 담겨있는 방번호
				int roomNo = (Integer)s.getAttributes().get("rno");
				
            	
				//메세지에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
				if(chatMessage.getRoomNo() == roomNo) {
					//같은 방 클라이언트에게 JSON형식으로 메세지를 보냄
					
				 	// s.sendMessage(new TextMessage( message.getPayload()));
					s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
					count++;
				}
			}
				if(chatMessage.getInvite() == null) {
				int result3= cService.unreadMessage(chatMessage);
				for(WebSocketSession s : sessions) {
					ChatUser cu = new ChatUser();
					int roomNo = (Integer)s.getAttributes().get("rno");
					int userNo = (Integer)s.getAttributes().get("uno");
					cu.setRoomNo(roomNo);
					cu.setUserNo(userNo);
				
					int result4= cService.readMessage(cu);
						
					
				}
			
				}
		}
    }
}
