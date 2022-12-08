package com.spring.service;

import java.util.List;

import com.spring.model.CartDTO;
import com.spring.model.DeliveryDTO;
import com.spring.model.ReviewDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;

public interface MyPageDAO {
	
	UserDTO getUserCont(String userId);
	CartDTO getOrderCont(String userId);
	ReviewDTO getReviewCont(String userId);
	List<Subscribe_userDTO> getSubCont(String userId);
	DeliveryDTO getDeliveryCont(String userId);

}
