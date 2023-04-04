package com.team.nexus.member.model.service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.nexus.member.model.dao.MemberDao;
import com.team.nexus.member.model.vo.Member;


@Service
public class kakaoService {
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	  public String getAccessToken (String authorize_code) {
          String access_Token = "";
          String refresh_Token = "";
          String reqURL = "https://kauth.kakao.com/oauth/token";

          try {
              URL url = new URL(reqURL);

              HttpURLConnection conn = (HttpURLConnection) url.openConnection();

              //    POST ��û�� ���� �⺻���� false�� setDoOutput�� true�� 
              // 한글

              conn.setRequestMethod("POST");
              conn.setDoOutput(true);

              //    POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
              BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
              StringBuilder sb = new StringBuilder();
              sb.append("grant_type=authorization_code");
              sb.append("&client_id=c2b8f2ae81e7206df597a694d983c1ee");  //������ �߱޹��� key
              sb.append("&redirect_uri=http://localhost:8010/nexus/kakao");     // ������ ������ ���� ���
              sb.append("&code=" + authorize_code);
              bw.write(sb.toString());
              bw.flush();

              //    ��� �ڵ尡 200�̶�� ����
              int responseCode = conn.getResponseCode();
              System.out.println("responseCode : " + responseCode);

              //    ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
              String line = "";
              String result = "";

              while ((line = br.readLine()) != null) {
                  result += line;
              }
              System.out.println("response body : " + result);

              //    Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);

              access_Token = element.getAsJsonObject().get("access_token").getAsString();
              refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

              System.out.println("access_token : " + access_Token);
              System.out.println("refresh_token : " + refresh_Token);

              br.close();
              bw.close();
          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }

          return access_Token;
      }
	
	  public Member getUserInfo (String access_Token) {

          //    ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
          HashMap<String, Object> userInfo = new HashMap<String, Object>();
          String reqURL = "https://kapi.kakao.com/v2/user/me";
          try {
              URL url = new URL(reqURL);
              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
              conn.setRequestMethod("POST");

              //    ��û�� �ʿ��� Header�� ���Ե� ����
              conn.setRequestProperty("Authorization", "Bearer " + access_Token);
              conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
              conn.setRequestProperty("charset", "utf-8");
              conn.setDoOutput(true);

              int responseCode = conn.getResponseCode();
              System.out.println("responseCode : " + responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

              String line = "";
              String result = "";

              while ((line = br.readLine()) != null) {
                  result += line;
              }
              System.out.println("response body : " + result);

              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);
              

              JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
              JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

              String nickname = properties.getAsJsonObject().get("nickname").getAsString();
              String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
              String email = kakao_account.getAsJsonObject().get("email").getAsString();

              userInfo.put("nickname", nickname);
              userInfo.put("email", email);
              userInfo.put("profile_image", profile_image);

          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }
          
          Member result = mDao.findKaKao(sqlSession,userInfo);
          
          if(result == null) {
        	  mDao.insertKaKao(sqlSession,userInfo);
        	  
        	  return mDao.findKaKao(sqlSession,userInfo);
          }else {
        	  return result;
          }
          
      }

}
