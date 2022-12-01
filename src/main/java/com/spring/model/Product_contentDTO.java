package com.spring.model;

import lombok.Data;

@Data
public class Product_contentDTO {
	
	private int product_no; // 상품 번호 FK
	private String product_file1; // 상품 사진
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
