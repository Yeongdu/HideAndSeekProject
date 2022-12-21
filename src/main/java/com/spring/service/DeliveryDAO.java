package com.spring.service;

import java.util.List;

import com.spring.model.DeliveryDTO;

public interface DeliveryDAO {
	
	List<DeliveryDTO> getDeliveryCont(String userId);

}
