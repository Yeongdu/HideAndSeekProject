<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script>

let page = 1;

function displayoff(){
	$(".sub_main_wrap").slideUp(500);
	$(".order_main_wrap").slideUp(500);
	$(".refund_main_wrap").slideUp(500);
	$(".review_main_wrap").slideUp(500);
	$(".delivery_main_wrap").slideUp(500);
	$(".user_main_wrap").slideUp(500);
	$(".user_modify_wrap").slideUp(500);
	
	$("#mypage_sub-active").attr("id","mypage_sub");
	$("#mypage_order-active").attr("id","mypage_order");
	$("#mypage_refund-active").attr("id","mypage_refund");
	$("#mypage_review-active").attr("id","mypage_review");
	$("#mypage_delivery-active").attr("id","mypage_delivery");
	$("#mypage_user-active").attr("id","mypage_user");
	$("#mypage_user_modify-active").attr("id","mypage_user_modify");
	
	$("#mypage_content").empty();
	
	loading = false;
}

$(document).ready(function(){
	
	$("#mypage_content").append($("<div class = 'user_title'></div>"));
	$(".user_title").append($("<h3>회원 정보</h3>"));

	$("#mypage_user").attr("id","mypage_user-active");
	$('.user_main_wrap').slideDown(1000);
	
	if(!loading){
		getUser();
		loading = true;
	} // if(loading)의 end
	
});


var loading = false; 
var su = false;
var su2 = false;
var su3 = false;

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
								"<div class = 'mypage_sub_delete' onclick = 'sub_delete("+item.sub_enddate+")'>" +
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

function sub_delete(date){
	console.log("date >>> " + date);
}

$(document).on("click", "#mypage_sub-active", function(){
	$("#mypage_sub-active").attr("id","mypage_sub");
	$(".sub_main_wrap").slideUp(500);
	$("#mypage_content").empty();
}); // 구독관리 닫기 - onclick 끝

// 주문내역 ==============================================================================================================
$(document).on("click", "#mypage_order", function(){
	
	su2 = false;
	
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
		getorder();
	}
	loading = true;
	
}); // 주문내역 열기 onclick 끝

$(document).on("click", "#mypage_order-active", function(){
	$("#mypage_order-active").attr("id","mypage_order");
	$(".order_main_wrap").slideUp(500);
	$("#mypage_content").empty();
	$(".user_main_wrap").slideDown(500);
	loading = false;
	
}); // 주문내역 닫기 - onclick 끝

// 무한스크롤
$(document).on("scroll", function(){
	
		if($(window).scrollTop()+200>=$(document).height() - $(window).height())
	    {	
	    	
	        if(!loading)    //실행 가능 상태라면?
	        {	if(!su){
	        	if(!su2){
	        		loading = true; //실행 불가능 상태로 변경
		            getorder();
		            $("#none_order").css("display","none");	
	        	}
	        	
	        }
	            
	        }
	    }
});

