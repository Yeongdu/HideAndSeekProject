package com.spring.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.DeliveryDTO;
import com.spring.model.OrderDTO;
import com.spring.model.ReviewDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public UserDTO getUserCont(String userId) {
		return this.sqlSession.selectOne("user_cont", userId);
	}
	
	@Override
	public int updateUser(Map<String, Object> map) {
		return this.sqlSession.update("user_update", map);
	}
	
	
	
	@Override
	public List<OrderDTO> getOrderCont(Map<String, Object> map) {

		System.out.println("map >>> " + map);
		return this.sqlSession.selectList("order_cont", map);
		
	}
	
	@Override
	public int getOrderCount(String userId) {
		return this.sqlSession.selectOne("count_order", userId);
	}
	
	@Override
	public int getRefundCount(String userId) {
		return this.sqlSession.selectOne("count_refund", userId);
	}
	
	@Override
	public int getDeliveryCount(String userId) {
		return this.sqlSession.selectOne("count_delivery", userId);
	}

	@Override
	public int getDeliveryCompleteCount(String userId) {
		return this.sqlSession.selectOne("count_deliverycomplete", userId);
	}
	
	@Override
	public int getOrderAllCount(String userId) {
		return this.sqlSession.selectOne("orderall", userId);
	}


	@Override
	public List<ReviewDTO> getReviewCont(Map<String, Object> map) {
		return this.sqlSession.selectList("review_cont", map);
	}
	
	@Override
	public int getReviewCount(String userId) {
		return this.sqlSession.selectOne("count_review", userId);
	}

	@Override
	public List<Subscribe_userDTO> getSubCont(String userId) {
		return this.sqlSession.selectList("sub_cont", userId);
	}
	@Override
	public List<DeliveryDTO> getDeliveryCont(String userId) {
		return this.sqlSession.selectList("delivery_cont", userId);
	}
	
	@Override
	public int getDeliveryAddrCount(String userId) {
		return this.sqlSession.selectOne("count_order", userId);
	}

	@Override
	public List<OrderDTO> orderContent(String userId) {
		return this.sqlSession.selectList("order_content", userId);
	}








	



	

	

	
	
	

}
