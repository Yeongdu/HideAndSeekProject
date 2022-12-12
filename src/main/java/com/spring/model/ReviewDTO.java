package com.spring.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	private int review_no; // 리뷰 번호
	private String review_title; // 리뷰 제목
	private String review_cont; // 리뷰 내용
	private String review_file; // 리뷰 사진
	private int review_star; // 리뷰 별점 // 1~5까지
	
	@JsonFormat(pattern = "yyyy년 MM월 dd일")
	private Date review_date; // 리뷰 날짜
	
	private String user_id; // 유저 아이디 FK
	private int product_no; // 상품 번호

	//product
	private String product_name; // 상품 이름
	private String product_status; // 상품 상태 기본값:판매 .. 품절, 종료
	private int product_amount; // 상품 용량
}
