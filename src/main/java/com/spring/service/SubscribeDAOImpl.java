package com.spring.service;

import java.util.List;
import java.util.Map;

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

	@Override
	public int getSubMaxPackageNo() {
		return this.sqlSession.selectOne("getSubMaxPackageNo");
	}
	
	@Override
	public int insertSub1(Map<String, Object> map) {
		return this.sqlSession.insert("admin_sub_insert1", map);
	}

	@Override
	public int insertSub2(Map<String, Object> map) {
		return this.sqlSession.insert("admin_sub_insert2", map);
	}

	@Override
	public int insertSub3(Map<String, Object> map) {
		return this.sqlSession.insert("admin_sub_insert3", map);
	}


}
