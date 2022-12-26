package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.Subscribe_userDTO;


public interface Subscribe_userDAO {
	
	int SubList(String userId);
	List<Subscribe_userDTO> subList(String userId); // 구독자의 구독현황 전체
	List<Subscribe_userDTO> subList_all(String userId);
	
	void insertSubUser(Map<String, Object> map);
	void insertSubStatus(Map<String, Object> map);

}
