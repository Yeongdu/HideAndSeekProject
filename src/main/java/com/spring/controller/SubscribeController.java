package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public int sub_check(@RequestParam("userId")String userId, Model model) {
		
		int suball = this.sudao.SubList(userId);
		
		return suball;
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
		
		System.out.println("Controller 진입");
		
		DeliveryDTO ddto = this.ddao.getDeli(deli_no);
		SubscribeDTO sdto = this.sdao.subCont();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("deli_no", deli_no);
		map.put("pack", sdto.getSub_package_no());
		map.put("pack_name", sdto.getSub_package());
		
		this.sudao.insertSubUser(map);
		this.sudao.insertSubStatus(map);
		
		System.out.println("실행");
		
		model.addAttribute("userId", userId);
		model.addAttribute("deli_no", deli_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("ddto", ddto);
		
		return "redirect:sub_complete_ok.do";
		
	}
	
	@RequestMapping("sub_complete_ok.do")
	public String sub_complete_ok(@RequestParam("userId")String userId, @RequestParam("deli_no")int deli_no, Model model) {
		
		DeliveryDTO ddto = this.ddao.getDeli(deli_no);
		SubscribeDTO sdto = this.sdao.subCont();
		
		model.addAttribute("sdto", sdto);
		model.addAttribute("ddto", ddto);
		
		return "sub/sub_complete";
		
	}

}
