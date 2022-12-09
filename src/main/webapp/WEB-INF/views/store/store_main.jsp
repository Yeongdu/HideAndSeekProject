<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<img alt="banner" src="resources/image/store_banner.png">
	
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
							<li class="text">청 주</li>
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
			
			<div class="more">
			</div>
		</div>
		
		<div class="">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="data_wrap">
							<div class="data_grid">
								<c:set var="i" value="0"/>
								<c:forEach items="${list }" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap" style="height: 68.5%	">
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }" style="width: 100%; height: 39.7vh">
													</span>
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
															<p class="content_score">${star[i] }</p>
															<div class="content_column_line"></div>
															<p class="review">리뷰 ${count[i] }</p>
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
									<c:set var="i" value="${i+1 }"/>
								</c:forEach>
							</div>
						</div>
					</div>
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:set var="i" value="0"/>
								<c:forEach items="${list }" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap">
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }" style="width: 100%; height: 39.7vh">
													</span>
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
															<p class="content_score">${star[i] }</p>
															<div class="content_column_line"></div>
															<p class="review">리뷰 ${count[i] }</p>
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
									<c:set var="i" value="${i+1 }"/>
								</c:forEach>
							</div>
						</div>
					</div>
					
					<div class="carousel-item">
						<div class="data_wrap">
							<div class="data_grid">
								<c:set var="i" value="0"/>
								<c:forEach items="${list }" var="dto">
									<div class="product">
										<div class="product_wrap">
											<a href="<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no}">
												<div class="img_wrap">
													<span>
														<img alt="img" src="resources/upload/${dto.product_thumbnail }" style="width: 100%; height: 39.7vh">
													</span>
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
															<p class="content_score">${star[i] }</p>
															<div class="content_column_line"></div>
															<p class="review">리뷰 ${count[i] }</p>
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
									<c:set var="i" value="${i+1 }"/>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev" style="left:-200px;">
				<img alt="button" src="resources/image/slider_left_button.png" style="width:50px; height:50px;" aria-hidden="true"> 
				<span class="visually-hidden">Previous</span>
			</button>
			
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next" style="right:-200px;">
				<img alt="button" src="resources/image/slider_right_button.png" style="width:50px; height:50px;" aria-hidden="true">
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
<!-- 		<div class="best"> -->
<!-- 			<div class="best_product"> -->
<!-- 				<div class="best_product_img"> -->
<!-- 					<img alt="best_img" src="resources/upload/fWO1-1668403134296-1Z7A1584.jpg" style="width: 86.5%; height: 39.7vh"> -->
<!-- 				</div> -->
				
<!-- 				<div class="best_product_content"> -->
<!-- 					<div class="best_product_wrap"> -->
<!-- 						<div class="best_product_name"> -->
<!-- 						제목 -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 					<div class="best_product_wrap"> -->
<!-- 						<div class="best_product_pr"> -->
<!-- 							<div class="best_product_price"> -->
<!-- 							00000원 -->
<!-- 							</div> -->
<!-- 							<div class="best_product_review"> -->
<!-- 							별 0.0점 | 리뷰 00 -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<hr> -->
<!-- 					</div> -->
					
<!-- 					<div class="best_product_coment"> -->
<!-- 						<div>#일하기싫다</div> -->
<!-- 						<div>#집가고싶다</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
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
		
		<div class="review">
			<div class="review_product">
				<div class="review_product_img">
					<img alt="review_img" src="resources/upload/fWO1-1668403134296-1Z7A1584.jpg" style="width: 86.5%; height: 39.7vh">
				</div>
				
				<div class="review_product_content">
					<div class="review_product_wrap">
						<div class="review_product_name">
						제목
						</div>
					</div>
					
					<div class="review_product_wrap">
						<div class="review_product_pr">
							<div class="review_product_price">
							00000원
							</div>
							<div class="review_product_review">
							별 0.0점 | 리뷰 00
							</div>
						</div>
						
						<hr>
					</div>
					
					<div class="review_product_coment">
						<div>#일하기싫다</div>
						<div>#집가고싶다</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
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
	
