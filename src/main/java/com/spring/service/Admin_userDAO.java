package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.PageDTO;
import com.spring.model.UserDTO;

public interface Admin_userDAO {
	
	//전체 유저 수를 받아오는 메서드
	int getUserCount();
	
	//전체 유저 리스트를 불러오는 메서드
	List<UserDTO> getUserList(PageDTO dto);
	
	
	//유저 상세정보 불러오는 메서드
	UserDTO getUserCont(int user_no);
	
	
	//검색된 유저의 수를 받아오는 메서드
	int getSearchUserCount(String keyword);
	
	//유저 검색하는 메서드
	List<UserDTO> searchUserList(Map<String, Object> map);
	
	
	//유저 추가하는 메서드
	int insertUser(UserDTO dto);
	
	//유저 수정하는 메서드
	int updateUser(UserDTO dto);
	
	//유저 삭제하는 메서드
	int deleteUser(int user_no);
	
	//유저 삭제 후 번호재정렬
	void userUpdateSeq(int user_no);

	
}
