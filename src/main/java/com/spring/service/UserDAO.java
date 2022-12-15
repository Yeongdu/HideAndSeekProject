package com.spring.service;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.model.DeliveryDTO;
import com.spring.model.MailDTO;
import com.spring.model.UserDTO;

public interface UserDAO {
	
	 //로그인
     int userCheck(Map<String, Object> map);
	 
	 //회원가입_아이디 중복체크
	 int idCheck(String id);
	 
	 //회원가입_ 이메일 중복체크
	 int emailCheck(String email);
	 
	 //회원가입완료(DB에 값 저장)
	  int insertUser(UserDTO dto);
	  
	 //아이디 찾기(이메일 사용)
	  int findId(String email);
	  
	  //메일 보내기 공통 서비스
	  int mailSending (MailDTO dto);
	  
	  //비밀번호 찾기 (이메일 사용)
	  
	  int findPw(Map<String, Object> map);
	  
	  //배송지 등록용
	  void insertDelivery(DeliveryDTO dto);
	
	   //임시비밀번호로 변경
	   int updatePw(UserDTO dto);
	
	
	
	
	
	
	
	 
	
	

}
