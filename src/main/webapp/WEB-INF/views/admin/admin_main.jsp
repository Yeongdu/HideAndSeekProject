<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

<title>관리자 페이지 메인</title>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;">
	<br> <br> <br> <br>

	<div class="adminProductListTitle" align="center">
		<h4>최근 주문 목록</h4>
	</div>
	<br />
	
	<div align="center">
<!-- 		<table class="table table-hover table-bordered" style="width: 36em;"> -->
		
<!-- 			<tr> -->
<!-- 				<th>주문번호</th> -->
<!-- 				<th>주문상태</th> -->
<!-- 				<th>상품번호</th> -->
<!-- 				<th>유저아이디</th> -->
<!-- 				<th>주문날짜</th> -->
<!-- 			</tr> -->
<!-- 					<tr> -->
<%-- 						<td>${dto.order_no }</td> --%>
<%-- 						<td>${dto.order_status }</td> --%>
<%-- 						<td>${dto.user_id }</td> --%>
<%-- 						<td>${dto.product_no }</td> --%>
<%-- 						<td>${dto.order_date }</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:if> --%>


		<table class="table table-hover table-bordered" style="margin-left: auto; margin-right: auto; text-align: center; width: 66em;">
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
						<td onclick="location.href='<%=request.getContextPath()%>/admin_order_same_package.do?no=${dto.order_package }'">${dto.order_no }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_order_same_package.do?no=${dto.order_package }'">${dto.order_package }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_order_same_package.do?no=${dto.order_package }'"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.order_date }" /></td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_order_same_package.do?no=${dto.order_package }'">${dto.user_id }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_order_same_package.do?no=${dto.order_package }'">${dto.product_name }</td>
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
				<tr>
					<td colspan="8" align="center">
						<input type="button" class="btn btn-light" value="전체목록" onclick="location.href='admin_order_list.do'">
					</td>
				</tr>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="9" align="center">
						<h4>게시물이 없습니다.</h4>
					</td>
				</tr>
			</c:if>



			
<%-- 			<c:if test="${empty olist }"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="5" align="center"> -->
<!-- 						<h3>주문리스트가 없습니다.</h3> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>

		</table>
	</div>
</div>
<jsp:include page="../banner/bottom.jsp" />