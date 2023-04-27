package com.team.nexus.chatting.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.team.nexus.chatting.model.service.ChatServiceImpl;
import com.team.nexus.chatting.model.vo.ChatMessage;
import com.team.nexus.chatting.model.vo.ChatRoom;
import com.team.nexus.chatting.model.vo.ChatUser;
import com.team.nexus.member.model.vo.Member;

@Controller
@SessionAttributes({"rno", "rList", "uno"})

public class ChattingController {
	
	@Autowired
	private ChatServiceImpl cService;
	
	@RequestMapping("selectChat.ih")
	public String selectChattingRoom(HttpSession session, Model model) {
		modularity(session, model);
		
		return "chatting/chattingRoom";
	}
	
	@RequestMapping("roomDetail.ih")
	public String selectRoomDetail(ChatRoom cr,ChatUser cu , HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		cu.setUserNo(userNo);
		int result = cService.readMessage(cu);
		ArrayList<ChatMessage> cList = cService.selectMessage(cr.getRoomNo()); 
		modularity(session, model);
		System.out.println("cList : " + cList);
		model.addAttribute("cu",cu);
		model.addAttribute("cList",cList);
		model.addAttribute("cr", cr);
		model.addAttribute("uno", userNo);
		model.addAttribute("rno", cr.getRoomNo());
		return "chatting/chattingRoomDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="search.ih", produces = "application/json; charset=utf-8")
	public String searchUser(Member m) {
		ArrayList<Member> list = cService.searchUser(m);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="searchPlus.ih", produces = "application/json; charset=utf-8")
	public String searchUserPlus(Member m) {
		ArrayList<Member> list = cService.searchUser(m);
		return new Gson().toJson(list);
	}
	
	public void modularity(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<ChatRoom> rList = cService.selectRoom(userNo);
		ArrayList<ChatUser> uList = cService.selectRoomUser(userNo);
		ArrayList<ChatUser> cuList = cService.selectUnreadMessage(userNo);
		System.out.println(uList);
		model.addAttribute("cuList", cuList);
		model.addAttribute("rList",rList);
		model.addAttribute("uList",uList);
	}
	
	@RequestMapping("createRoom.ih")
	public String createRoom(int checkNo, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int[] cUser = {loginUser.getUserNo(), checkNo};
		Member m = cService.selectMember(loginUser.getUserNo());
		Member om = cService.selectMember(checkNo);
		m.setRoomTitle2(om.getUserName());
		m.setChangeName2(om.getProfile());
		int result = cService.createRoom(m);
		if(result>0) {
			for(int c : cUser) {
				cService.insertChatUser(c);
			}
			return "redirect:/selectChat.ih";
		}else {
			return "errorPage";
		}
	}
	
	@RequestMapping("groupRoom.ih")
	public String createGroupRoom(@ModelAttribute("loginUser") Member loginUser,String uno, ChatRoom c, MultipartFile upfile, HttpSession session, Model model) {
		int[] users = Stream.of(uno.split(",")).mapToInt(Integer::parseInt).toArray();
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			c.setOriginName(upfile.getOriginalFilename());
			c.setChangeName("resources/uploadFiles/"+changeName);
		}else {
			c.setChangeName("/nexus/resources/image/group-solid-60.png");
		}
		
		c.setNumberParticipants(users.length);
		int result = cService.createGroupRoom(c);
		if(result>0) {
			for(int u : users) {
				cService.insertChatGroupUser(u);
				Member m = cService.selectMember(u);
				cService.firstEntry(m);
			}
			return "redirect:/selectChat.ih";
		}else {
			return "errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateRoom.ih", produces = "application/json; charset=utf-8")
	public String updateRoom(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<ChatRoom> list = cService.updateRoom(userNo);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("exitRoom.ih")
	public String hideRoom(ChatUser cu){
		//ChatUser opponent = cService.opponentUser(cu);
		int hideRoom = cService.hideRoom(cu);
		
		return "redirect:/selectChat.ih";
	}

	@ResponseBody
	@RequestMapping("fileChat.ih")
	public Map<String, String> insertChatFile(MultipartHttpServletRequest request, HttpServletRequest servletRequest, HttpSession session) {
		MultipartFile upfile = request.getFile("file");
		ChatMessage cm = new ChatMessage();
		cm.setUserNo(Integer.parseInt(servletRequest.getParameter("userNo")));
		cm.setRoomNo(Integer.parseInt(servletRequest.getParameter("roomNo")));
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			cm.setOriginName(upfile.getOriginalFilename());
			cm.setChangeName("resources/uploadFiles/"+changeName);
		}
		
		 Map<String, String> map = new HashMap<>();
		
		
			 map.put("originName", cm.getOriginName());
		     map.put("changeName", cm.getChangeName());
		
		return map;
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {

		// 파일명 수정 작업 후 서버에 업로드 시키기 ("flower.png" => "20230331101821332.png")
		String originName = upfile.getOriginalFilename(); // flower.png
		
		// "20230331101855" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 랜덤한 숫자 5자리
		int ranNum = (int)(Math.random() * 90000 + 10000); // 10000~99999 사이
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 최종 수정명
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/"); // "/" 쓰면 webapp 가리킨다
		
		// 서버에 파일을 업로드
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
