package com.spring.model;

import lombok.Data;

// 페이징 처리 작업 시 작업할 내용을 설정하는 객체

@Data
public class PageDTO {
	
	// 페이징 처리 관련 멤버 선언
	private int page;			// 현재 페이지
	private int rowsize;		// 한 페이지당 보여질 게시물의 수
	private int totalRecord;	// DB상의 테이블 전체 레코드 수
	private int startNo;		// 해당 페이지에서 시작 글 번호
	private int endNo;			// 해당 페이지에서 끝 글 번호
	
	public PageDTO() {	}	// 기본 생성자
	
	// 일반적인 페이징 처리 생성자
	public PageDTO(int page, int rowsize) {
			
		this.page = page;
		this.rowsize = rowsize;
			
		// 해당 페이지에서 시작 글 번호
		this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);
			
		// 해당 페이지에서 끝 글번호
		this.endNo = (this.page * this.rowsize);
			
			
	}	// 인자 생성자
	
	// 일반적인 페이징 처리 생성자
	public PageDTO(int page, int rowsize, int totalRecord) {
		
		this.page = page;
		this.rowsize = rowsize;
		this.totalRecord = totalRecord;
		
		// 해당 페이지에서 시작 글 번호
		this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);
		
		// 해당 페이지에서 끝 글번호
		this.endNo = (this.page * this.rowsize);
		
		
	}	// 인자 생성자
	
}
