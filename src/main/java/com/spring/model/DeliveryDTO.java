package com.spring.model;

import lombok.Data;

@Data
public class DeliveryDTO {
	private String deli_zipcode; // 우편 번호
	private String deli_addr1; // 기본 주소
	private String deli_addr2; // 상세 주소
	private String user_id; // 유저 아이디 FK
}
