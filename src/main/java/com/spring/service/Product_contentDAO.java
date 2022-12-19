package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.CartDTO;
import com.spring.model.Product_contentDTO;
import com.spring.model.ReviewDTO;

public interface Product_contentDAO {
	List<Product_contentDTO> getProductContList(int product_no);
	
	Product_contentDTO getProduct(int product_no);	
	
	List<ReviewDTO> getReviewList(int product_no, String sort);

	List<ReviewDTO> getReviewListMore(int product_no, String sort);
	
	int getReviewCount(int product_no);
	
	int insertCart(CartDTO dto);
}