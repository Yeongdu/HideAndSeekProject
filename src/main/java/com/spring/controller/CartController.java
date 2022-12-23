package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.CartDTO;
import com.spring.model.DeliveryDTO;
import com.spring.model.ProductDTO;
import com.spring.model.UserDTO;
import com.spring.service.CartDAO;
import com.spring.service.MyPageDAO;

@Controller
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	@Autowired
	private MyPageDAO mdao;
	
	// 장바구니 테이블에서 userId 와 일치하는 장바구니 정보를 불러오는 메서드
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
	
	// 장바구니 삭제 시 userId 와 일치하는 장바구니 정보를 삭제하는 메서드
	@RequestMapping("/cart_delete.do")
	@ResponseBody
	public Integer cartdeletecount(HttpSession session,
								   @RequestParam("cart_no") int cart_no,
								   @RequestParam("userId") String userId){
		
		this.dao.deleteCartList(cart_no);
		
		int count = this.dao.getCartCount(userId);
		
		session.setAttribute("rcount", count);
		
		return count;
		
	}
	
	// 해당 상품에 해당하는 수량을 - 하는 메서드
	@RequestMapping("/cart_amount_minus.do")
	@ResponseBody
	public List<CartDTO> minuscart(@RequestParam("cart_no") int cart_no,
								   @RequestParam("userId") String userId){
		
		this.dao.minusCartAmonut(cart_no);
		
		List<CartDTO> list = this.dao.getCartDTO(cart_no);
		
		List<ProductDTO> plist = this.dao.getCartProductList(list.get(0).getProduct_no());
		
		list.get(0).setProduct_company(plist.get(0).getProduct_company());
		list.get(0).setProduct_name(plist.get(0).getProduct_name());
		list.get(0).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
		list.get(0).setProduct_price(plist.get(0).getProduct_price());
		list.get(0).setProduct_stock(plist.get(0).getProduct_stock());
		
		return list;
		
	}
	
	// 해당 상품에 해당하는 수량을 + 하는 메서드
	@RequestMapping("/cart_amount_plus.do")
	@ResponseBody
	public List<CartDTO> pluscart(@RequestParam("cart_no") int cart_no,
							 	  @RequestParam("userId") String userId){
		
		this.dao.plusCartAmonut(cart_no);
		
		List<CartDTO> list = this.dao.getCartDTO(cart_no);
		
		List<ProductDTO> plist = this.dao.getCartProductList(list.get(0).getProduct_no());
		
		list.get(0).setProduct_company(plist.get(0).getProduct_company());
		list.get(0).setProduct_name(plist.get(0).getProduct_name());
		list.get(0).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());
		list.get(0).setProduct_price(plist.get(0).getProduct_price());
		list.get(0).setProduct_stock(plist.get(0).getProduct_stock());
		
		return list;
		
	}
	
	// 버튼 클릭시 장바구니 정보를 가지고 배송지 선택을 위한 페이지로 이동하는 메서드
	@RequestMapping("/cart_delivery.do")
	public String cartdelivery(@RequestParam("product_no") List<Integer> product_no,
							   @RequestParam("cart_no") List<Integer> cart_no,
							   @RequestParam("amount") List<Integer> amount,
							   @RequestParam("name") List<String> name,
			   				   @RequestParam("sum") int total,
			   				   @RequestParam("delivery") int delivery,
			   				   @RequestParam("userId") String userId,
			   				   Model model) {
		
		List<DeliveryDTO> list = this.dao.getUserDeliveryList(userId);
		
		UserDTO dto = this.mdao.getUserCont(userId);
		
		model.addAttribute("list", list);
		model.addAttribute("product_no", product_no);
		model.addAttribute("cart_no", cart_no);
		model.addAttribute("amount", amount);
		model.addAttribute("name", name);
		model.addAttribute("sum", total);
		model.addAttribute("delivery", delivery);
		model.addAttribute("email", dto.getUser_email());
		model.addAttribute("point", dto.getUser_point());
		
		
		return "cart/cart_delivery";
	}
	
	// 배송지 라디오버튼 클릭시 해당 번호에 해당하는 배송지 정보를 가져오는 메서드
	@RequestMapping("/cart_delivery_list.do")
	@ResponseBody
	public List<DeliveryDTO> cartdeliveryList(@RequestParam("delivery_no") int delivery_no) {
		
		List<DeliveryDTO> list = this.dao.getDeliveryList(delivery_no);
		
		return list;
	}
	
	// 유저 탑 배너 로드 시 장바구니 카운트 숫자를 받아오는 메서드
	@RequestMapping("/banner_cart_count.do")
	@ResponseBody
	public String getcartcount(@RequestParam("userId") String userId,
						     HttpSession session) {
		
		int count = this.dao.getCartCount(userId);
		
		session.setAttribute("rcount", count);
		
		return "성공 메세지";
	}
	
}
