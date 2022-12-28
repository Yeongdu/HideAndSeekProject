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
 	width: 80%;
 	height: 15%;
 	margin : 10px auto;
 	position: relative;
 	}

.event_wrap > img {

	width: 100%;
/* 	height: 20vw; */
	vertical-align: middle;
/* 	object-fit: cover; */
/* 	overflow:hidden; */
	border-radius: 15px;
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
    
<div align = "center" id = "event">
		<h1 class = "title">EVENT</h1>
		<br />
		<div id = "event_center">
		<input type = "hidden" name = "event_no">

			<c:set var = "list" value = "${list }" />
			<c:forEach items="${list }" var = "dto">
			<div class = "event_wrap">
				<img src = "resources/image/${dto.event_thumbnail}" class = "event_img"
					onclick = "location.href ='<%=request.getContextPath() %>/event_content.do?event_no=${dto.event_no }'">
			</div>
			</c:forEach>
		</div>
	</div>
<br><br>
</div>

<script>
window.onload = function () {
	$(".loading").fadeOut(100,function(){
		$("#div_load_image").fadeOut(300);
	});
}
</script>	

<jsp:include page="../banner/bottom.jsp" />
