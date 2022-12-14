<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

<title>관리자 주문 목록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

<div style="height: 100%">
<br>
<br>
<br>

	<div class="adminProductListTitle" align="center">
		<h4>전체 주문 목록</h4>
	</div>
	<br>
	<div align="center">

		<table class="table table-hover table-bordered"  style="margin-left: auto; margin-right: auto; text-align: center; width: 80em;">
			<tr>
				<th>주문번호</th>
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
						<td>${dto.order_date }</td>
						<td>${dto.user_id }</td>
						<td>${dto.product_name }</td>
						<td><img style="width: 100%; height: 60px" src="resources/upload/${dto.product_thumbnail }"></td>
						<td>${dto.order_amount }</td>
						<c:if test="${dto.order_status =='주문 완료' }">
							<td>
								<input type="button" value="주문 완료"
									onclick="if(confirm('배송중으로 변경 하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=배송중'} 
									else{return; }">
							</td>
							
							<td>
								<input type="button" value="취소"
									onclick="if(confirm('주문을 취소하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=취소'} 
									else{return; }">
							</td>
						</c:if>
						
						<c:if test="${dto.order_status =='배송중' }">
							<td colspan="2" align="right">
								<input type="button" value="배송중"
									onclick="if(confirm('배송완료로 변경 하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/admin_order_statusChange.do?no=${dto.order_no }&page=${page.page }&key=배송완료'} 
									else{return; }">
							</td>
						</c:if>
						
						<c:if test="${dto.order_status == '배송완료' }">
							<td colspan="2" align="right">
								<input type="button" value="배송완료">
							</td>
						</c:if>
						
						<c:if test="${dto.order_status == '취소' }">
							<td colspan="2" align="right">
								<input type="button" value="주문취소">
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
	</div>

	<%-- 페이징 처리 --%>
		<div class="page-paging">
		    <c:if test="${page.startBlock > 1}"><span><a href="admin_product_search.do?page=1&field=${field }&keyword=${keyword}"><i class="fa fa-angle-double-left"></i></a></span></c:if>
		    <c:if test="${page.startBlock <= 1}"><span class="nolink"><i class="fa fa-angle-double-left"></i></span></c:if>
		
		    <c:if test="${page.page > 1}"><span><a href="admin_product_search.do?page=${page.page - 1}&field=${field }&keyword=${keyword}"><i class="fa fa-angle-left"></i></a></span></c:if>
		    <c:if test="${page.page <= 1}"><span class="nolink"><i class="fa fa-angle-left"></i></span></c:if>
		
		    <ol class="paging_1">
		        <c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="i">
		        <c:if test="${i == page.page}"><li class="now">${i}</li></c:if>
		        <c:if test="${i != page.page}"><li><a href="admin_product_search.do?page=${i}&field=${field }&keyword=${keyword}">${i}</a></li></c:if>
		        </c:forEach>
		    </ol>
		
		    <c:if test="${page.page < page.allPage}"><span><a href="admin_product_search.do?page=${page.page + 1}&field=${field }&keyword=${keyword}"><i class="fa fa-angle-right"></i></a></span></c:if>
		    <c:if test="${page.page >= page.allPage}"><span class="nolink"><i class="fa fa-angle-right"></i></span></c:if>
		
		    <c:if test="${page.endBlock < page.allPage}"><span><a href="admin_product_search.do?page=${page.allPage}&field=${field }&keyword=${keyword}"><i class="fa fa-angle-double-right"></i></a></span></c:if>
		    <c:if test="${page.endBlock >= page.allPage}"><span class="nolink"><i class="fa fa-angle-double-right"></i></span></c:if>
		</div>
	<%-- 페이징 처리 end --%>
		
		<br>
		
<%-- 검색 기능 --%>
<div class="searchWrab" align="center">
	<div>
		<form method="post"
			action="<%=request.getContextPath()%>/admin_order_search.do">

			 <span> <input type="text" name="keyword" value="${keyword}"
				class="form-control" style="width: 20em; display: inline-block;" placeholder="주문자 검색"/></span>
			&nbsp;&nbsp;&nbsp;

			<button type="submit" class="btn btn-secondary ml-1">
				<i class="fa fa-search"></i> 검색
			</button>

		</form>
	</div>
</div>
<%-- 검색 기능 end --%>


</div>


<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../banner/bottom.jsp" />