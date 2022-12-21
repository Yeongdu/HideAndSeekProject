package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.DeliveryDTO;
import com.spring.model.SubscribeDTO;
import com.spring.service.DeliveryDAO;
import com.spring.service.SubscribeDAO;

@Controller
public class SubscribeController {
	
	@Autowired
	private SubscribeDAO sdao;
	
	@Autowired
	private DeliveryDAO ddao;
	
	@RequestMapping("sub.do")
	public String sub(SubscribeDTO sdto, Model model) {
		
		sdto = this.sdao.subCont();
		
		model.addAttribute("sdto", sdto);
		
		return "sub/sub_main";
	} 
	
	@RequestMapping("sub_info.do")
	public String sub_info(@RequestParam("userId")String userId, Model model) {
		
		List<DeliveryDTO> ddto = this.ddao.getDeliveryCont(userId);
		
		model.addAttribute("ddto", ddto);
		
		return "sub/sub_info";
	}

}
