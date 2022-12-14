package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.CartDTO;
import com.spring.model.ProductDTO;
import com.spring.service.CartDAO;

@Controller
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	@RequestMapping("/cart.do")
	public String cart(Model model, HttpServletRequest request) {
		
		String userId = (String) request.getSession().getAttribute("userId");
		
		int totalcart = this.dao.getCartCount(userId);
		
		List<CartDTO> list = this.dao.getCartList(userId);
		
		for(CartDTO item : list) {
			
			List<ProductDTO> plist = this.dao.getCartProductList(item.getProduct_no());
			
			
			item.setProduct_company(plist.get(0).getProduct_company());
			item.setProduct_name(plist.get(0).getProduct_name());
			item.setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
			item.setProduct_price(plist.get(0).getProduct_price());
			
		}
		
		model.addAttribute("totalcart", totalcart);
		
		model.addAttribute("list", list);
		
		return "cart/cart";
		
	}
	
	
}
