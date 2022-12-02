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
				<img src="resources/image/${dto.getProduct_file1() }">
			</div>
			
			<span class="name">이름</span>
			
			<div class="ex">
				<span class="sub_ex">#${dto.getProduct_cont1() } #${dto.getProduct_cont2() }</span>
				<span class="ssub_ex1">주종 : ${dto.getProduct_cont3() }주류</span>
				<span class="ssub_ex2">도수 : ${dto.getProduct_cont4() }%</span>
				<span class="ssub_ex3">주량 : ${dto.getProduct_cont5() }ml</span>
			</div>
			
			<span class="price_w">판매가격: </span>
			<span class="price">판매가격: </span>
			<hr class="first">
			
			<span class="su">수량</span>
			
			<span class="total_price_w">총 상품 가격</span>
			<div class="total_price">
				
			</div>
		</c:forEach>
	</div>
</body>
</html>