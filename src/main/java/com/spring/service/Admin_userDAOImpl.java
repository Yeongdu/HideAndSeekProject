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
		return this.sqlSession.selectOne("getSearchUserCount", keyword);
	}

	@Override
	public List<UserDTO> searchUserList(Map<String, Object> map) {
		return this.sqlSession.selectList("getSearchUserList", map);
	}

	@Override
	public int insertUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserDTO dto) {
		return this.sqlSession.update("adminUpdateUser", dto);
	}

	@Override
	public int deleteUser(int user_no) {
		return this.sqlSession.delete("adminUserDelete", user_no);
	}

	@Override
	public void userUpdateSeq(int user_no) {
		this.sqlSession.update("adminUserUpdateSeq", user_no);
	}

	@Override
	public int updateUserStatus(int user_no) {
		return this.sqlSession.update("adminUserStatusChange", user_no);
	}

	@Override
	public int getIngUserCount() {
		return this.sqlSession.selectOne("adminIngUserCount");
	}

	@Override
	public List<UserDTO> getIngUserList(PageDTO dto) {
		return this.sqlSession.selectList("getIngUserList", dto);
	}

	@Override
	public int getDelUserCount() {
		return this.sqlSession.selectOne("adminDelUserCount");
	}

	@Override
	public List<UserDTO> getDelUserList(PageDTO dto) {
		return this.sqlSession.selectList("getDelUserList", dto);
	}
}
