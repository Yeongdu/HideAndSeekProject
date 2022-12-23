<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="cdto" value="${cateList }"  />

<title>관리자 구독 등록</title>
<style>

.btn.btn-light_admin_sub_mainBtn{
border: 0.5px solid lightgray;
}

</style>

<div class="admin_sub_main_Wrab" style="height: auto; min-height: 100%;" align="center">
<br><br><br>

<button type="button" class="btn btn-light_admin_sub_mainBtn">버튼 ?</button>

<!-- <button type="button" class="btn btn-light_admin_sub_mainBtn" -->
<%-- onclick="location.href='<%=request.getContextPath()%>/admin_sub_insert.do?'">만들기</button> --%>
<br><br><br><br>
	<h4>구독 만들기</h4><br>
<br><br><br><br> 

	<select name="product_category1" required>
		<option value="" selected disabled hidden>카테고리</option>
		<option value="takju">탁주</option>
		<option value="chungju">약.청주</option>
		<option value="wine">과실주</option>
		<option value="soju">증류주</option>
	</select>
	
<!-- 	<select name="product_category1" required> -->
<!-- 		<option value="" selected disabled hidden>카테고리</option> -->
<!-- 		<option value="takju">탁주</option> -->
<!-- 		<option value="chungju">약.청주</option> -->
<!-- 		<option value="wine">과실주</option> -->
<!-- 		<option value="soju">증류주</option> -->
<!-- 	</select> -->
	
	





</div>

<jsp:include page="../banner/bottom.jsp" />