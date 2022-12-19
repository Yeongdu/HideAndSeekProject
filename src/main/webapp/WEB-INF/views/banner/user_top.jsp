<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,600,0,0" />
<link href="resources/css/banner/banner.css" rel="stylesheet" type="text/css">
<link href="resources/css/reset.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
</head>
	<div id="div_load_image" style="position:absolute; width:100%;height:100%; z-index:9999; background:#FCFCFC; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
     	 <img src="resources/image/loading_new.gif" style="width:400px; height:400px; position:relative; top:30%;" class = "loading">
  	</div>

	<div id = "header">
		<ul class = "header_wrap">
			<li class = "logo" onclick = "location.href = '<%=request.getContextPath()%>'"><img src = "resources/image/logo.png"></li>
			<li class = "sub" onclick = "location.href = '<%=request.getContextPath()%>/sub.do'">구 독</li>
			<li class = "store" <%-- onclick = "location.href = '<%=request.getContextPath()%>/store.do'" --%>>상 점</li>
			<li class = "event" onclick = "location.href = '<%=request.getContextPath()%>/event.do'">이 벤 트</li>
			<li class = "none"> </li>
			<li class = "user_name" onclick = "location.href = '<%=request.getContextPath()%>/mypage.do'">
			<label for = "user_name">${userId }</label>님
			</li>
			<li class = "login" onclick = "location.href = '<%=request.getContextPath()%>/user_logout.do'">로그아웃</li>
			<li class = "cart" onclick = "location.href='<%=request.getContextPath()%>/cart.do'">
				<div class="cart_icon">
						<div class="cart_circle" align = "right">
							<span class="cart_count">${rcount }</span>
						</div>
				</div>
			</li>
		</ul>
	</div>
	
	<script type="text/javascript">
		// store 진입 시 로딩 
		$(".store").on("click", function(){
			$(".loading").fadeIn(100, function(){
				$("#div_load_image").fadeIn(300, function(){
					location.href = "<%=request.getContextPath()%>/store.do";				
				});
			});
		});
	</script>
