package com.spring.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Subscribe_userDTO;

@Repository
public class Subscribe_userDAOImpl implements Subscribe_userDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertSubUser(Map<String, Object> map) {
		this.sqlSession.insert("subUser", map);
	}

	@Override
	public void insertSubStatus(Map<String, Object> map) {
		this.sqlSession.insert("subStatus",map);
		
	}

	@Override
	public List<Subscribe_userDTO> SubList() {
		return this.sqlSession.selectList("subList");
	}

	@Override
	public List<Subscribe_userDTO> subList(String userId) {
		return this.sqlSession.selectList("sub_user_list", userId);
	}

}
