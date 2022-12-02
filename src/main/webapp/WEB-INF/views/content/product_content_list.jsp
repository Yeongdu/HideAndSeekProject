<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/cont/content.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../banner/none_top.jsp" />
	<div>
		<c:set var="list" value="${List }" />
		<c:forEach items="${list }" var="dto">
			<div class="pic">
				${dto.product_file1 }
			</div>
			<span class="price">총 상품 가격</span>
			<span class="su">수량</span>
		</c:forEach>
	</div>
</body>
</html>