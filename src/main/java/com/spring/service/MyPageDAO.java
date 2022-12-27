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
	int userDelete(String userId);
	
	List<OrderDTO> getOrderCont(Map<String, Object> map);
	List<OrderDTO> orderContent(String userId);
	int getOrderCount(String userId, String sort);
	int getOrderAllCount(String userId);
	int getRefundCount(String userId);
	int getDeliveryCount(String userId);
	int getDeliveryCompleteCount(String userId);
	
	List<OrderDTO> sortOrder(Map<String, Object> map, String sort);
	
	
	
	List<ReviewDTO> getReviewCont(Map<String, Object> map);
	int getReviewCount(String userId);
	int reviewInsert(ReviewDTO rdto);
	int reviewCheck(Map<String, Object> map);
	
	List<Subscribe_userDTO> getSubCont(String userId);
	List<Subscribe_userDTO> getSubList(String userId);
	void subDelete(String userId);
	void subUserUpdate(int sub_no);
	
	List<DeliveryDTO> getDeliveryCont(String userId);
	DeliveryDTO getDeliveryModify(int deli_no);
	int deliveryModify(Map<String, Object> map);
	int getDeliveryAddrCount(String userId);
	int deliveryInsert(Map<String, Object> map);
	void updateDeliveryDefault(String userId);

}