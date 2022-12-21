<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

<title>관리자 이벤트</title>
<style>

#event{
	height: 100%;
}

.title{
	margin-top: 30px;
	font-size: 3em;
	font-family: 'yg-jalnan';
}

#event_center{
	display: flex;
    flex-direction: column;
}

.event_span {
	margin-top: 20px;
	margin-bottom: 50px;
}

.event_wrap{
	margin-bottom: 30px;
}

.event_img{
	width:70%;
	height: 100%;	
}



</style>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;" align="center">
	<br> <br> <br>

	<div class="adminProductListTitle" align="center">
		<h4>이벤트</h4>
	</div>
	<br />


<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event_insert.do'"
>이벤트 생성</button>
<br />
<div align = "center" id = "event">
		<h1 class = "title">EVENT</h1>
		<div id = "event_center">
		<input type = "hidden" name = "event_no">
			<div class = "event_span" align = "center">
				<h3 class = "event_ing">현재 진행중인 이벤트</h3>
			</div>
			<c:set var = "list" value = "${list }" />
			<c:forEach items="${list }" var = "dto">
			<div class = "event_wrap">
				<img src = "resources/image/event${dto.getEvent_no() }.png" class = "event_img"
					onclick = "location.href ='<%=request.getContextPath() %>/event_content?event_no=${dto.getEvent_no() }'">
			</div>
			</c:forEach>
		</div>
	</div>

	</div>

<jsp:include page="../banner/bottom.jsp" />