var count = 0;

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
	    			
	    			var price = item.product_price * item.order_amount;
	    			var totalprice = price.toLocaleString('ko-KR');
			    	
		    		res += "<div id = 'order_wrap'>";
	    			res += 		"<div id = 'order_image'>";
	    			res += 			"<img src = 'resources/upload/" + item.product_thumbnail + "' class = 'order_thumbnail'>";
	    			res += 		"</div>"
	    			
	    			res += 		"<div id = 'order_info'>"
	    			res += 			"<div id = 'order_info_date'><span>" + item.order_date + "</span>" + "</div>"
	    			res += 			"<div id = 'order_info_title'>" + item.product_name + "</div>"
	    			res += 			"<div id = 'order_info_alchol'>도수 : " + item.product_alcohol + "%</div>"
	    			res += 			"<div id = 'order_info_amount'>수량 : " + item.order_amount + "개</div>"
	    			res += 			"<div id = 'order_info_price'>" + totalprice + "원</div>"
	    			res +=			"<input type = 'hidden' value = '" + item.product_no + "' class = 'product_review_no' name = 'product_review_no'>"
					res += 		"</div>"
					res +=		"<div class = 'order_review_insert'>"
							if(item.order_status == "취소"){
	    			res +=						"<div style = 'color:red;' class = 'order_info_status order_info_status"+count+"'>" + item.order_status + "</div>"							
	    									}else if(item.order_status == "배송중"){
	    			res +=						"<div style = 'color:#0097F3;' class = 'order_info_status order_info_status"+count+"'>" + item.order_status + "</div>"	    										
	    									}else if(item.order_status == "배송 완료"){
	    			res +=						"<div style = 'color:#FAAF00;' class = 'order_info_status order_info_status"+count+"'>" + item.order_status + "</div>"
	    									}else{
	    			res +=						"<div style = 'color:black;' class = 'order_info_status order_info_status"+count+"'>" + item.order_status + "</div>"
	    						}
	    			
								if(item.order_status == "배송 완료"){
					res +=			"<input type = 'button' class = 'review_goBtn' value = '리뷰하러가기' onclick = 'review_submit("+item.product_no+")'>"				
								}
					res +=		"</div>"
					
					res += "</div>"
					
	    			count += 1;
					
	    	});
	    
	    	// 구독페이지로 이동
	    	$(document).on("click",".order_btn", function() {
	    		location.href = "<%=request.getContextPath() %>/sub.do";					
	    	});
	    	
	    	}
	    	
	    	page += 1;
	    	
	    	
	    	loading = false;
	    	
	    	$('#mypage_content').append(res);
	    	
	    },error : function(request, status, error) { // 결과 에러 콜백함수
	    	/* alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); */
	    }
	    
	}); // ajax 끝
} // 주문내역 ajax 메서드 끝

$(document).on("click", ".review_goBtn", function(){
	$("#modal").fadeIn(300);
});

$(document).on("click", ".modalClose", function(){
	$("#modal").fadeOut(300);
	$(".review_cont").val('');
});


function review_submit(no){
	$(".review_content").append($("<input type = 'hidden' value = '" +no+"' name = 'product_insert_no' class = 'product_insert_no'>"));
}


//기본 위치(top)값
var floatPosition = parseInt($("#modal").css('top'))
// scroll 인식
$(window).scroll(function() {
  
    // 현재 스크롤 위치
    var currentTop = $(window).scrollTop();
    var modalTop = currentTop + floatPosition + "px";
    //이동 애니메이션
    $("#modal").stop().animate({
      "top" : modalTop
    }, 300);
}).scroll();


