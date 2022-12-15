package com.spring.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.PageDTO;
import com.spring.model.UserDTO;

@Repository
public class Admin_userDAOImpl implements Admin_userDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getUserCount() {
		return this.sqlSession.selectOne("getUserCount");
	}

	@Override
	public List<UserDTO> getUserList(PageDTO dto) {
		return this.sqlSession.selectList("getUserList", dto);
	}

	@Override
	public UserDTO getUserCont(int user_no) {
		return this.sqlSession.selectOne("adminUserCont", user_no);
	}

	@Override
	public int getSearchUserCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserDTO> searchUserList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(int user_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void userUpdateSeq(int user_no) {
		// TODO Auto-generated method stub
		
	}
}
