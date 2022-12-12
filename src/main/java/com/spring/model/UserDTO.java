package com.spring.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_name;
	private int user_jumin1; //주민등록번호 앞자리
 	private String user_addr1;
	private String user_phone1;
	private int user_point;
	private Date user_date; //회원가입일
	private int user_leave; //회원탈퇴여부 기본값:1 탈퇴시:2
	private int user_jumin2;//주민등록번호 뒷자리
	private String user_phone2;
	private String user_phone3;
	private String user_addr2;
	private String user_zipcode1;//우편번호
	
}
