package com.spring.service;

import java.util.List;

import com.spring.model.CartDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;

public interface OrderDAO {
	
	//�ֱ� �ֹ� ����Ʈ�� �ҷ����� �޼���
	List<OrderDTO> getNewOrderList();
	
	//�ֹ� ����Ʈ�� �ҷ����� �޼���
	List<OrderDTO> getOrderList();
	
	//ī�װ� ����Ʈ�� �ҷ����� �޼���
	List<Product_categoryDTO> getCategoryList();
	
	//��ü �ֹ��� �ҷ����� �޼���
	int getOrderCount();
	
	// �ֹ� ������ DB �� �ִ� �޼���
    void insertOrder(OrderDTO dto);

    // �ֹ� DB �� ������ �޾ƿ��� �޼���
    CartDTO getOrderCont(int order_no);

    // �ֹ� ������ �����ϴ� �޼���
    void updateOrder(OrderDTO dto);

    // �ֹ� ������ �����ϴ� �޼���
    void deleteOrder(int order_no);
    
    // DB 상의 전체 주문 목록 수를 받아오는 메서드
    int getOrderListCount();
    
    // 오더테이블의 리스트를 받아오는 메서드
    List<OrderDTO> getOrderList(PageDTO dto);
    
    // 오더리스트에 상품번호에 해당하는 상품 정보를 받아오는 메서드
    List<ProductDTO> getOrderProductList(int product_no);

}
