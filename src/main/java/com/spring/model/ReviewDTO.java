package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int review_no; // 리뷰 번호
	private String review_title; // 리뷰 제목
	private String review_cont; // 리뷰 내용
	private String review_file; // 리뷰 사진
	private int review_star; // 리뷰 별점 // 1~5까지
	private Date review_date; // 리뷰 날짜
	
	private String user_id; // 유저 아이디 FK
	private int product_no; // 상품 번호

}
