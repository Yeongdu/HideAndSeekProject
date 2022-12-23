package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.EventDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;
import com.spring.model.Product_contentDTO;
import com.spring.model.SubscribeDTO;
import com.spring.model.UserDTO;
import com.spring.model.admin_productDTO;
import com.spring.model.admin_product_contentDTO;
import com.spring.service.Admin_productDAO;
import com.spring.service.Admin_product_contentDAO;
import com.spring.service.Admin_userDAO;
import com.spring.service.EventDAO;
import com.spring.service.OrderDAO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;
import com.spring.service.SubscribeDAO;


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
	
	@Autowired
	private Admin_userDAO audao;
	
	@Autowired
	private EventDAO edao;
	
	@Autowired
	private SubscribeDAO sdao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 10;
	
			
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	private static final String FILE_SERVER_PATH = "D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\upload";
	private static final String FILE_SERVER_PATH2 = "D:\\git\\HideAndSeekProject\\src\\main\\webapp\\resources\\image";
//	private static final String FILE_SERVER_PATH = "/src/main/webapp/resources/upload";

	//신규 제품 등록
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

	//관리자 메인
	@RequestMapping("/admin_main.do")
	public String admin_main(Model model) {
//		List<OrderDTO> list = this.dao.getOrderList();
//		model.addAttribute("orderList", list);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<OrderDTO> list = this.dao.getNewOrderList();

		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			System.out.println("반복문 list 값 >>> " + list.get(count));

			count += 1;

		}

		model.addAttribute("list", list);

		return "admin/admin_main";
	}
	
	//신규 제품 등록 페이지
	@RequestMapping("/admin_product_insert.do")
	public String product_insert(Model model) {
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
		model.addAttribute("CategoryList", cateList);
		return "admin/admin_product_insert";
	}
	
	//전체 상품 목록
	@RequestMapping("/admin_product_list.do")
	public String admin_product_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
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
	
	//전체 상품 검색
	@RequestMapping("admin_product_search.do")
	public String admin_product_search(HttpServletRequest request, 
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page;
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
	
	
	// 판매중인 상품 검색
	@RequestMapping("admin_product_ing_search.do")
	public String admin_product_ing_search(HttpServletRequest request,
			@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "keyword", required = false) String keyword, 
			Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int page;
		int rowsize = 10;
		int totalRecord;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.apdao.getSearchIngProductCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		map.put("field", field);
		map.put("keyword", keyword);
		map.put("Page", dto);

		List<admin_productDTO> productSearchList = this.apdao.searchIngProductList(map);

		model.addAttribute("list", productSearchList);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);

		return "admin/admin_ing_product_search";
	}
	
	//상품 상세 페이지
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

	//상품 기본정보 수정 페이지
	@RequestMapping("admin_product_update.do")
	public String admin_productUpdate(@RequestParam("page") int page, @RequestParam("no") int no, Model model) {
		ProductDTO pdto = this.pdao.getProductCont(no);
//		Product_contentDTO pcdto = this.pcdao.getProduct(no);
		List<Product_categoryDTO> cateList = this.dao.getCategoryList();
//		model.addAttribute("thumbnailFileDB", pdto.getProduct_thumbnail());
		model.addAttribute("CategoryList", cateList);
		model.addAttribute("PCont", pdto);
//		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		
		return "admin/admin_product_update";
	}
	
	// 상품 기본정보 수정
	@RequestMapping("admin_product_update_ok.do")
	public void admin_product_update_ok(
			@RequestParam(value = "product_thumbnailFile", required = false) MultipartFile upload,
			@RequestParam("page") int page, @RequestParam("no") int no, HttpServletResponse response, Model model,
			admin_productDTO adto) throws IllegalStateException, IOException {

		String savedfile = adto.getProduct_thumbnail();

		if (upload.isEmpty()) {
			if (adto.getProduct_alcohol() <= 7) {
				adto.setProduct_dosu("low");
			} else if (adto.getProduct_alcohol() <= 20) {
				adto.setProduct_dosu("middle");
			} else if (adto.getProduct_alcohol() <= 35) {
				adto.setProduct_dosu("high");
			} else if (adto.getProduct_alcohol() <= 50) {
				adto.setProduct_dosu("very-high");
			}
			int check2 = apdao.productUpdateWithoutThumbnail(adto);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			if (check2 > 0) {
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}

		} else {
			// 원래 있던 파일 삭제
			if (savedfile != null) {
				String fullpath = FILE_SERVER_PATH + "/" + savedfile;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
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
			if (check > 0 && !upload.getOriginalFilename().isEmpty()) {
				upload.transferTo(new File(FILE_SERVER_PATH, upload.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
		}
	}

	//판매중인 상품 목록
	@RequestMapping("admin_product_ing.do")
	public String admin_product_edit(HttpServletRequest request, Model model) {
		int page;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		totalRecord = this.apdao.getIngProductCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		List<admin_productDTO> plist = this.apdao.IngProductList(dto);

		model.addAttribute("list", plist);
		model.addAttribute("page", dto);
		return "admin/admin_product_ing";
	}
	
	//상품 상세정보 수정 페이지
	@RequestMapping("admin_product_content_update.do")
	public String admin_productContentUpdate(@RequestParam("page") int page, @RequestParam("no") int no, Model model) {
		ProductDTO pdto = this.pdao.getProductCont(no);
		admin_product_contentDTO pcdto = this.apcdao.getProductOne(no);
		
		model.addAttribute("file1", pcdto.getProduct_file1());
		model.addAttribute("file2", pcdto.getProduct_file2());
		model.addAttribute("file3", pcdto.getProduct_file3());
		model.addAttribute("PCont", pdto);
		model.addAttribute("PCCont", pcdto);
		model.addAttribute("page", page);
		return "admin/admin_product_content_update";
	}
	
	//상품 상세정보 수정
	@RequestMapping("admin_product_content_update_ok.do")
	public void admin_product_content_update_ok(
			@RequestParam("product_file1file") MultipartFile file1,
			@RequestParam("product_file2file") MultipartFile file2,
			@RequestParam("product_file3file") MultipartFile file3,
			@RequestParam("page") int page, 
			@RequestParam("no") int no, 
			ProductDTO pdto, 
			admin_product_contentDTO apcdto,
			Product_contentDTO pccdto, 
			HttpServletResponse response, 
			Model model) throws Exception {
		
		String savedfile1 = pccdto.getProduct_file1();
		String savedfile2 = pccdto.getProduct_file2();
		String savedfile3 = pccdto.getProduct_file3();
		

		
		// file 셋다 수정 안한 경우
		if (file1.isEmpty() && file2.isEmpty() && file3.isEmpty()) {
			int check1 = this.apcdao.updateWithoutFile(apcdto);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			if (check1 > 0) {
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}

		} else if (file2.isEmpty() && file3.isEmpty()) { // file1만 수정한 경우
			// 원래 있던 파일 삭제
			if (savedfile1 != null) {
				String fullpath = FILE_SERVER_PATH + "/" + savedfile1;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}
			apcdto.setProduct_file1(file1.getOriginalFilename());

			int check2 = this.apcdao.UpdatePCFile1(apcdto);

			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");

			if (check2 > 0 && !file1.getOriginalFilename().isEmpty()) {
				file1.transferTo(new File(FILE_SERVER_PATH, file1.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
		} else if (file1.isEmpty() && file3.isEmpty()) { // file2만 수정한 경우
			// 원래 있던 파일 삭제
			if (savedfile2 != null) {
				String fullpath = FILE_SERVER_PATH + "/" + savedfile2;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}
			apcdto.setProduct_file2(file2.getOriginalFilename());

			int check2 = this.apcdao.UpdatePCFile2(apcdto);

			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");

			if (check2 > 0 && !file2.getOriginalFilename().isEmpty()) {
				file2.transferTo(new File(FILE_SERVER_PATH, file2.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
		} else if (file1.isEmpty() && file2.isEmpty()) { // file3만 수정한 경우
			// 원래 있던 파일 삭제
			if (savedfile3 != null) {
				String fullpath = FILE_SERVER_PATH + "/" + savedfile3;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}

			apcdto.setProduct_file3(file3.getOriginalFilename());

			int check2 = this.apcdao.UpdatePCFile3(apcdto);

			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");

			if (check2 > 0 && !file3.getOriginalFilename().isEmpty()) {
				file3.transferTo(new File(FILE_SERVER_PATH, file3.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
		} else if (file1.isEmpty()) { // file1만 수정 하지 않은 경우
			// 원래 있던 파일 삭제
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
			apcdto.setProduct_file2(file2.getOriginalFilename());
			apcdto.setProduct_file3(file3.getOriginalFilename());

			int check2 = this.apcdao.updateWithoutFile1(apcdto);

			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");

			if (check2 > 0 && !file2.getOriginalFilename().isEmpty() && !file3.getOriginalFilename().isEmpty()) {
				file2.transferTo(new File(FILE_SERVER_PATH, file2.getOriginalFilename()));
				file3.transferTo(new File(FILE_SERVER_PATH, file3.getOriginalFilename()));
				out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
						+ page + "'; </script>");
			} else {
				out.println("<script> alert('상품수정실패'); history.back(); </script>");
			}
		} else if (file2.isEmpty()) { // file2만 수정 하지 않은 경우
				// 원래 있던 파일 삭제
				if (savedfile1 != null) {
					String fullpath = FILE_SERVER_PATH + "/" + savedfile1;
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
				apcdto.setProduct_file1(file1.getOriginalFilename());
				apcdto.setProduct_file3(file3.getOriginalFilename());

				int check2 = this.apcdao.updateWithoutFile2(apcdto);

				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");

				if (check2 > 0 && !file1.getOriginalFilename().isEmpty() && !file3.getOriginalFilename().isEmpty()) {
					file1.transferTo(new File(FILE_SERVER_PATH, file1.getOriginalFilename()));
					file3.transferTo(new File(FILE_SERVER_PATH, file3.getOriginalFilename()));
					out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
							+ page + "'; </script>");
				} else {
					out.println("<script> alert('상품수정실패'); history.back(); </script>");
				}
			} else if (file3.isEmpty()) { // file3만 수정 하지 않은 경우
				// 원래 있던 파일 삭제
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
				apcdto.setProduct_file1(file1.getOriginalFilename());
				apcdto.setProduct_file2(file2.getOriginalFilename());

				int check2 = this.apcdao.updateWithoutFile3(apcdto);

				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");

				if (check2 > 0 && !file1.getOriginalFilename().isEmpty() && !file2.getOriginalFilename().isEmpty()) {
					file1.transferTo(new File(FILE_SERVER_PATH, file1.getOriginalFilename()));
					file2.transferTo(new File(FILE_SERVER_PATH, file2.getOriginalFilename()));
					out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
							+ page + "'; </script>");
				} else {
					out.println("<script> alert('상품수정실패'); history.back(); </script>");
				}
			} else { //셋다 수정됐을 때
				
				// 원래 있던 파일 삭제
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
				apcdto.setProduct_file1(file1.getOriginalFilename());
				apcdto.setProduct_file2(file2.getOriginalFilename());
				apcdto.setProduct_file3(file3.getOriginalFilename());

				int check2 = this.apcdao.productContentUpdate(apcdto);

				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");

				if (check2 > 0 && !file1.getOriginalFilename().isEmpty() && !file2.getOriginalFilename().isEmpty() && !file3.getOriginalFilename().isEmpty()) {
					file1.transferTo(new File(FILE_SERVER_PATH, file1.getOriginalFilename()));
					file2.transferTo(new File(FILE_SERVER_PATH, file2.getOriginalFilename()));
					file3.transferTo(new File(FILE_SERVER_PATH, file3.getOriginalFilename()));
					out.println("<script> alert('상품수정성공'); location.href='admin_product_content.do?no=" + no + "&page="
							+ page + "'; </script>");
				} else {
					out.println("<script> alert('상품수정실패'); history.back(); </script>");
				}
				
			}
	}


	
	//상품 삭제(product, product_content 같은 번호 동시 삭제)
	@RequestMapping("admin_product_delete.do")
	public void admin_product_del(@RequestParam("no") int no, HttpServletResponse response) throws IOException {

		int product_no = no;	
		int check1 = this.apcdao.deleteProductCont(no); // 해당 번호 product_content삭제
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check1 > 0) {
			this.apcdao.productContUpdateSeq(product_no); // product_content 번호 재정렬
			int check2 = this.apdao.deleteProduct(no); // 해당 번호 product삭제
			if (check2 > 0) {
				this.apdao.productUpdateSeq(product_no); // product 번호 재정렬
				out.println("<script> alert('상품이 삭제되었습니다.'); location.href='admin_product_list.do'; </script>");
			} else {
				out.println("<script> alert('상품삭제실패'); history.back(); </script>");
			}
		}
	}
	
	//주문 리스트
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
	
	// 주문 클릭하면 같은 패키지끼리 보여주는 메서드
	@RequestMapping("admin_order_same_package.do")
	public String admin_order_same_pakage(HttpServletRequest request, Model model,@RequestParam("no") int no) {

		// 클릭한 패키지번호에 해당하는 게시물을 가져오는 메서드 호출.
		List<OrderDTO> list = this.dao.getSamePakageOrderList(no);

		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			System.out.println("반복문 list 값 >>> " + list.get(count));

			count += 1;

		}

		model.addAttribute("list", list);

		return "admin/admin_order_same_pakage";
		
	}
	
	
	
	//주문 상태 변경
	@RequestMapping("admin_order_statusChange.do")
	public void admin_order_statusChange(HttpServletResponse response, @RequestParam("no") int no,
			@RequestParam("key") String key) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("no", no);

		int check = this.dao.orderStatusChange(map);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0) {
			out.println("<script> alert('제품 판매상태 변경 성공'); location.href='admin_order_list.do'; </script>");
		} else {
			out.println("<script> alert('제품 판매상태 변경을 실패했습니다.'); history.back(); </script>");
		}
	}
	
	//주문 검색 
	@RequestMapping("admin_order_search.do")
	public String admin_order_search(HttpServletRequest request, 
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
		totalRecord = this.dao.getOrderSearchListCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		map.put("keyword", keyword);
		map.put("Page", dto);
		
		List<OrderDTO> list = this.dao.getOrderSearchList(map);
		
		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			count += 1;

		}

		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);
		
		return "admin/admin_order_search";
	}
	
	//주문 취소 리스트
	@RequestMapping("/admin_order_del.do")
	public String admin_order_del_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.dao.getOrderDelListCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<OrderDTO> list = this.dao.getOrderDelList(dto);

		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			count += 1;

		}

		model.addAttribute("list", list);
		model.addAttribute("page", dto);

		return "admin/admin_order_del_list";
	}
	
	//주문 취소 검색
	@RequestMapping("admin_order_del_search.do")
	public String admin_order_del_search(HttpServletRequest request, 
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
		totalRecord = this.dao.getOrderDelSearchListCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		map.put("keyword", keyword);
		map.put("Page", dto);
		
		List<OrderDTO> list = this.dao.getOrderDelSearchList(map);
		
		int count = 0;

		for (OrderDTO item : list) {

			List<ProductDTO> plist = dao.getOrderProductList(list.get(count).getProduct_no());

			list.get(count).setProduct_name(plist.get(0).getProduct_name());
			list.get(count).setProduct_thumbnail(plist.get(0).getProduct_thumbnail());

			count += 1;

		}

		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);
		
		return "admin/admin_order_del_search_list";
	}
	
	//판매중지 상품 리스트
	@RequestMapping("admin_product_del_list.do")
	public String admin_product_del_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}

		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.apdao.getStopProductCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<admin_productDTO> plist = this.apdao.stopProductList(dto);
		

		model.addAttribute("list", plist);
		
		model.addAttribute("page", dto);
		
		
		return "admin/admin_product_del_list";
	}
	
	//전체 유저 리스트
	@RequestMapping("admin_user_list.do")
	public String admin_user_list(HttpServletRequest request, Model model) {
			// 페이징 처리 작업
			int page;	// 현재 페이지 변수
							
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}else {
				page = 1;
			}
			// DB상의 전체 게시물의 수를 확인하는 메서드
			totalRecord = this.audao.getUserCount();
			PageDTO dto = new PageDTO(page, rowsize, totalRecord);
			
			// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
			List<UserDTO> plist = this.audao.getUserList(dto);
			
			model.addAttribute("list", plist);
			model.addAttribute("page", dto);
			return "admin/admin_user_list";
	}
	
	//유저 상세정보
	@RequestMapping("admin_user_content.do")
	public String admin_user_cont(@RequestParam("no") int no, @RequestParam("page") int page , Model model) {
		UserDTO udto = this.audao.getUserCont(no);
		model.addAttribute("udto", udto);
		model.addAttribute("page", page);
		return "admin/admin_user_cont";
	}
	

	//유저 수정
	@RequestMapping("admin_user_update.do")
	public String admin_user_update(@RequestParam("no") int no, @RequestParam("page") int page, Model model){
		UserDTO dto = this.audao.getUserCont(no);
		model.addAttribute("User", dto);
		model.addAttribute("page", page);
		return "admin/admin_user_update";
	}

	//유저 수정 완료
	@RequestMapping("admin_user_update_ok.do")
	public void admin_user_update_ok(@RequestParam("user_no") int no, @RequestParam("user_point") int user_point,  
			@RequestParam("page") int page, 
			HttpServletResponse response, 
			Model model, UserDTO dto) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_no",no);
		map.put("user_point",user_point);
		int check = audao.updateUser(map);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0) {
			out.println("<script> alert('회원 수정 성공'); location.href='admin_user_cont.do?no="+no+"'; </script>");
		} else {
			out.println("<script> alert('회원 수정 실패.'); history.back(); </script>");
		}
	}
	
	//유저 삭제
	@RequestMapping("admin_user_delete.do")
	public void admin_user_delete(@RequestParam("no") int no, HttpServletResponse response) throws IOException {
		int check = this.audao.deleteUser(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0) {
			this.audao.userUpdateSeq(no);
			out.println("<script> alert('회원 삭제 성공'); location.href='admin_user_list.do'; </script>");
		} else {
			out.println("<script> alert('회원삭제실패'); history.back(); </script>");
		}
	}
	
	//유저 검색
	@RequestMapping("admin_user_search.do")
	public String admin_user_search(HttpServletRequest request, 
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page;
		int rowsize = 10;
		int totalRecord;
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.audao.getSearchUserCount(keyword);
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		map.put("keyword", keyword);
		map.put("Page", dto);
		
		List<UserDTO> userSearchList = this.audao.searchUserList(map);

		model.addAttribute("list", userSearchList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", dto);
		
		return "admin/admin_user_search";
	}
	
	//회원 탈퇴처리
	@RequestMapping("admin_user_statusChange.do")
	public void admin_user_statusChange(HttpServletResponse response, @RequestParam("no") int no) throws IOException {
		int check = this.audao.updateUserStatus(no);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script> location.href='admin_user_list.do'; </script>");
		}else {
			out.println("<script> history.back(); </script>");
		}
	}
	
	
	//현재 활동중인 회원 목록
	@RequestMapping("admin_ing_user_list.do")
	public String admin_ing_user_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.audao.getIngUserCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<UserDTO> plist = this.audao.getIngUserList(dto);
		
		model.addAttribute("list", plist);
		model.addAttribute("page", dto);
		return "admin/admin_ing_user_list";
	}
	
	//현재 활동중인 회원 검색
	
	//탈퇴 회원 목록
	@RequestMapping("admin_del_user_list.do")
	public String admin_del_user_list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
						
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.audao.getDelUserCount();
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<UserDTO> plist = this.audao.getDelUserList(dto);
		
		model.addAttribute("list", plist);
		model.addAttribute("page", dto);
		return "admin/admin_del_user_list";
	}
	
	//탈퇴 회원 검색
	
	
	//관리자 로그아웃
	@RequestMapping("admin_logout.do")
	public String signOut(HttpSession session) {

		session.invalidate();

		return "redirect:/store.do";
	}
	
	
	// 관리자 이벤트
	@RequestMapping("/admin_event.do")
	public String admin_event(HttpServletRequest request, Model model) {
		List<EventDTO> list = edao.eventList();
		model.addAttribute("list", list);
		return "admin/admin_event";
	}
	
	// 관리자 이벤트 등록
	@RequestMapping("/admin_event_insert.do")
	public String admin_event_insert(HttpServletRequest request, Model model) {

		return "admin/admin_event_insert";
	}
	
	//이벤트 등록 확인
	@RequestMapping("/admin_event_insert_ok.do")
	public void admin_event_insert_ok(
			@RequestParam("event_thumbnailfile") MultipartFile file1,
//			@RequestParam("event_file1file") MultipartFile file2,
//			@RequestParam("event_file2file") MultipartFile file3,
//			@RequestParam("event_file3file") MultipartFile file4,
//			@RequestParam("event_start") Date event_start, 
//			@RequestParam("event_end") Date event_end, 
			@RequestParam("event_start") String start, 
			@RequestParam("event_end") String end, 
			HttpServletResponse response,
			ModelAndView mv,
			EventDTO dto,
			Model model) throws Exception {
		
		dto.setEvent_start(start.substring(0,10));
		dto.setEvent_end(end.substring(0,10));
//		
		if (!file1.isEmpty()) {
			dto.setEvent_thumbnail(file1.getOriginalFilename());			
		}else if(file1.isEmpty()) {
			dto.setEvent_thumbnail(null);			
		}
		
//		if (!file2.isEmpty()) {
//			dto.setEvent_file1(file2.getOriginalFilename());
//		}else {
//			dto.setEvent_file1(null);
//		}
//		
//		if (!file3.isEmpty()) {
//			dto.setEvent_file2(file3.getOriginalFilename());
//		}else {
//			dto.setEvent_file2(null);
//		}
//		
//		if (!file4.isEmpty()) {
//			dto.setEvent_file3(file4.getOriginalFilename());
//		}else {
//			dto.setEvent_file3(null);
//		}
//		
//		
		

		int check = this.edao.insertEvent(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0 && !file1.getOriginalFilename().isEmpty()) {
			file1.transferTo(new File(FILE_SERVER_PATH2, file1.getOriginalFilename()));
			out.println("<script> alert('이벤트 등록 성공'); location.href='admin_event.do'; </script>");
		} else {
			out.println("<script> alert('이벤트 등록 실패했습니다.'); history.back(); </script>");
		}
	}
	
	//이벤트 상세
	@RequestMapping("/admin_event_content.do")
	public String admin_event_content(@RequestParam("event_no") int no, Model model) {
		EventDTO dto = this.edao.getEventCont(no);
			int pno = dto.getProduct_no();
			ProductDTO pdto = this.pdao.getProductCont(pno);
			model.addAttribute("productCont", pdto);
		
		model.addAttribute("eventCont", dto);
		return "admin/admin_event_content";
	}
	
	//이벤트 상세정보 수정
	@RequestMapping("/admin_event_update.do")
	public String admin_event_update(@RequestParam("no") int no, Model model) throws Exception {
		EventDTO dto = this.edao.getEventCont(no);
		int pno = dto.getProduct_no();
		ProductDTO pdto = this.pdao.getProductCont(pno);
		model.addAttribute("eventCont", dto);
		model.addAttribute("productCont", pdto);		
		return "admin/admin_event_update";
	}
	
	//이벤트 상세정보 수정 완료
	@RequestMapping("/admin_event_update_ok.do")
	public void admin_event_update_ok(
			@RequestParam(value="event_file1file",required = false) MultipartFile file1,
			@RequestParam(value="event_file2file",required = false) MultipartFile file2,
			@RequestParam(value="event_file3file",required = false) MultipartFile file3,			
			@RequestParam("no") int no, 
			@RequestParam("event_start") String start, 
			@RequestParam("event_end") String end, 
			HttpServletResponse response,
			ModelAndView mv,
			EventDTO dto,
			Model model) throws Exception {
		
		System.out.println(dto.getEvent_start());
		
		dto.setEvent_start(start.substring(0,10));
		dto.setEvent_end(end.substring(0,10));
		
		String savedfile1 = dto.getEvent_file1();
		String savedfile2 = dto.getEvent_file2();
		String savedfile3 = dto.getEvent_file3();

		if (!file1.isEmpty()) {//파일이 있을 때
			if (savedfile1 != null) {
				String fullpath = FILE_SERVER_PATH2 + "/" + savedfile1;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}
			file1.transferTo(new File(FILE_SERVER_PATH2, file1.getOriginalFilename()));
				
				dto.setEvent_file1(file1.getOriginalFilename()); //새로운 파일로 교체
		} else { //파일 없을 때
			dto.setEvent_file1(null);
		}
//
		if (!file2.isEmpty()) {//파일이 있을 때
			if (savedfile2 != null) {
				String fullpath = FILE_SERVER_PATH2 + "/" + savedfile2;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}
			file2.transferTo(new File(FILE_SERVER_PATH2, file2.getOriginalFilename()));
				dto.setEvent_file2(file2.getOriginalFilename()); //새로운 파일로 교체
		} else { //파일 없을 때
			dto.setEvent_file2(null);
		}
//
		if (!file3.isEmpty()) {//파일이 있을 때
			if (savedfile3 != null) {
				String fullpath = FILE_SERVER_PATH2 + "/" + savedfile3;
				File file = new File(fullpath);
				if (file.isFile()) {
					file.delete();
				}
			}
			file3.transferTo(new File(FILE_SERVER_PATH2, file3.getOriginalFilename()));
				dto.setEvent_file3(file3.getOriginalFilename()); //새로운 파일로 교체
		} else { //파일 없을 때
			dto.setEvent_file3(null);
		}
		
		int check = this.edao.updateEvent(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check > 0) {
			out.println("<script> alert('이벤트 수정 성공'); location.href='admin_event_content.do?event_no=" + no+"'; </script>");
		} else {
			out.println("<script> alert('이벤트 수정 실패했습니다.'); history.back(); </script>");
		}
	}
	
	//구독 관리
	@RequestMapping("/admin_subscribe.do")
	public String admin_subscribe(HttpServletRequest request, Model model) {
		SubscribeDTO dto = sdao.subCont();
		List<SubscribeDTO> list = sdao.getAllsubscribeList();
		model.addAttribute("currentSub", dto);
		model.addAttribute("list", list);
		
		
		return "admin/admin_subscribe";
	}
	
	@RequestMapping("/admin_sub_insert")
	public String admin_sub_insert() {
		
		
		return "admin/admin_sub_insert";
	}
	
	
	
	//구독 등록
	@RequestMapping("/admin_sub_list")
	@ResponseBody
	public List<ProductDTO> admin_sub_list(@RequestParam("category") String category
			) {
		
		System.out.println("category 값 >>> " + category);
		List<ProductDTO> List = this.apdao.getCateProductList(category);
		System.out.println("List 값 >>> " + List);

		return List;
	}
	
	
	
	
	
	
	
	

}
