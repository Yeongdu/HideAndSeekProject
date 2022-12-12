package com.spring.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.admin_productDTO;

@Repository
public class Admin_productDAOImpl implements Admin_productDAO{
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
	public List<admin_productDTO> getProductList(PageDTO dto) {
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
	public admin_productDTO getProductCont(int product_no) {
		return this.sqlSession.selectOne("adminProductContent", product_no);
	}

	@Override
	public List<admin_productDTO> searchProductList(Map<String, Object> map) {
		return this.sqlSession.selectList("adminProductSearch", map);
	}

	@Override
	public int getSearchListCount(String keyword) {
		return this.sqlSession.selectOne("getSearchListCount", keyword);
	}

	@Override
	public int insertProduct(admin_productDTO adto) {

		return this.sqlSession.insert("adminProductInsert", adto);
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


	@Override
	public int productUpdate(ProductDTO dto) {
		return this.sqlSession.update("adminProductUpdate", dto);
	}

}
