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
	
}