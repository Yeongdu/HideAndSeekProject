package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.UserDTO;
import com.spring.service.UserDAO;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserDAO dao;

	// 로그인페이지이동
	@RequestMapping("user_login.do")
	public String loginList() {

		return "user/login";

	}

	// 회원가입페이지이동
	@RequestMapping("join_form.do")
	public String joinformList() {

		return "user/join";

	}


	//로그인
	@RequestMapping("user_check.do")
    public String signIn(HttpSession session, @RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
        int result = dao.userCheck(id, pw);
        if (result == 1) {
            model.addAttribute("id", id);

            session.setAttribute("userId", id);

            return "store/store_main";
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
	           HttpServletResponse response) throws IOException {
	
		
		int check = this.dao.insertUser(dto);
		
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
	      
	      return "store/store_main";
	   }

	

}
