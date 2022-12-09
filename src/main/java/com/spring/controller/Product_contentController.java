package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.ProductDTO;
import com.spring.model.Product_contentDTO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;

@Controller
public class Product_contentController {
	
	@Autowired
	private Product_contentDAO pcdao;
	
	@Autowired
	private ProductDAO dao;
	
	 @RequestMapping("/product_content_list.do") 
	   public String list(@RequestParam("no") int no, Model model) {
	        List<Product_contentDTO> list = this.pcdao.getProductContList(no);
	        model.addAttribute("List", list);

	        ProductDTO dto = this.dao.getProductCont(no);
	        model.addAttribute("Cont", dto);
	        return "content/product_content_list";
	    }
	 
	
}
