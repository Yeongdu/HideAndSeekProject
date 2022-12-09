<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/mypage/mypage_main.css" rel="stylesheet" type="text/css">

	<jsp:include page="../banner/user_top.jsp" />
 
<main style = "min-height : 100%;;">
<div id = "mypage"> <!-- main 영역 -->
	
	<c:set  var = "user_dto" value = "${user_cont }"/>
	<c:set var = "order_all" value = "${count }" />
	<c:set var = "order_count" value = "${order }" />
	<c:set var = "refund_count" value = "${refund }" />
	<c:set var = "delivery_count" value = "${delivery }" />
	<c:set var = "delivery_complete_count" value = "${delivery_complete }" />
	
	
	<div id = "mypage_wrap" align = "center"> <!-- 컨텐츠 전체 영역 -->
		<div id = "mypage_category"> <!-- 카테고리 영역 / 이름, 포인트, 카테고리 등 -->
			<div id = "mypage_user">
				<div class = "mypage_name">${userId }<span>님</span></div>
				<div class = "mypage_point">
					<span>잔여 포인트</span> 
					<fmt:formatNumber>
						${user_dto.getUser_point() }
					</fmt:formatNumber>
					<span>점</span>
				</div>
			</div>
			
			<div id = "mypage_select">
			
				<div id = "mypage_sub">
					<span>구독관리</span>
					<img src = "resources/image/sub.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_order">
					<span>주문내역</span>
					<img src = "resources/image/order.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_refund">
					<span>취소/환불내역</span>
					<img src = "resources/image/refund.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_review">
					<span>리뷰</span>
					<img src = "resources/image/review.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_delivery">
					<span>배송지관리</span>
					<img src = "resources/image/delivery.png" class = "mypage_icon">
				</div>
				
			</div>
		</div>
		<div id = "mypage_content"> <!-- 컨텐츠 영역 (변경되는 부분) -->
			<%-- <div class = "user_main_wrap">
				<div class = "mypage_user_title">${user_dto.getUser_name() }<span>님의 개인 정보</span></div>
				<div class = "mypage_user_id"><span>아이디 : </span>${user_dto.getUser_id() }</div>
				<div class = "mypage_user_pw"><span>비밀번호 : </span>${user_dto.getUser_id() }</div>
				<div class = "mypage_user_email"><span>이메일 : </span>${user_dto.getUser_id() }</div>
				<div class = "mypage_user_name"><span>이름 : </span>${user_dto.getUser_id() }</div>
				<div class = "mypage_user_phone">
					<span>전화번호 : </span>
					${user_dto.getUser_phone1() }
					<span> - </span>
					${user_dto.getUser_phone2() }
					<span> - </span>
					${user_dto.getUser_phone3() }
				</div>
				
				<div class = "mypage_user_zipcode"><span>우편번호 : </span>${user_dto.getUser_zipcode() }</div>
				<div class = "mypage_user_addr">
					<span>상세주소 : </span>
					${user_dto.getUser_addr1() }&nbsp;
					${user_dto.getUser_addr2() }</div>
			</div> --%>
		</div>
	</div>
</div>
</main>
    
    
<script>

let page = 1;

function displayoff(){
	$(".sub_main_wrap").slideUp(500);
	$(".order_main_wrap").slideUp(500);
	$(".refund_main_wrap").slideUp(500);
	$(".review_main_wrap").slideUp(500);
	$(".delivery_main_wrap").slideUp(500);
	$(".user_main_wrap").slideUp(500);
	
	$("#mypage_sub-active").attr("id","mypage_sub");
	$("#mypage_order-active").attr("id","mypage_order");
	$("#mypage_refund-active").attr("id","mypage_refund");
	$("#mypage_review-active").attr("id","mypage_review");
	$("#mypage_delivery-active").attr("id","mypage_delivery");
	$("#mypage_user-active").attr("id","mypage_user");
	
	$("#mypage_content").empty();
	
	loading = false;
}


var loading = false; 
var su = false;

// 구독관리 ==============================================================================================================
	
