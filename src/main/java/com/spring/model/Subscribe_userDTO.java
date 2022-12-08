package com.spring.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Subscribe_userDTO {
	private int sub_no; // 구독 번호
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date sub_start; // 구독 시작일
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date sub_end; // 구독 종료일
	
	private String sub_status; // 구독 상태 기본값:진행 .. 휴식,진행,종료
	private String user_id; // 유저 아이디 FK
	private String sub_package; // 구독 패키지명
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date sub_date; // 판매 기간
	
	private int product_no; // 상품 번호
	private String sub_image; // 패키지 이미지 
	
	
	// 상품 상세 관련 
	private String product_name; // 상품 이름
	private String product_category; // 상품 카테고리
	private String product_introduce1;	// 상품 설명1
	private int product_alcohol; // 도수
	private int product_price; // 상품 판매가
	private String product_thumbnail; // 상품 썸네일
	
}