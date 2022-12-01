package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int order_no; // 주문 번호
	private String order_status; //주문상태 기본값:주문완료
	private Date order_date; // 주문 날짜
	private String user_id; // 유저 아이디 FK
	private int product_no; // 상품 번호 FK
}
