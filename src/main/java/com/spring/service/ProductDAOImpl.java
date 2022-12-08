package com.spring.service;

import java.util.List;
import java.util.Map;

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
	public int getListTagCount(Map<String, Object> map) {

		return this.sqlSession.selectOne("getListTagCount", map);
		
	}
	
	@Override
	public int getReviewCount(int product_no) {
		
		return this.sqlSession.selectOne("getReviewCount", product_no);
		
	}

	@Override
	public double getReviewStar(int product_no) {
		
			return this.sqlSession.selectOne("getReviewStar", product_no);
			
	}
	
	@Override
	public List<ProductDTO> getProductList(PageDTO dto) {
		return this.sqlSession.selectList("getProductList",dto);
	}

	
	@Override
	public List<ProductDTO> getProductList(PageDTO dto, String sort) {
		return this.sqlSession.selectList(sort,dto);
		
	}
	
	@Override
	public List<ProductDTO> getProductTagList(Map<String, Object> map, String sort) {

		return this.sqlSession.selectList(sort+"_tag", map);
		
	}

	@Override
	public ProductDTO getProductCont(int product_no) {
		return this.sqlSession.selectOne("adminProductCont", product_no);
	}

	@Override
	public List<ProductDTO> searchProductList(Map<String, Object> map) {
		return this.sqlSession.selectList("adminProductSearch", map);
	}

	@Override
	public int getSearchListCount(String keyword) {
		return this.sqlSession.selectOne("getSearchListCount", keyword);
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		return this.sqlSession.insert("adminProductInsert", dto);
	}

	//판매중 -> 판매중지(품절)
	@Override
	public int productStatusChange(int product_no) {
		return this.sqlSession.update("productStatusChange", product_no);
	}

	//판매중지(품절) -> 판매중
	@Override
	public int productStatusChange2(int product_no) {
		return this.sqlSession.update("productStatusChange2", product_no);
	}

}
