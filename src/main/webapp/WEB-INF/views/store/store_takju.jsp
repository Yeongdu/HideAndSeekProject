<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../banner/none_top.jsp" />
<link href="resources/css/store/store_category.css" rel="stylesheet" type="text/css"/>

<c:set var="list" value="${list }" />
<c:set var="page" value="${page }"/>

<script type="text/javascript">

$(function(){
	
	let loading = false;
	
	let page = ${page.page} + 1;
	
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
 	$(document).on("scroll", function(){
			
 		if($(window).scrollTop()+200>=$(document).height() - $(window).height())
 	    {
 	        if(!loading)    //실행 가능 상태라면?
 	        {
 	            loading = true; //실행 불가능 상태로 변경
 	            getlist();
 	        }
 	    }
	});
	
	function getlist(){
		
		let html = "";
		
		$.ajax({
			url:"<%=request.getContextPath()%>/infinite_scroll.do",
			methood:"post",
			data: {page : page},
			datatype: "json",
			success:function(data){
				
				isBottom = false;
				
				$.each(data, function(index, item){			// 데이터 = item
					
					html = "";
				
					let price = item.product_price.toLocaleString('ko-KR');
				
					html += "<div class='product'>"
					html += "<div class='product_wrap'>"
					html += "<a href='<%=request.getContextPath() %>/product_content.do?no="+item.product_no+"'>"
					html += "<div class='img_wrap'><span>"
					html += "<img alt='img' src='resources/upload/"+item.product_thumbnail+".jpg' style='width: 100%; height: 39.7vh'></span></div>"
					html += "<div class='content_wrap'>"
					html += "<div class='wrapper'>"
					html += "<div class='content_title'>"+item.product_name+"</div></div>"
					html += "<div class='wrapper'><div class='content_price'><p class='content_price_blank' /><div class='content_price_wrap'><p>"
					html += price
					html += "<span>원</span></p></div></div>"
					html += "<div class='content_review'>"
					html += "<img alt='img' src='resources/image/star.png'>"
					html += "<p class='content_score'>0.0</p>"
					html += "<div class='content_column_line'></div>"
					html += "<p class='review'>리뷰 00</p></div></div>"
					html += "<div class='card_footer'>"
					html += "<div class='footer_content'>"
					html += "<div>#"+item.product_introduce1+"</div>"
					html += "<div>#"+item.product_introduce2+"</div></div></div></a></div></div>"
					
					$(".data_grid").append(html);
				});
				
				page += 1;
				
				loading = false;
				
			},
			
			error:function(data){
				alert("통신 실패");
			}
		});

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
		
		<div class="content_tag_wrap">
			<div class="content_filter">
				<div class="content_filter_wrap">
					<div class="filter_button_group">
						<div class="container">
							<button class="filter flex">
								<span>도수</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
							
						<div class="container">
							<button class="filter flex">
								<span>단맛</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
							
						<div class="container">
							<button class="filter flex">
								<span>신맛</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
							
						<div class="container">
							<button class="filter flex">
								<span>탄산</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
							
						<div class="container">
							<button class="filter flex">
								<span>원료</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
							
						<div class="container">
							<button class="filter flex">
								<span>가격</span>
								<img src="resources/image/down_button.png" width="20px" class="img" alt="arrow-down">
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="content_product_list">
				<div class="content_product_wrap">
					<div class="infinite_scroll">
						<div class="infinite_scroll_component">
							<div class="data_header">
								<div class="wrapper flex">
									<div class="search_result flex">
										<span>23</span>
										<span>건의 결과가 있어요.</span>
									</div>
									
									<div class="sort-wrapper flex">
										<span>추천순</span>
									</div>
								</div>
							</div>
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

