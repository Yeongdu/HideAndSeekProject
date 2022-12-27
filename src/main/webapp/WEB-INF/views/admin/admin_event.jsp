<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

<title>관리자 이벤트</title>
<style>




</style>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;" align="center">
	<br> <br> <br>

	<br />


<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event_insert.do'"
>이벤트 생성</button>
<br />
<div align = "center" id = "event">
		<h1 class = "title">EVENT</h1>
		<br />
		<div id = "event_center">
		<input type = "hidden" name = "event_no">

			<c:set var = "list" value = "${list }" />
			<c:forEach items="${list }" var = "dto">
			<div class = "event_wrap">
				<img src = "resources/image/${dto.event_thumbnail}" class = "event_img"
					onclick = "location.href ='<%=request.getContextPath() %>/admin_event_content.do?event_no=${dto.event_no }'">
			</div>
			</c:forEach>
		</div>
	</div>

	</div>

<jsp:include page="../banner/bottom.jsp" />