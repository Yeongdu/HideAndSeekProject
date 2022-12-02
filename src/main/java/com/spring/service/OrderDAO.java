package com.spring.service;

import java.util.List;

import com.spring.model.CartDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;

public interface OrderDAO {
	
	//주문 리스트를 불러오는 메서드
	List<OrderDTO> getOrderList();
	
	// 주문 정보를 DB 에 넣는 메서드
    void insertOrder(OrderDTO dto);

    // 주문 DB 의 정보를 받아오는 메서드
    CartDTO getOrderCont(int order_no);

    // 주문 정보를 변경하는 메서드
    void updateOrder(OrderDTO dto);

    // 주문 정보를 삭제하는 메서드
    void deleteOrder(int order_no);

}
