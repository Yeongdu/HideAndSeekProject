package com.spring.service;

import java.util.Map;


public interface Subscribe_userDAO {
	
	int SubList(String userId);
	
	void insertSubUser(Map<String, Object> map);
	void insertSubStatus(Map<String, Object> map);

}
