package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;

public interface ProductDAO {
	// DB 상의 전체 상품 수를 받아오는 메서드
    int getListCount();
    
    // 태그가 포함된 DB 상의 상품 수를 받아오는 메서드
    int getListTagCount(Map<String, Object> map);

    // 상품테이블의 리스트를 받아오는 메서드
    List<ProductDTO> getProductList(PageDTO dto);

    // 상품의 상세정보를 받아오는 메서드
    ProductDTO getProductCont(int product_no);
    
    //상품 검색하는 메서드
    List<ProductDTO> searchProductList(String field, String keyword);

}
