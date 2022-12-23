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
	public int userDelete(String userId) {
		return this.sqlSession.update("user_delete", userId);
	}
	
	@Override
	public List<Subscribe_userDTO> getSubCont(String userId) {
		return this.sqlSession.selectList("sub_cont", userId);
	}
	
	@Override
	public void subDelete(String userId) {
		this.sqlSession.update("sub_delete", userId);
	}
	
	@Override
	public void subUserUpdate(int sub_no) {
		this.sqlSession.update("sub_update", sub_no);
		
	}
	
	
	
	@Override
	public List<OrderDTO> getOrderCont(Map<String, Object> map) {
		return this.sqlSession.selectList("order_cont", map);
	}
	
	@Override
	public List<OrderDTO> orderContent(String userId) {
		return this.sqlSession.selectList("order_content", userId);
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
	public int reviewInsert(ReviewDTO rdto) {
		return this.sqlSession.insert("review_insert", rdto);
	}


	
	@Override
	public List<DeliveryDTO> getDeliveryCont(String userId) {
		return this.sqlSession.selectList("delivery_cont", userId);
	}
	
	@Override
	public int getDeliveryAddrCount(String userId) {
		return 0;
	}
	
	@Override
	public int deliveryInsert(Map<String, Object> map) {
		return this.sqlSession.insert("delivery_insert", map);
	}

	@Override
	public void updateDeliveryDefault(String userId) {
		this.sqlSession.update("default_update", userId);
	}

	@Override
	public DeliveryDTO getDeliveryModify(int deli_no) {
		
		return this.sqlSession.selectOne("deli_modify", deli_no);
	}

	@Override
	public int deliveryModify(Map<String, Object> map) {
		return this.sqlSession.update("deli_modify_ok", map);
	}




}