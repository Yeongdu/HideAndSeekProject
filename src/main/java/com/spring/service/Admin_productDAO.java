package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.admin_productDTO;

public interface Admin_productDAO {
	
	// DB 상의 전체 상품 수를 받아오는 메서드
    int getListCount();
    
    // 태그가 포함된 DB 상의 상품 수를 받아오는 메서드
    int getListTagCount(Map<String, Object> map);

    // 상품테이블의 정렬된 리스트를 받아오는 메서드
    List<ProductDTO> getProductList(PageDTO dto, String sort);
    
    // 상품테이블의 리스트를 받아오는 메서드
    List<admin_productDTO> getProductList(PageDTO dto);
    
	// 태그가 포함된 상품테이블의 리스트를 받아오는 메서드
    List<ProductDTO> getProductTagList(Map<String, Object> map, String sort);

    // 상품의 상세정보를 받아오는 메서드
    admin_productDTO getProductCont(int product_no);
    
    //상품 검색하는 메서드
    List<admin_productDTO> searchProductList(Map<String, Object> map);
    
    // 검색된 상품의 수를 받아오는 메서드
    int getSearchListCount(String keyword);
    
    //상품 추가하는 메서드
    int insertProduct(admin_productDTO adto);
    
    //상품의 판매상태를 변경하는 메서드
    int productStatusChange(int product_no);
    //상품의 판매상태를 변경하는 메서드
    int productStatusChange2(int product_no);
    
    //상품을 수정하는 메서드
    int productUpdate(admin_productDTO adto);

	int insertGoods(admin_productDTO adto);
	
	//상품을 삭제하는 메서드
	int deleteProduct(int product_no);
	
	//삭제후 번호재정렬
	void productUpdateSeq(int product_no);
	
	//판매 중지 상품 리스트 조회
	List<admin_productDTO> stopProductList(PageDTO dto);
	
	//판매 중지 상품 갯수 조회
	int getStopProductCount();
	
	//판매중인 상품 리스트 조회
	List<admin_productDTO> IngProductList(PageDTO dto);
	
	//판매중인 상품 갯수 조회
	int getIngProductCount();
	
	//판매중인 상품 검색 결과 갯수
	int getSearchIngProductCount(String keyword);
	
	//판매중인 상품 검색하는 메서드
    List<admin_productDTO> searchIngProductList(Map<String, Object> map);
    
    //썸네일 포함하지 않은 상품수정
    int productUpdateWithoutThumbnail(admin_productDTO adto);
    
    //카테고리 별 상품 전체 목록
    List<admin_productDTO> getProductCateSortTakjuList();
    List<admin_productDTO> getProductCateSortChungjuList();
    List<admin_productDTO> getProductCateSortWineList();
    List<admin_productDTO> getProductCateSortSojuList();
    
    //카테고리별 상품 목록
    List<ProductDTO> getCateProductList(String category);
	

}
