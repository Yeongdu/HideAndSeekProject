package com.spring.service;

import java.util.List;

import com.spring.model.SubscribeDTO;

public interface SubscribeDAO {
	
	SubscribeDTO subCont();
	
	int subPay(int pack);
	
	List<SubscribeDTO> getAllsubscribeList();

}
