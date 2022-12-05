<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../banner/user_top.jsp"/>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/sub/sub_main.css" rel="stylesheet" type="text/css">


	<div id = "section1">
		<div class = "sub_banner" align = "center">
			<h1 class = "sub_title">먹어본 적 없는 새로운 맛을 느끼고 싶을 때</h1>
		</div>
	
		<hr class = "sepa">
		<hr class = "sepa2">
	
		<div class = "sub_banner2" align = "center">
			<img src = "resources/image/sub_icon.jpg" class = "sub_icon">
			<h2 class = "sub_title2">한한국술의 다양한 맛을 느낄 수 있는 최고의 방법</h2>
		</div>
	</div>
	
	<div id = "section2">
		<div class = "sub_banner3" align = "center">
			<h1 class = "sub_title3">여러 종류의 전통주를 마셔볼 수 있는 기회</h1>
			<p class = "sub_title3_cont">당신이 원하던 인생술을 발견할지도 몰라요</p>
			<div class = "sub2" align = "center">
				<img src = "resources/image/sub2.png" class = "sub2">
				<h3 class = "sub2_title">4도부터 53도까지<br>다양한 전통주가 준비되어있어요.</h3>
			</div>
		</div>
	</div>
	
	<div id = "section3">
		<div class ="sub_banner4" align ="center">
			<h1 class = "sub_banner4_title">매 달 새로운 경험을 쌓아드려요</h1>
			<p>계절에 맞추어 변화하는 술래잡기 패키지</p>
			<div class = "sub_package_wrap">
				<img src = "resources/image/sub_package.png" class = "sub_package">
				<div class = "sub_package_info">
					<ul>
						<li>1. 술래잡기가 직접 제작한 특수한 포장 박스</li>
						<li>2. 매월 술에 담긴 정보가 담긴 편지</li>
						<li>3. 이번 달 구독 패키지 술의 정보</li>
						<li>4. 이번 달의 증류주</li>
						<li>5. 이번 달의 와인</li>
						<li>6. 이번 달의 탁주</li>
					</ul>
				</div>
			</div>
			<input type = "button" class = "sub_btn" value = "구독하기" onclick = "location.href='<%=request.getContextPath() %>/sub_insert.do'">
		</div>
	</div>
	
	
<script type="text/javascript">
	
	// 배너 이미지 효과
	$(document).ready(function(){
		$(".sub_banner").fadeIn(1000);
		$(".sub_title").fadeIn(100,function(){
			$(".sub_banner2").fadeIn(1200);
			$(".sub_title2").animate({right:"0"}, 800);
		});
		$(".sub_title").animate({left:"0"}, 800);	
	});
	
	
	// 휠 이벤트
	
	// 윈도우 휠 설정 초기화
	window.addEventListener("wheel", function(e){
	    e.preventDefault();
	},{passive : false});
	
	//한번의 휠 내릴 시 섹션 1개씩만 보이는 이벤트
	var mHtml = $("html");
	var page = 1;
	mHtml.animate({scrollTop : 0},10);
	
	$(window).on("wheel", function(e) {
	    if(mHtml.is(":animated")) return;
	    if(e.originalEvent.deltaY > 0) {
	        if(page == 4) return;
	        page++;
	    } else if(e.originalEvent.deltaY < 0) {
	        if(page == 1) return;
	        page--;
	    }
	    var posTop =(page-1) * $(window).height();
	    mHtml.animate({scrollTop : posTop});
	})
	
</script>	

</body>
</html>