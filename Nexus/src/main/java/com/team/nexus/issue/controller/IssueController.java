package com.team.nexus.issue.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.issue.model.service.IssueServiceImpl;
import com.team.nexus.member.model.vo.Member;

@Controller
public class IssueController {

	@Autowired
	private IssueServiceImpl iService;

	
	
//	@ResponseBody
	@RequestMapping(value="issueShow.mini", produces="application/json; charset=utf-8")
	public String issueList(HttpSession session,Member m) throws IOException {
		
		String token = ((Member)(session.getAttribute("loginUser"))).getToken();
		
//		String OWNER = "";	// 레파지토리 작성자
//		String REPO = ""; // 레파지토리
//		
//		String url = " https://api.github.com/repos/" + OWNER + "/" + REPO + "/issues";
		
		String url = "https://api.github.com/repos/pyjhoop/NEXUS/issues?state=all";
		
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("GET");
		
		
		 BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	      
	      String line;
	      String responseText="";
	      
	      while((line = br.readLine()) !=null) {
	         responseText += line;
	      }
		
		
	      JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
	      
	      
	      
	      //----------------
	      JsonObject responseObj = totalObj.getAsJsonObject("response"); // response의 value를 담아줄거다.
	      
	      JsonObject bodyObj = responseObj.getAsJsonObject("body");
		
	      int totalCount = bodyObj.get("totalCount").getAsInt();
		
	      JsonArray itemArr = bodyObj.getAsJsonArray("items");
	      
	      
	      ArrayList<AirVo> list = new ArrayList<>();
	      
	      
	      for(int i = 0; i<itemArr.size(); i++) {
	          JsonObject item = itemArr.get(i).getAsJsonObject();
//	          System.out.println(item);
	          
	          AirVo air = new AirVo();
	          air.setStationName(item.get("stationName").getAsString());
	          air.setDataTime(item.get("dataTime").getAsString());
	          air.setKhaiValue(item.get("khaiValue").getAsString());
	          air.setPm10Value(item.get("pm10Value").getAsString());
	          air.setSo2Value(item.get("so2Value").getAsString());
	          air.setCoValue(item.get("coValue").getAsString());
	          air.setNo2Value(item.get("no2Value").getAsString());
	          air.setO3Value(item.get("o3Value").getAsString());
	          
	          list.add(air);
	       }
	       
	       for(AirVo a: list) {
	          System.out.println(a);
	       }
	       
	       //5. 다 사용한 스트림 반납
	       br.close();
	       urlConnection.disconnect();
	       
	    
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
		
		return "issue/issueList";
	}

	@RequestMapping("issueEnroll.mini")
	public String issueEnrollForm() {
		return "issue/issueEnrollView";
	}

	@RequestMapping("issueDetail.mini")
	public String selectIssue(int ino, Model model) {

//			Issue is = iService.selectIssue(ino);
//			
//			if( is != null) {
//				model.addAttribute("is",is);
//				return "issue/issueDetail";
//			}else {
//				model.addAttribute("errorMsg", "이슈 상세 페이지 보기 실패!");
//				return "common/errorPage";
//				
//			}

		return "issue/issueDetail";

	}

	@RequestMapping("issueDelete.mini")
	public String deleteIssue(HttpSession session) {
		session.setAttribute("alertMsg", "성공적으로 이슈가 삭제되었습니다");

		return "redirect:issueShow.mini";
	}

}
