package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.SubscribeDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;
import com.spring.service.MyPageDAO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypage_dao;
	
	
	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		 UserDTO user_info = this.mypage_dao.getUserCont(userId);
		 model.addAttribute("user_cont", user_info);
		 return "mypage/mypage_main";
		 
	}
	
	@RequestMapping("mypage_sub.do")
	
	@ResponseBody
	public List<Subscribe_userDTO> mypage_sub(Model model, HttpServletResponse response, @RequestParam("userId")String userId) {
		
		System.out.println("Controller userId >>> " + userId);
		
		List<Subscribe_userDTO> sub_info = this.mypage_dao.getSubCont(userId);
		
		System.out.println("sub_info >>> " + sub_info);
		
		return sub_info;
		
	}
	
	
	
	
	
}
