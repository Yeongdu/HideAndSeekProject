package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.OrderDTO;
import com.spring.service.OrderDAO;


@Controller
public class AdminController {
	
	@Autowired
	private OrderDAO dao;
	
	@RequestMapping("admin_main.do")
	public String admin_main(Model model) {
		List<OrderDTO> list = this.dao.getOrderList();
		model.addAttribute("orderList", list);
		return "admin/admin_main";
	}
	
	@RequestMapping("admin_product_insert.do")
	public String product_insert() {
		return "admin/admin_product_insert";
	}
	
	

}
