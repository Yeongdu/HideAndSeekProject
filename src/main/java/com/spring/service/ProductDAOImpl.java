package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> getProductList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDTO getProductCont(int product_no) {
		// TODO Auto-generated method stub
		return null;
	}
}
