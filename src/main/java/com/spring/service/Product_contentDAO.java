package com.spring.service;

import java.util.List;

import com.spring.model.Product_contentDTO;

public interface Product_contentDAO {
	List<Product_contentDTO> getProductContList();
	
	Product_contentDTO getProduct(int product_no);
	
}
