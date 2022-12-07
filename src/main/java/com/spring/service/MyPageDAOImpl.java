package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.DeliveryDTO;
import com.spring.model.ReviewDTO;
import com.spring.model.SubscribeDTO;
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
	public CartDTO getOrderCont(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO getReviewCont(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subscribe_userDTO> getSubCont(String userId) {
		System.out.println("IMPL userId >>> " + userId);
		return this.sqlSession.selectList("sub_cont", userId);
	}

	@Override
	public DeliveryDTO getDeliveryCont(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
