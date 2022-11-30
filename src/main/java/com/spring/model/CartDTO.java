package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cart_no; // 장바구니 번호
	private int cart_amount; // 장바구니 수량
	private int cart_price; // 장바구니 가격
	private Date cart_date; // 장바구니 날짜
	private String user_id; // 유저아이디 FK
	private int product_no; // 상품 번호 FK

}
