<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/banner/banner.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div id = "header">
		<ul class = "header_wrap">
			<li class = "logo" onclick = "location.href = '<%=request.getContextPath()%>'"><img src = "resources/image/logo.png"></li>
			<li class = "sub" onclick = "location.href = '<%=request.getContextPath()%>/sub.do'">구 독</li>
			<li class = "store" onclick = "location.href = '<%=request.getContextPath()%>/store.do'">상 점</li>
			<li class = "event" onclick = "location.href = '<%=request.getContextPath()%>/event.do'">이 벤 트</li>
			<li class = "none"> </li>
			<li class = "login" onclick = "location.href = '<%=request.getContextPath()%>/user_login.do'">로 그 인</li>
		</ul>
	</div>
