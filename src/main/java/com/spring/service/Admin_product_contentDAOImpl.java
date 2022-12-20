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
	public int productContentUpdate(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_product_content_update", dto);
	}

	@Override
	public int insertProductContent(int no) {
		return this.sqlSession.insert("adminProductContentInsert", no);
	}

	@Override
	public int deleteProductCont(int product_no) {
		return this.sqlSession.delete("adminProductContDelete", product_no);
	}

	@Override
	public void productContUpdateSeq(int product_no) {
		this.sqlSession.update("seqCont", product_no);
		
	}

	@Override
	public int UpdatePCFile1(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdatePCFile1", dto);
	}

	@Override
	public int UpdatePCFile2(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdatePCFile2", dto);
	}

	@Override
	public int UpdatePCFile3(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdatePCFile3", dto);
	}

	@Override
	public int updateWithoutFile1(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdateWithoutFile1", dto);
	}

	@Override
	public int updateWithoutFile2(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdateWithoutFile2", dto);
	}

	@Override
	public int updateWithoutFile3(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdateWithoutFile3", dto);
	}

	@Override
	public int updateWithoutFile(admin_product_contentDTO dto) {
		return this.sqlSession.update("admin_productUpdateWithoutFile", dto);
	}
	


}
