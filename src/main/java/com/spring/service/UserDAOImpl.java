package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserDTO> getLoginList() {
		// TODO Auto-generated method stub
		return null;
	}

	
    
	

	

}
