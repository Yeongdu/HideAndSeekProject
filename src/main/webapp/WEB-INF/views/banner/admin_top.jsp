<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

</head>
<body>
<div class="adminWrab">
	<nav>
	    <ul class="adminNav">
	    
		    <li class = "logo"><img src = "resources/image/logo.png"></li>
		    
		    <li class="admin_navMenu">
		        <a href="<%=request.getContextPath() %>/admin_product_list.do">상품관리</a>
		        <ul class="admin_navSubMenuWrab">
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_list.do">전체 상품 목록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_insert.do">상품 신규 등록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_contentEdit.do">등록 상품 관리</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_del_list.do">판매 중지 상품</a></li>
		        </ul>
		    </li>
		
		    <li class="admin_navMenu">
		        <a class="admin_navMenu1" href="<%=request.getContextPath() %>/admin_order_list.do">주문관리</a>
		        <ul class="admin_navSubMenuWrab">
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_order_list.do">전체 주문 목록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_order_del.do">주문 취소 목록</a></li>
		        </ul>
		    </li>
		
		    <li class="admin_navMenu"><a href="<%=request.getContextPath() %>/admin_user_list.do">회원관리</a></li>
		    
		    <li class="admin_navMenu"><a href="<%=request.getContextPath() %>/admin_event.do">이벤트</a></li>
		    
		    <li class="admin_navMenu_none"> </li>
		    
		    <li class="admin_navMenu"><a href="<%=request.getContextPath() %>/admin_main.do">관리자</a>
		     	<ul class="admin_navSubMenuWrab">
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_logout.do">로그아웃</a></li>
		        </ul>
		    </li>
		    
	    </ul>
	</nav>
</div>