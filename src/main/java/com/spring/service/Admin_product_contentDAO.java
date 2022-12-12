package com.spring.service;

import java.util.List;

import com.spring.model.Product_contentDTO;
import com.spring.model.admin_product_contentDTO;

public interface Admin_product_contentDAO {
	List<Product_contentDTO> getProductContList();
	
	admin_product_contentDTO getProductOne(int product_no);
	
	int productContentUpdate(Product_contentDTO dto);
	
	int insertProductContent(int product_no);

}
