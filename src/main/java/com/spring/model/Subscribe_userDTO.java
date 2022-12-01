package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class Subscribe_userDTO {
	private int sub_no; // 구독 번호
	private Date sub_start; // 구독 시작일
	private Date sub_end; // 구독 종료일
	private String sub_status; // 구독 상태 기본값:진행 .. 휴식,진행,종료
	private String user_id; // 유저 아이디 FK
}