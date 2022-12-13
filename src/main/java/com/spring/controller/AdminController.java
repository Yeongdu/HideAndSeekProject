package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	private static final String FILE_SERVER_PATH = "D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\upload";

	
	
	@RequestMapping("/admin_product_insert_ok.do")
	public void insertSubmit(@RequestParam("product_thumbnailFile") MultipartFile file, HttpServletResponse response,
			ModelAndView mv, Model model, admin_productDTO adto) throws IllegalStateException, IOException {

		if (adto.getProduct_alcohol() <= 7) {
			adto.setProduct_dosu("low");
		} else if (adto.getProduct_alcohol() <= 20) {
			adto.setProduct_dosu("middle");
		} else if (adto.getProduct_alcohol() <= 35) {
			adto.setProduct_dosu("high");
		} else if (adto.getProduct_alcohol() <= 50) {
			adto.setProduct_dosu("very-high");
		}

		adto.setProduct_thumbnail(file.getOriginalFilename());

		int check = this.apdao.insertProduct(adto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0 && !file.getOriginalFilename().isEmpty()) {
			this.apcdao.insertProductContent(adto.getProduct_no());
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			out.println("<script> alert('제품 등록 성공'); location.href='admin_product_list.do'; </script>");
		} else {
			out.println("<script> alert('제품 등록 실패했습니다.'); history.back(); </script>");
		}

	}

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
		model.addAttribute("thumbnail", dto.getProduct_thumbnail());
		model.addAttribute("file1", apdto.getProduct_file1());
		model.addAttribute("file2", apdto.getProduct_file2());
		model.addAttribute("file3", apdto.getProduct_file3());
		
		
		
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
			@RequestParam(value="product_thumbnailFile",required = false) MultipartFile upload,
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
//			ProductDTO pdto, 
//			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model,
			admin_productDTO adto
			) throws IllegalStateException, IOException {
		
		String savedfile = adto.getProduct_thumbnail();

		//원래 있던 파일 삭제
		if (savedfile != null) {
			String fullpath = FILE_SERVER_PATH + "/" + savedfile;
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
			}
		}
		 
		if(upload == null) {
			adto.setProduct_thumbnail(savedfile);
		}
		
		 
		 if (adto.getProduct_alcohol() <= 7) {
				adto.setProduct_dosu("low");
				} else if (adto.getProduct_alcohol() <= 20) {
					adto.setProduct_dosu("middle");
				} else if (adto.getProduct_alcohol() <= 35) {
					adto.setProduct_dosu("high");
				} else if (adto.getProduct_alcohol() <= 50) {
					adto.setProduct_dosu("very-high");
				}
			
		 adto.setProduct_thumbnail(upload.getOriginalFilename());
		
		 int check = this.apdao.productUpdate(adto);
		 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			model.addAttribute("page", page);
			if(check > 0 && !upload.getOriginalFilename().isEmpty()) {
				upload.transferTo(new File(FILE_SERVER_PATH, upload.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no="+no+"&page="+page+"'; </script>");
			}else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////
	
	
	
	
	//////////////////////////////////////////////////////////////////
	

	@RequestMapping("admin_product_contentEdit.do")
	public String admin_product_edit(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
		
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		
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
		admin_product_contentDTO pcdto = this.apcdao.getProductOne(no);
//		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		
		model.addAttribute("file1", pcdto.getProduct_file1());
		model.addAttribute("file2", pcdto.getProduct_file2());
		model.addAttribute("file3", pcdto.getProduct_file3());
//		model.addAttribute("CategoryList", cateList);
		model.addAttribute("PCont", pdto);
		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		return "admin/admin_product_content_update";
	}
	
	
	
	@RequestMapping("admin_product_content_update_ok.do")
	public void admin_product_content_update_ok(
			@RequestParam("product_file1file") MultipartFile file1,
			@RequestParam("product_file2file") MultipartFile file2,
			@RequestParam("product_file3file") MultipartFile file3,
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
			ProductDTO pdto, 
			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model) throws IOException {
		
		
		String savedfile1 = pccdto.getProduct_file1();
		String savedfile2 = pccdto.getProduct_file2();
		String savedfile3 = pccdto.getProduct_file3();

		//원래 있던 파일 삭제
		if (savedfile1 != null) {
			String fullpath = FILE_SERVER_PATH + "/" + savedfile1;
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
			}
		}
		if (savedfile2 != null) {
			String fullpath = FILE_SERVER_PATH + "/" + savedfile2;
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
			}
		}
		if (savedfile3 != null) {
			String fullpath = FILE_SERVER_PATH + "/" + savedfile3;
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
			}
		}

		
		
		pccdto.setProduct_file1(file1.getOriginalFilename());
		pccdto.setProduct_file2(file2.getOriginalFilename());
		pccdto.setProduct_file3(file3.getOriginalFilename());
		
		int check2 = this.apcdao.productContentUpdate(pccdto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("page", page);
		
		if(check2 > 0) { //&page="+page+"
			file1.transferTo(new File(FILE_SERVER_PATH, file1.getOriginalFilename()));
			file2.transferTo(new File(FILE_SERVER_PATH, file2.getOriginalFilename()));
			file3.transferTo(new File(FILE_SERVER_PATH, file3.getOriginalFilename()));
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
	
	
	@RequestMapping("admin_product_delete.do")
	public void admin_product_del(@RequestParam("no") int no, HttpServletResponse response) throws IOException  {
		System.out.println(no);
		
		int check2 = this.apcdao.deleteProductCont(no);
		int check1 = this.apdao.deleteProduct(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check1 > 0 && check2 > 0) {
			this.apcdao.productContUpdateSeq(no);
			this.apdao.productUpdateSeq(no);
			out.println("<script> alert('상품이 삭제되었습니다.'); location.href='admin_product_list.do'; </script>");
		}else {
			out.println("<script> alert('상품삭제실패'); history.back(); </script>");
		}
		
		
		
	}
	
	@RequestMapping("/admin_order_list.do")
	public String admin_order_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.dao.getOrderListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<OrderDTO> list = this.dao.getOrderList(dto);

		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			System.out.println("반복문 list 값 >>> " + list.get(count));

			count += 1;

		}

		model.addAttribute("list", list);

		model.addAttribute("page", dto);

		return "admin/admin_order_list";

	}

	@RequestMapping("admin_order_statusChange.do")
	public void admin_order_statusChange(HttpServletResponse response, @RequestParam("no") int no,
			@RequestParam("key") String key) throws IOException {
		int check = this.pdao.productStatusChange(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_order_list.do'; </script>");
		} else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	@RequestMapping("admin_order_del.do")
	public String admin_order_del() {
		return "admin/admin_order_del";
	}
	


}