// 회원 정보 =================================================================================================================
$(document).on("click", "#mypage_user", function(){
	
	// ajax창 전체 종료(초기화)
	displayoff();
	
	$("#mypage_content").append($("<div class = 'user_title'></div>"));
	$(".user_title").append($("<h3>회원 정보</h3>"));

	$("#mypage_user").attr("id","mypage_user-active");
	$('.user_main_wrap').slideDown(1000);
	
	if(!loading){
		getUser();
		loading = true;
	} // if(loading)의 end
	
	}); // 회원정보 열기 - onclick 끝
	
	function getUser(){
		
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajax({
		    type : 'get',           // 타입 (get, post, put 등등)
		    url : "<%=request.getContextPath() %>/mypage_user.do",          // 요청할 서버url
		    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		    data : {userId : id},
		    success : function(result) { // 결과 성공 콜백함수
		    	
		    	var res = '';
		    
				   var pwd_count = result.user_pwd.length;
				   var count = ""; 
				   for(var i=1; i<=pwd_count; i++){  
					   count += "*";
					}
			    	 
			    		res = "<div class = user_main_wrap>" +
			    				"<div class ='user_info_top'>" +
				    				"<div class = 'user_name_title'><span>" + result.user_name + "</span>님</div>" +
				    				"<hr>" +
			    				"</div>" +
			    				"<div class = 'user_info_middle'>" +
				    				"<div class = 'user_info_middle_left'>" +
				    					"<div class = 'user_id_title'>아이디" + "</div>" +
				    					"<div class = 'user_name_title'>닉네임" + "</div>" + 
				    					"<div class = 'user_pwd_title'>비밀번호" + "</div>" + 
				    					"<div class = 'user_email_title'>이메일" + "</div>" + 
				    					"<div class = 'user_phone_title'>전화번호" + "</div>" + 
				    				"</div>" +
				    				"<div class = 'user_info_middle_right'>" +
					    				"<div class = 'user_id'>" +result.user_id + "</div>" + 
					    				"<div class = 'user_name'>" + result.user_name + "</div>" +
					    				"<div class = 'user_pwd'>" + count + "</div>" +
					    				"<div class = 'user_email'>" + result.user_email + "</div>" +
					    				"<div class = 'user_phone'>" + result.user_phone1 + " - " + result.user_phone2 + " - " + result.user_phone3 + "</div>" +
				    				"</div>" +
				    			"</div>" +
			    				"<div class = 'user_info_bottom1'>" +
			    					"<div class = 'user_modify_btn'>수정</div>" +
			    					"<hr>" + 
			    					"<div class = 'user_delete_btn'>회원 탈퇴</div>" +
			    				"</div>" +
			    			"</div>";

		    	$('#mypage_content').append(res);
		    	
		    	//  수정하기로 이동
		    	$(document).on("click",".user_modify_btn", function() {
		    		
		    		$("#mypage_content").empty();
		    		
		    		res =
		    			"<div class = user_main_wrap>" +
    				"<div class ='user_info_top'>" +
	    				"<div class = 'user_name_title'>개인 정보 수정</div>" +
	    				"<hr style = 'color:yellow;'>" +
    				"</div>" +
    				"<div class = 'user_info_middle'>" +
	    				"<div class = 'user_info_middle_left'>" +
							"<div class = 'user_id_title'>아이디" + "</div>" +
							"<div class = 'user_name_title'>닉네임" + "</div>" + 
							"<div class = 'user_pwd_title'>비밀번호" + "</div>" + 
							"<div class = 'user_pwd_new_title'>수정할 비밀번호" + "</div>" + 
							"<div class = 'user_email_title'>이메일" + "</div>" + 
							"<div class = 'user_phone_title'>전화번호" + "</div>" + 
						"</div>" +
						"<div class = 'user_info_middle_right'>" +
						"<input type ='hidden' value = '" + result.user_pwd + "' class = 'user_dto_pwd'>" +
	    					"<div class = 'user_id'>" + result.user_id + "</div>" + 
	    					"<div class = 'user_name'><input class = 'user_name_input' value = '" +result.user_name + "'></div>" +
	    					"<div class = 'user_pwd'><input type = 'password' class = 'user_pwd_old' placeholder ='기존 비밀번호'></div>" +
	    					"<div class = 'user_pwd_modify'><input type = 'password' class = 'user_pwd_new' placeholder ='새로운 비밀번호' required>" + 
	    					"</div>" +
	    					"<div class = 'user_email'>" + result.user_email + "</div>" +
	    					"<div class = 'user_phone'>" + 
	    					"<input class = 'user_phone1' value = '"+ result.user_phone1 + "'>" + " -" +  
	    					"<input class = 'user_phone2' value = '"+ result.user_phone2 + "'>" + " -" + 
	    					"<input class = 'user_phone3' value = '"+ result.user_phone3 + "'>" + "</div>" +
	    				"</div>" +
    				"</div>" +
    				"<div class = 'user_info_bottom'>" +
    					"<div class = 'user_modifyok_btn'>수정</div>" +
    					"<div class = 'user_modifyCancle_btn'>취소</div>" +
    				"</div>" +
    			"</div>";

				$('#mypage_content').append(res);
				
		    	}); // 수정창 이동 onclick 끝;
		    	
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	
		    }
		    
		}); // ajax 끝
		
	}// getUser 메서드의 끝
	
		$(document).on("click",".user_modifyok_btn", function(){
			
			var id = '<%=(String)session.getAttribute("userId")%>';
			
			var user_name_input = $(".user_name_input").val();
			var user_pwd_new = $(".user_pwd_new").val();
			var user_pwd_old = $(".user_pwd_old").val();
			var user_email = $(".user_email").val();
			var user_phone1 = $(".user_phone1").val();
			var user_phone2 = $(".user_phone2").val();
			var user_phone3 = $(".user_phone3").val();
			var user_dto_pwd = $(".user_dto_pwd").val();
			
			console.log("user_email >> " + user_email);
			
			$.ajax({
			    type : 'get',           // 타입 (get, post, put 등등)
			    url : "<%=request.getContextPath() %>/mypage_user_modifyOk.do",          // 요청할 서버url
			    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
			    data : {userId : id,
			    		user_name : user_name_input,
			    		user_pwd_new : user_pwd_new,
			    		user_pwd_old : user_pwd_old,
			    		user_email : user_email,
			    		user_phone1 : user_phone1,
			    		user_phone2 : user_phone2,
			    		user_phone3 : user_phone3,
			    		user_dto_pwd : user_dto_pwd
			    		},
			    success : function(check) {
			    	
			    	if(check>0){
			    		
			    		console.log("check >>> " + check);
			    		
			    			$("#mypage_content").empty();
			    			
			    			getUser();
	    			    	swal('개인정보 수정',"정보가 수정되었습니다.",'success');
	    			    	
			    	}else if(check == -1){
			    		swal('비밀번호 오류',"올바른 비밀번호를 입력해주세요.",'warning');
			    	}else {
			    		swal('개인정보 수정 오류',"정보가 수정되지 않았습니다.",'error');
			    	}
			    
			    },
			    error : function(request, status, error){
			    }
			
		}); // 수정하기 ajax 끝;
			
    }); // 수정하기 onclick 끝;
		    	
