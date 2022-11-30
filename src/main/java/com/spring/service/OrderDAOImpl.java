package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertOrder(OrderDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CartDTO getOrderCont(int order_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrder(OrderDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOrder(int order_no) {
		// TODO Auto-generated method stub
		
	}



}
