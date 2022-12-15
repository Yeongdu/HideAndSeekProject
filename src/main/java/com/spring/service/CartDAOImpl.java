package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.ProductDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCartCount(String userId) {

		return this.sqlSession.selectOne("getCartCount", userId);
		
	}
	
	@Override
	public List<CartDTO> getCartList(String userId) {

		return this.sqlSession.selectList("getCartList", userId);
		
	}
	
	@Override
	public List<CartDTO> getCartDTO(int cart_no) {
		
		return this.sqlSession.selectList("getCartDTO", cart_no);
		
	}

	@Override
	public List<ProductDTO> getCartProductList(int product_no) {
		
		return this.sqlSession.selectList("getCartProductList", product_no);
		
	}

	@Override
	public void deleteCartList(int cart_no) {
		
		this.sqlSession.delete("deleteCartList", cart_no);
		
	}

	@Override
	public void minusCartAmonut(int cart_no) {
		
		this.sqlSession.update("minusCartAmonut", cart_no);
		
	}

	@Override
	public void plusCartAmonut(int cart_no) {

		this.sqlSession.update("plusCartAmonut", cart_no);
		
	}

	@Override
	public String getCartAmount(int cart_no) {
		
		return this.sqlSession.selectOne("getCartAmount", cart_no);
		
	}

	@Override
	public List<CartDTO> getCartMaxNo(int cart_no) {
		
		return this.sqlSession.selectList("getCartMaxNo", cart_no);
		
	}




}