$(document).on("click", "#mypage_user-active", function(){
	$("#mypage_user-active").attr("id","mypage_user");
	$(".user_main_wrap").slideUp(500);
	$("#mypage_content").empty();
	loading = false;
}); // 회원정보 닫기 - onclick 끝

$(document).on("click", ".user_modifyCancle_btn", function(){
	$("#mypage_content").empty();
	$("#mypage_content").append($("<div class = 'user_title'></div>"));
	$(".user_title").append($("<h3>회원 정보</h3>"));
	getUser();
});

$(document).on("click", ".user_delete_btn", function(){
	$("#user_modal").fadeIn(300);
});

$(document).on("click", ".user_modalClose", function(){
	$("#user_modal").fadeOut(300);
});


//기본 위치(top)값
var floatPosition = parseInt($("#user_modal").css('top'))
// scroll 인식
$(window).scroll(function() {
  
    // 현재 스크롤 위치
    var currentTop = $(window).scrollTop();
    var modalTop = currentTop + floatPosition + "px";
    //이동 애니메이션
    $("#user_modal").stop().animate({
      "top" : modalTop
    }, 300);
}).scroll();

//비밀번호입력시 - 정규식확인 pw
$(document).on("blur", ".user_pwd_new",function(){
	  var pwd = $('.user_pwd_new').val().trim();
	  
	  	  var num = pwd.search(/[0-9]/g);
		  var eng = pwd.search(/[a-zA-Z]/ig);
		  var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pwd.length < 8 || pwd.length > 20){
		let warningTxt = "<font class = 'checkpwd' color='red' size='1.5em'>8자리 ~ 20자리 이내로 입력해주세요.</font>";
		$(".checkpwd").text('');		// span 태그 영역 초기화
		$(".user_pwd_modify").prepend(warningTxt);
		$(".user_pwd_new").val(null);
		swal('비밀번호 오류',"8자리 ~ 20자리 이내로 입력해주세요.",'warning');
		
	 }else if(num < 0 || eng < 0 || spe < 0 ){
		 
	  	let warningTxt = "<font class = 'checkpwd' color='red' size='1.5em'>영문, 숫자, 특수문자를 혼합하여 입력해주세요.</font>";
		$(".checkpwd").text('');		// span 태그 영역 초기화
		$(".user_pwd_modify").prepend(warningTxt);
		$(".user_pwd_new").val(null);
		swal('비밀번호 오류',"영문, 숫자, 특수문자를 혼합하여 입력해주세요.",'warning');
		
	 }else {
		 
		let warningTxt = "<font class = 'checkpwd' color='green' size='1.5em'>사용 가능한 비밀번호 입니다.</font>";
		$(".checkpwd").text('');		// span 태그 영역 초기화
		$(".user_pwd_modify").prepend(warningTxt);
		swal('비밀번호 수정',"사용 가능한 비밀번호 입니다.",'success');
		
	 }
	});  //비밀번호입력시 - 정규식확인 pw end
	
	

