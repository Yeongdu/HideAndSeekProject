package com.spring.service;

import java.util.List;

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

	@Override
	public int subPay(int pack) {
		return this.sqlSession.selectOne("package_price", pack);
	}

	@Override
	public List<SubscribeDTO> getAllsubscribeList() {
		return this.sqlSession.selectList("admin_all_sub_list");
	}

}
