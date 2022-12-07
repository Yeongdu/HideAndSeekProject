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
	
		
	$(document).on("click", ".b1", function(){
		
		tag();
		
		$(".b1 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b1").addClass("b1-active");
		
		$(".b1-active").removeClass("b1");
		
		$(".dosu").css("display", "block");
		
	});
	
	$(document).on("click", ".b2", function(){
		
		tag();
		
		$(".b2 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b2").addClass("b2-active");
		
		$(".b2-active").removeClass("b2");
		
		$(".sweet").css("display", "block");
		
	});
	
	$(document).on("click", ".b3", function(){
		
		tag();
		
		$(".b3 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b3").addClass("b3-active");
		
		$(".b3-active").removeClass("b3");
		
		$(".acidity").css("display", "block");
		
	});
	
	$(document).on("click", ".b4", function(){
		
		tag();
		
		$(".b4 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b4").addClass("b4-active");
		
		$(".b4-active").removeClass("b4");
		
		$(".soda").css("display", "block");
		
	});
	
	$(document).on("click", ".b5", function(){
		
		tag();
		
		$(".b5 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b5").addClass("b5-active");
		
		$(".b5-active").removeClass("b5");
		
		$(".material").css("display", "block");
		
	});
	
	$(document).on("click", ".b6", function(){
		
		tag();
		
		$(".b6 > img").attr({src:"resources/image/up_button.png"});
			
		$(this).css("borderColor", "#5197F2");
		
		$(".b6").addClass("b6-active");
		
		$(".b6-active").removeClass("b6");
		
		$(".price").css("display", "block");
		
	});
	
	$(document).on("click", ".b1-active", function(){
		
		tag();
		
		$(".b1-active").addClass("b1");
		
		$(".b1").removeClass("b1-active");
		
	});
	
	$(document).on("click", ".b2-active", function(){
		
		tag();
		
		$(".b2-active").addClass("b2");
		
		$(".b2").removeClass("b2-active");
		
	});
	
	$(document).on("click", ".b3-active", function(){
		
		tag();
		
		$(".b3-active").addClass("b3");
		
		$(".b3").removeClass("b3-active");
		
	});
	
	$(document).on("click", ".b4-active", function(){
		
		tag();
		
		$(".b4-active").addClass("b4");
		
		$(".b4").removeClass("b4-active");
		
	});
	
	$(document).on("click", ".b5-active", function(){
		
		tag();
		
		$(".b5-active").addClass("b5");
		
		$(".b5").removeClass("b5-active");
		
	});
	
	$(document).on("click", ".b6-active", function(){
		
		let minprice = $(".minprice").val();
		
		let maxprice = $(".maxprice").val();
		
		if(parseInt(minprice) > parseInt(maxprice)){
			
			alert('최소값은 최대값보다 작아야 합니다.')
			
			$(".minprice").val("");
			
			$(".maxprice").val("");
			
		}else {
			
			tag();
			
			$(".b6-active").addClass("b6");
			
			$(".b6").removeClass("b6-active");
			
		}
		
	});
	
	$(document).on("click", ".price_info_button", function(){
		
		let minprice = $(".minprice").val();
		
		let maxprice = $(".maxprice").val();
		
		if(parseInt(minprice) > parseInt(maxprice)){
			
			alert('최소값은 최대값보다 작아야 합니다.')
			
			$(".minprice").val("");
			
			$(".maxprice").val("");
			
		}else {
			
			tag();
			
			$(".b6-active").addClass("b6");
			
			$(".b6").removeClass("b6-active");
			
		}
		
	});
	
	$(document).on("click", ".dosu1", function(){
		
		$(".dosu1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu1").addClass("dosu1-active");
		
		$(".dosu1-active").removeClass("dosu1");
		
	});
	
	$(document).on("click", ".dosu2", function(){
		
		$(".dosu2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu2").addClass("dosu2-active");
		
		$(".dosu2-active").removeClass("dosu2");
		
	});
	
	$(document).on("click", ".dosu3", function(){
	
		$(".dosu3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu3").addClass("dosu3-active");
		
		$(".dosu3-active").removeClass("dosu3");
		
	});
	
	$(document).on("click", ".dosu4", function(){
		
		$(".dosu4 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu4").addClass("dosu4-active");
		
		$(".dosu4-active").removeClass("dosu4");
		
	});
	
	$(document).on("click", ".dosu1-active", function(){
		
		$(".dosu1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu1-active").addClass("dosu1");
		
		$(".dosu1").removeClass("dosu1-active");
		
	});
	
	$(document).on("click", ".dosu2-active", function(){
		
		$(".dosu2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu2-active").addClass("dosu2");
		
		$(".dosu2").removeClass("dosu2-active");
		
	});
	
	$(document).on("click", ".dosu3-active", function(){
	
		$(".dosu3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu3-active").addClass("dosu3");
		
		$(".dosu3").removeClass("dosu3-active");
		
	});
	
	$(document).on("click", ".dosu4-active", function(){
		
		$(".dosu4-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu4-active").addClass("dosu4");
		
		$(".dosu4").removeClass("dosu4-active");
		
	});
	
	$(document).on("click", ".sweet1", function(){
		
		$(".sweet1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet1").addClass("sweet1-active");
		
		$(".sweet1-active").removeClass("sweet1");
		
	});
	
	$(document).on("click", ".sweet2", function(){
		
		$(".sweet2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet2").addClass("sweet2-active");
		
		$(".sweet2-active").removeClass("sweet2");
		
	});
	
	$(document).on("click", ".sweet3", function(){
	
		$(".sweet3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet3").addClass("sweet3-active");
		
		$(".sweet3-active").removeClass("sweet3");
		
	});
	
	$(document).on("click", ".sweet1-active", function(){
		
		$(".sweet1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet1-active").addClass("sweet1");
		
		$(".sweet1").removeClass("sweet1-active");
		
	});
	
	$(document).on("click", ".sweet2-active", function(){
		
		$(".sweet2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet2-active").addClass("sweet2");
		
		$(".sweet2").removeClass("sweet2-active");
		
	});
	
	$(document).on("click", ".sweet3-active", function(){
	
		$(".sweet3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet3-active").addClass("sweet3");
		
		$(".sweet3").removeClass("sweet3-active");
		
	});
	
	$(document).on("click", ".acidity1", function(){
		
		$(".acidity1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity1").addClass("acidity1-active");
		
		$(".acidity1-active").removeClass("acidity1");
		
	});
	
	$(document).on("click", ".acidity2", function(){
		
		$(".acidity2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity2").addClass("acidity2-active");
		
		$(".acidity2-active").removeClass("acidity2");
		
	});
	
	$(document).on("click", ".acidity3", function(){
	
		$(".acidity3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity3").addClass("acidity3-active");
		
		$(".acidity3-active").removeClass("acidity3");
		
	});
	
	$(document).on("click", ".acidity1-active", function(){
		
		$(".acidity1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity1-active").addClass("acidity1");
		
		$(".acidity1").removeClass("acidity1-active");
		
	});
	
	$(document).on("click", ".acidity2-active", function(){
		
		$(".acidity2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity2-active").addClass("acidity2");
		
		$(".acidity2").removeClass("acidity2-active");
		
	});
	
	$(document).on("click", ".acidity3-active", function(){
	
		$(".acidity3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity3-active").addClass("acidity3");
		
		$(".acidity3").removeClass("acidity3-active");
		
	});
	
	$(document).on("click", ".soda1", function(){
		
		$(".soda1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda1").addClass("soda1-active");
		
		$(".soda1-active").removeClass("soda1");
		
	});
	
	$(document).on("click", ".soda2", function(){
		
		$(".soda2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda2").addClass("soda2-active");
		
		$(".soda2-active").removeClass("soda2");
		
	});
	
	$(document).on("click", ".soda3", function(){
	
		$(".soda3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda3").addClass("soda3-active");
		
		$(".soda3-active").removeClass("soda3");
		
	});
	
	$(document).on("click", ".soda4", function(){
		
		$(".soda4 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda4").addClass("soda4-active");
		
		$(".soda4-active").removeClass("soda4");
		
	});
	
	$(document).on("click", ".soda1-active", function(){
		
		$(".soda1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda1-active").addClass("soda1");
		
		$(".soda1").removeClass("soda1-active");
		
	});
	
	$(document).on("click", ".soda2-active", function(){
		
		$(".soda2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda2-active").addClass("soda2");
		
		$(".soda2").removeClass("soda2-active");
		
	});
	
	$(document).on("click", ".soda3-active", function(){
	
		$(".soda3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda3-active").addClass("soda3");
		
		$(".soda3").removeClass("soda3-active");
		
	});
	
	$(document).on("click", ".soda4-active", function(){
		
		$(".soda4-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda4-active").addClass("soda4");
		
		$(".soda4").removeClass("soda4-active");
		
	});
	
	$(document).on("click", ".fruit", function(){
		
		$(".fruit > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".fruit").addClass("fruit-active");
		
		$(".fruit-active").removeClass("fruit");
		
	});
	
	$(document).on("click", ".flower", function(){
		
		$(".flower > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".flower").addClass("flower-active");
		
		$(".flower-active").removeClass("flower");
		
	});
	
	$(document).on("click", ".nut", function(){
	
		$(".nut > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".nut").addClass("nut-active");
		
		$(".nut-active").removeClass("nut");
		
	});
	
	$(document).on("click", ".herb", function(){
		
		$(".herb > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".herb").addClass("herb-active");
		
		$(".herb-active").removeClass("herb");
		
	});
	
	$(document).on("click", ".other", function(){
		
		$(".other > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".other").addClass("other-active");
		
		$(".other-active").removeClass("other");
		
	});
	
	$(document).on("click", ".fruit-active", function(){
		
		$(".fruit-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".fruit-active").addClass("fruit");
		
		$(".fruit").removeClass("fruit-active");
		
	});
	
	$(document).on("click", ".flower-active", function(){
		
		$(".flower-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".flower-active").addClass("flower");
		
		$(".flower").removeClass("flower-active");
		
	});
	
	$(document).on("click", ".nut-active", function(){
		
		$(".nut-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".nut-active").addClass("nut");
		
		$(".nut").removeClass("nut-active");
		
	});
	
	$(document).on("click", ".herb-active", function(){
	
		$(".herb-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".herb-active").addClass("herb");
		
		$(".herb").removeClass("herb-active");
		
	});
	
	$(document).on("click", ".other-active", function(){
		
		$(".other-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".other-active").addClass("other");
		
		$(".other").removeClass("other-active");
		
	});
	
	function tag(){
		
		$(".b1-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b1-active > img").attr({src:"resources/image/down_button.png"});
		$(".b2-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b2-active > img").attr({src:"resources/image/down_button.png"});
		$(".b3-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b3-active > img").attr({src:"resources/image/down_button.png"});
		$(".b4-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b4-active > img").attr({src:"resources/image/down_button.png"});
		$(".b5-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b5-active > img").attr({src:"resources/image/down_button.png"});
		$(".b6-active").css("borderColor", "rgb(244, 244, 244)");
		$(".b6-active > img").attr({src:"resources/image/down_button.png"});
		$(".dosu").css("display", "none");
		$(".sweet").css("display", "none");
		$(".acidity").css("display", "none");
		$(".soda").css("display", "none");
		$(".material").css("display", "none");
		$(".price").css("display", "none");
		
	}
		
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
					html += price+"&nbsp;"
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
			<form method="get" action="<%=request.getContextPath()%>/store_tlist_tag.do">
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
												<label for="dosu_low" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="dosu_low" style="box-sizing: border-box">
													<span>0%~10%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_middle" name="dosu" value="middle">
											<div class="dosu2">
												<label for="dosu_middle" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="dosu_middle" style="box-sizing: border-box">
													<span>10%~20%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_high" name="dosu" value="high">
											<div class="dosu3">
												<label for="dosu_high" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="dosu_high" style="box-sizing: border-box">
													<span>20%~30%</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="dosu_veryhigh" name="dosu" value="veryhigh">
											<div class="dosu4">
												<label for="dosu_veryhigh" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="dosu_veryhigh" style="box-sizing: border-box">
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
												<label for="sweet_low" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="sweet_low" style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="sweet_middle" name="sweet" value="middle">
											<div class="sweet2">
												<label for="sweet_middle" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="sweet_middle" style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="sweet_high" name="sweet" value="high">
											<div class="sweet3">
												<label for="sweet_high" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="sweet_high" style="box-sizing: border-box">
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
												<label for="acidity_low" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="acidity_low" style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="acidity_middle" name="acidity" value="middle">
											<div class="acidity2">
												<label for="acidity_middle" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="acidity_middle" style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="acidity_high" name="acidity" value="high">
											<div class="acidity3">
												<label for="acidity_high" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="acidity_high" style="box-sizing: border-box">
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
												<label for="soda_none" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="soda_none" style="box-sizing: border-box">
													<span>없음</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_low" name="soda" value="low">
											<div class="soda2">
												<label for="soda_low" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="soda_low" style="box-sizing: border-box">
													<span>약한</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_middle" name="soda" value="middle">
											<div class="soda3">
												<label for="soda_middle" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="soda_middle" style="box-sizing: border-box">
													<span>중간</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="soda_high" name="soda" value="high">
											<div class="soda4">
												<label for="soda_high" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="soda_high" style="box-sizing: border-box">
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
												<label for="material_fruit" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="material_fruit" style="box-sizing: border-box">
													<span>과일 · 과채</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_flower" name="material" value="flower">
											<div class="flower">
												<label for="material_flower" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="material_flower" style="box-sizing: border-box">
													<span>꽃</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_nut" name="material" value="nut">
											<div class="nut">
												<label for="material_nut" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="material_nut" style="box-sizing: border-box">
													<span>곡물 · 견과</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_herb" name="material" value="herb">
											<div class="herb">
												<label for="material_herb" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="material_herb" style="box-sizing: border-box">
													<span>약재</span>
												</label>
											</div>
										</div>
									</div>
									<div class="grid_item">
										<div class="check-box_filter">
											<input type="checkbox" id="material_other" name="material" value="other">
											<div class="other">
												<label for="material_other" style="box-sizing: border-box">
													<span>
														<img alt="checkbox" src="resources/image/checkbox.png">
													</span>
												</label>
												<label for="material_other" style="box-sizing: border-box">
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
												<input name="maxprice" class="maxprice" placeholder="100,000원">
												<button type="button" class="price_info_button">확인</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="container-button">
							<input type="submit" value="검색" class="price_info_button" style="display: block;"/>
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

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	
	// 로딩창 종료
	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>