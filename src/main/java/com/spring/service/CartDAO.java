package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.model.CartDTO;
import com.spring.model.ProductDTO;


public interface CartDAO {

	// 유저 ID 에 해당하는 장바구니 수를 받아오는 메서드
	int getCartCount(String userId);
	
	// 유저 ID 에 해당하는 장바구니 정보를 받아오는 메서드
	List<CartDTO> getCartList(String userId);
	
	// 상품 번호에 해당하는 상품 정보를 받아오는 메서드
	List<ProductDTO> getCartProductList(int product_no);
	
	// 카트 번호에 해당하는 장바구니 정보를 삭제하는 메서드
	void deleteCartList(int cart_no);
	
}
