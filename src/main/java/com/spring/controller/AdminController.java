package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;
import com.spring.service.OrderDAO;
import com.spring.service.ProductDAO;


@Controller
public class AdminController {
	
	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 4;
			
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	
	@RequestMapping("/admin_main.do")
	public String admin_main(Model model) {
		List<OrderDTO> list = this.dao.getOrderList();
		model.addAttribute("orderList", list);
		return "admin/admin_main";
	}
	
	@RequestMapping("/admin_product_insert.do")
	public String product_insert(Model model) {
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		return "admin/admin_product_insert";
	}
	
	@RequestMapping("/admin_product_list.do")
	public String admin_product_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.pdao.getListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<ProductDTO> plist = this.pdao.getProductList(dto);
		

		model.addAttribute("list", plist);
		
		model.addAttribute("page", dto);
		return "admin/admin_product_list";

	}
	
//	@RequestMapping("admin_product_insert_ok.do")
//	public void product_insert_ok(ProductDTO dto, HttpServletResponse response) {
//		return;
//	}
	
	@RequestMapping("admin_product_view.do")
	public String admin_product_view() {
		return "admin/admin_product_view";
	}
	
	@RequestMapping("admin_product_del.do")
	public String admin_product_del() {
		return "admin/admin_product_del";
	}
	
	@RequestMapping("admin_order_list.do")
	public String admin_order_list() {
		return "admin/admin_order_list";
	}
	
	@RequestMapping("admin_order_del.do")
	public String admin_order_del() {
		return "admin/admin_order_del";
	}
	


}
