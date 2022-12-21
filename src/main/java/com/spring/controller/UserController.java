package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.DeliveryDTO;
import com.spring.model.MailDTO;
import com.spring.model.UserDTO;
import com.spring.service.CartDAO;
import com.spring.service.UserDAO;
import com.sun.jdi.Location;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private CartDAO cdao;

	// 로그인페이지이동
	@RequestMapping("/user_login.do")
	public String loginList(HttpServletRequest request, HttpSession session) {

		String referer = request.getHeader("Referer");
		
		session.setAttribute("referer", referer);
		
		return "user/login";

	}

	// 회원가입페이지이동
	@RequestMapping("join_form.do")
	public String joinformList() {

		return "user/join";

	}
	


	//로그인
    @RequestMapping("user_check.do")
    public String signIn( HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestParam("id") String id, @RequestParam("pw") String pw, Model model) throws IOException {

    	if(id.equals("admin1") && pw.equals("1234")) {//관리자 아이디일때 
    		session.setAttribute("userId", id);
    		return "redirect:/admin_main.do";
    		
    	}else {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user_id", id);
        map.put("user_pwd", pw);

        int result = dao.userCheck(map);
        
        String referer = (String)session.getAttribute("referer");

        //상품상세페이지 주소
		/*
		 * String address = "http://localhost:8787/model/product_content_list.do?no=14";
		 */
        
        if (result == 1) { //아이디, 비밀번호 일치 시(로그인 성공)
            
              //세션값
            session.setAttribute("userId", id);
        	// 아이디에 해당하는 장바구니 수량을 가져오는 메서드
        	session.setAttribute("rcount", cdao.getCartCount(id));
      		 return "redirect:/store.do";
                 
        	
        	
        }else {//아이디, 비번 틀렸을 때
        	
        	model.addAttribute("msg","아이디, 비밀번호를 확인하세요");
        	model.addAttribute("url","/user_login.do");
        	
        	
        	
          
            return "user/redirect";
        }
    }
    }
	
	//회원가입_아이디 중복체크
	@ResponseBody
	@RequestMapping("/idCheck.do")
	public int idCheck(@RequestParam("user_id") String id) {
		
		System.out.println("Controller Id >>> " + id);
	
		int cnt = dao.idCheck(id);
		
		System.out.println("Controller cnt >>> " + cnt);
		
		return cnt;
		
		
	}
	
	//회원가입_ 이메일 중복체크
	@ResponseBody
	@RequestMapping("/emailCheck.do")
	public int emailCheck(@RequestParam("user_email") String email) {
		
		System.out.println("Controller email >>> " + email);
		
		int cnt = dao.emailCheck(email);
		
		System.out.println("Controller email cnt >>> " + cnt);
		
		return cnt;
		
		
	}
	
	//회원가입완료(DB에 값 저장)
	@RequestMapping("user_join_ok.do")
	public void insertUser(UserDTO dto,
	           HttpServletResponse response, DeliveryDTO ddto) throws IOException {
		
		
		int check = this.dao.insertUser(dto);
		
		System.out.println("회원가입 dto >>>" + dto);
		
		if(!dto.getUser_zipcode1().equals("null")) {
			
			ddto.setDeli_zipcode(dto.getUser_zipcode1());
			ddto.setDeli_addr1(dto.getUser_addr1());
			ddto.setDeli_addr2(dto.getUser_addr2());
			ddto.setUser_id(dto.getUser_id());
			ddto.setDeli_phone1(dto.getUser_phone1());
			ddto.setDeli_phone2(dto.getUser_phone2());
			ddto.setDeli_phone3(dto.getUser_phone3());
		
			
			
			this.dao.insertDelivery(ddto);
		}
		
		
		response.setContentType("text/html; charset=UTF-8");
		
        PrintWriter out = response.getWriter();
        
        if(check > 0) {
        	out.println("<script> alert('회원 가입 성공'); location.href='user_login.do'; </script>");
        	
        }else {
        	out.println("<script> alert('회원 가입 실패'); history.back(); </script>");
        }
	}
	
	
	//로그아웃
	@RequestMapping("user_logout.do")
	   public String signOut(HttpSession session) {
	      
	      session.invalidate();
	      
	      return "redirect:/store.do";
	   }
	
	//아이디/비밀번호찾기 페이지로 이동
	@RequestMapping("find_idpw.do")
	public String findId() {
		
		return "user/find_idpw";
	}
	
	//아이디찾기 메일 관련 
	@RequestMapping("findIdMail.do")
	@ResponseBody
	public int findIdMail(@RequestParam("tomail") String tomail) {
		
		int resultCode = dao.findId(tomail);
		
		return resultCode;
	}
	
	
	/*
	 * //비밀번호찾기 페이지로 이동
	 * 
	 * @RequestMapping("find_pw.do") public String findPw() {
	 * 
	 * return "user/find_pw"; }
	 */
	
	
	//비밀번호 찾기 메일 관련
	   @RequestMapping("findPwMail.do")
	   @ResponseBody
	   public int findPwMail(@RequestParam("tomail1") String tomail1, @RequestParam("id") String id) {
	      

	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("tomail1", tomail1);
	        map.put("id", id);

	        int resultCode = dao.findPw(map);
	        
	        
	        
	        System.out.println("map확인 >>>" + map);
	        System.out.println("tomail확인 >>>" + tomail1);
	        System.out.println("id확인 >>>" + id);
	        
	        return resultCode;
	      
	      
	   }
	   
	   
	   
	   //바로구매 버튼 클릭 시 로그인 버튼 이동
	   @RequestMapping("/user_login_buy.do")
		public String loginList1(HttpServletRequest request, HttpSession session) {

			String referer = request.getHeader("Referer");
			
			session.setAttribute("referer", referer);
			
			return "user/login_buy";

		}
	   
	   //바로구매 버튼 클릭 시 로그인 성공
	   @RequestMapping("user_check_buy.do")
	    public String signIn1( HttpServletRequest request, HttpSession session, @RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		  
		   Map<String, Object> map = new HashMap<String, Object>();
	        map.put("user_id", id);
	        map.put("user_pwd", pw);

	        int result = dao.userCheck(map);
	        
	        String referer = (String)session.getAttribute("referer");

	        if (result == 1) { //아이디, 비밀번호 일치 시(로그인 성공)
	        	
	        	session.setAttribute("userId", id);
	           
	           // 아이디에 해당하는 장바구니 수량을 가져오는 메서드
	           session.setAttribute("rcount", cdao.getCartCount(id));
	           
	           if(referer != null) {// referer에 값이 있을 때(로그인 전 세션값이 있을 때)
	              session.setAttribute("userId", id);
	               System.out.println("referer값 확인1 >>>" + referer);
	               
	               session.setAttribute("rcount", cdao.getCartCount(id));
	               
	               return "redirect:" +referer;
	              
	           }//referer값이 없을 때 (로그인 전 세션값이 없을 때)
	                session.setAttribute("userId", id);
	                
	                session.setAttribute("rcount", cdao.getCartCount(id));
	                
	               return "redirect:/store.do";
	                 
	        }else {

	            return "user/login";
	        }
	    }

	   
        
        
        
        
		
		
	}
	
	
	


