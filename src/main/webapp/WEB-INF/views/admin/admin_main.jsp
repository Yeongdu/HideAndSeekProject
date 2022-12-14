<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../banner/admin_top.jsp" />

<title>관리자 페이지 메인</title>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;">
	<br> <br> <br> <br>

	<div align="center">
		<span><h4 align="right" style="width: 504px;">최근 주문</h4></span>
	</div>
	
	<div align="center">
		<table class="table table-hover table-bordered" style="width: 36em;">
		
			<tr>
				<th>주문번호</th>
				<th>주문상태</th>
				<th>상품번호</th>
				<th>유저아이디</th>
				<th>주문날짜</th>
			</tr>
			<c:set var="olist" value="${orderList }" />
			<c:if test="${!empty olist }">
				<c:forEach items="${olist }" var="dto">
					<tr>
						<td>${dto.order_no }</td>
						<td>${dto.order_status }</td>
						<td>${dto.user_id }</td>
						<td>${dto.product_no }</td>
						<td>${dto.order_date }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty olist }">
				<tr>
					<td colspan="5" align="center">
						<h3>주문리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>

		</table>
	</div>
</div>
<jsp:include page="../banner/bottom.jsp" />