<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="resources/css/mypage/mypage_main.css" rel="stylesheet" type="text/css">


	<jsp:include page="../banner/user_top.jsp" />
<title>마이페이지</title>
<main style = "min-height : 100%;">

	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
	<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set>
	<c:set var="month"><fmt:formatDate value="${today}" pattern="MM" /></c:set>
	
	
	<c:set  var = "user_dto" value = "${user_cont }"/>
	<c:set var = "order_all" value = "${count }" />
	<c:set var = "order_count" value = "${order }" />
	<c:set var = "refund_count" value = "${refund }" />
	<c:set var = "delivery_count" value = "${delivery }" />
	<c:set var = "delivery_complete_count" value = "${delivery_complete }" />
	<c:set var = "delvery_modify" value = "${dlist }" />
	
<div id = "mypage"> <!-- main 영역 -->
	<div id = "mypage_wrap" align = "center"> <!-- 컨텐츠 전체 영역 -->
		<div id = "mypage_category"> <!-- 카테고리 영역 / 이름, 포인트, 카테고리 등 -->
			<div id = "mypage_category_user">
				<div class = "mypage_user_name">${userId }<span>님</span></div>
				<div class = "mypage_user_point">
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
				
				<div id = "mypage_user">
					<span>회원정보</span>
					<img src = "resources/image/user.png" class = "mypage_icon">
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
		<input type ="hidden" value = ${date } class = "today_date">
		<div id = "mypage_content"> <!-- 컨텐츠 영역 (변경되는 부분) -->
			
		</div>
	</div>
</div>


<!-- 리뷰 등록 모달 -->
<div id="modal" style = 'display:none; z-index:1;'>
	<div class="modal_body">
		<div class="modalClose" align="right">
			<input type = "button" value = "X">
		</div>
			<div class = "review_select">
				<span>리뷰 작성하기</span>
			</div>
			<form method = "post" enctype="multipart/form-data" action = "<%=request.getContextPath() %>/review_insertOk.do" id = "review_form">
			<div class = "review_insert_star">
					<span class="text-bold">이번 술은 어떠셨나요?</span>&nbsp;&nbsp;&nbsp;
					<span class="star">★★★★★<span>★★★★★</span>
		  			<input type="range" oninput="drawStar()" value = "0" step="1" min="0" max="10" class = "star_range" name = "reviewStar">
				</span>
				</div>
			<div class = "review_content">
				<textarea rows="10" cols="80" class = "review_cont" name = "review_insert_cont" placeholder = "한번 작성하신 리뷰는 삭제할 수 없습니다.&#13;&#10;&#13;&#10;신중하고 솔직한 후기를 남겨주세요."></textarea>
				<div class = "review_files">
					<div class = "review_file">
						<label class = "filebox" for="review_image_upload">업로드</label>
						<input type ="file" id = "review_image_upload" name = "review_insert_image" onchange="readURL(this);">
					</div>
					<div class = "review_preview">
						<img id="preview" src = "resources/image/camera_default.png" />
					</div>
				</div>
				<input type = "hidden" value = "${userId }" name = "review_insert_userId" class = "review_insert_userId">
				
				
				<input type = "submit" value = "리뷰 작성하기" class = "review_submit">
			</div>
			</form>
	</div>
</div> 

<!-- 회원 삭제 모달 -->
<div id="user_modal" style = 'display:none; z-index:1;'>
	<div class="user_modal_body"> 
		<div class="user_modalClose" align="right">
			<input type = "button" value = "X">
		</div>
				<div class = "user_delete_title">
					<span>회원 탈퇴 유의사항</span>
				</div>
					
				<div class = "delete_rule">
					<div class = "delete_rule_number">1</div>
					<div class = "delete_rule_cont">
						회원 탈퇴 시 삭제된 데이터에 대해 복구가 불가능하며,<br>
						개인정보가 필요한 술담화의 모든 웹서비스 이용이 불가합니다.
					</div>
				</div>
					
				<div class = "delete_rule">	
					<div class = "delete_rule_number">2</div>
					<div class = "delete_rule_cont">
						구독을 이용하고 계신 경우, 회원 탈퇴 진행 시 구독도 함께 취소됩니다.
					</div>
				</div>
				
				<div class = "delete_rule">	
					<div class = "delete_rule_number">3</div>
					<div class = "delete_rule_cont">
						잔여 포인트, 잔여 쿠폰, 회원 등급 등의 정보는 <br>
						모두 삭제되며 환불되지 않습니다.
					</div>
				</div>
				
				<div class = "delete_rule">	
					<div class = "delete_rule_number">4</div>
					<div class = "delete_rule_cont">
						회원 탈퇴 후 모든 술래잡기 웹서비스 내에서의 계약 또는 청약 철회 등에 관한 기록은<br> 
						전자상거래 등에서의 소비자 보호에 관한 법률에 따라 5년간 보관되며,<br>
						이를 위한 개인정보는 법률에 따른 보유 목적 외에 다른 목적으로는 이용되지 않습니다.
					</div>
				</div>
				
				<div class = "delete_rule">		
					<div class = "delete_rule_number">5</div>
					<div class = "delete_rule_cont">
						회원 탈퇴 후 술래잡기 서비스에 입력하신 <br>
						상품문의 및 후기(사진 포함)는 삭제되지 않으며,<br>
						회원 정보 삭제로 인해 작성자 본인을 확인할 수 없어<br>
						편집 및 삭제처리가 원천적으로 불가능합니다.<br>
						상품문의 및 후기, 댓글 삭제를 원하시는 경우에는<br>
						먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
					</div>
				</div>
				
			<form method = "post" action = "<%=request.getContextPath() %>/user_delete.do" id = "user_delete_form">
				<input type = "hidden" name = "delete_user_name" value = "${userId }">
				<label for = "user_check">회원 탈퇴 유의사항을 숙지하였으며 회원 탈퇴를 진행하겠습니다.</label>
				<input type = "checkbox" id = "user_check" value = "1" name = "user_check">
				<br>
				<input type = "submit" value = "회원 탈퇴" class = "user_submit" disabled = "disabled" value = "0">
			</form>
	</div>
