package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cart_no; // 장바구니 번호
	private int cart_amount; // 장바구니 수량
	private Date cart_date; // 장바구니 날짜
	private String user_id; // 유저아이디 FK
	private int product_no; // 상품번호 FK
	
	private String product_name; // 상품 이름
	private String product_company; // 상품 제조사
	private int product_price; // 상품 판매가
	private String product_thumbnail; // 상품 썸네일
	private int product_stock; // 상품 재고수량
	
	private int totalcart; // 장바구니의 총 수량

}
