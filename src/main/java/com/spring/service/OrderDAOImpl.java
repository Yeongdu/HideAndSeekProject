package com.spring.service;

import java.util.List;

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
	public List<OrderDTO> getOrderList() {
		return this.sqlSession.selectList("admin_new5order");
	}

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
