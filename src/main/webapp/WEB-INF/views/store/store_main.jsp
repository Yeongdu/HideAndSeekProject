<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>술래잡기 상점</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    
	<c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>



<link href="resources/css/store/store_main.css" rel="stylesheet" type="text/css">

	<div class="main">
		<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			</div>
			
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="3500">
					<a href="<%=request.getContextPath()%>/product_content_list.do?no=1">
						<img class="d-block w-100" src="resources/image/055z-1670381772398-PC_MAIN_BANNER2.jpg">
					</a>
				</div>
				
				<div class="carousel-item" data-bs-interval="3500">
					<a href="<%=request.getContextPath() %>/mypage.do">
						<img class="d-block w-100" src="resources/image/qL5p-1655775957715-main_review.png">
					</a>
				</div>
			</div>
			
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	
		<div class="category">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/store_tlist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_takju_logo.png">
							</li>
							<li class="text">탁 주</li>
						</ul>
					</a>
				</li>
			
				<li>
					<a href="<%=request.getContextPath()%>/store_clist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_chungju_logo.png">
							</li>
							<li class="text">약·청 주</li>
						</ul>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_wlist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_wine_logo.png">
							</li>
							<li class="text">과실주</li>
						</ul>
					</a>
				</li>
					
				<li>
					<a href="<%=request.getContextPath()%>/store_slist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_soju_logo.png">
							</li>
							<li class="text">증류주</li>
						</ul>
					</a>
				</li>
			</ul>
		</div>
	
	<hr>
	<div class="best_wrap">
		<div class="best_choice">
			<div class="best_logo">
				<img alt="best_img" src="resources/image/best_product_logo.png">
			</div>
			
			<div class="best_title">
				<span class="best_introduse1">현재 술래잡기에서 가장 인기 있는 술</span>
				<span class="best_introduse2">&nbsp;&nbsp;이 술은 어때요?</span>
			</div>
			
			<div class="more"></div>
		</div>
		
		<div class="slider_bar">
			<div id="bestslide" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${bestlist }" begin="0" end="3" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_status != '품절'}" >
														<span>
															<img alt="img" src="resources/upload/${dto.product_thumbnail }">
														</span>
													</c:if>
													
													<c:if test="${dto.product_status == '품절'}" >
														<span>
															<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${bestlist }" begin="4" end="7" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${bestlist }" begin="8" end="11" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${bestlist }" begin="12" end="15" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
			
				<button class="carousel-control-prev" type="button" data-bs-target="#bestslide" data-bs-slide="prev" style="left:-200px;">
					<img alt="button" src="resources/image/slider_left_button.png" style="width:50px; height:50px;" aria-hidden="true"> 
					<span class="visually-hidden">Previous</span>
				</button>
				
				<button class="carousel-control-next" type="button" data-bs-target="#bestslide" data-bs-slide="next" style="right:-200px;">
					<img alt="button" src="resources/image/slider_right_button.png" style="width:50px; height:50px;" aria-hidden="true">
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
		
	<div class="review_wrap">
		<div class="review_choice">
			<div class="review_logo">
				<img alt="review_img" src="resources/image/review_product_logo.png">
			</div>
			
			<div class="review_title">
				<span class="review_introduse1">마셔본 사람들의 이야기가 가장 많아요</span>
				<span class="review_introduse2">&nbsp;&nbsp;이 술은 어때요?</span>
			</div>
			
			<div class="more">
			</div>
		</div>
		
		<div class="slider_bar">
			<div id="reviewslide" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${reviewlist }" begin="0" end="3" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${reviewlist }" begin="4" end="7" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${reviewlist }" begin="8" end="11" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:forEach items="${reviewlist }" begin="12" end="15" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" >
													<c:if test="${dto.product_stock != 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
													</span>
													</c:if>
													
													<c:if test="${dto.product_stock == 0}" >
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }">
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
			
				<button class="carousel-control-prev" type="button" data-bs-target="#reviewslide" data-bs-slide="prev" style="left:-200px;">
					<img alt="button" src="resources/image/slider_left_button.png" style="width:50px; height:50px;" aria-hidden="true"> 
					<span class="visually-hidden">Previous</span>
				</button>
				
				<button class="carousel-control-next" type="button" data-bs-target="#reviewslide" data-bs-slide="next" style="right:-200px;">
					<img alt="button" src="resources/image/slider_right_button.png" style="width:50px; height:50px;" aria-hidden="true">
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
		
		<div class="photoreview_wrap">
			<img alt="speaker" src="resources/image/speaker.png">
			<div class="review_headtitle">"이 순간 다른 분들은"</div>
			<p class="review_maintitle">실시간 후기</p>
			
			<div class="slider_bar">
			<div id="photoreviewslide" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="photoreview_list">
							<c:forEach items="${photoreview }" begin="0" end="2" var="dto">
							<div class="photoreview_content">
								<div>
									<a href="<%=request.getContextPath()%>/product_content_list.do?no=${dto.product_no}">
										<div class="photoreview_card">
											<div style="display: block">
												<span>
													<img src="resources/review_img/${dto.review_file }">
												</span>
											</div>
											
											<div class="photoreview_card_content">
												<div class="star-ratings">
													<div class="star-ratings-fill space-x-2 text-lg" style="width: ${dto.review_star}%">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
													<div class="star-ratings-base space-x-2 text-lg">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
												</div>
												
												<p class="cont">${dto.review_cont }</p>
											</div>
											
											<div class="photoreview_card_footer">
												<p>${dto.user_id }</p>
											</div>
										</div>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
					<div class="carousel-item">
						<div class="photoreview_list">
							<c:forEach items="${photoreview }" begin="3" end="5" var="dto">
							<div class="photoreview_content">
								<div>
									<a href="<%=request.getContextPath()%>/product_content_list.do?no=${dto.product_no}">
										<div class="photoreview_card">	
											<div style="display: block">
												<span>
													<img src="resources/review_img/${dto.review_file }" >
												</span>
											</div>
											
											<div class="photoreview_card_content">
												<div class="star-ratings">
													<div class="star-ratings-fill space-x-2 text-lg" style="width: ${dto.review_star}%">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
													<div class="star-ratings-base space-x-2 text-lg">
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
												</div>
												
												<p class="cont">${dto.review_cont }</p>
											</div>
											
											<div class="photoreview_card_footer">
												<p>${dto.user_id }</p>
											</div>
										</div>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			
				<button class="carousel-control-prev" type="button" data-bs-target="#photoreviewslide" data-bs-slide="prev" style="left:-200px;">
					<img alt="button" src="resources/image/slider_left_button.png" style="width:50px; height:50px;" aria-hidden="true"> 
					<span class="visually-hidden">Previous</span>
				</button>
				
				<button class="carousel-control-next" type="button" data-bs-target="#photoreviewslide" data-bs-slide="next" style="right:-200px;">
					<img alt="button" src="resources/image/slider_right_button.png" style="width:50px; height:50px;" aria-hidden="true">
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">

	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>

<jsp:include page="../banner/bottom.jsp" />
	
