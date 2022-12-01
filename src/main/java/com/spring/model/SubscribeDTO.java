package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class SubscribeDTO {
	private int sub_no; // 구독 번호
	private String sub_package; // 구독 패키지명
	private Date sub_date; // 판매 기간
	private int product_no; // 상품 번호

}
