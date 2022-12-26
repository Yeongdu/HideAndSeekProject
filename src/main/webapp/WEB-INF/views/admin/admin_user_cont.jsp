<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${udto }" />
<c:set var = "olist" value = "${olist }" />
<c:set var = "slist" value = "${slist }" />
<c:set var = "oall" value = "${olist_all }" />
<c:set var = "sall" value = "${slist_all }" />
<c:set var="page" value="${page }" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="resources/css/admin/admin_user.css" rel="stylesheet" type="text/css">
<jsp:include page="../banner/admin_top.jsp" />


<title>${dto.user_no }) ${dto.user_name } 회원 상세정보 </title>
<script type="text/javascript">

	function swalUserChange(){
	swal({
		icon: 'warning',
		text : "회원을 탈퇴처리 하겠습니까?",
		buttons: ["취소" , "네"],
		closeOnClickOutside : true // 백그라운드 클릭해도 안꺼짐
	})
	.then(function(result){ //  창 꺼질때 실행할 함수
		console.log(result);
		// background 클릭 => null
		// 확인버튼 클릭 => true
	    
	    if(result) {
	    	location.href='admin_user_statusChange.do?no='+'${dto.user_no }';
	    }
	    
		})
	}
	



</script>
<br><br><br>


<div style="height: auto; min-height: 100%;" align="center">
	<div class="adminProductListTitle" align="center">
	<h4>${dto.user_no }) ${dto.user_name } 회원 상세</h4>
	<br>
	</div>


	<div align="center" style="width: 60%;">
		
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원명</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_name }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원아이디</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_id }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원이메일</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_email }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">생년월일</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_jumin1 }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">전화번호</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_phone1 } - ${dto.user_phone2 } - ${dto.user_phone3 }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">포인트</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_point }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원가입일</label>
				<div class="col-sm-10">
					<span class="form-control">
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.user_date }" />
					</span>
				</div>
			</div>
			
			<c:if test="${!empty dto.user_addr1 }">
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">주소</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_addr1 }</span>
				</div>
			</div>
			</c:if>
			
			<c:if test="${empty dto.user_addr1 }">
			</c:if>
			
			<c:if test="${dto.user_leave == 0 }">
			<h4>탈퇴회원 입니다</h4>
			<br>
			</c:if>
			
			
			
</div>
	<!-- 네번째 end -->
<div class="adminUserContBtnWrab" style="display: flex; justify-content: space-between; width: 60%;">
	<span>
		
		<c:if test="${dto.user_leave == 0 }">

		</c:if>
		
		<c:if test="${dto.user_leave == 1 }">
		<input type="button" class="btn btn-primary-2" value="수정" onclick="location.href='admin_user_update.do?no=${dto.user_no }&page=${page}'">
		<input type="button" class="btn btn-primary-2" value="탈퇴" 
		onclick="swalUserChange();">
		</c:if>
	</span>
	<span>
		<input type="button" class="btn btn-primary-2" value="전체회원목록" onclick="location.href='admin_user_list.do'">
	</span>
</div>

<div id = "adminUser_bottom">
	
<div class = "adminUser_wrap">
	<span> 주문 내역 </span>
