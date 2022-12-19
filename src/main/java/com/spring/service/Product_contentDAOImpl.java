package com.spring.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.Product_contentDTO;
import com.spring.model.ReviewDTO;

@Repository
public class Product_contentDAOImpl implements Product_contentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Product_contentDTO> getProductContList(int product_no) {
		return this.sqlSession.selectList("all", product_no);
	}

	@Override
	public Product_contentDTO getProduct(int product_no) {
		return this.sqlSession.selectOne("all", product_no);
	}
	
	@Override
	public List<ReviewDTO> getReviewList(Map<String, Object> map, String sort) {
		return this.sqlSession.selectList(sort, map);
	}

	@Override
	public int getReviewCount(int product_no) {
		return this.sqlSession.selectOne("RCount", product_no);
	}

	@Override
	public int insertCart(CartDTO dto) {
		return this.sqlSession.insert("add_cart", dto);
	}
}