package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;
import com.spring.model.Product_contentDTO;
import com.spring.service.Admin_productDAO;
import com.spring.service.Admin_product_contentDAO;
import com.spring.service.OrderDAO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;


@Controller
public class AdminController {
	
	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	@Autowired
	private Product_contentDAO pcdao;
	
	@Autowired
	private Admin_productDAO apdao;
	
	@Autowired
	private Admin_product_contentDAO apcdao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 10;
	
			
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
	
	@RequestMapping("/admin_product_insert_ok.do")
	public void product_insert_Ok(ProductDTO dto, HttpServletResponse response) throws IOException {
		
		if(dto.getProduct_alcohol() <= 7) {
			dto.setProduct_dosu("low");
		}else if(dto.getProduct_alcohol() <= 20) {
			dto.setProduct_dosu("middle");
		}else if(dto.getProduct_alcohol() <= 35) {
			dto.setProduct_dosu("high");
		}else if(dto.getProduct_alcohol() <= 50) {
			dto.setProduct_dosu("very-high");	
		}
		
		int check = this.pdao.insertProduct(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('제품 등록 성공'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품 등록 실패했습니다.'); history.back(); </script>");
		}
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
	
	
	@RequestMapping("admin_product_search.do")
	public String admin_product_search(HttpServletRequest request, 
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		int rowsize = 10;
		int totalRecord;

						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.pdao.getSearchListCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("Page", dto);
		
		List<ProductDTO> productSearchList = this.pdao.searchProductList(map);

		model.addAttribute("list", productSearchList);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);
		
		return "admin/admin_product_search";
	}
	
	@RequestMapping("admin_product_content.do")
	public String admin_product_cont(@RequestParam("no") int no,@RequestParam("page") int page , Model model) {
		ProductDTO dto = this.pdao.getProductCont(no);
		model.addAttribute("Cont", dto);
		
		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		model.addAttribute("PCCont", pcdto);
		
		model.addAttribute("page", page);
		
		return "admin/admin_product_cont";
	}
	
	//판매중 -> 판매중지(품절)
	@RequestMapping("admin_product_statusChange.do")
	public void admin_product_statusChange(HttpServletResponse response, @RequestParam("no") int no) throws IOException {
		int check = this.pdao.productStatusChange(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	//판매중지(품절) -> 판매중
	@RequestMapping("admin_product_statusChange2.do")
	public void admin_product_statusChange2(HttpServletResponse response, @RequestParam("no") int no) throws IOException {
		int check = this.pdao.productStatusChange2(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	@RequestMapping("admin_product_update.do")
	public String admin_productUpdate(@RequestParam("page") int page, @RequestParam("no") int no, Model model) {
		ProductDTO pdto = this.pdao.getProductCont(no);
		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		model.addAttribute("PCont", pdto);
		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		
		return "admin/admin_product_update";
		
//		int check = this.dao.updateMember(dto);
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(check > 0) {
//			out.println("<script> alert('회원수정성공'); location.href='member_content.do?num="+dto.getNum()+"'; </script>");
//		}else {
//			out.println("<script> alert('회원등록실패 8^8'); history.back(); </script>");
//		}
	}
	
	@RequestMapping("admin_product_update_ok.do")
	public String admin_product_update_ok(
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
			ProductDTO pdto, 
			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model) throws IOException {

		
		int check1 = this.apdao.productUpdate(pdto);
		int check2 = this.apcdao.productContentUpdate(pccdto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("page", page);
		
		if(check1 > 0 || ( (check1 > 0)  && (check2 > 0) )) { //&page="+page+"
			out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no="+no+"&page="+page+"'; </script>");
		}else {
			out.println("<script> alert('상품수정실패'); history.back(); </script>");
		}
		ProductDTO dto = this.pdao.getProductCont(no);
		model.addAttribute("Cont", dto);
		
		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		model.addAttribute("PCCont", pcdto);
		return "admin/admin_product_cont";
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
