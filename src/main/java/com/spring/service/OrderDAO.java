package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.CartDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;

public interface OrderDAO {
	
	//占쌍깍옙 占쌍뱄옙 占쏙옙占쏙옙트占쏙옙 占쌀뤄옙占쏙옙占쏙옙 占쌨쇽옙占쏙옙
	List<OrderDTO> getNewOrderList();
	
	//占쌍뱄옙 占쏙옙占쏙옙트占쏙옙 占쌀뤄옙占쏙옙占쏙옙 占쌨쇽옙占쏙옙
	List<OrderDTO> getOrderList();
	
	//카占쌓곤옙 占쏙옙占쏙옙트占쏙옙 占쌀뤄옙占쏙옙占쏙옙 占쌨쇽옙占쏙옙
	List<Product_categoryDTO> getCategoryList();
	
	//占쏙옙체 占쌍뱄옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙 占쌨쇽옙占쏙옙
	int getOrderCount();
	
	// 占쌍뱄옙 占쏙옙占쏙옙占쏙옙 DB 占쏙옙 占쌍댐옙 占쌨쇽옙占쏙옙
    void insertOrder(OrderDTO dto);

    // 占쌍뱄옙 DB 占쏙옙 占쏙옙占쏙옙占쏙옙 占쌨아울옙占쏙옙 占쌨쇽옙占쏙옙
    CartDTO getOrderCont(int order_no);

    // 占쌍뱄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쌨쇽옙占쏙옙
    void updateOrder(OrderDTO dto);

    // 占쌍뱄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쌨쇽옙占쏙옙
    void deleteOrder(int order_no);
    
    // DB ���� ��泥� 二쇰Ц 紐⑸� ��瑜� 諛����ㅻ�� 硫�����
    int getOrderListCount();
    
    // �ㅻ�����대��� 由ъ�ㅽ�몃�� 諛����ㅻ�� 硫�����
    List<OrderDTO> getOrderList(PageDTO dto);
    
    // �ㅻ��由ъ�ㅽ�몄�� ����踰��몄�� �대�뱁���� ���� ��蹂대�� 諛����ㅻ�� 硫�����
    List<ProductDTO> getOrderProductList(int product_no);
    
    // 二쇰Ц踰��몄�� �대�뱁���� 二쇰Ц�댁���� 二쇰Ц����瑜� 蹂�寃쏀���� 硫�����
    int orderStatusChange(Map<String, Object> map);
    
    // �ㅻ�����대��� 寃��� 由ъ�ㅽ�몄�� ��瑜� 諛����ㅻ�� 硫�����
    int getOrderSearchListCount(String keyword);
    
    // �ㅻ�����대��� 寃��� 由ъ�ㅽ�몃�� 諛����ㅻ�� 硫�����
    List<OrderDTO> getOrderSearchList(Map<String, Object> map);
    
    // DB ���� ��泥� 二쇰Ц 紐⑸� ��瑜� 諛����ㅻ�� 硫�����
    int getOrderDelListCount();
    
    // �ㅻ�����대��� 二쇰Ц�� 痍⑥���� 由ъ�ㅽ�몃�� 諛����ㅻ�� 硫�����
    List<OrderDTO> getOrderDelList(PageDTO dto);
    
    // �ㅻ�����대��� 寃��� 由ъ�ㅽ�몄�� ��瑜� 諛����ㅻ�� 硫�����
    int getOrderDelSearchListCount(String keyword);
    
    // �ㅻ�����대��� 寃��� 由ъ�ㅽ�몃�� 諛����ㅻ�� 硫�����
    List<OrderDTO> getOrderDelSearchList(Map<String, Object> map);
    
    List<OrderDTO> getSamePakageOrderList(int order_pakage);
    

}
