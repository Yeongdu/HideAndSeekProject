package com.spring.service;

import java.util.HashMap;
import java.util.List;

import com.spring.model.UserDTO;

public interface UserDAO {
	
	
	int insertUser(UserDTO userDTO);
	
	List<UserDTO> getLoginList();
	
	
	
	
	 
	
	

}