</div> 

<div id="delivery_modal" style = 'display:none; z-index:1;'>
	<div class="delivery_modal_body" align = "center"> 
		<div class="delivery_modalClose" align="right">
			<input type = "button" value = "X">
		</div>
		
			<h3>배송지 등록</h3>
			
			<form method = "post" action = "<%=request.getContextPath() %>/delivery_insert.do" id = "delivery_insert_form">
				<input type = "hidden" value = "${userId }" name = "user_id">
				
				<span>배송지 별명</span>
				<div class = "delivery_nickname">
					<input name = "delivery_name">
				</div>
				<hr>
				<span>주소</span>
				<div class = "delivery_postcode">
					<input name = "delivery_zipcode" id = "delivery_zipcode">
					<input type = "button" value = "우편번호 찾기" onclick = "sample6_execDaumPostcode();" id = "zipcodebtn">
				</div>
				
				<div class = "delivery_addrAll">
					<input name = "delivery_addr" id = "delivery_addr" placeholder = "기본 주소를 입력하세요.">
					<input name = "delivery_extraAddr" id = "delivery_extraAddr" placeholder = "상세 주소를 입력하세요.">
				</div>
				
				<div class = "delivery_phone">
					<span>전화번호</span>
					<div class = "delivery_phone_insert">
						<input name = "deli_phone1" class = "delivery_phone1">&nbsp;-&nbsp;<input name = "deli_phone2">&nbsp;-&nbsp;<input name = "deli_phone3">
					</div>
				</div>
				<input type = "hidden" value = "1" name = "notice" id = "notice">
				<input type = "button" value = "등록하기" class = "delivery_submit">
				
			</form>
	</div>
</div> 

</main>

<script type="text/javascript">
	function drawStar(){
		var starval = $(".star_range").val();
		var starvalue = starval * 10; 
		$(".star span").css("width", starvalue+"%");
	}
	
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = null;
		  }
		}
	  
	// 체크하지않으면 버튼 활성화 x
	$(document).ready(function(){
		$("#user_check").change(function(){
	        if($("#user_check").is(":checked")){
	        	$(".user_submit").prop("disabled", false);
				$(".user_submit").removeAttr("disabled");
	        }else{
	        	$(".user_submit").prop("disabled", true);
				$(".user_submit").attr("disabled","disabled");
	        }
	   	});
	});
	
// 배송지 등록 ========================================================
	
	
	$(document).on("click",".delivery_submit", function(){
		
		swal({
			  title: "기본 배송지 등록하시겠습니까?",
			  text: "작성하신 배송지가 기본 배송지로 등록됩니다.",
			  icon: "success",
			  buttons: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("기본 배송지로 등록되었습니다.", {
			      icon: "success",
			    });
			    $("#delivery_insert_form").submit();
			  } else {
			    swal("배송지가 등록되었습니다.", "success");
			    $("#notice").val(0);
			      
			    $("#delivery_insert_form").submit();
			  }
			});
		
		
// 		swal("배송지 등록 완료", "등록된 배송지는 마이페이지의 '배송지 관리'에서 확인하실 수 있습니다.", "success")
// 		.then((value) => {
// 			$("#delivery_insert_form").submit();
// 			$(".loading").fadeIn(300);
// 		});
		
	}); // delivery_submit onclick 끝
	
	
</script>

    
    
<jsp:include page="../mypage/mypage_script.jsp" />
<jsp:include page="../banner/bottom.jsp" />