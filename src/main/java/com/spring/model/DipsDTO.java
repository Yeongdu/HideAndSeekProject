package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class DipsDTO {
	private int dibs_no; // 찜 번호
	private Date dibs_date; // 찜 날짜
	private String user_id;  // 유저 아이디 FK
	private int product_no; // 상품 번호 FK
}
