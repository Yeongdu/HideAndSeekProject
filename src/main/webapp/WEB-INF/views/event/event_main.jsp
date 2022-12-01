<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../banner/user_top.jsp"/>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/event/event_main.css" rel="stylesheet" type="text/css">


	<div class = "event_banner" align = "center">
		<h1 class = "event_title">먹어본 적 없는 새로운 맛을 느끼고 싶을 때</h1>
	</div>
	<div class = "event_banner2" align = "center">
		<img src = "resources/image/event_icon.jpg" class = "event_icon">
		<h2 class = "event_title2">굳 완벽</h2>
	</div>
	
	
<script type="text/javascript">
	
	$(document).ready(function(){
		$(".event_banner").fadeIn(1000);
		$(".event_title").fadeIn(100);
		$(".event_title").animate({left:"0"}, 800);	
	});
	
</script>	
</body>

</html>