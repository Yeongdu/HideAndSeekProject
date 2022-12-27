<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="list" value="${Subscribe }"  />

<title>관리자 구독 관리</title>
<style>

</style>

<div class="" style="height: auto; min-height: 100%;" align="center">
<br><br><br>

<c:forEach items="${list }" begin="0" end="0" var="dto">
	<c:set value="${dto.sub_package_no }" var="sub_package_no" />
</c:forEach>

<button type="button" class="btn btn-light_admin_sub_mainBtn"
onclick="location.href='<%=request.getContextPath()%>/admin_sub_insert.do?'">새로만들기</button>
<button type="button" class="btn btn-light_admin_sub_mainBtn"
onclick="location.href='<%=request.getContextPath()%>/admin_subscribe.do?'">전체구독목록</button>
<br><br>
<form method="post" action="<%=request.getContextPath()%>/admin_sub_update_ok.do?no=${sub_package_no }">
<button type="submit" class="btn btn-success">수정 완료</button>
<br><br><br><br>

<c:forEach items="${list }" begin="0" end="0" var="dto">
			<%-- 구독 상태 --%>
			<div class="form-group row border-bottom py-2">
				<label for="event_status" class="col-sm-4 col-form-label">상태</label>
				<div class="col-sm-8">

					<input class="form-check-input" type="radio" name="sub_status" id="sub_status" value="신청가능" <c:if test="${dto.sub_status eq '신청가능'}">checked</c:if> required> 
					<label class="form-check-label" for="inlineRadio1">신청가능</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="sub_status" id="sub_status" value="신청불가" <c:if test="${dto.sub_status eq '신청불가'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">신청불가</label>
				</div>
			</div>
</c:forEach>
</form>
			<br>

<div class="admin_sub_cont_imgWrab">
	<c:forEach items="${list }" var="odto">

		<div class="card" style="width: 10rem;">
			<img src="resources/upload/${odto.product_thumbnail }" class="card-img-top" >
			<div class="card-body">
				<p class="card-text">${odto.product_name }</p>
				<p class="card-text"><fmt:formatNumber value="${odto.product_price }" pattern="#,### 원" /></p>
			</div>
		</div>

	</c:forEach>
	</div>
	
	
	
	


	<br> <br> <br>
	<h4></h4>
	<br>
	<table class="table table-bordered"
		style="margin-left: auto; margin-right: auto; font-size: 1.2em; text-align: center; width: 66em;">

		<c:forEach items="${list }" begin="0" end="0" var="dto">
			<tr>
				<td>${dto.sub_package_no }</td>
				<td>${dto.sub_package }</td>

				<td><img width="150px" src="resources/image/${dto.sub_image}"></td>
				<td width="180px;">${dto.sub_date.substring(0,10) }부터</td>
				<td width="170px;">${dto.sub_enddate.substring(0,10) }까지</td>
		<td><fmt:formatNumber value="${dto.sub_price }" pattern="#,### 원" /></td>
		</tr>
		</c:forEach>

	</table>

</div>
<br><br><br>

<jsp:include page="../banner/bottom.jsp" />