// 리뷰관리 ==============================================================================================================
	
	$(document).on("click", "#mypage_review", function(){
		
		// ajax창 전체 종료(초기화)
		displayoff();
		
		page = 1;
		
		$("#mypage_review").attr("id","mypage_review-active");
		$('.review_main_wrap').slideDown(1000)
		
		if(!loading){
			getreview();
		}
		loading = true;
		
	}); // 리뷰관리 열기 onclick 끝

	$(document).on("click", "#mypage_review-active", function(){
		$("#mypage_review-active").attr("id","mypage_review");
		$(".review_main_wrap").slideUp(500);
		$("#mypage_content").empty();
		loading = false;
		
	}); // 리뷰관리 닫기 - onclick 끝

	// 무한스크롤
	$(document).on("scroll", function(){
		
			if($(window).scrollTop()+200>=$(document).height() - $(window).height())
		    {	
		    	
		        if(!loading)    //실행 가능 상태라면?
		        {	if(!su){
			        	if(su2){
			        		loading = true; //실행 불가능 상태로 변경
				            getreview();
			        		if(su3){
					            $("#none_review").css("display","none");	
			        		}
			        			
		        		}
		        	
		       		}
		            
		        }
		    }
	});

	function getreview(){
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajax({
		    type : 'get',           // 타입 (get, post, put 등등)
		    url : "<%=request.getContextPath() %>/mypage_review.do",          // 요청할 서버url
		    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		    data : {userId : id,
		    		page : page},
		    success : function(result) { // 결과 성공 콜백함수
		    	
		    	var res = '';
		    
		    	if(result == 0){
		    		if(su2) {
		    			if(su3){
		    				res = "<div class = 'review_main_wrap'>" +
		    				"<div id = 'none_review'>" + 
		    					"<h3 = 'none_review_title'>작성한 리뷰가 없어요" + "</h3>" +
		    				"</div>";
		    				su2 = true;
		    			}
		    			
	    				su = true;
		    		}
		    	}else {
		    		
		    		$.each(result, function(index, item){
		    			var int_no = item.review_no;
		    			var star_num = item.review_star / 20;
			    		res += "<div class = 'review_wrap'>";
		    			res += 		"<div class = 'review_info'>"
		    			res += 		"<div class = 'review_info_top'>"
		    			res += 			"<div class = 'review_info_top_left'>"
		    			res += 				"<div class = 'review_info_product_name'>" + item.product_name + "</div>"
		    			res += 				"<div class = 'review_info_product_amount'>&nbsp;[<span>" + item.product_amount + "</span>ml]</div>"
		    			res += 		"</div>"
		    			res +=			"<div class = 'review_info_top_right'>"
		    			res += 			"<div class = 'review_info_star-rating'>"
		    			res += 				"<div class='star-ratings-fill space-x-2 text-lg' style='width: " + item.review_star + "%'>"
		    			res += 					"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
		    			res += 				"</div>"
		    			res += 				"<div class='star-ratings-base space-x-2 text-lg'>"
		    			res += 					"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
		    			res += 				"</div>"
		    			res += 			"</div>"
		    			res += 			"<div class = 'review_info_date'><span>" + item.review_date + "</span></div>"
		    			res += 			"</div>"
		    			res += 		"</div>"
		    			res += 		"<div class = 'review_info_bottom'>"
		    			res += 			"<div class = 'review_info_cont'><pre>"+ item.review_cont + "</pre></div>"
		    							if(item.review_file == null) {
		    								res += '';
		    							}else {
		    								res += 			"<img src = 'resources/review_img/" + item.review_file + "' class = 'review_image"+int_no+"' onmouseover = 'zoomImg("+int_no+")' style = 'height:100px;'>"
		    							}
						res += 		"</div>"
						res += 		"</div>"
						res += "</div>"
			    		 
		    	});
		    
		    	// 구독페이지로 이동
		    	$(document).on("click",".review_btn", function() {
		    		location.href = "<%=request.getContextPath() %>/review_write.do";					
		    	});
		    	
		    	}
		    	
		    	page += 1;
		    	
		    	
		    	loading = false;
		    	su2 = true;
		    	
		    	$('#mypage_content').append(res);
		    	
		    },error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		    }
		    
		}); // ajax 끝
	} // 리뷰관리 ajax 메서드 끝
	
	function zoomImg(no){
		$(document).on("click",".review_image"+no, function(){
			$(".review_image"+no).css("width", "auto");
			$(".review_image"+no).css("height", "80%");
			$(".review_image"+no).attr("class", "review_image_zoom"+no);
		});
		
		$(document).on("mouseover", ".review_image"+no, function(){
			$(".review_image"+no).css("cursor", "zoom-in");
		});
		
		$(document).on("click",".review_image_zoom"+no, function(){
			$(".review_image_zoom"+no).css("width", "auto");
			$(".review_image_zoom"+no).css("height", "100px");
			$(".review_image_zoom"+no).attr("class", "review_image"+no);
		});
		
		$(document).on("mouseover", ".review_image_zoom"+no, function(){
			$(".review_image_zoom"+no).css("cursor", "zoom-out");
		});
	}
