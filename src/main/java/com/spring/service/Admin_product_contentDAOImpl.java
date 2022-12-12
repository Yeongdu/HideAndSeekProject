package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Product_contentDTO;
import com.spring.model.admin_product_contentDTO;

@Repository
public class Admin_product_contentDAOImpl implements Admin_product_contentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Product_contentDTO> getProductContList() {
		return this.sqlSession.selectList("all");
	}

	@Override
	public admin_product_contentDTO getProductOne(int product_no) {
		return this.sqlSession.selectOne("adminProductContentCont", product_no);
	}

	@Override
	public int productContentUpdate(Product_contentDTO dto) {
		return this.sqlSession.update("admin_product_content_update", dto);
	}

	@Override
	public int insertProductContent(int no) {
		return this.sqlSession.insert("adminProductContentInsert", no);
	}


}
