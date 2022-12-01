package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("getListCount");
		
	}

	@Override
	public List<ProductDTO> getProductList(PageDTO dto) {

		return this.sqlSession.selectList("getProductList", dto);
		
	}

	@Override
	public ProductDTO getProductCont(int product_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
