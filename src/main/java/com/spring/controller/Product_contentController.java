package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.CartDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_contentDTO;
import com.spring.model.ReviewDTO;
import com.spring.service.CartDAO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;

@Controller
public class Product_contentController {
	
	@Autowired
	private Product_contentDAO pcdao;
	
	@Autowired
	private ProductDAO dao;
	
	@Autowired
	private CartDAO cdao;
	
	//한 페이지당 보여질 게시물의 수
	private final int rowsize = 3;
	
	//DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	 @RequestMapping("/product_content_list.do") 
	   public String list(HttpServletRequest request, Model model, @RequestParam("no") int no) {
	        List<Product_contentDTO> list = this.pcdao.getProductContList(no);
	        model.addAttribute("List", list);

	        ProductDTO dto = this.dao.getProductCont(no);
	        model.addAttribute("Cont", dto);
	        
	        String sort = "release";
	        
	        int page;
	        if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				//처음으로 게시물 전체 목록 태그를 클릭한 경우
				page = 1;
			}
	        
	        int totalRecord = this.pcdao.getReviewCount(no);
	        
	        PageDTO page_dto = new PageDTO(page, rowsize, totalRecord);
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        
	        map.put("product_no", no);
	        map.put("startNo", page_dto.getStartNo());
	        map.put("endNo", page_dto.getEndNo());
	        
	        List<ReviewDTO> rlist = this.pcdao.getReviewList(no, sort);
	        model.addAttribute("RList", rlist);
	        model.addAttribute("Paging", page_dto);
	        System.out.println("리뷰 : "+rlist);
	        System.out.println("페이지 : "+page_dto);
	        
	        //수정중
	        int RCount = this.pcdao.getReviewCount(no);
	        double SCount = this.pcdao.getReviewStar(no);
	        model.addAttribute("RCount", RCount);
	        model.addAttribute("SCount", SCount);
	        
	        return "content/product_content_list";
	    }
	 
	 //CartDB에 저장
	 @RequestMapping("/cart_ok.do")
	 @ResponseBody
	 public void insertCart(CartDTO dto, HttpServletResponse response, HttpSession session) throws IOException {
		 int check = this.pcdao.insertCart(dto);
		 
		 System.out.println("CartDTO" + dto);
		 
		 String userId = (String)session.getAttribute("userId");
		 session.setAttribute("rcount", cdao.getCartCount(userId));
	 }
	 
	 @RequestMapping("/product_review.do")
	 @ResponseBody
	 public List<ReviewDTO> product_review(@RequestParam("sort") String sort, @RequestParam("product_no") int no) {
		 List<ReviewDTO> list = this.pcdao.getReviewList(no, sort);
		 
		 System.out.println("list : " + list);
		 System.out.println("sort : " + sort);
		 System.out.println("product_no : " + no);
		 
		 return list;
	 }
	 
	 @RequestMapping("/product_review_more.do")
	 @ResponseBody
	 public List<ReviewDTO> product_review_more(@RequestParam("sort") String sort, @RequestParam("product_no") int no) {
		 List<ReviewDTO> list = this.pcdao.getReviewListMore(no, sort);
		 
		 System.out.println("list1 : " + list);
		 System.out.println("sort1 : " + sort);
		 System.out.println("product_no1 : " + no);
		 
		 return list;
	 }
	 
	 @RequestMapping("/product_review_photo.do")
	 @ResponseBody
	 public List<ReviewDTO> product_review_photo(@RequestParam("sort") String sort, @RequestParam("product_no") int no) {
		 List<ReviewDTO> list = this.pcdao.getReviewListPhoto(no, sort);
		 
		 System.out.println("list2 : " + list);
		 System.out.println("sort2 : " + sort);
		 System.out.println("product_no2 : " + no);
		 
		 return list;
	 }

}