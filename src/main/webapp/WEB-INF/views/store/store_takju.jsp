<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../banner/none_top.jsp" />
<link href="resources/css/store/store_category.css" rel="stylesheet" type="text/css"/>

<c:set var="list" value="${list }" />
<c:set var="page" value="${page }"/>

<script type="text/javascript">
		
	let page = ${page.page} + 1;
	console.log())
	
	let list = ${page.}
		
	$(document).on("scroll", function(){
			
		let scrolltop = $(window).scrollTop();
			
		let windowHeight = $(window).height();
			
		let documentHeight = $(document).height();
			
		let isBottom = scrolltop + windowHeight + 10 >= documentHeight;
			
		if(isBottom){
			
			if(${dto.produ})
			
		}			
	});
</script>

	<div class="main">
		<div class="header_menu">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/store_tlist.do">
						<div class="menu_label">
							<span class="select_label">탁주</span>
							<div class="select_underbar"></div>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_chungju.do">
						<div class="menu_label">
							<span class="label">약.청주</span>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_wine.do">
						<div class="menu_label">
							<span class="label">과실주</span>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_soju.do">
						<div class="menu_label">
							<span class="label">증류주</span>
						</div>
					</a>
				</li>
			</ul>
		</div>
		
		<hr style="color: #C6C6C6;">
		
		<div class="header_img_wrap">
			<div class="header_category_cont">
				<div>
					<div class="category_title">탁주</div>
					<div class="category_cont">맛있는 막걸리는 다 있어요</div>
				</div>
				<div class="category_logo">
					<img style="width: 80%" alt="logo" src="resources/image/store_takju_logo.png">
				</div>
			</div>
		</div>
		
		<div class="content_wrap">
			<div class="content_filter">
				<div class="content_filter_wrap">
				</div>
			</div>
			
			<div class="content_product_list">
				<div class="content_product_wrap">
					<div class="infinite_scroll">
						<div class="infinite_scroll_component">
							<div class="data_wrap">
								<div class="data_grid">
									<c:forEach items="${list }" var="dto">
										<div class="product">
											<div class="product_wrap">
												<a href="<%=request.getContextPath() %>/product_content.do?no=${dto.product_no}">
													<div class="img_wrap">
														<span>
															<img alt="img" src="resources/upload/${dto.product_thumbnail }.jpg" style="width: 100%; height: 39.7vh">
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
																<p class="content_score">0.0</p>
																<div class="content_column_line"></div>
																<p class="review">리뷰 00</p>
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

