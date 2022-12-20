package com.spring.service;

import java.util.List;

import com.spring.model.Product_contentDTO;
import com.spring.model.admin_product_contentDTO;

public interface Admin_product_contentDAO {
	List<Product_contentDTO> getProductContList();
	
	admin_product_contentDTO getProductOne(int product_no);
	
	
	int insertProductContent(int product_no);
	
	int deleteProductCont(int product_no);
	
	void productContUpdateSeq(int product_no);
	
	
	
	//첫번째 파일만 들어왔을 때
	int UpdatePCFile1(admin_product_contentDTO dto);
	
	//두번째 파일만 들어왔을 때
	int UpdatePCFile2(admin_product_contentDTO dto);

	//세번째 파일만 들어왔을 때
	int UpdatePCFile3(admin_product_contentDTO dto);
	
	//첫번째만 안들어왔을 때
	int updateWithoutFile1(admin_product_contentDTO dto);

	//두번째만 안들어왔을 때
	int updateWithoutFile2(admin_product_contentDTO dto);

	//세번째만 안들어왔을 때
	int updateWithoutFile3(admin_product_contentDTO dto);
	
	//다 들어왔을 때
	int productContentUpdate(admin_product_contentDTO dto);
	
	//파일이 하나도 수정되지 않았을 때
	int updateWithoutFile(admin_product_contentDTO dto);
	


}
