package com.spring.service;

import java.util.Map;


public interface Subscribe_userDAO {
	
	int SubList(String userId);
	List<Subscribe_userDTO> SubList(); // 구독 현황 전체
	List<Subscribe_userDTO> subList(String userId); // 구독자의 구독현황 전체
	
	void insertSubUser(Map<String, Object> map);
	void insertSubStatus(Map<String, Object> map);

}
