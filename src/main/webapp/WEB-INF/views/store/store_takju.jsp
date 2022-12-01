<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <script type="text/javascript">

	function(){
		
		let page = 1;
		let size = 4;
		let start = (page * size) - (size - 1);
		let end = page * size;
		
		$.ajax({
			url : "<%=request.getContextPath()%>/store_getlist.do",
	  		data : {
	  			start : start,
	  			end : end
	  		},
	  		type : "post", 
	  		async : false,
	  		dataType : "json",
	  		success : function(data){
				// 서비스 성공 시 처리 할 내용
			},
	  		error : function(data){
				// 서비스 실패 시 처리 할 내용
			}
		});
		
	}
</script> --%>
<body>
	<h3>탁주 페이지</h3>
	
	<div align="center">
		<hr width="50%" color="red">
			<h3>BOARD 테이블 게시물 전체 리스트 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table border="1" cellspacing="0" width="1000">
			<tr>
				<th>상품 번호</th> <th>상품 이름</th> <th>상품 카테고리</th>
				<th>상품 제조사</th> <th>도수</th> <th>단맛</th> <th>신맛</th>
				<th>탄산</th> <th>원료</th> <th>가격</th>
				<th>썸네일</th> <th>상태</th> <th>등록일</th>
			</tr>
			
			<c:set var="list" value="${list }" />
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.product_no }</td>
						<td>${dto.product_name }</td>
						<td>${dto.product_category }</td>
						<td>${dto.product_company }</td>
						<td>${dto.product_alcohol }</td>
						<td>${dto.product_sweet }</td>
						<td>${dto.product_acidity }</td>
						<td>${dto.product_soda }</td>
						<td>${dto.product_material }</td>
						<td>${dto.product_price }</td>
						<td>${dto.product_stock }</td>
						<td>${dto.product_point }</td>
						<td>${dto.product_thumbnail }</td>
						<td>${dto.product_status }</td>
						<td>${dto.product_date }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="13" align="center">
						<h3>전체 게시물 목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>