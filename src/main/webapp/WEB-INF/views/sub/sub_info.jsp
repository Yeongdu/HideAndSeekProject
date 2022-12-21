<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/sub/sub_main.css" rel="stylesheet" type="text/css">
    
    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
	
	<div id = "sub_info_main">
		<div class = "sub_info_wrap">
			<img src = "resources/image/damhwabox.png" class = "sub_info_img">
			<div class = "sub_info_cont">
				<span class = "sub_title"></span>
				<span class = "sub_price"><fmt:formatNumber></fmt:formatNumber>${sdto.get }</span>
			</div>
		</div>
	
	</div>
	

	
<jsp:include page="../banner/bottom.jsp" />
