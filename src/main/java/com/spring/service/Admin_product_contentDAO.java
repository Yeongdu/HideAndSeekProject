package com.spring.service;

import java.util.List;

import com.spring.model.Product_contentDTO;

public interface Admin_product_contentDAO {
	List<Product_contentDTO> getProductContList();
	
	Product_contentDTO getProduct(int product_no);
	
	int productContentUpdate(Product_contentDTO dto);

}
