package com.spring.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SubscribeDTO {
	private int sub_no; // 구독 번호
	private String sub_package; // 구독 패키지명
	
	private String sub_date; // 판매 기간
	
	private int product_no; // 상품 번호
	private String sub_image; // 패키지 이미지
	
	private String sub_enddate;
	
	private String sub_status;
	private int sub_package_no;
	
	private int sub_price;

}
