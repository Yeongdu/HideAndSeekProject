<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">

/* $(document).ready(function () {
    var $title_wrap = $(".title_wrap");
    var $title = $("#title");

    $("#title").click(function (e) {
        var output = "";
        var panel_x = $panel.offset().left;
        var panel_y = $panel.offset().top;

        output += "클릭한 지역 위치(x, y) = " + e.clientX + ", " + e.clientY + "<br>";
        output += "문서 기준 위치(x, y) = " + e.pageX + ", " + e.pageY;

        $fish.stop().animate({ // stop()을 넣어주면 애니메이션 도중에 다른 애니메이션을 실행시킬 수 있다.
            left: e.clientX - panel_x,
            top: e.clientY - panel_y
        }, 1000, "easeOutExpo");

        $("#info").html(output);
    }

    );

}); */


	$(document).ready(function(){
		$("#title").fadeIn(1000, function(){
			$("#title").animate({top:"10%"}, function(){
				$("#btn").fadeIn(500);	
			});
		});
	});

</script>
</head>
<body style = "background-image: url('resources/image/main.png')">

	<jsp:include page="banner/none_top.jsp" />

	<div id = "main" align = "center">
		<div align = "center" id = "title" style = "display: none">
			<ul class = "title_wrap">
				<li><span class = "title">양조장에서 집 까지 찾아오는</span></li>
				<li><span class = "title2">한국의 전통적인 전통주</span></li>
			</ul>
			
			
		</div>

		<div align = "center" id = "btn" style = "display: none">
			<input type = "button" class = "inputBtn" onclick = "location.href = '<%=request.getContextPath() %>/store.do'" value = "about">
		</div>
	</div>

</body>


</html>
