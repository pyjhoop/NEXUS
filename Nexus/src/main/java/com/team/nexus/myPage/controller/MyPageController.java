package com.team.nexus.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.team.nexus.member.model.service.MemberServiceImpl;
import com.team.nexus.member.model.vo.Member;
import com.team.nexus.myPage.model.service.MyPageServiceImpl;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl mService;
	
	@Autowired
	private MemberServiceImpl mService2;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("selectMy.ih")
	public String selectMyPage() {
		return "member/myPage";
	}
	
	@RequestMapping("myUpdate.ih")
	public String myPageUpadte(MultipartFile upfile, HttpSession session, Member m,Model model) {
		int result = 0;
		int result2 = 0;
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			m.setProfile("resources/uploadFiles/"+changeName);
			result= mService.myPageUpdate(m);
		}else {	
		result2= mService.myPageUpdate(m);
		
		}
		
		if(result+result2>0) {
			Member newMember = mService2.selectMember(m);
			 session.setAttribute("loginUser", newMember);
			 session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			return "redirect:selectMy.ih";
		}else {
			model.addAttribute("errorMsg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("myDelete.ih")
	public String memberDelete(Member m, String inputPassword, HttpSession session, Model model) {
		if(m.getSocial() == null) {
			if(bcrypt.matches(inputPassword, m.getUserPwd())) {
				int result = mService.memberDelete(m);
				if(result>0) {
					 session.removeAttribute("loginUser");
					 session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
			         return "redirect:/";
				}else {
					 model.addAttribute("errorMsg", "회원 탈퇴 실패");
			         return "common/errorPage";
				}
			}else {
				session.setAttribute("alertMsg", "비밀번호가 맞지 않습니다.");
				return "redirect:selectMy.ih";
			}
		}else {
			int result2 = mService.memberDelete(m);
			if(result2>0) {
				session.removeAttribute("loginUser");
		        session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
		        return "redirect:/";
			} else {
				 model.addAttribute("errorMsg", "회원 탈퇴 실패");
		         return "common/errorPage";
			}
		}
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