<div class = "adminUser_wrap_main">
		<c:if test="${!empty olist }">
		<ul>
			<li class = "adminUser_title">주문일</li>
			<c:forEach items = "${olist }" var = "odto">
				<li><fmt:formatDate value="${odto.getOrder_date() }" pattern = "yyyy년 MM월 dd일"/> </li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">상품명</li>
			<c:forEach items = "${olist }" var = "odto">
				<li>${odto.getProduct_name() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">수량</li>
			<c:forEach items = "${olist }" var = "odto">
				<li>${odto.getOrder_amount() }개</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">가격</li>
			<c:forEach items = "${olist }" var = "odto">
				<li><fmt:formatNumber>${odto.getProduct_price()*odto.getOrder_amount() }</fmt:formatNumber>원</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">배송지</li>
			<c:forEach items = "${olist }" var = "odto">
				<li>${odto.getDeli_addr1() } ${odto.getDeli_addr2() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">주문상태</li>
			<c:forEach items = "${olist }" var = "odto">
				<li>${odto.getOrder_status() }</li>
			</c:forEach>
		</ul>
		
		</c:if>
			
			<c:if test="${empty olist }">
				<ul>
					<li>주문한 상품이 없습니다</li>
				</ul>
			</c:if>
	</div>
	<input type = "button" value = "전체 목록" class = "adminUser_order_moreBtn">
</div>



<div class = "adminUser_wrap adminuser_sub_title">
	<span> 구독 내역 </span>
<div class = "adminUser_wrap_main">
		<c:if test="${!empty slist }">
		<ul>
			<li class = "adminUser_title">구독일</li>
			<c:forEach items = "${slist }" var = "odto">
				<li><fmt:formatDate value="${odto.getSub_start() }" pattern = "yyyy년 MM월 dd일"/> </li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">패키지명</li>
			<c:forEach items = "${slist }" var = "odto">
				<li>${odto.getSub_package() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">배송지</li>
			<c:forEach items = "${slist }" var = "odto">
				<li>${odto.getDeli_addr1() } ${odto.getDeli_addr2() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">구독상태</li>
			<c:forEach items = "${slist }" var = "odto">
				<li>${odto.getUser_status() }</li>
			</c:forEach>
		</ul>
		</c:if>
			
			<c:if test="${empty slist }">
				<ul>
					<li>구독 내역이 없습니다</li>
				</ul>
			</c:if>
	</div>
	<input type = "button" value = "전체 목록" class = "adminUser_sub_moreBtn">
</div>

</div>

</div>
<br><br><br>

<div id="modal" style = 'display:none; z-index:1;'>
	<div class="modal_body">
			<div class = "adminUser_order_more_title">
				<span>전체 주문 내역</span>
				<div class="modalClose" align="right">
					<input type = "button" value = "X" class = "Mclose">
				</div>
			</div>
			
			<div class = "adminUser_order_more">
				<c:if test="${!empty oall }">
		<ul>
			<li class = "adminUser_title">주문일</li>
			<c:forEach items = "${oall }" var = "odto">
				<li><fmt:formatDate value="${odto.getOrder_date() }" pattern = "yyyy년 MM월 dd일"/> </li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">상품명</li>
			<c:forEach items = "${oall }" var = "odto">
				<li>${odto.getProduct_name() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">수량</li>
			<c:forEach items = "${oall }" var = "odto">
				<li>${odto.getOrder_amount() }개</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">가격</li>
			<c:forEach items = "${oall }" var = "odto">
				<li><fmt:formatNumber>${odto.getProduct_price()*odto.getOrder_amount() }</fmt:formatNumber>원</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">배송지</li>
			<c:forEach items = "${oall }" var = "odto">
				<li>${odto.getDeli_addr1() } ${odto.getDeli_addr2() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">주문상태</li>
			<c:forEach items = "${oall }" var = "odto">
				<li>${odto.getOrder_status() }</li>
			</c:forEach>
		</ul>
		
		</c:if>
			
			<c:if test="${empty oall }">
				<ul>
					<li>주문한 상품이 없습니다</li>
				</ul>
			</c:if>
			</div>
	</div>
</div> 

<div id="sub_modal" style = 'display:none; z-index:1;'>
	<div class="modal_body">
		<div class = "adminUser_sub_more_title">
			<span>전체 구독 내역</span>
			<div class="submodalClose" align="right">
				<input type = "button" value = "X" class = "Mclose">
			</div>
		</div>
		
		<div class = "adminUser_sub_more">
			<c:if test="${!empty sall }">
		<ul>
			<li class = "adminUser_title">구독일</li>
			<c:forEach items = "${sall }" var = "sdto">
				<li><fmt:formatDate value="${sdto.getSub_start() }" pattern = "yyyy년 MM월 dd일"/> </li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">패키지명</li>
			<c:forEach items = "${sall }" var = "sdto">
				<li>${sdto.getSub_package() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">배송지</li>
			<c:forEach items = "${sall }" var = "sdto">
				<li>${sdto.getDeli_addr1() } ${sdto.getDeli_addr2() }</li>
			</c:forEach>
		</ul>
		
		<ul>
			<li class = "adminUser_title">구독상태</li>
			<c:forEach items = "${sall }" var = "sdto">
				<li>${sdto.getUser_status() }</li>
			</c:forEach>
		</ul>
		</c:if>
			
			<c:if test="${empty sall }">
				<ul>
					<li>구독 내역이 없습니다</li>
				</ul>
			</c:if>
		</div>
	</div>
</div> 

<script>
	
	// 주문 전체 보기 모달
	$(document).on("click", ".adminUser_order_moreBtn", function(){
		$("#modal").fadeIn(500);
	});
	
	$(".modalClose").on("click", function(){
		$("#modal").fadeOut(500);
	});
	
	
	var floatPosition = parseInt($("#modal").css('top'))
	$(window).scroll(function() {
	  
	    var currentTop = $(window).scrollTop();
	    var modalTop = currentTop + floatPosition + "px";
	    $("#modal").stop().animate({
	      "top" : modalTop
	    }, 1);
	    
	}).scroll();
	// ====================================== 주문 전체 보기 모달 end
	
	
	// 구독 전체 보기 모달
	$(document).on("click", ".adminUser_sub_moreBtn", function(){
		$("#sub_modal").fadeIn(300);
	});
	
	$(".submodalClose").on("click", function(){
		$("#sub_modal").fadeOut(300);
	});
	
	
	var floatPosition2 = parseInt($("#sub_modal").css('top'))
	$(window).scroll(function() {
	  
	    var currentTop = $(window).scrollTop();
	    var modalTop = currentTop + floatPosition2 + "px";
	    $("#sub_modal").stop().animate({
	      "top" : modalTop
	    }, 1);
	    
	}).scroll();
	// ====================================== 주문 전체 보기 모달 end
	
	
	
</script>



<jsp:include page="../banner/bottom.jsp" />