$(document).on("click", "#mypage_sub", function(){
	displayoff();
	$("#mypage_sub").attr("id","mypage_sub-active");
	$('.sub_main_wrap').slideDown(1000);
	
	if(!loading){
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajax({
		    type : 'get',           // 타입 (get, post, put 등등)
		    url : "<%=request.getContextPath() %>/mypage_sub.do",          // 요청할 서버url
		    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		    data : {userId : id},
		    success : function(result) { // 결과 성공 콜백함수
		    
		    	var res = '';
		    
		    	if(result == 0){
		    		res = "<div class = sub_main_wrap>" + 
		    				"<div id = 'none_sub'>" + 
		    				"<h3 = 'none_sub_title'>아직 구독을 준비중이에요" + "</h3>" +
		    				"<input type = 'button' value = '구독하기' class = 'sub_btn'>" +
		    				"</div>" + "</div>";
		    	}else {
		    		$.each(result, function(index, item){
				    	
			    		res = "<div class = sub_main_wrap>" + 
			    			"<div id = 'mypage_sub_wrap'>" + "<img src = 'resources/image/loading_new.gif' class = 'mypage_loading'>" +
					    			/* "<div class = 'mypage_sub_pacakge_image'> " + "<img src = 'resources/image/" + item.sub_image + "' class = 'sub_image'>" + "</div>" + */
					    			"<div class = 'mypage_sub_info'>" +
						    			"<div class = 'mypage_sub_packagename'> <span class = 'sub_packagename'>현재 구독중인 패키지</span>" +"「"+ item.sub_package + "」</div>" + "<hr>" +
									"<div class ='sub_package' align = 'center'> <span class = 'package_name'>받아보신 패키지 술</span>" + "<hr>"+
									"<div class = 'sub_drinks'>";
			    		
									$.each(result, function(index, sub_item){
		    							res += "<div class = 'sub_drink'>" + 
										"<img src = 'resources/upload/" + sub_item.product_thumbnail + "' class = 'drink1'>" +
										"<span class = 'drink_name'>" + sub_item.product_name + "</span>" +
										"<span class = 'drick_dosu'>도수 : " + sub_item.product_alcohol + "%</span>" +
									"</div>" ;
	    						});
						res +=
								"</div>" +
								"</div>" +
								"<div class = 'mypage_sub_date'>" + item.sub_end + "<span>이후 새로운 패키지가 발송됩니다. </span> " +"</div>" +
					    		"</div>" +
					    		"</div>";
			    		});
		    	}
		    	
		    	res += "</div>";
		    	$('#mypage_content').append(res);
		    	
		    	// 구독으로 하기로 이동
		    	$(document).on("click",".sub_btn", function() {
		    		location.href = "<%=request.getContextPath() %>/sub.do";					
		    	});
		    	
		    },error : function(request, status, error) { // 결과 에러 콜백함수
		    	
		    }
		    
		}); // ajax 끝
		loading = true;
	}
	
}); // 구독관리 열기 - onclick 끝

$(document).on("click", "#mypage_sub-active", function(){
	$("#mypage_sub-active").attr("id","mypage_sub");
	$(".sub_main_wrap").slideUp(500);
	$("#mypage_content").empty();
	loading = false;
}); // 구독관리 닫기 - onclick 끝

// 주문내역 ==============================================================================================================
$(document).on("click", "#mypage_order", function(){
	
	// ajax창 전체 종료(초기화)
	displayoff();
	
	// 주문 건수 div 추가
	$("#mypage_content").append($("<div class = 'order_category_all'></div>"));
	$(".order_category_all").append($("<div class = 'order_category'></div>"));
	$(".order_category").append($("<div class = 'order_title'> 전체 주문 </div>"));
	$(".order_category").append($("<div class = 'order_count'><span>" + ${count} + "</span>건</div>"));
	
	$(".order_category_all").append($("<div class = 'order_orderall'></div>"));
	$(".order_orderall").append($("<div class = 'order_title'> 주문 완료 </div>"));
	$(".order_orderall").append($("<div class = 'order_count'><span>" + ${order} + "</span>건</div>"));
	
	$(".order_category_all").append($("<div class = 'order_refund_all'></div>"));
	$(".order_refund_all").append($("<div class = 'order_title'> 취 소 </div>"));
	$(".order_refund_all").append($("<div class = 'order_count'><span>" + ${refund } + "</span>건</div>"));
	
	$(".order_category_all").append($("<div class = 'order_delivery_all'></div>"));
	$(".order_delivery_all").append($("<div class = 'order_title'> 배송중 </div>"));
	$(".order_delivery_all").append($("<div class = 'order_count'><span>" + ${delivery} + "</span>건</div>"));
	
	$(".order_category_all").append($("<div class = 'order_delivery_complete_all'></div>"));
	$(".order_delivery_complete_all").append($("<div class = 'order_title'> 배송 완료 </div>"));
	$(".order_delivery_complete_all").append($("<div class = 'order_count'><span>" + ${delivery_complete} + "</span>건</div>"));
	
	page = 1;
	
	$("#mypage_order").attr("id","mypage_order-active");
	$('.order_main_wrap').slideDown(1000)
	
	
	
	if(!loading){
		console.log(loading);
		getorder();
	}
	loading = true;
	
}); // 주문내역 열기 onclick 끝

