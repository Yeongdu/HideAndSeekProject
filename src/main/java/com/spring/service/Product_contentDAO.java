package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.Product_contentDTO;
import com.spring.model.ReviewDTO;

public interface Product_contentDAO {
	List<Product_contentDTO> getProductContList(int product_no);
	
	Product_contentDTO getProduct(int product_no);	
	
	List<ReviewDTO> getReviewList(Map<String, Object> map);
	
	int getReviewCount(int product_no);
}