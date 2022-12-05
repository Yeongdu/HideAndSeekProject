package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Product_contentDTO;

@Repository
public class Product_contentDAOImpl implements Product_contentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Product_contentDTO> getProductContList() {
		return this.sqlSession.selectList("all");
	}

	@Override
	public Product_contentDTO getProduct(int no) {
		return this.sqlSession.selectOne("admin_product_content_cont", no);
	}
}
