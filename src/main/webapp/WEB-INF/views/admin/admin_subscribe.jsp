<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />
<c:set var="cdto" value="${currentSub }"  />

<title>관리자 구독</title>
<style>

.btn.btn-light_admin_sub_mainBtn{
border: 0.5px solid lightgray;
}

</style>

<div class="admin_sub_main_Wrab" style="height: auto; min-height: 100%;" align="center">
<br><br><br>

<button type="button" class="btn btn-light_admin_sub_mainBtn"
onclick="location.href='<%=request.getContextPath()%>/admin_sub_insert.do?'">구독 만들기</button>
<br><br><br><br>

	<h4>이달의 구독</h4><br>
	<table class="table table-hover table-bordered"
		style="margin-left: auto; margin-right: auto; font-size: 1.2em; text-align: center; width: 66em;">
		<tr>
			<td>${cdto.sub_package_no }</td>
			<td>${cdto.sub_package }</td>
			<td><img width="150px" src="resources/image/${cdto.sub_image}"></td>
			<td width="180px;">${cdto.sub_date.substring(0,10) } 부터</td>
			<td width="170px;">${cdto.sub_enddate.substring(0,10) } 까지</td>
			<td><fmt:formatNumber value="${cdto.sub_price }"
					pattern="#,### 원" /></td>
		</tr>
	</table>
	
	<br><br><br>
	<h4>전체 구독 목록</h4><br>
	<table class="table table-hover table-bordered"
		style="margin-left: auto; margin-right: auto; font-size: 1.2em; text-align: center; width: 66em;">

		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.sub_package_no }</td>
				<td>${dto.sub_package }</td>
				<td><img width="150px" src="resources/image/${dto.sub_image}"></td>
				<td width="180px;">${dto.sub_date.substring(0,10) } 부터</td>
				<td width="170px;">${dto.sub_enddate.substring(0,10) } 까지</td>
				<td><fmt:formatNumber value="${dto.sub_price }"
						pattern="#,### 원" /></td>
			</tr>
		</c:forEach>

	</table>

</div>
<br><br><br>

<jsp:include page="../banner/bottom.jsp" />