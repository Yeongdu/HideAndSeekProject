package com.spring.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class EventDTO {
	
	private int event_no; // 이벤트 번호
	
	private MultipartFile event_thumbnailfile; // 썸네일
	private MultipartFile event_file1file; // 이벤트 사진1
	private MultipartFile event_file2file; // 이벤트 사진2
	private MultipartFile event_file3file; // 이벤트 사진3
	
	private String event_thumbnail; // 썸네일
	private String event_file1; // 이벤트 사진1
	private String event_file2;
	private String event_file3;
	
	private String event_cont1;// 이벤트 설명1
	private String event_cont2;
	private String event_cont3;
	
	private Date event_date; // 이벤트 등록일
	private String event_start; // 이벤트 시작일
	private String event_end; // 이벤트 종료일
	
	private String event_status; // 이벤트 상태
	
	private int product_no; // 제품 번호
	

}
