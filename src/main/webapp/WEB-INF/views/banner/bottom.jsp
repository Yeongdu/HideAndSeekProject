<div style = "position: fixed; bottom: 20px; right: 20px; display:none;" class = "ontop">
	<img src = "resources/image/ontop.png" class = "ontop_img" onmouseover = "this.src ='resources/image/ontop_hover.png'" onmouseout = "this.src ='resources/image/ontop.png'">
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
// 일정 페이지 아래로 내려가면 맨 위로 올라가는 버튼 활성화
$(document).ready(function() {
	$(window).scroll(function() {
	    // top button controll
	    if ($(this).scrollTop() > 500) {
	        $('.ontop').fadeIn();
	    } else {
	        $('.ontop').fadeOut();
	        $("html").css("scroll-behavior", "");
	    }
	});
	
	$(".ontop").click(function(){
		$("html").animate({scrollTop : 0},300);
	});
});
</script>
    <link href="resources/css/banner/bottom.css" rel="stylesheet" type="text/css">
<div id = "footer">
		<div class = "footer_title">
			<h3>술래잡기</h3>
			<p>고객센터 : 070-1234-5678</p>
			<p>평일 09:00 ~ 18:00, 주말 휴무</p>
		</div>
		
		<div class = "footer_info">
			<p style = "font-size: 17px;"><b>Final Project</b></p>
			<p style = "font-size: 10px;">관리자 : 전영주 이현지 김예지 정영훈 김경령</p>
		</div>
		
		<div class = "footer_terms">
			<p>술래잡기 사이트는 spring 프로젝트를 통해 만들어졌습니다.</p>
			<p>해당 사이트는 상업적 영리를 취득하지 않는 팀 프로젝트입니다</p>
		</div>
	</div>

</body>
</html>