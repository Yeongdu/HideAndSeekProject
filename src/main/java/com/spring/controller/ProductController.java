package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.service.ProductDAO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 4;
		
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	@RequestMapping("/store_tlist.do")
	public String list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
				
		if(request.getParameter("page") != null) {
					
			page = Integer.parseInt(request.getParameter("page"));
					
		}else {
					
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
					
		}
				
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.dao.getListCount();
				
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
				
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<ProductDTO> list = this.dao.getProductList(dto);
		
		System.out.println("list 값 >>> " + list);
		System.out.println("totalRecord 값 >>> " + totalRecord);
		System.out.println("rowsize 값 >>> " + rowsize);
		System.out.println("page 값 >>> " + page);
		System.out.println("startno 값 >>> " + dto.getStartNo());
		System.out.println("endno 값 >>> " + dto.getEndNo());
		
		model.addAttribute("list", list);
		
		model.addAttribute("page", dto);
		
		return "store/store_takju";
		
	}
}
