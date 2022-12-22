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
	public String sub_info(@RequestParam("userId")String userId,Model model) {
		
		List<DeliveryDTO> ddto = this.ddao.getDeliveryCont(userId);
		
		SubscribeDTO sdto = this.sdao.subCont();
		
		model.addAttribute("ddto", ddto);
		model.addAttribute("userId", userId);
		model.addAttribute("sdto", sdto);
		
		return "sub/sub_info";
	}
	
	@RequestMapping("sub_pay.do")
	public String sub_pay(@RequestParam("userId")String userId, @RequestParam("deli_no")int deli_no, Model model) {
		
		DeliveryDTO ddto = this.ddao.getDeli(deli_no);
		SubscribeDTO sdto = this.sdao.subCont();
		
		model.addAttribute("userId", userId);
		model.addAttribute("deli_no", deli_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("ddto", ddto);
		
		return "sub/sub_pay";
		
	}
	
	@RequestMapping("sub_complete.do")
	public String sub_complete(@RequestParam("userId")String userId, @RequestParam("deli_no")int deli_no, Model model){
		
		DeliveryDTO ddto = this.ddao.getDeli(deli_no);
		SubscribeDTO sdto = this.sdao.subCont();
		
		model.addAttribute("userId", userId);
		model.addAttribute("deli_no", deli_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("ddto", ddto);
		
		return "sub_complete";
		
	}

}
