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
import com.spring.service.UserDAO;
import com.sun.jdi.Location;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserDAO dao;

	// 로그인페이지이동
	@RequestMapping("user_login.do")
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
    public String signIn( HttpServletRequest request, HttpSession session, @RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {

    	

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user_id", id);
        map.put("user_pwd", pw);

        int result = dao.userCheck(map);
        
        String referer = (String)session.getAttribute("referer");

        if (result == 1) { //아이디, 비밀번호 일치 시(로그인 성공)
            //model.addAttribute("id", id);
        	session.setAttribute("userId", id);
        	
        	if(referer != null) {// referer에 값이 있을 때(로그인 전 세션값이 있을 때)
        		session.setAttribute("userId", id);
        		 System.out.println("referer값 확인1 >>>" + referer);
        		 return "redirect:" +referer;
        		
        	}//referer값이 없을 때 (로그인 전 세션값이 없을 때)
        	     session.setAttribute("userId", id);
        	     
        		 return "redirect:/store.do";
                 
        }else {

            return "user/login";
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
	
	//아이디찾기 페이지로 이동
	@RequestMapping("find_id.do")
	public String findId() {
		
		return "user/find_id";
	}
	
	//아이디찾기 메일 관련 
	@RequestMapping("findIdMail.do")
	@ResponseBody
	public int findIdMail(@RequestParam("tomail") String tomail) {
		
		int resultCode = dao.findId(tomail);
		
		return resultCode;
	}
	
	
	//비밀번호찾기 페이지로 이동
	@RequestMapping("find_pw.do")
	public String findPw() {
		
		return "user/find_pw";
	}
	
	//비밀번호 찾기 메일 관련
	   @RequestMapping("findPwMail.do")
	   @ResponseBody
	   public int findPwMail(@RequestParam("tomail") String tomail, @RequestParam("id") String id) {
	      

	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("tomail", tomail);
	        map.put("id", id);

	        int resultCode = dao.findPw(map);
	        
	        
	        
	        System.out.println("map확인 >>>" + map);
	        System.out.println("tomail확인 >>>" + tomail);
	        System.out.println("id확인 >>>" + id);
	        
	        return resultCode;
	      
	      
	   }
	   
        
        
        
        
		
		
	}
	
	
	


