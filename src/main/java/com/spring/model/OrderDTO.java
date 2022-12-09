package com.spring.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderDTO {
	private int order_no; // 주문 번호
	private String order_status; //주문상태 기본값:주문완료
	
	@JsonFormat(pattern = "yyyy년 MM월 dd일")
	private Date order_date; // 주문 날짜
	
	private String user_id; // 유저 아이디 FK
	private int product_no; // 상품 번호 FK
	private int order_amount; // 주문 갯수
	
	private int count;
	
	// join용 product dto
	private String product_name; // 상품 이름
	private String product_category;
	private String product_introduce1;	// 상품 설명1
	private String product_introduce2;	// 상품 설명2
	private String product_company; // 상품 제조사
	private int product_alcohol; // 도수
	private int product_price; // 상품 판매가
	private String product_thumbnail; // 상품 썸네일
	
}
