package com.spring.service;

import com.spring.model.CartDTO;


public interface CartDAO {
	// 장바구니 정보를 DB 에 넣는 메서드
    void insertCart(CartDTO dto);

    // 장바구니 DB 의 정보를 받아오는 메서드
    CartDTO getCartCont(int cart_no);

    // 장바구니의 정보를 변경하는 메서드
    void updateCart(CartDTO dto);

    // 장바구니의 정보를 삭제하는 메서드
    void deleteCart(int cart_no);

}
