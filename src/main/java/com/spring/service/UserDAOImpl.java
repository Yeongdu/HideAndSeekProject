package com.spring.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.UserDTO;

import jdk.internal.module.ModuleLoaderMap.Mapper;

@Repository
public class UserDAOImpl implements UserDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	UserDTO dto;


	//로그인
	@Override
    public int userCheck(String id, String pw) {
       return sqlSession.selectOne("getMember",id);
      }


	//회원가입_아이디 중복체크
	@Override
	public int idCheck(String id) {
		
		int cnt = this.sqlSession.selectOne("idCheck",id);
		System.out.println("IMPL >>> " + id);
		
		System.out.println(cnt);
		return cnt;
	}


	//회원가입_ 이메일 중복체크
	@Override
	public int emailCheck(String email) {
		
		int cnt = this.sqlSession.selectOne("emailCheck",email);
		System.out.println("emailIMPL >>> " + email);
		
		System.out.println(cnt);
		return cnt;
	}


	
	//회원가입완료(DB에 값 저장)
	@Override
	public int insertUser(UserDTO dto) {
		
		return this.sqlSession.insert("add", dto);
	}


	@Override
	public List<String> findId(String email) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("findId", email);
	}
	
	
	


	


	


	
	  
	  



	


	
	
	}

	
	

	