// 배송지 관리 ==============================================================================================================
	
	$(document).on("click", "#mypage_delivery", function(){
		displayoff();
		$("#mypage_delivery").attr("id","mypage_delivery-active");
		$('.delivery_main_wrap').slideDown(1000);
		
		if(!loading){
			var id = '<%=(String)session.getAttribute("userId")%>';
			
			$.ajax({
			    type : 'get',           // 타입 (get, post, put 등등)
			    url : "<%=request.getContextPath() %>/mypage_delivery.do",          // 요청할 서버url
			    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
			    data : {userId : id},
			    success : function(result) { // 결과 성공 콜백함수
			    
			    	var res = '';
			    
			    	if(result == 0){
			    		res = "<div class = delivery_main_wrap>" + 
			    				"<div id = 'none_delivery'>" + 
			    					"<h3 = 'none_delivery_title'>등록된 배송지가 없어요" + "</h3>" +
			    					"<input type = 'button' value = '등록하기' class = 'delivery_btn'>" +
			    				"</div>" + 
			    			  "</div>";
			    	}else {
			    		$.each(result, function(index, item){
			    			
			    			var de = item.deli_default;
			    			
				    		res += "<div class = 'delivery_main_wrap'>"
				    		res += 		"<div class = 'delivery_title"+item.deli_no+"'" + "onmouseover = 'arcodian("+item.deli_no+")'>"
				    				if(de == 1){
							res +=			"<input type = 'button' value = '기본 배송지' class = 'delivery_default_badge' disabled>"
							    		}
				    		res += 			"<div class = 'delivery_name'>" + item.deli_name + "</div>"
				    		res += 		"</div>" // delivery_title의 end
				    		
				    		if(de == 1) {
				    			res += 		"<div class = 'delivery_arco" + item.deli_no +"'>"	
				    		}else {
				    			res += 		"<div class = 'delivery_arco" + item.deli_no +"'" + "style = 'display:none;'>"
				    		}
				    		
				    		res += 		"<div class = 'delivery_phone'>"
				    		res += 			item.deli_phone1 + "-" + item.deli_phone2 + "-" + item.deli_phone3
				    		res += 		"</div>" // delivery_phone의 end
			    			res += 		"<div class = 'delivery_info'>"
			    			res += 			"<div class = 'delivery_info_addr1'>" + item.deli_addr1 + "</div>&nbsp;"
			    			res += 			" <div class = 'delivery_info_addr2'>" + item.deli_addr2 + "</div>"
							res += 		"</div>" // delivery_info의 end
							res += 		"<div class = 'delivery_modify'>"
							res +=			"<a class = 'deli_modi_btn"+item.deli_no+"' onmouseover = 'delivery_modify_submit("+item.deli_no+")'>수정</a>"
							res +=		"</div>"
			    			res += "</div>" // delivery_arco의 end
			    			res += "</div>" // delivery_main_wrap의 end
			    	});
			    		res += "<input type = 'button' value = '등록하기' class = 'delivery_btn'>";
			    			
			    	}
			    	
			    	$('#mypage_content').append(res);
			    	
			    },error : function(request, status, error) { // 결과 에러 콜백함수
			    	
			    }
			    
			}); // ajax 끝
			loading = true;
		}
		
	}); // 배송지 관리 열기 - onclick 끝

	$(document).on("click", "#mypage_delivery-active", function(){
		$("#mypage_delivery-active").attr("id","mypage_delivery");
		$(".delivery_main_wrap").slideUp(500);
		$("#mypage_content").empty();
		$(".user_main_wrap").slideDown(500);
		loading = false;

	}); // 배송지 관리 닫기 - onclick 끝
	
	
	// 배송지 등록하기로 이동
	$(document).on("click",".delivery_btn", function() {
		$("#delivery_modal").fadeIn(300);
	});
	
	$(document).on("click",".delivery_modalClose", function() {
		$("#delivery_modal").fadeOut(300);
	});
	
	// 배송지 아코디언 on/off
	function arcodian(no){
		$(document).on("click",".delivery_title"+no, function(){
			$(".delivery_arco"+no).slideDown(500);
			$(".delivery_title"+no).attr("class", "delivery_title-active"+no);	
		});
		
			
		$(document).on("click",".delivery_title-active"+no, function(){
			$(".delivery_arco"+no).slideUp(500);
			$(".delivery_title-active"+no).attr("class", "delivery_title"+no);
		}); 
	}
	
	function delivery_modify_submit(no){
		
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$(document).on("click",".deli_modi_btn"+no, function(){
			
			$("#delivery_modify_modal"+no).fadeIn(500);
			console.log("no >>>" + no);
			
		$.ajax({
			type : 'get',           // 타입 (get, post, put 등등)
		    url : "<%=request.getContextPath() %>/mypage_delivery_modify.do",          // 요청할 서버url
		    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		    data : {deli_no : no},
		    success : function(result) { // 결과 성공 콜백함수
		    	
		    	var res = '';
		    console.log("ajax >>> " + result.deli_no);
		    	
		    	res = "<div id='delivery_modify_modal"+result.deli_no+"' style = 'z-index:1;'>"+
		   		 		"<div class='delivery_modify_modal_body' align = 'center'>"+
		    				"<div class='delivery_modify_modalClose"+result.deli_no+"' align='right' onmouseover = 'deli_modal_close("+result.deli_no+")'>"+
		    	 			"<input type = 'button' value = 'X'>"	+
		    			"</div>"+
		    			"<h3>배송지 수정</h3>"+
		    			"<form method = 'post' action = 'mypage_delivery_modify_ok.do' class = 'delivery_form' id = 'delivery_modify_form"+result.deli_no+"'>"+
		    				"<input type ='hidden' value ='"+id+"' name = 'user_modify_id'>" +
		    	 			"<input type = 'hidden' name = 'deli_modify_no' class = 'deli_modify_no"+result.deli_no+"' value = '"+result.deli_no+"'>"+
		    				"<span>배송지 별명</span>"+
		    				"<div class = 'delivery_nickname'>"+
		    					"<input name = 'delivery_modify_name' class = 'delivery_modify_name"+result.deli_no+"' value = '"+result.deli_name+"'>"+
		    				"</div>"+
		    				"<hr>"+
		    				"<span>주소</span>"+
		    				"<div class = 'delivery_postcode'>"+
		    					"<input name = 'delivery_modify_zipcode' id = 'delivery_modify_zipcode"+result.deli_no+"' value = '"+result.deli_zipcode+"'>"+
		    					"<input type = 'button' value = '우편번호 찾기' onclick = 'sample5_execDaumPostcode("+result.deli_no+");' id = 'zipcodebtn'>"+
		    				"</div>"+
		    				"<div class = 'delivery_addrAll'>"+
								"<input name = 'delivery_modify_addr' id = 'delivery_modify_addr"+result.deli_no+"' placeholder = '기본 주소를 입력하세요.' value = '"+result.deli_addr1+"'>"+
								"<input name = 'delivery_modify_extraAddr' id = 'delivery_modify_extraAddr"+result.deli_no+"' placeholder = '상세 주소를 입력하세요.' value = '"+result.deli_addr2+"'>"+
							"</div>"+
							"<div class = 'delivery_phone'>"+
								"<span>전화번호</span>"+
								"<div class = 'delivery_phone_insert'>"+
								"<input name = 'deli_modify_phone1' class = 'delivery_modify_"+result.deli_no+"_phone1' value = '"+result.deli_phone1+"'>&nbsp;-&nbsp;"	+
								"<input name = 'deli_modify_phone2' class = 'delivery_modify_"+result.deli_no+"_phone2' value = '"+result.deli_phone2+"'>&nbsp;-&nbsp;"	+
								"<input name = 'deli_modify_phone3' class = 'delivery_modify_"+result.deli_no+"_phone3' value = '"+result.deli_phone3+"'>"	+
							"</div>"+
						"</div>"+
				 		"<input type = 'hidden' value = '1' name = 'modify_notice' id = 'notice"+result.deli_no+"' value = '"+result.deli_default+"'>"+
						"<input type = 'button' value = '수정하기'  class = 'delivery_modify_submit delivery_modify_submit"+result.deli_no+"' onmouseover ='deli_modi_ok_btn("+result.deli_no+")'>"+
					"</form>"+
					"</div>"+
					"</div>";
				
		    	
		    	$('#mypage_content').append(res);
		    	
			}, // success의 end
		
		}); // ajax의 end
		
	});	// deli_modi_btn onclick 이벤트의 end
		
} // delivery_modify_submit 함수의 end
	
	function deli_modi_ok_btn(no){
	$(document).on("click", ".delivery_modify_submit"+no, function(){
		
		swal({
			  title: "기본 배송지로 등록하시겠습니까?",
			  text: "작성하신 배송지가 기본 배송지로 등록됩니다.",
			  icon: "success",
			  buttons: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("기본 배송지로 등록되었습니다.", {
			      icon: "success",
			    });
			    $("#delivery_modify_form"+no).submit();
			  } else {
			    swal("배송지가 등록되었습니다.", "success");
			    $("#modify_notice").val(0);
			      
			    $("#delivery_modify_form"+no).submit();
			  }
			});
	});
}
	
	function deli_modal_close(no){
		$(document).on("click", ".delivery_modify_modalClose"+no, function(){
			$("#delivery_modify_modal"+no).fadeOut(300);
		});	
	}
	

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
                function sample6_execDaumPostcode() {
                   new daum.Postcode({
                     oncomplete: function(data) {
                      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                             var addr = ''; // 주소 변수
                             var extraAddr = ''; // 참고항목 변수

                              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                  addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                         addr = data.jibunAddress;
                                          }

                                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                  if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                       extraAddr += data.bname;
                                  }
                                     // 건물명이 있고, 공동주택일 경우 추가한다.
                                       if(data.buildingName !== '' && data.apartment === 'Y'){
                                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                      }
                                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                      extraAddr = ' (' + extraAddr + ')';
                                  }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    // 주소변수 문자열과 참고항목 문자열 합치기
                                    addr += extraAddr;
                                       } else {
                                                addr += ' ';
                                              }

                             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                             document.getElementById('delivery_zipcode').value = data.zonecode;
                             document.getElementById("delivery_addr").value = addr;
                             // 커서를 상세주소 필드로 이동한다.
                             document.getElementById("delivery_extraAddr").focus();
                        }
             }).open();
        }
                
                function sample5_execDaumPostcode(no) {
                    new daum.Postcode({
                      oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                              var addr = ''; // 주소 변수
                              var extraAddr = ''; // 참고항목 변수

                               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                   addr = data.roadAddress;
                                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                          addr = data.jibunAddress;
                                           }

                                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                   if(data.userSelectedType === 'R'){
                                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                   }
                                      // 건물명이 있고, 공동주택일 경우 추가한다.
                                        if(data.buildingName !== '' && data.apartment === 'Y'){
                                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                       }
                                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                     if(extraAddr !== ''){
                                       extraAddr = ' (' + extraAddr + ')';
                                   }
                                     // 조합된 참고항목을 해당 필드에 넣는다.
                                     // 주소변수 문자열과 참고항목 문자열 합치기
                                     addr += extraAddr;
                                        } else {
                                                 addr += ' ';
                                               }

                              // 우편번호와 주소 정보를 해당 필드에 넣는다.
                              document.getElementById("delivery_modify_zipcode"+no).value = data.zonecode;
                              document.getElementById("delivery_modify_addr"+no).value = addr;
                              // 커서를 상세주소 필드로 이동한다.
                              document.getElementById("delivery_modify_extraAddr"+no).focus();
                         }
              }).open();
         }
</script>