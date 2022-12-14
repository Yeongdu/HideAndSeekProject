package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			item.setProduct_stock(plist.get(0).getProduct_stock());
			
		}
		
		model.addAttribute("totalcart", totalcart);
		
		model.addAttribute("list", list);
		
		return "cart/cart";
		
	}
	
	@RequestMapping("/cart_delete.do")
	@ResponseBody
	public List<CartDTO> cartdelete(@RequestParam("cart_no") int cart_no,
								   @RequestParam("userId") String userId){
		
		this.dao.deleteCartList(cart_no);
		
		int count = this.dao.getCartCount(userId);
		
		List<CartDTO> list = this.dao.getCartList(userId);
		
		for(CartDTO item : list) {
			
			List<ProductDTO> plist = this.dao.getCartProductList(item.getProduct_no());
			
			item.setProduct_company(plist.get(0).getProduct_company());
			item.setProduct_name(plist.get(0).getProduct_name());
			item.setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
			item.setProduct_price(plist.get(0).getProduct_price());
			item.setProduct_stock(plist.get(0).getProduct_stock());
			
		}
		if(count != 0) {
			
			list.get(0).setTotalcart(count);
			
		}
		
		return list;
		
	}
	
	@RequestMapping("/cart_amount_minus.do")
	@ResponseBody
	public List<CartDTO> minuscart(@RequestParam("cart_no") int cart_no,
								   @RequestParam("userId") String userId){
		
		this.dao.minusCartAmonut(cart_no);
		
		List<CartDTO> list = this.dao.getCartList(userId);
		
		for(CartDTO item : list) {
			
			List<ProductDTO> plist = this.dao.getCartProductList(item.getProduct_no());
			
			
			item.setProduct_company(plist.get(0).getProduct_company());
			item.setProduct_name(plist.get(0).getProduct_name());
			item.setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
			item.setProduct_price(plist.get(0).getProduct_price());
			item.setProduct_stock(plist.get(0).getProduct_stock());
			
		}
		
		return list;
		
	}
	
	@RequestMapping("/cart_amount_plus.do")
	@ResponseBody
	public List<CartDTO> pluscart(@RequestParam("cart_no") int cart_no,
								   @RequestParam("userId") String userId){
		
		this.dao.plusCartAmonut(cart_no);
		
		List<CartDTO> list = this.dao.getCartList(userId);
		
		for(CartDTO item : list) {
			
			List<ProductDTO> plist = this.dao.getCartProductList(item.getProduct_no());
			
			
			item.setProduct_company(plist.get(0).getProduct_company());
			item.setProduct_name(plist.get(0).getProduct_name());
			item.setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
			item.setProduct_price(plist.get(0).getProduct_price());
			item.setProduct_stock(plist.get(0).getProduct_stock());
			
		}
		
		return list;
		
	}
	
}
