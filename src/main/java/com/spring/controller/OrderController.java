package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.CartDAO;
import com.spring.service.OrderDAO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private CartDAO cdao;
	
	// 결제 완료시 장바구니의 정보를 오더테이블에 인서트하는 메서드
		@RequestMapping("/insert_order.do")
		public String insertorder(@RequestParam("delivery_no") int delivery_no,
							    @RequestParam("amount") List<Integer> amount,
							    @RequestParam("product_no") List<Integer> product_no,
							    @RequestParam("cart_no") List<Integer> cart_no,
							    @RequestParam("userId") String userId,
							    @RequestParam("price") int price,
							    @RequestParam("point") int point,
							    HttpSession session) {
			
			int savepoint = price / 100;
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int packageno = this.dao.getOrderMaxPackageNo();
			
			map.put("minuspoint", point);
			
			map.put("savepoint", savepoint);
			
			map.put("packageno", packageno);
			
			map.put("userId", userId);
			
			map.put("delivery_no", delivery_no);
			
			for(int i=0; i<product_no.size(); i++) {
				
				int orderno = this.dao.getOrderMaxNo();
				
				map.put("orderno", orderno);
				
				map.put("product_no", product_no.get(i));
				
				map.put("amount", amount.get(i));
				
				if(cart_no.size() != 0) {
					
					int no = cart_no.get(i);
					
					this.cdao.deleteCartList(no);
					
					
				}
				
				this.dao.insertorder(map);
				
				this.dao.updateProductStock(map);
				
				this.dao.updateProductStatus(map);
				
			}
			
			this.dao.updateMinusPoint(map);
			
			this.dao.updateSavePoint(map);
			
			int count = this.cdao.getCartCount(userId);
			
			session.setAttribute("rcount", count);
			
			return "redirect:store.do";
			
		}
	
}
