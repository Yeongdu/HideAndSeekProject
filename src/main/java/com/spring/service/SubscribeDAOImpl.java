package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.SubscribeDTO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public SubscribeDTO subCont() {
		
		return this.sqlSession.selectOne("subList");
	}

}
