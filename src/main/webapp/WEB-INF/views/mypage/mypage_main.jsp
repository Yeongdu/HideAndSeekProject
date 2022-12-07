<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/mypage/mypage_main.css" rel="stylesheet" type="text/css">

	<jsp:include page="../banner/user_top.jsp" />
    
<div id = "mypage"> <!-- main 영역 -->
	
	<c:set  var = "user_dto" value = "${user_cont }"/>
	
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
					<p>구독관리</p>
					<img src = "resources/image/sub.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_order">
					<p>주문내역</p>
					<img src = "resources/image/order.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_refund">
					<p>취소/환불내역</p>
					<img src = "resources/image/refund.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_review">
					<p>리뷰</p>
					<img src = "resources/image/review.png" class = "mypage_icon">
				</div>
				
				<div id = "mypage_delivery">
					<p>배송지관리</p>
					<img src = "resources/image/delivery.png" class = "mypage_icon">
				</div>
				
			</div>
		</div>
		<div id = "mypage_content"> <!-- 컨텐츠 영역 (변경되는 부분) -->
		</div>
	</div>
</div>
    
    
<script>

var loading = false; 

$("#mypage_sub").on("click", function(){
	if(!loading){
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajax({
		    type : 'get',           // 타입 (get, post, put 등등)
		    url : "<%=request.getContextPath() %>/mypage_sub.do",          // 요청할 서버url
		    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		    data : {userId : id},
		    success : function(result) { // 결과 성공 콜백함수
		    	$.each(result, function(index, item){
		    		
		    		var res = "<div id = 'mypage_sub'>" +
				    			"<div class = 'mypage_sub_packagename'>" + item.sub_package + "</div>" +
				    			"<div class = 'mypage_sub_startdate'>" + item.sub_start + "</div>" +
				    			"<div class = 'mypage_sub_enddate'>" + item.sub_end + "</div>" +
				    			"</div>";
		    			
		    			 $('#mypage_content').append(res);
		    		});
		    },error : function(request, status, error) { // 결과 에러 콜백함수
		    	/* alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); */
		    }
		}); // ajax 끝
		loading = true;
	}	
	
}); // onclick 끝

</script>
<jsp:include page="../banner/bottom.jsp" />
