package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscribeController {
	
	@RequestMapping("sub.do")
	public String sub() {
		
		return "sub/sub_main";
	} 
	
	@RequestMapping("sub_insert.do")
	public String sub_insert() {
		return "sub/sub_insert_package";
	}

}
