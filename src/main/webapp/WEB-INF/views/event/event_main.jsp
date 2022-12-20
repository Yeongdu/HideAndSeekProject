<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
    <link href="resources/css/event/event_main.css" rel="stylesheet" type="text/css">
    
<style>
 .event_wrap {
 	width: 100%;
 	height: 15%;
 	margin : 10px auto;
 	position: relative;
 	}

.event_image > img {

	width: 100%;
	height: 20vw;
	vertical-align: middle;
	object-fit: cover;
	overflow:hidden;
}

 .event_text { 
 	position: absolute; 
 	top: 40%; 
 	left: 50%; 
 	transform: translate(-50%, -50%); 
 	font-size: 4vw;; 
 	font-weight: bold; 
 	color: white; 
 	text-align: left; 
 } 

/* .event_imageThumbnail { */
/* 	width: 100%; */
/* } */
</style>

<div style="height: auto; min-height: 100%;">
<br>
<br>

	<c:set var = "list" value = "${list }" />
	<c:forEach items="${list }" var = "dto">
    
    <div class="event_wrap">
    	<div class="event_image">
    	<img src = "resources/image/${dto.event_thumbnail }"
    	onclick = "location.href ='<%=request.getContextPath() %>/event_content.do?event_no=${dto.event_no }'"
    	>
    	</div>
    	<div class="event_text">
    	<p>${dto.event_cont1 }</p>
    	</div>
    
    </div>
    
    <br><br>
    
    </c:forEach>
    
    
<!-- 	<div align = "center" id = "event"> -->
<!-- 		<h1 class = "title">EVENT</h1> -->
<!-- 		<div id = "event_center"> -->
<!-- 		<input type = "hidden" name = "event_no"> -->
<!-- 			<div class = "event_span" align = "center"> -->
<!-- 				<h3 class = "event_ing">현재 진행중인 이벤트</h3> -->
<!-- 			</div> -->
<%-- 			<c:set var = "list" value = "${list }" /> --%>
<%-- 			<c:forEach items="${list }" var = "dto"> --%>
<!-- 			<div class = "event_wrap"> -->
<%-- 				<img src = "resources/image/event${dto.getEvent_no() }.png" class = "event_img" --%>
<%-- 					onclick = "location.href ='<%=request.getContextPath() %>/event_content?event_no=${dto.getEvent_no() }'"> --%>
<!-- 			</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->

</div>

<script>
window.onload = function () {
	$(".loading").fadeOut(100,function(){
		$("#div_load_image").fadeOut(300);
	});
}
</script>	

<jsp:include page="../banner/bottom.jsp" />
