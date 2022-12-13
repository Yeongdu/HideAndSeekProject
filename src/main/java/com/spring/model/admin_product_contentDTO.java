package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class admin_product_contentDTO {
	
	private int product_no; // 상품 번호 FK
	private MultipartFile product_file1file; // 상품 사진 첨부용
	private MultipartFile product_file2file;
	private MultipartFile product_file3file;
	private MultipartFile product_file4file;
	private MultipartFile product_file5file;
	
	private String product_file1; //상품 사진
	private String product_file2;
	private String product_file3;
	private String product_file4;
	private String product_file5;
	
	private String product_cont1; // 상품 설명
	private String product_cont2;
	private String product_cont3;
	private String product_cont4;
	private String product_cont5;
}
