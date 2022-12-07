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


	  @Override
	  public int userCheck(String id, String pw) {
		  dto = sqlSession.selectOne("getMember",id);
		  
		  	System.out.println(dto.getUser_id());
		  	System.out.println(dto.getUser_addr());
		  	System.out.println(dto.getUser_jumin());
		  	System.out.println(dto.getUser_name());
		  if(dto != null) {
			  if(pw.equals(dto.getUser_pwd())) {
				  return 0;
			  }
		  }
		  
		  return 1;
	  }



	


	
	  
	  



	


	
	
	}

	
	

	

