package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;
import com.spring.service.MyPageDAO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypage_dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 3;

	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	
	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		 UserDTO user_info = this.mypage_dao.getUserCont(userId);
		 int count = this.mypage_dao.getOrderCount(userId);
		 int order = this.mypage_dao.getOrderAllCount(userId);
		 int refund = this.mypage_dao.getRefundCount(userId);
		 int delivery = this.mypage_dao.getDeliveryCount(userId);
		 int delivery_complete = this.mypage_dao.getDeliveryCompleteCount(userId);
		 
		 model.addAttribute("user_cont", user_info);
		 model.addAttribute("count", count);
		 model.addAttribute("order", order);
		 model.addAttribute("refund", refund);
		 model.addAttribute("delivery", delivery);
		 model.addAttribute("delivery_complete", delivery_complete);
		 
		 
		 if(userId != null) {
			 return "mypage/mypage_main";
		 }else {
			 return "user/login";
		 }
		 
		 
	}
	
	@RequestMapping("mypage_sub.do")
	
	@ResponseBody
	public List<Subscribe_userDTO> mypage_sub(Model model, @RequestParam("userId")String userId) {
		
		List<Subscribe_userDTO> sub_info = this.mypage_dao.getSubCont(userId);
		
		return sub_info;
		
	}
	
	@RequestMapping("mypage_order.do")
	@ResponseBody
	public List<OrderDTO> mypage_order(Model model, @RequestParam("userId") String userId, @RequestParam("page") int page){
		
		int totalRecord;
		
		System.out.println("userId >>> " + userId);
		System.out.println("page >>> " + page);
		
		totalRecord = this.mypage_dao.getOrderCount(userId);
		
		System.out.println("totalRecord >>> " + totalRecord);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("startNo", dto.getStartNo());
		map.put("endNo", dto.getEndNo());
		
		List<OrderDTO> order_info = this.mypage_dao.getOrderCont(map);
		
		System.out.println("order_info >>> " + order_info);
		
		return order_info;
		
	}
	
}
