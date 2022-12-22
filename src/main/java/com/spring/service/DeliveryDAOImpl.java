package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.DeliveryDTO;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<DeliveryDTO> getDeliveryCont(String userId) {
		return this.sqlSession.selectList("deli_cont", userId);
	}

	@Override
	public DeliveryDTO getDeli(int deli_no) {
		return this.sqlSession.selectOne("delivery", deli_no);
	}
	

	

}
