<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

$(function(){
	
	let loading = false;
	
	let status = true;
	
	let page = ${page.page} + 1;
	
	let html = "";
	
		
	$(document).on("click", ".b1", function(){
		
		tag();
		
		if(status){
			
			$(".b1 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b1").addClass("b1-active");
			
			$(".b1-active").removeClass("b1");
			
			$(".dosu").css("display", "block");
			
		}
		
	});
	
	$(document).on("click", ".b2", function(){
		
		tag();
		
		if(status){
			
			$(".b2 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b2").addClass("b2-active");
			
			$(".b2-active").removeClass("b2");
			
			$(".sweet").css("display", "block");
		
		}
		
	});
	
	$(document).on("click", ".b3", function(){
		
		tag();
		
		if(status){
			
			$(".b3 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b3").addClass("b3-active");
			
			$(".b3-active").removeClass("b3");
			
			$(".acidity").css("display", "block");
			
		}
		
	});
	
	$(document).on("click", ".b4", function(){
		
		tag();
		
		if(status){
		
			$(".b4 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b4").addClass("b4-active");
			
			$(".b4-active").removeClass("b4");
			
			$(".soda").css("display", "block");
		
		}
		
	});
	
	$(document).on("click", ".b5", function(){
		
		tag();
		
		if(status){
		
			$(".b5 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b5").addClass("b5-active");
			
			$(".b5-active").removeClass("b5");
			
			$(".material").css("display", "block");
		
		}
		
	});
	
	$(document).on("click", ".b6", function(){
		
		tag();
		
		if(status){
		
			$(".b6 > img").attr({src:"resources/image/up_button.png"});
				
			$(this).css("borderColor", "#5197F2");
			
			$(".b6").addClass("b6-active");
			
			$(".b6-active").removeClass("b6");
			
			$(".price").css("display", "block");
		
		}
		
	});
	
	$(document).on("click", ".b1-active", function(){
		
		tag();
		
		if(status){
			
			$(".b1-active").addClass("b1");
			
			$(".b1").removeClass("b1-active");
		
		}
		
	});
	
	$(document).on("click", ".b2-active", function(){
		
		tag();
		
		if(status){
			
			$(".b2-active").addClass("b2");
			
			$(".b2").removeClass("b2-active");
		
		}
		
	});
	
	$(document).on("click", ".b3-active", function(){
		
		tag();
		
		if(status){
		
			$(".b3-active").addClass("b3");
			
			$(".b3").removeClass("b3-active");
		
		}
		
	});
	
	$(document).on("click", ".b4-active", function(){
		
		tag();
		
		if(status){
			
			$(".b4-active").addClass("b4");
			
			$(".b4").removeClass("b4-active");
		
		}
		
	});
	
	$(document).on("click", ".b5-active", function(){
		
		tag();
		
		if(status){
			
			$(".b5-active").addClass("b5");
			
			$(".b5").removeClass("b5-active");
			
		}
		
	});
	
	$(document).on("click", ".b6-active", function(){
		
		tag();
		
		if(status){
			
			$(".b6-active").addClass("b6");
			
			$(".b6").removeClass("b6-active");
			
		}
			
	});
	
	$(document).on("click", ".price_info_button", function(){
		
		tag();
		
		if(status){
		
			$(".b6-active").addClass("b6");
			
			$(".b6").removeClass("b6-active");
			
		}
			
	});
	
	$(document).on("click", ".dosu1", function(){
		
		document.getElementById("dosu_low").checked = true;
		
		$(".dosu1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu1").addClass("dosu1-active");
		
		$(".dosu1-active").removeClass("dosu1");
		
	});
	
	$(document).on("click", ".dosu2", function(){
		
		document.getElementById("dosu_middle").checked = true;
		
		$(".dosu2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu2").addClass("dosu2-active");
		
		$(".dosu2-active").removeClass("dosu2");
		
	});
	
	$(document).on("click", ".dosu3", function(){
		
		document.getElementById("dosu_high").checked = true;
	
		$(".dosu3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu3").addClass("dosu3-active");
		
		$(".dosu3-active").removeClass("dosu3");
		
	});
	
	$(document).on("click", ".dosu4", function(){
		
		document.getElementById("dosu_veryhigh").checked = true;
		
		$(".dosu4 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".dosu4").addClass("dosu4-active");
		
		$(".dosu4-active").removeClass("dosu4");
		
	});
	
	$(document).on("click", ".dosu1-active", function(){
		
		document.getElementById("dosu_low").checked = false;
		
		$(".dosu1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu1-active").addClass("dosu1");
		
		$(".dosu1").removeClass("dosu1-active");
		
	});
	
	$(document).on("click", ".dosu2-active", function(){
		
		document.getElementById("dosu_middle").checked = false;
		
		$(".dosu2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu2-active").addClass("dosu2");
		
		$(".dosu2").removeClass("dosu2-active");
		
	});
	
	$(document).on("click", ".dosu3-active", function(){
		
		document.getElementById("dosu_high").checked = false;
	
		$(".dosu3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu3-active").addClass("dosu3");
		
		$(".dosu3").removeClass("dosu3-active");
		
	});
	
	$(document).on("click", ".dosu4-active", function(){
		
		document.getElementById("dosu_veryhigh").checked = false;
		
		$(".dosu4-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".dosu4-active").addClass("dosu4");
		
		$(".dosu4").removeClass("dosu4-active");
		
	});
	
	$(document).on("click", ".sweet1", function(){
		
		document.getElementById("sweet_low").checked = true;
		
		$(".sweet1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet1").addClass("sweet1-active");
		
		$(".sweet1-active").removeClass("sweet1");
		
	});
	
	$(document).on("click", ".sweet2", function(){
		
		document.getElementById("sweet_middle").checked = true;
		
		$(".sweet2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet2").addClass("sweet2-active");
		
		$(".sweet2-active").removeClass("sweet2");
		
	});
	
	$(document).on("click", ".sweet3", function(){
		
		document.getElementById("sweet_high").checked = true;
	
		$(".sweet3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".sweet3").addClass("sweet3-active");
		
		$(".sweet3-active").removeClass("sweet3");
		
	});
	
	$(document).on("click", ".sweet1-active", function(){
		
		document.getElementById("sweet_low").checked = false;
		
		$(".sweet1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet1-active").addClass("sweet1");
		
		$(".sweet1").removeClass("sweet1-active");
		
	});
	
	$(document).on("click", ".sweet2-active", function(){
		
		document.getElementById("sweet_middle").checked = false;
		
		$(".sweet2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet2-active").addClass("sweet2");
		
		$(".sweet2").removeClass("sweet2-active");
		
	});
	
	$(document).on("click", ".sweet3-active", function(){
		
		document.getElementById("sweet_high").checked = false;
	
		$(".sweet3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".sweet3-active").addClass("sweet3");
		
		$(".sweet3").removeClass("sweet3-active");
		
	});
	
	$(document).on("click", ".acidity1", function(){
		
		document.getElementById("acidity_low").checked = true;
		
		$(".acidity1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity1").addClass("acidity1-active");
		
		$(".acidity1-active").removeClass("acidity1");
		
	});
	
	$(document).on("click", ".acidity2", function(){
		
		document.getElementById("acidity_middle").checked = true;
		
		$(".acidity2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity2").addClass("acidity2-active");
		
		$(".acidity2-active").removeClass("acidity2");
		
	});
	
	$(document).on("click", ".acidity3", function(){
		
		document.getElementById("acidity_high").checked = true;
	
		$(".acidity3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".acidity3").addClass("acidity3-active");
		
		$(".acidity3-active").removeClass("acidity3");
		
	});
	
	$(document).on("click", ".acidity1-active", function(){
		
		document.getElementById("acidity_low").checked = false;
		
		$(".acidity1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity1-active").addClass("acidity1");
		
		$(".acidity1").removeClass("acidity1-active");
		
	});
	
	$(document).on("click", ".acidity2-active", function(){
		
		document.getElementById("acidity_middle").checked = false;
		
		$(".acidity2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity2-active").addClass("acidity2");
		
		$(".acidity2").removeClass("acidity2-active");
		
	});
	
	$(document).on("click", ".acidity3-active", function(){
		
		document.getElementById("acidity_high").checked = false;
	
		$(".acidity3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".acidity3-active").addClass("acidity3");
		
		$(".acidity3").removeClass("acidity3-active");
		
	});
	
	$(document).on("click", ".soda1", function(){
		
		document.getElementById("soda_none").checked = true;
		
		$(".soda1 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda1").addClass("soda1-active");
		
		$(".soda1-active").removeClass("soda1");
		
	});
	
	$(document).on("click", ".soda2", function(){
		
		document.getElementById("soda_low").checked = true;
		
		$(".soda2 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda2").addClass("soda2-active");
		
		$(".soda2-active").removeClass("soda2");
		
	});
	
	$(document).on("click", ".soda3", function(){
		
		document.getElementById("soda_middle").checked = true;
	
		$(".soda3 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda3").addClass("soda3-active");
		
		$(".soda3-active").removeClass("soda3");
		
	});
	
	$(document).on("click", ".soda4", function(){
		
		document.getElementById("soda_high").checked = true;
		
		$(".soda4 > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".soda4").addClass("soda4-active");
		
		$(".soda4-active").removeClass("soda4");
		
	});
	
	$(document).on("click", ".soda1-active", function(){
		
		document.getElementById("soda_none").checked = false;
		
		$(".soda1-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda1-active").addClass("soda1");
		
		$(".soda1").removeClass("soda1-active");
		
	});
	
	$(document).on("click", ".soda2-active", function(){
		
		document.getElementById("soda_low").checked = false;
		
		$(".soda2-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda2-active").addClass("soda2");
		
		$(".soda2").removeClass("soda2-active");
		
	});
	
	$(document).on("click", ".soda3-active", function(){
		
		document.getElementById("soda_middle").checked = false;
	
		$(".soda3-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda3-active").addClass("soda3");
		
		$(".soda3").removeClass("soda3-active");
		
	});
	
	$(document).on("click", ".soda4-active", function(){
		
		document.getElementById("soda_high").checked = false;
		
		$(".soda4-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".soda4-active").addClass("soda4");
		
		$(".soda4").removeClass("soda4-active");
		
	});
	
	$(document).on("click", ".fruit", function(){
		
		document.getElementById("material_fruit").checked = true;
		
		$(".fruit > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".fruit").addClass("fruit-active");
		
		$(".fruit-active").removeClass("fruit");
		
	});
	
	$(document).on("click", ".flower", function(){
		
		document.getElementById("material_flower").checked = true;
		
		$(".flower > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".flower").addClass("flower-active");
		
		$(".flower-active").removeClass("flower");
		
	});
	
	$(document).on("click", ".nut", function(){
		
		document.getElementById("material_nut").checked = true;
	
		$(".nut > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".nut").addClass("nut-active");
		
		$(".nut-active").removeClass("nut");
		
	});
	
	$(document).on("click", ".herb", function(){
		
		document.getElementById("material_herb").checked = true;
		
		$(".herb > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".herb").addClass("herb-active");
		
		$(".herb-active").removeClass("herb");
		
	});
	
	$(document).on("click", ".other", function(){
		
		document.getElementById("material_other").checked = true;
		
		$(".other > label > span > img").attr({src:"resources/image/checkbox-active.png"});
		
		$(".other").addClass("other-active");
		
		$(".other-active").removeClass("other");
		
	});
	
	$(document).on("click", ".fruit-active", function(){
		
		document.getElementById("material_fruit").checked = false;
		
		$(".fruit-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".fruit-active").addClass("fruit");
		
		$(".fruit").removeClass("fruit-active");
		
	});
	
	$(document).on("click", ".flower-active", function(){
		
		document.getElementById("material_flower").checked = false;
		
		$(".flower-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".flower-active").addClass("flower");
		
		$(".flower").removeClass("flower-active");
		
	});
	
	$(document).on("click", ".nut-active", function(){
		
		document.getElementById("material_nut").checked = false;
		
		$(".nut-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".nut-active").addClass("nut");
		
		$(".nut").removeClass("nut-active");
		
	});
	
	$(document).on("click", ".herb-active", function(){
		
		document.getElementById("material_herb").checked = false;
	
		$(".herb-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".herb-active").addClass("herb");
		
		$(".herb").removeClass("herb-active");
		
	});
	
	$(document).on("click", ".other-active", function(){
		
		document.getElementById("material_other").checked = false;
		
		$(".other-active > label > span > img").attr({src:"resources/image/checkbox.png"});
		
		$(".other-active").addClass("other");
		
		$(".other").removeClass("other-active");
		
	});
	
	$(document).on("click", ".price_submit_button", function(){
		
		let minprice = $(".minprice").val();
		
		let maxprice = $(".maxprice").val();
		
		if(parseInt(minprice) > parseInt(maxprice)){
			
			swal('알림',"최소값은 최대값보다 작아야 합니다.",'warning');
			
			$(".minprice").focus();
			
			$(".minprice").val("");
			
			status = false;
			
			return;
			
		}else if(minprice && !maxprice){
			
			swal('알림',"최대값 범위 설정을 해주세요.",'warning');
			
			 $(".maxprice").focus();
			 
			 status = false;
			 
			 return;
			 
		}else if(maxprice && !minprice){
			
			swal('알림',"최소값 범위 설정을 해주세요.",'warning');
			
			$(".minprice").focus();
			
			status = false;
			
			return;
			
		}else if(maxprice > 1000000){
			
			swal('알림',"최대 입력 가능 금액은 백만원 입니다.",'warning');
			
			$(".maxprice").focus();
			
			$(".maxprice").val("");
			
			status = false;
			
			return;
			
		}else {
			
			$("#frm").submit();
			
		}
			
	});
	
	function tag(){
		
		let minprice = $(".minprice").val();
		
		let maxprice = $(".maxprice").val();
		
		if(parseInt(minprice) > parseInt(maxprice)){
			
			swal('알림',"최소값은 최대값보다 작아야 합니다.",'warning');
			
			$(".minprice").focus();
			
			$(".minprice").val("");
			
			status = false;
			
			return;
			
		}else if(minprice && !maxprice){
			
			swal('알림',"최대값 범위 설정을 해주세요.",'warning');
			
			 $(".maxprice").focus();
			 
			 status = false;
			 
			 return;
			
		}else if(maxprice && !minprice){
			
			swal('알림',"최소값 범위 설정을 해주세요.",'warning');
			
			$(".minprice").focus();
			
			status = false;
			
			return;
			
		}else if(maxprice > 1000000){
			
			swal('알림',"최대 입력 가능 금액은 백만원 입니다.",'warning');
			
			$(".maxprice").focus();
			
			$(".maxprice").val("");
			
			status = false;
			
			return;
			
		}else {
		
			$(".b1-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b1-active > img").attr({src:"resources/image/down_button.png"});
			$(".b1-active").addClass("b1");
			$(".b1").removeClass("b1-active");
			$(".b2-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b2-active > img").attr({src:"resources/image/down_button.png"});
			$(".b2-active").addClass("b2");
			$(".b2").removeClass("b2-active");
			$(".b3-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b3-active > img").attr({src:"resources/image/down_button.png"});
			$(".b3-active").addClass("b3");
			$(".b3").removeClass("b3-active");
			$(".b4-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b4-active > img").attr({src:"resources/image/down_button.png"});
			$(".b4-active").addClass("b4");
			$(".b4").removeClass("b4-active");
			$(".b5-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b5-active > img").attr({src:"resources/image/down_button.png"});
			$(".b5-active").addClass("b5");
			$(".b5").removeClass("b5-active");
			$(".b6-active").css("borderColor", "rgb(244, 244, 244)");
			$(".b6-active > img").attr({src:"resources/image/down_button.png"});
			$(".b6-active").addClass("b6");
			$(".b6").removeClass("b6-active");
			$(".dosu").css("display", "none");
			$(".sweet").css("display", "none");
			$(".acidity").css("display", "none");
			$(".soda").css("display", "none");
			$(".material").css("display", "none");
			$(".price").css("display", "none");
			
			status = true;
		
		}
		
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
 	
 	$(document).on("change", ".sort-menu", function(){
 		
 		let sort = $('.sort-menu').val();
 		
 		let category = "wine";
 		
 		page = 1;
 		
		$.ajax({
			url:"<%=request.getContextPath()%>/infinite_scroll.do",
			method:"post",
			data: {
				page : page,
				sort : sort,
				category : category
				},
			datatype: "json",
			success:function(data){
				
				$(".data_grid").empty();
				
				$.each(data, function(index, item){			// 데이터 = item
					
					html = "";
				
					let price = item.product_price.toLocaleString('ko-KR');
				
					html += "<div class='product'>"
					html += "<div class='product_wrap'>"
					html += "<a href='<%=request.getContextPath() %>/product_content_list.do?no="+item.product_no+"'>"
					if(item.product_status != '품절'){
						html += "<div class='img_wrap'><span>"
						html += "<img alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 100%; height: 39.7vh'></span></div>"
					}else if(item.product_status == '품절'){
						html += "<div class='img_wrap'><span>"
						html += "<img alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 100%; height: 39.7vh'></span>"
						html += "<div class='soldout'><div class='soldout_title'>품절</div>"
						html += "<div class='margin_box'></div><div class='soldout_cont'>술 빚는 중이에요</div></div></div>"
					}
					html += "<div class='content_wrap'>"
					html += "<div class='wrapper'>"
					html += "<div class='content_title'>"+item.product_name+"</div></div>"
					html += "<div class='wrapper'><div class='content_price'><p class='content_price_blank' /><div class='content_price_wrap'><p>"
					html += price+"&nbsp;"
					html += "<span>원</span></p></div></div>"
					html += "<div class='content_review'>"
					html += "<img alt='img' src='resources/image/star.png'>"
					html += "<p class='content_score'> "+item.product_review_star.toFixed(1)+"</p>"
					html += "<div class='content_column_line'></div>"
					html += "<p class='review'>리뷰 "+item.product_review_count+"</p></div></div>"
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
 		
 	});
	
	function getlist(){
		
		let sort = $('.sort-menu').val();
		
		let category = "wine";
		
		$.ajax({
			url:"<%=request.getContextPath()%>/infinite_scroll.do",
			method:"post",
			data: {
				page : page,
				sort : sort,
				category : category
				},
			datatype: "json",
			success:function(data){
				
				$.each(data, function(index, item){			// 데이터 = item
					
					html = "";
					
					let price = item.product_price.toLocaleString('ko-KR');
				
					html += "<div class='product'>"
					html += "<div class='product_wrap'>"
					html += "<a href='<%=request.getContextPath() %>/product_content_list.do?no="+item.product_no+"'>"
					if(item.product_status != '품절'){
						html += "<div class='img_wrap'><span>"
						html += "<img alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 100%; height: 39.7vh'></span></div>"
					}else if(item.product_status == '품절'){
						html += "<div class='img_wrap'><span>"
						html += "<img alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 100%; height: 39.7vh'></span>"
						html += "<div class='soldout'><div class='soldout_title'>품절</div>"
						html += "<div class='margin_box'></div><div class='soldout_cont'>술 빚는 중이에요</div></div></div>"
					}
					html += "<div class='content_wrap'>"
					html += "<div class='wrapper'>"
					html += "<div class='content_title'>"+item.product_name+"</div></div>"
					html += "<div class='wrapper'><div class='content_price'><p class='content_price_blank' /><div class='content_price_wrap'><p>"
					html += price+"&nbsp;"
					html += "<span>원</span></p></div></div>"
					html += "<div class='content_review'>"
					html += "<img alt='img' src='resources/image/star.png'>"
					html += "<p class='content_score'> "+item.product_review_star.toFixed(1)+"</p>"
					html += "<div class='content_column_line'></div>"
					html += "<p class='review'>리뷰 "+item.product_review_count+"</p></div></div>"
					html += "<div class='card_footer'>"
					html += "<div class='footer_content'>"
					html += "<div>#"+item.product_introduce1+"</div>"
					html += "<div>#"+item.product_introduce2+"</div></div></div></a></div></div>"
					
					$(".data_grid").append(html);
				});
				
				page += 1;
				
				loading = false;
				
			},
			
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});

	}
});
</script>