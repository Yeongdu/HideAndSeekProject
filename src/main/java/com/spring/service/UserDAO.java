package com.spring.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.model.UserDTO;

public interface UserDAO {
	
	 //로그인
	 int userCheck(String id, String pw);
	 
	 //회원가입_아이디 중복체크
	 int idCheck(String id);
	 
	 //회원가입_ 이메일 중복체크
	 int emailCheck(String email);
	 
	 //회원가입완료(DB에 값 저장)
	  int insertUser(UserDTO dto);
	
	
	
	
	
	
	
	
	
	 
	
	

}
