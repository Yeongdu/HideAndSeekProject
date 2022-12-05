package com.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.UserDTO;
import com.spring.service.UserDAO;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserDAO dao;

	
	  @RequestMapping("user_login.do") 
	  public String loginList() {
	  
	  return "user/login";
	  
	  }
	 

	@RequestMapping("join_form.do")
	public String joinformList() {

		return "user/join";
	}

	@RequestMapping("policy.do")
	public String joinpolicyList() {

		return "user/policy";
	}

	@RequestMapping("privacy.do")
	public String joinprivacyList() {

		return "user/privacy";
	}
	
	

	
}
