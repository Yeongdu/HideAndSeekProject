package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {
	
	@RequestMapping("admin_main.do")
	public String admin_main() {
		return "admin/admin_main";
	}
	
	
	

}
