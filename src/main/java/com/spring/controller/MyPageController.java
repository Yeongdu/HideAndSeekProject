package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.model.DeliveryDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ReviewDTO;
import com.spring.model.Subscribe_userDTO;
import com.spring.model.UserDTO;
import com.spring.service.MyPageDAO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypage_dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 3;

	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	private static final String FILE_SERVER_PATH = /*"D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\upload";*/ "C:\\Users\\user1\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\review_img";
	
	
	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		 UserDTO user_info = this.mypage_dao.getUserCont(userId);
		 List<OrderDTO> olist = this.mypage_dao.orderContent(userId);
		 int count = this.mypage_dao.getOrderCount(userId);
		 int order = this.mypage_dao.getOrderAllCount(userId);
		 int refund = this.mypage_dao.getRefundCount(userId);
		 int delivery = this.mypage_dao.getDeliveryCount(userId);
		 int delivery_complete = this.mypage_dao.getDeliveryCompleteCount(userId);
		 
		 model.addAttribute("user_cont", user_info);
		 model.addAttribute("order_content", olist);
		 model.addAttribute("count", count);
		 model.addAttribute("order", order);
		 model.addAttribute("refund", refund);
		 model.addAttribute("delivery", delivery);
		 model.addAttribute("delivery_complete", delivery_complete);
		 
		 
		 if(userId != null) {
			 return "mypage/mypage_main";
		 }else {
			 return "user/login";
		 }
		 
		 
	}
	
	@RequestMapping("mypage_sub.do")
	
	@ResponseBody
	public List<Subscribe_userDTO> mypage_sub(Model model, @RequestParam("userId")String userId) {
		
		List<Subscribe_userDTO> sub_info = this.mypage_dao.getSubCont(userId);
		
		return sub_info;
		
	}
	
	@RequestMapping("mypage_order.do")
	@ResponseBody
	public List<OrderDTO> mypage_order(Model model, @RequestParam("userId") String userId, @RequestParam("page") int page){
		
		int totalRecord;
		
		System.out.println("userId >>> " + userId);
		System.out.println("page >>> " + page);
		
		totalRecord = this.mypage_dao.getOrderCount(userId);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("startNo", dto.getStartNo());
		map.put("endNo", dto.getEndNo());
		
		List<OrderDTO> order_info = this.mypage_dao.getOrderCont(map);
		
		return order_info;
		
	}
	
	@RequestMapping("mypage_user.do")
	@ResponseBody
	public UserDTO mypage_user(Model model, @RequestParam("userId")String userId) {
		UserDTO dto = this.mypage_dao.getUserCont(userId);
		
		return dto;
	}
	
	@RequestMapping("mypage_user_modifyOk.do")
	@ResponseBody
	public int mypage_user_modify(Model model, 
									@RequestParam("userId")String userId, 
									@RequestParam("user_name")String user_name, 
									@RequestParam("user_pwd_new")String user_pwd_new, 
									@RequestParam("user_pwd_old")String user_pwd_old, 
									@RequestParam("user_email")String user_email,
									@RequestParam("user_phone1")String user_phone1,
									@RequestParam("user_phone2")String user_phone2,
									@RequestParam("user_phone3")String user_phone3,
									@RequestParam("user_dto_pwd")String user_dto_pwd,
									HttpServletResponse response) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("user_name", user_name);
		map.put("user_pwd", user_pwd_new);
		map.put("user_email", user_email);
		map.put("user_phone1", user_phone1);
		map.put("user_phone2", user_phone2);
		map.put("user_phone3", user_phone3);
		map.put("user_dto_pwd", user_dto_pwd);
		
		int result = 0;
		UserDTO dto = null;
		
		if(user_dto_pwd.equals(user_pwd_old)) {
			result = this.mypage_dao.updateUser(map);
		}else {
			result = -1;
		}
		
		return result;
		
	}
	
	@RequestMapping("user_delete.do")
	public String mypage_user_delete(@RequestParam("user_check")int check, 
									@RequestParam("delete_user_name")String userId,HttpServletResponse response, HttpSession session) throws IOException {
		
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out = response.getWriter();
		
		if(check == 1) {
			int user_delete = this.mypage_dao.userDelete(userId);
			
			if(user_delete < 0) {
				out.println("<script>");
				out.println("alert('회원에서 탈퇴되었습니다.')");
				out.println("<script>");
				session.invalidate();
			}else {
				out.println("<script>");
				out.println("alert('회원 탈퇴를 실패하였습니다.')");
				out.println("<script>");
			}
			
			return "redirect:/main.do";
			
		}else {
			out.println("<script>");
			out.println("alert('회원 탈퇴 실패')");
			out.println("<script>");
			
			return "redirect:/mypage.do";
		}
	}
	
	
	
	@RequestMapping("mypage_review.do")
	@ResponseBody
	public List<ReviewDTO> mypage_review(Model model, @RequestParam("userId") String userId, @RequestParam("page") int page){

		int totalRecord;
		
		totalRecord = this.mypage_dao.getReviewCount(userId);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("startNo", dto.getStartNo());
		map.put("endNo", dto.getEndNo());
		
		List<ReviewDTO> review_info = this.mypage_dao.getReviewCont(map);
	
		return review_info;
		
	}
	
	@RequestMapping("mypage_delivery.do")
	@ResponseBody
	public List<DeliveryDTO> mypage_delivery(Model model, @RequestParam("userId") String userId){
		List<DeliveryDTO> delivery_info = this.mypage_dao.getDeliveryCont(userId);
		
		return delivery_info;
	}
	
	@RequestMapping("review_insertOk.do")
	public void review_insertOk(@RequestParam("product_insert_no")int no,
								@RequestParam("review_insert_cont")String cont,
								@RequestParam("review_insert_image")MultipartFile file,
								@RequestParam("reviewStar") String star2,
								@RequestParam("review_insert_userId")String userId,
								HttpServletResponse response,
								ReviewDTO rdto) throws IllegalStateException, IOException {
		int star = Integer.parseInt(star2);
		
		System.out.println("star >>> " + star2);
		
		if(file.isEmpty()) {
			rdto.setReview_file("");
		}else {
			rdto.setReview_file(file.getOriginalFilename());
		}
		
		rdto.setReview_cont(cont);
		rdto.setProduct_no(no);
		
		if(star == 0) {
			rdto.setReview_star(0);
		}else {
			rdto.setReview_star(star);
		}
		
		rdto.setUser_id(userId);
		
		 int check = this.mypage_dao.reviewInsert(rdto);
		 
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out = response.getWriter();
		 
		 if (check > 0 && !file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
				out.println("<script>");
				out.println("location.href='mypage.do'");
				out.println("</script>");
			}else if(check > 0 && file.getOriginalFilename().isEmpty()){
				out.println("<script>");
				out.println("location.href='mypage.do'");
				out.println("</script>");
			}else {
				out.println("<script> alert('리뷰 등록 실패');</script>");
			}
		 
		 
		 
		 
		 
		
	}
	
	
	
	
	
}
