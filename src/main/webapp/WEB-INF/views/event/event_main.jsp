<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:include page="../banner/user_top.jsp"/>
    <link href="resources/css/event/event_main.css" rel="stylesheet" type="text/css">

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

<jsp:include page="../banner/bottom.jsp" />