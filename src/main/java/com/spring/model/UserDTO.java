package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_name;
	private int user_jumin; //주민등록번호 앞자리
	private int user_zipcode; //우편번호
	private String user_addr;
	private String user_phone;
	private int user_point;
	private Date user_date; //회원가입일
	private int user_leave; //회원탈퇴여부 기본값:1 탈퇴시:2
}
