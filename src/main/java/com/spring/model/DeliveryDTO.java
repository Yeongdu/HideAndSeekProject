package com.spring.model;

import lombok.Data;

@Data
public class DeliveryDTO {
	private String deli_zipcode; // 우편 번호
	private String deli_addr1; // 기본 주소
	private String deli_addr2; // 상세 주소
	private String user_id; // 유저 아이디 FK
	private int deli_default; // 기본 배송지 설정
	private String deli_name; // 배송지 이름 설정
	private String deli_phone1;
	private String deli_phone2;
	private String deli_phone3;
	private int deli_no;
}
