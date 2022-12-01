<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="adminWrab">
	<nav>
	    <ul class="adminNav">
	    
		    <li class = "logo"><img src = "resources/image/logo.png"></li>
		    
		    <li class="admin_navMenu">
		        <a href="<%=request.getContextPath() %>/admin_product_list.do">상품관리</a>
		        <ul>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_list.do">전체 상품 목록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_insert.do">상품 신규 등록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_view.do">판매 노출 관리</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_product_del.do">삭제 상품 관리</a></li>
		        </ul>
		    </li>
		
		    <li class="admin_navMenu">
		        <a href="<%=request.getContextPath() %>/admin_order_list.do">주문관리</a>
		        <ul>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_order_list.do">전체 주문 목록</a></li>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_order_del.do">주문 취소 목록</a></li>
		        </ul>
		    </li>
		
		    <li class="admin_navMenu"><a href="<%=request.getContextPath() %>/admin_user_list.do">회원관리</a></li>
		    
		    <li class="admin_navMenu"><a href="<%=request.getContextPath() %>/admin_event.do">이벤트</a></li>
		    
		    <li class="admin_navMenu"><a href=></a></li>
		    
		    <li class="admin_navMenu"><a href="">관리자</a>
		     	<ul>
		            <li><a class="admin_navSubMenu" href="<%=request.getContextPath() %>/admin_logout.do">로그아웃</a></li>
		        </ul>
		    </li>
		    
	    </ul>
	</nav>
</div>