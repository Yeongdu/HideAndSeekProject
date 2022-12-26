package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.SubscribeDTO;

public interface SubscribeDAO {
	
	SubscribeDTO subCont();
	
	int subPay(int pack);
	
	List<SubscribeDTO> getAllsubscribeList();
	
	int insertSub1(Map<String, Object> map);
	int insertSub2(Map<String, Object> map);
	int insertSub3(Map<String, Object> map);
	
	int getSubMaxPackageNo();

}
