<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>술래잡기 약청주 리스트</title>
	<c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
<link href="resources/css/store/store_category.css" rel="stylesheet" type="text/css"/>
<c:set var="list" value="${list }" />
<c:set var="page" value="${page }"/>
<jsp:include page="store_chungju_js.jsp" />

	<div class="main">
		<div class="header_menu">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/store_tlist.do">
						<div class="menu_label">
							<span class="label">탁주</span>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_clist.do">
						<div class="menu_label">
							<span class="select_label">약·청주</span>
							<div class="select_underbar"></div>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_wlist.do">
						<div class="menu_label">
							<span class="label">과실주</span>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_slist.do">
						<div class="menu_label">
							<span class="label">증류주</span>
						</div>
					</a>
				</li>
			</ul>
		</div>
		
		<div class="header_img_wrap">
			<div class="header_category_cont" style="background-color: rgb(255, 251, 244);">
				<div>
					<div class="category_title">약·청주</div>
					<div class="category_cont">맑고 깨끗한 술의 원조</div>
				</div>
				<div class="category_logo">
					<img style="width: 80%" alt="logo" src="resources/image/store_chungju_logo.png">
				</div>
			</div>
		</div>
		
		<div class="content_tag_wrap">
			<form id="frm" name="frm" method="get" action="<%=request.getContextPath()%>/store_list_tag.do">
			<input type="hidden" name="category" value="chungju">
			<div class="content_filter">
				<div class="content_filter_wrap">
					<div class="filter_button_group">
						<div class="container">
							<button type="button" class="filter flex b1">
								<span>도수</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check dosu">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_low" name="dosu" value="low">
											<div class="dosu1">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>0%~10%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_middle" name="dosu" value="middle">
											<div class="dosu2">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>10%~20%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_high" name="dosu" value="high">
											<div class="dosu3">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>20%~30%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_veryhigh" name="dosu" value="veryhigh">
											<div class="dosu4">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>30% 이상</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						<div class="container">
							<button type="button" class="filter flex b2">
								<span>단맛</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check sweet">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="sweet_low" name="sweet" value="low">
											<div class="sweet1">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="sweet_middle" name="sweet" value="middle">
											<div class="sweet2">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="sweet_high" name="sweet" value="high">
											<div class="sweet3">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>강한</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						<div class="container">
							<button type="button" class="filter flex b3">
								<span>신맛</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check acidity">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="acidity_low" name="acidity" value="low">
											<div class="acidity1">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="acidity_middle" name="acidity" value="middle">
											<div class="acidity2">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="acidity_high" name="acidity" value="high">
											<div class="acidity3">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>강한</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						<div class="container">
							<button type="button" class="filter flex b4">
								<span>탄산</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check soda">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_none" name="soda" value="nosoda">
											<div class="soda1">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>없음</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_low" name="soda" value="low">
											<div class="soda2">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_middle" name="soda" value="middle">
											<div class="soda3">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_high" name="soda" value="high">
											<div class="soda4">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>강한</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						<div class="container">
							<button type="button" class="filter flex b5">
								<span>원료</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check material">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_fruit" name="material" value="fruit">
											<div class="fruit">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>과일 · 과채</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_flower" name="material" value="flower">
											<div class="flower">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>꽃</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_nut" name="material" value="nut">
											<div class="nut">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>곡물 · 견과</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_herb" name="material" value="herb">
											<div class="herb">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>약재</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_other" name="material" value="other">
											<div class="other">
												<label style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label style="box-sizing: border-box">
													<span>기타</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							
						<div class="container">
							<button type="button" class="filter flex b6">
								<span>가격</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
							<div class="filter_check price">
								<div class="check_grid">
									<div class="grid_item">
										<div class="check-box_filter">
											<div class="price_info">
												<input name="minprice" class="minprice" placeholder="0원">
												&nbsp;~&nbsp;
												<input name="maxprice" class="maxprice" placeholder="1,000,000원">
												<button type="button" class="price_info_button">확인</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="container-button">
							<input type="button" class="price_submit_button" value="검색">
						</div>
					</div>
				</div>
			</div>
			</form>
			
			<div class="content_product_list">
				<div class="content_product_wrap">
					<div class="infinite_scroll">
						<div class="infinite_scroll_component">
							<div class="data_header">
								<div class="wrapper flex">
									<div class="search_result flex">
										<span>${page.totalRecord}</span>
										<span>건의 결과가 있어요.</span>
									</div>
									
									<div class="sort-wrapper flex">
										<div class="sort-box">
											<select class="sort-menu" name="sort">
												<option value="released" selected>최신순</option>
												<option value="rating">평점순</option>
												<option value="star_count">리뷰 많은순</option>
												<option value="selling_count">판매순</option>
												<option value="price_high">높은 가격순</option>
												<option value="price_low">낮은 가격순</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="data_wrap">
								<div class="data_grid">
									<c:forEach items="${list }" var="dto">
										<div class="product">
											<div class="product_wrap">
												<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
													<div class="img_wrap">
														<c:if test="${dto.product_stock != 0}" >
															<span>
																<img alt="img" src="resources/upload/${dto.product_thumbnail }" style="width: 100%; height: 39.7vh">
															</span>
														</c:if>
															
														<c:if test="${dto.product_stock == 0}" >
															<span>
																<img alt="img" src="resources/upload/${dto.product_thumbnail }" style="width: 100%; height: 39.7vh">
															</span>
															
															<div class="soldout">
																<div class="soldout_title">품절</div>
																<div class="margin_box"></div>
																<div class="soldout_cont">술 빚는 중이에요</div>
															</div>
														</c:if>
													</div>
													
													<div class="content_wrap">
														<div class="wrapper">
															<div class="content_title">
																${dto.product_name }
															</div>
														</div>
														
														<div class="wrapper">
															<div class="content_price">
																<p class="content_price_blank" />
																<div class="content_price_wrap">
																	<p>
																		<fmt:formatNumber>${dto.product_price }</fmt:formatNumber>
																		<span>원</span>
																	</p>
																</div>
															</div>
															
															<div class="content_review">
																<img alt="img" src="resources/image/star.png">
																<p class="content_score">${dto.product_review_star }</p>
																<div class="content_column_line"></div>
																<p class="review">리뷰 ${dto.product_review_count }</p>
															</div>
														</div>
														
														<div class="card_footer">
															<div class="footer_content">
																<div>#${dto.product_introduce1 }</div>
																<div>#${dto.product_introduce2 }</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	
	// 로딩창 종료
	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>

<jsp:include page="../banner/bottom.jsp" />