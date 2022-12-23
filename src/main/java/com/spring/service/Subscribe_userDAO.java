package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.Subscribe_userDTO;

public interface Subscribe_userDAO {
	
	List<Subscribe_userDTO> SubList();
	
	void insertSubUser(Map<String, Object> map);
	void insertSubStatus(Map<String, Object> map);

}
