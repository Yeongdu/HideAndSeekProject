<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

<title>관리자 주문 목록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

<div style="height: auto; min-height: 100%;">
<br>
<br>
<br>


	<div class="adminProductListTitle" align="center">
		<h4>주문자 : ${list[0].user_id }</h4>
	</div>

	<br>
	
	<div align="center">

		<table class="table table-hover table-bordered" style="margin-left: auto; margin-right: auto; text-align: center; width: 70em;">
			<tr>
				<th>주문번호</th>
				<th>주문패키지</th>
				<th>주문일</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>이미지</th>
				<th>수량</th>
				<th colspan="2" align="center">주문상태</th>
			</tr>

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.order_no }</td>
						<td>${dto.order_package }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.order_date }" /></td>
						<td>${dto.user_id }</td>
						<td>${dto.product_name }</td>
						<td><img style="width: 100%; height: 60px" src="resources/upload/${dto.product_thumbnail }"></td>
						<td>${dto.order_amount }</td>
												<c:if test="${dto.order_status =='주문 완료' }">
							<td style="text-align: right;">
								<input type="button" class="btn btn-outline-success" value="주문 완료"
									onclick="if(confirm('배송중으로 변경 하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=배송중'} 
									else{return; }">
							</td>
							
							<td style="text-align: right;">
								<input type="button" value="취소" class="btn btn-outline-danger"
									onclick="if(confirm('주문을 취소하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=취소'} 
									else{return; }">
							</td>
						</c:if>
						
						<c:if test="${dto.order_status =='배송중' }">
							<td colspan="2" align="right">
								<input type="button" value="배송중" class="btn btn-outline-primary"
									onclick="if(confirm('배송 완료로 변경 하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=배송 완료'} 
									else{return; }">
							</td>
						</c:if>
						
						<c:if test="${dto.order_status == '배송 완료' }">
							<td colspan="2" align="right">
								<input type="button" class="btn btn-outline-dark" value="배송 완료" disabled>
							</td>
						</c:if>
						
						<c:if test="${dto.order_status == '취소' }">
							<td colspan="2" align="right" style="text-align: right;">
								<input type="button" class="btn btn-outline-danger" value="주문취소" disabled>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="8" align="center">
						<h4>게시물이 없습니다.</h4>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty keyword }">
				<tr>
					<td colspan="9" align="center">
						<input type="button" value="전체목록" onclick="location.href='admin_order_list.do'">
					</td>
				</tr>
			</c:if>
		</table>
		<br>
		<input type="button" class="btn btn-light" value="주문목록" onclick="location.href='admin_order_list.do'">
		
	</div>



</div>


<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../banner/bottom.jsp" />