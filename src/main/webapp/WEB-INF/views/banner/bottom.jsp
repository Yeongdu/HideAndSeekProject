
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">

	// 로딩 페이지 종료 이벤트
    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }

</script>
<div style = "position: fixed; bottom: 20px; right: 20px; display:none; margin-right: 100px; margin-bottom: 10px;" class = "ontop">
	<a href="#">
		<img src = "resources/image/ontop.png" class = "ontop_img" onmouseover = "this.src ='resources/image/ontop_hover.png'">
	</a>
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

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "c28cf7ff-8589-4abc-8a09-fbe66b1d39d4"
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