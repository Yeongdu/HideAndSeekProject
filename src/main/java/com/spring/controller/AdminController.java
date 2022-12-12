package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;
import com.spring.model.Product_contentDTO;
import com.spring.model.admin_productDTO;
import com.spring.model.admin_product_contentDTO;
import com.spring.service.Admin_productDAO;
import com.spring.service.Admin_product_contentDAO;
import com.spring.service.OrderDAO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;


@Controller
public class AdminController {
	
	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	@Autowired
	private Product_contentDAO pcdao;
	
	@Autowired
	private Admin_productDAO apdao;
	
	@Autowired
	private Admin_product_contentDAO apcdao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 10;
	
			
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	private String savePath = "D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\upload";
	private int sizeLimit = 5 * 1024 * 1024;
	
	
	@RequestMapping("/admin_main.do")
	public String admin_main(Model model) {
		List<OrderDTO> list = this.dao.getOrderList();
		model.addAttribute("orderList", list);
		return "admin/admin_main";
	}
	
	@RequestMapping("/admin_product_insert.do")
	public String product_insert(Model model) {
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		return "admin/admin_product_insert";
	}
	
	
	
	
	////////////////////
	
		@RequestMapping("/admin_product_insert_ok.do")
		public void ImgUpLoader(@RequestParam("product_thumbnail") MultipartFile file, HttpServletResponse response,MultipartHttpServletRequest mhsr, admin_productDTO adto) throws Exception {
			
			 if(adto.getProduct_alcohol() <= 7) {
					adto.setProduct_dosu("low");
				}else if(adto.getProduct_alcohol() <= 20) {
					adto.setProduct_dosu("middle");
				}else if(adto.getProduct_alcohol() <= 35) {
					adto.setProduct_dosu("high");
				}else if(adto.getProduct_alcohol() <= 50) {
					adto.setProduct_dosu("very-high");	
				}
			 
			 adto.setProduct_thumbnail(file);
			 
			 
			 	int check = this.apdao.insertProduct(adto);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				if(check > 0) {
					this.apcdao.insertProductContent(adto.getProduct_no());
					out.println("<script> alert('제품 등록 성공'); location.href='admin_product_list.do'; </script>");
				}else {
					out.println("<script> alert('제품 등록 실패했습니다.'); history.back(); </script>");
				}
				
			
				String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
				long size = file.getSize(); //파일 사이즈
				
				System.out.println("파일명 : "  + fileRealName);
				System.out.println("용량크기(byte) : " + size);
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
				String uploadFolder = "D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\upload";
				
				
				/*
				  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
				  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
				  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
				  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
				 */
				
				UUID uuid = UUID.randomUUID();
				System.out.println(uuid.toString());
				String[] uuids = uuid.toString().split("-");
				
				String uniqueName = uuids[0];
				System.out.println("생성된 고유문자열" + uniqueName);
				System.out.println("확장자명" + fileExtension);
				
				// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
				
				File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
				try {
					file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  
	    }
	
	/////////////////
//		
//		@RequestMapping("/admin_product_insert_ok.do")
//		public String ImgUpLoader(HttpServletRequest request, HttpServletResponse response, ProductDTO dto) throws Exception {
//			
//			if(dto.getProduct_alcohol() <= 7) {
//				dto.setProduct_dosu("low");
//			}else if(dto.getProduct_alcohol() <= 20) {
//				dto.setProduct_dosu("middle");
//			}else if(dto.getProduct_alcohol() <= 35) {
//				dto.setProduct_dosu("high");
//			}else if(dto.getProduct_alcohol() <= 50) {
//				dto.setProduct_dosu("very-high");	
//			}
//			int check = this.apdao.insertProduct(dto);
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			if(check > 0) {
//				this.apcdao.insertProductContent(dto.getProduct_no());
//				out.println("<script> alert('제품 등록 성공'); location.href='admin_product_list.do'; </script>");
//				
//				
//				
//				
//				//////////
//				
//				
//				MultipartRequest multi = (MultipartRequest) request;
//				MultipartFile file = multi.getFile("product_thumbnail");
//				String reNameFile = "";
//				
//				if (file.isEmpty()) { //파일 유무 검사
//					return reNameFile;
//				} else if (file.getSize() > sizeLimit) {
//					System.out.println("## 용량이 너무 큽니다. \n 3메가 이하로 해주세요.");
//					return "error";
//				}
//				
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
//				Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
//				
//				
//				String uploadDir = savePath + File.separator;
//				new File(uploadDir).mkdir(); // 해당 경로 폴더 없을 떄 폴더 생성.
//				String getFileName[] = file.getOriginalFilename().split("\\.");
//				
//				// 파일 이름 및 확장자 분리
//				
//				reNameFile = getFileName[0] + "_" + sdf.format(c.getTime()) + "." + getFileName[1];
//				//파일 이름 설정 = 원본 파일 이름_ 년월일분초 .확장자.
//				
//				reNameFile = getFileName[0] + "_" + sdf.format(c.getTime()) + "." + getFileName[1];
//				file.transferTo(new File(savePath + reNameFile));
//				
//				/////////
//				
//				
//			}else {
//				out.println("<script> alert('제품 등록 실패했습니다.'); history.back(); </script>");
//			}
//			return savePath;
//			
//		}
//		
//		/////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/admin_product_insert_ok.do")
//	public void product_insert_Ok(ProductDTO dto, HttpServletResponse response) throws IOException {
//		
//		if(dto.getProduct_alcohol() <= 7) {
//			dto.setProduct_dosu("low");
//		}else if(dto.getProduct_alcohol() <= 20) {
//			dto.setProduct_dosu("middle");
//		}else if(dto.getProduct_alcohol() <= 35) {
//			dto.setProduct_dosu("high");
//		}else if(dto.getProduct_alcohol() <= 50) {
//			dto.setProduct_dosu("very-high");	
//		}
//		int check = this.apdao.insertProduct(dto);
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(check > 0) {
//			this.apcdao.insertProductContent(dto.getProduct_no());
//			out.println("<script> alert('제품 등록 성공'); location.href='admin_product_list.do'; </script>");
//		}else {
//			out.println("<script> alert('제품 등록 실패했습니다.'); history.back(); </script>");
//		}
//	}
	
	@RequestMapping("/admin_product_list.do")
	public String admin_product_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.pdao.getListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<admin_productDTO> plist = this.apdao.getProductList(dto);
		

		model.addAttribute("list", plist);
		
		model.addAttribute("page", dto);
		return "admin/admin_product_list";

	}
	
	
	@RequestMapping("admin_product_search.do")
	public String admin_product_search(HttpServletRequest request, 
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		int rowsize = 10;
		int totalRecord;

						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.pdao.getSearchListCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("Page", dto);
		
		List<ProductDTO> productSearchList = this.pdao.searchProductList(map);

		model.addAttribute("list", productSearchList);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);
		
		return "admin/admin_product_search";
	}
	
	@RequestMapping("admin_product_content.do")
	public String admin_product_cont(@RequestParam("no") int no,@RequestParam("page") int page , Model model) {
		ProductDTO dto = this.pdao.getProductCont(no);
		model.addAttribute("Cont", dto);
		
		admin_product_contentDTO apdto = this.apcdao.getProductOne(no);
		model.addAttribute("PCCont", apdto);
		
		model.addAttribute("page", page);
		
		return "admin/admin_product_cont";
	}
	
	//판매중 -> 판매중지(품절)
	@RequestMapping("admin_product_statusChange.do")
	public void admin_product_statusChange(HttpServletResponse response, @RequestParam("no") int no) throws IOException {
		int check = this.pdao.productStatusChange(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	//판매중지(품절) -> 판매중
	@RequestMapping("admin_product_statusChange2.do")
	public void admin_product_statusChange2(HttpServletResponse response, @RequestParam("no") int no) throws IOException {
		int check = this.pdao.productStatusChange2(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////
	
	
	
	
	//////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("admin_product_update.do")
	public String admin_productUpdate(@RequestParam("page") int page, @RequestParam("no") int no, Model model) {
		ProductDTO pdto = this.pdao.getProductCont(no);
//		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		model.addAttribute("PCont", pdto);
//		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		
		return "admin/admin_product_update";
	}
	
	
	
	@RequestMapping("admin_product_update_ok.do")
	public void admin_product_update_ok(
			@RequestParam("product_thumbnail") MultipartFile file,
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
			ProductDTO pdto, 
			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model) throws IOException {
		
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);

		
		int check1 = this.apdao.productUpdate(pdto);
		int check2 = this.apcdao.productContentUpdate(pccdto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("page", page);
		
		if( (check1 > 0)  && (check2 > 0) ) { //&page="+page+"
			out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no="+no+"&page="+page+"'; </script>");
		}else {
			out.println("<script> alert('상품수정실패'); history.back(); </script>");
		}
//		ProductDTO dto = this.pdao.getProductCont(no);
//		model.addAttribute("Cont", dto);
//		
//		Product_contentDTO pcdto = this.pcdao.getProduct(no);
//		model.addAttribute("PCCont", pcdto);
//		return "admin/admin_product_cont";
	}
	
	@RequestMapping("admin_product_contentEdit.do")
	public String admin_product_edit(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.pdao.getListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<ProductDTO> plist = this.pdao.getProductList(dto);
		

		model.addAttribute("list", plist);
		
		model.addAttribute("page", dto);
		return "admin/admin_product_contentEdit";
	}
	
	@RequestMapping("admin_product_content_update.do")
	public String admin_productContentUpdate(@RequestParam("page") int page, @RequestParam("no") int no, Model model) {
		ProductDTO pdto = this.pdao.getProductCont(no);
		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		model.addAttribute("PCont", pdto);
		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		return "admin/admin_product_content_update";
	}
	
	
	
	@RequestMapping("admin_product_content_update_ok.do")
	public void admin_product_content_update_ok(
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
			ProductDTO pdto, 
			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model) throws IOException {

		int check2 = this.apcdao.productContentUpdate(pccdto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("page", page);
		
		if(check2 > 0) { //&page="+page+"
			out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no="+no+"&page="+page+"'; </script>");
		}else {
			out.println("<script> alert('상품수정실패'); history.back(); </script>");
		}
//		ProductDTO dto = this.pdao.getProductCont(no);
//		model.addAttribute("Cont", dto);
//		
//		Product_contentDTO pcdto = this.pcdao.getProduct(no);
//		model.addAttribute("PCCont", pcdto);
//		return "admin/admin_product_cont";
	}
	
	
	@RequestMapping("admin_product_del.do")
	public String admin_product_del() {
		return "admin/admin_product_del";
	}
	
	@RequestMapping("admin_order_list.do")
	public String admin_order_list() {
		return "admin/admin_order_list";
	}
	
	@RequestMapping("admin_order_del.do")
	public String admin_order_del() {
		return "admin/admin_order_del";
	}
	


}
