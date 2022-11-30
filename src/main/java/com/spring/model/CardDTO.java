package com.spring.model;

import lombok.Data;

@Data
public class CardDTO {
	private int card_num; // 카드 순서번호
	private int card_no1; // 카드 번호1
	private int card_no2; // 카드 번호2
	private int card_no3; // 카드 번호3
	private int card_no4; // 카드 번호4
	private int card_cvc; // CVC 번호 // DB암호화
	private int card_pwd; // 카드 비밀번호 // DB암호화

	private String user_id; // 유저 아이디 FK
}
