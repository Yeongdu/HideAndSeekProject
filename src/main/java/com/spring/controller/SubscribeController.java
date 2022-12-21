package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.SubscribeDTO;
import com.spring.service.SubscribeDAO;

@Controller
public class SubscribeController {
	
	@Autowired
	private SubscribeDAO sdao;
	
	@RequestMapping("sub.do")
	public String sub() {
		
		return "sub/sub_main";
	} 
	
	@RequestMapping("sub_insert.do")
	public String sub_insert() {
		return "sub/sub_insert_package";
	}
	
	@RequestMapping("sub_info.do")
	public String sub_info(SubscribeDTO sdto, Model model) {
		
		sdto = this.sdao.subCont();
		
		model.addAttribute("sdto", sdto);
		
		return "sub/sub_info";
	}

}