$(document).on("click", "#mypage_order-active", function(){
	$("#mypage_order-active").attr("id","mypage_order");
	$(".order_main_wrap").slideUp(500);
	$("#mypage_content").empty();
	loading = false;
	
}); // 주문내역 닫기 - onclick 끝

// 무한스크롤
$(document).on("scroll", function(){
	
		if($(window).scrollTop()+200>=$(document).height() - $(window).height())
	    {	console.log("스크롤 끝");
	    	console.log("loading :" + loading );
	    	
	        if(!loading)    //실행 가능 상태라면?
	        {	if(!su){
	        	loading = true; //실행 불가능 상태로 변경
	            getorder();
	            $("#none_order").css("display","none");
	            console.log("실행");
	        }
	            
	        }
	    }
});

function getorder(){
	var id = '<%=(String)session.getAttribute("userId")%>';
	
	$.ajax({
	    type : 'get',           // 타입 (get, post, put 등등)
	    url : "<%=request.getContextPath() %>/mypage_order.do",          // 요청할 서버url
	    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
	    data : {userId : id,
	    		page : page},
	    success : function(result) { // 결과 성공 콜백함수
	    	
	    	var res = '';
	    
	    	if(result == 0){
	    		if(su) {
	    			res = "<div class = 'order_main_wrap'>" +
    				"<div id = 'none_order'>" + 
    				"<h3 = 'none_order_title'>주문한 술이 없어요" + "</h3>" +
    				"<input type = 'button' value = '구매하러 가기 >' class = 'order_btn'>" +
    				"</div>";
    				su = true;
	    		}
	    	}else {
	    			
	    		$.each(result, function(index, item){
			    	
		    		res += "<div id = 'order_wrap'>";
	    			res += 		"<div id = 'order_image'>";
	    			res += 			"<img src = 'resources/upload/" + item.product_thumbnail + "' class = 'order_thumbnail'>";
	    			res += 		"</div>"
	    			
	    			res += 		"<div id = 'order_info'>"
	    			res += 			"<div id = 'order_info_date'><span>" + item.order_date + "</span><div id = 'order_info_status'>" + item.order_status + "</div>" + "</div>"
	    			res += 			"<div id = 'order_info_title'>" + item.product_name + "</div>"
	    			res += 			"<div id = 'order_info_alchol'>도수 : " + item.product_alcohol + "%</div>"
	    			res += 			"<div id = 'order_info_amount'>수량 : " + item.order_amount + "개</div>"
	    			res += 			"<div id = 'order_info_price'>" + item.product_price + "원</div>"
					res += 		"</div>"
					res += "</div>"
		    		 
	    	});
	    
	    	// 구독페이지로 이동
	    	$(document).on("click",".order_btn", function() {
	    		location.href = "<%=request.getContextPath() %>/store.do";					
	    	});
	    	
	    	}
	    	
	    	page += 1;
	    	
	    	console.log("page :" + page);
	    	
	    	loading = false;
	    	
	    	$('#mypage_content').append(res);
	    	
	    },error : function(request, status, error) { // 결과 에러 콜백함수
	    	/* alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); */
	    }
	    
	}); // ajax 끝
} // 주문내역 ajax 메서드 끝







	
</script>
<jsp:include page="../banner/bottom.jsp" />
