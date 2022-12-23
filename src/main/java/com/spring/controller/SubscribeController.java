package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.DeliveryDTO;
import com.spring.model.SubscribeDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.service.DeliveryDAO;
import com.spring.service.SubscribeDAO;
import com.spring.service.Subscribe_userDAO;

@Controller
public class SubscribeController {
	
	@Autowired
	private SubscribeDAO sdao;
	
	@Autowired
	private DeliveryDAO ddao;
	
	@Autowired
	private Subscribe_userDAO sudao;
	
	@RequestMapping("sub.do")
	public String sub(SubscribeDTO sdto, Model model) {
		
		sdto = this.sdao.subCont();
		
		model.addAttribute("sdto", sdto);
		
		return "sub/sub_main";
	}
	
	@RequestMapping("sub_check.do")
	public int sub_check(@RequestParam("userId")String userId, Model model) {
		
		List<Subscribe_userDTO> suball = this.sudao.SubList();
		
		int text1 = 0;
		
		for(Subscribe_userDTO item : suball) {
			String user = item.getUser_id();
			if(userId == user) {
				text1 = 1;
			}else {
				text1 = 0;
			}
		}
		
		return text1;
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("deli_no", deli_no);
		map.put("pack", sdto.getSub_package_no());
		map.put("pack_name", sdto.getSub_package());
		
		this.sudao.insertSubUser(map);
		this.sudao.insertSubStatus(map);
		
		model.addAttribute("userId", userId);
		model.addAttribute("deli_no", deli_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("ddto", ddto);
		
		return "sub/sub_complete";
		
	}

}
