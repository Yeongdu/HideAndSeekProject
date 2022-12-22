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
	public String sub_info(@RequestParam("userId")String userId, @RequestParam("pack")int pack, Model model) {
		
		List<DeliveryDTO> ddto = this.ddao.getDeliveryCont(userId);
		
		model.addAttribute("ddto", ddto);
		model.addAttribute("pack", pack);
		model.addAttribute("userId", userId);
		
		return "sub/sub_info";
	}
	
	@RequestMapping("sub_pay.do")
	public String sub_pay(@RequestParam("userId")String userId, @RequestParam("pack")int pack, @RequestParam("deli_no")int deli_no, Model model) {
		
		int pay = this.sdao.subPay(pack);
		
		model.addAttribute("pack", pack); // 패키지의 번호
		model.addAttribute("userId", userId);
		model.addAttribute("deli_no", deli_no);
		model.addAttribute("price", pay);
		
		return "sub/sub_pay";
		
	}

}
