<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		$("#title").fadeIn(500, function(){
			$("#title").animate({top:"10%"}, function(){
				$("#btn").fadeIn(500);	
			});
		});
	});

</script>
</head>
<body>

	<div id="div_load_image" style="position:absolute; width:100%;height:100%; z-index:9999; background:#FCFCFC; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
     	 <img src="resources/image/loading_new.gif" style="width:400px; height:400px; position:relative; top:30%; display:hidden;" class = "loading">
  	</div>

	<div id = "main" align = "center">
		<div align = "center" id = "title" style = "display: none" align = "center">
			<ul class = "title_wrap">
				<li><h1 class = "title">양조장에서 집 까지 찾아오는</h1></li>
				<li><h2 class = "title2">한국의 전통적인 전통주</h2></li>
			</ul>
			
			
		</div>

		<div align = "center" id = "btn" style = "display: none" align = "center">
			<input type = "button" class = "inputBtn" <%-- onclick = "location.href = '<%=request.getContextPath() %>/store.do'" --%> value = "about">
		</div>
	</div>
	
	<script>
	// store 진입 시 로딩 
	$(".inputBtn").on("click", function(){
		$(".loading").fadeIn(100, function(){
			$("#div_load_image").fadeIn(300, function(){
				location.href = "<%=request.getContextPath()%>/store.do";				
			});
		});
	});
	
	// 로딩 페이지 종료 이벤트
    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }
	</script>

</body>

</html>
