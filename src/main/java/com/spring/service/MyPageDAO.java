package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.DeliveryDTO;
import com.spring.model.OrderDTO;
import com.spring.model.ReviewDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;

public interface MyPageDAO {
	
	UserDTO getUserCont(String userId);
	int updateUser(Map<String, Object> map);
	
	List<OrderDTO> getOrderCont(Map<String, Object> map);
	List<OrderDTO> orderContent(String userId);
	int getOrderCount(String userId);
	int getOrderAllCount(String userId);
	int getRefundCount(String userId);
	int getDeliveryCount(String userId);
	int getDeliveryCompleteCount(String userId);
	
	List<ReviewDTO> getReviewCont(Map<String, Object> map);
	int getReviewCount(String userId);
	
	List<Subscribe_userDTO> getSubCont(String userId);
	
	List<DeliveryDTO> getDeliveryCont(String userId);
	int getDeliveryAddrCount(String userId);

}
