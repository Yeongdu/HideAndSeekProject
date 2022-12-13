<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../banner/admin_top.jsp" />

<title>관리자 주문 목록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

<div style="height: 100%">
<br>
<br>
<br>

	<div class="adminProductListTitle" align="center">
		<h4>'${keyword }' 주문 검색 결과</h4>
	</div>
	<br>
	<div align="center">

		<table class="table table-hover table-bordered" style="width: 60em">
			<tr>
				<th>주문번호</th>
				<th>주문상태</th>
				<th>주문일</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>이미지</th>
				<th>수량</th>
			</tr>

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.order_no }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.order_status }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.order_date }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.user_id }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.product_name }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.product_thumbnail }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.order_no }&page=${page.page }'">${dto.order.amount }</td>
						<td>
						<c:if test="${dto.order_status =='주문 완료' }">
						<input type="button" value="판매중"
							onclick="if(confirm('판매상태를 판매 중지로 변경하시겠습니까?')){
							location.href='<%=request.getContextPath() %>/admin_product_statusChange.do?no=${dto.order_no }&page=${page.page }'} 
							else{return; }">
						</c:if>
						<c:if test="${dto.order_status != '판매' }">
						${dto.order_status }
						</c:if>
						</td>
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

			<tr>
				<td colspan="9" align="center">
					<c:if test="${!empty keyword }">
						<input type="button" value="전체목록" onclick="location.href='admin_product_list.do'">
					</c:if>
				</td>
			</tr>
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
			action="<%=request.getContextPath()%>/admin_product_search.do">

			<span> <select name="field" class="form-select"
				style="width: 8em; display: inline-block;">
					<option value="allSearch"
						<c:if test="${field == 'all'}"> selected="selected"</c:if>>통합</option>
					<option value="name"
						<c:if test="${field == 'name'}"> selected="selected"</c:if>>상품이름</option>
			</select>

			</span> <span> <input type="text" name="keyword" value="${keyword}"
				class="form-control" style="width: 20em; display: inline-block;" /></span>
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