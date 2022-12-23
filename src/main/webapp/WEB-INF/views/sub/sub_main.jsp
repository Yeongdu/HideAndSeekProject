<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>구독하기</title>
    
	<c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/sub/sub_main.css" rel="stylesheet" type="text/css">

<div id = "sub_main">
	<div id = "section1" class = "section-box">
		<div class = "sub_banner" align = "center">
			<h1 class = "sub_title">먹어본 적 없는 새로운 맛을 느끼고 싶을 때</h1>
		</div>
	
		<hr class = "sepa">
		<hr class = "sepa2">
	
		<div class = "sub_banner2" align = "center">
			<img src = "resources/image/sub_icon.jpg" class = "sub_icon">
			<h2 class = "sub_title2">한국술의 다양한 맛을 느낄 수 있는 최고의 방법</h2>
		</div>
	</div>
	
	<div id = "section2" class = "section-box">
		<div class = "sub_section2">
		<div class = "sub_banner3" align = "center">
			<h1 class = "sub_title3">여러 종류의 전통주를 마셔볼 수 있는 기회</h1>
			<p class = "sub_title3_cont">당신이 원하던 인생술을 발견할지도 몰라요</p>
			<div class = "sub2" align = "center">
				<img src = "resources/image/sub2.png" class = "sub2_img">
				<h3 class = "sub2_title">4도부터 53도까지<br>다양한 전통주가 준비되어있어요.</h3>
			</div>
		</div>
		</div>
	</div>
	
	<div id = "section3" class = "section-box">
		<div class ="sub_banner4" align ="center">
			<div id = "sub_info_main_1">
				<div class = "sub_info_title_wrap">
					<h1>한 달에 한 번 찾아오는 인생술</h1>
					<h2>당신을 위한 구독서비스를 신청해보세요</h2>
				</div>
				<div class = "sub_info_wrap">
					<img src = "resources/image/damhwabox.png" class = "sub_info_img">
					<div class = "sub_info_top_wrap">
					<div class = "sub_info_cont">
						<div class = "sub_info_cont_wrap">
							<span class = "sub_info_title">${sdto.getSub_package() }</span>
							<span class = "sub_info_price"><fmt:formatNumber>${sdto.getSub_price() }</fmt:formatNumber>원/월</span>
						</div>
						<span class = "sub_title_cont">다양한 술이 담겨있는 술래잡기만의 박스</span>
					</div>
						<input type = "hidden" value = "${sdto.getSub_package_no() }" class = "package_no">
						<hr style = "width: 10%; color: #707070; border: 0.5px solid rgb(224, 224, 224); text-align: left; margin-left: 0;">
					
					<div class = "sub_info_date">
						<div class = "sub_info_date_left">
							<span class = "sub_start">신청일 </span>
							<span class = "sub_start_date"><fmt:formatDate value="${sdto.getSub_date() }" pattern="yyyy년 MM월 dd일"/></span>
						</div>
						<div class = "sub_info_date_right">
							<span class = "sub_start">마감일 </span>
							<span class = "sub_start_date"><fmt:formatDate value="${sdto.getSub_enddate() }" pattern="yyyy년 MM월 dd일"/></span>
						</div>
					</div>
				</div>
				</div>
			</div> <%-- sub_info_main_1의 end --%>  
			<input type = "hidden" value = ${userId } class = "user_id">
			<input type = "button" class = "sub_btn" value = "구독하러 가기 &nbsp;&nbsp;>">
		</div>
	</div>
</div>

<script type="text/javascript">

	var id = '<%=(String)session.getAttribute("userId")%>';
	
	$(".sub_btn").on("click", function(){
        if(id != "null"){
        	
        	$.ajax({
        		type : "post",
        		url : "<%=request.getContextPath()%>/sub_check.do">,
        		data : {userId : id},
        		datatype : "text",
        		success : function(result){
        			if(result == 1){
        				swal("구독회원", "이미 구독중인 회원입니다.", "warning");
        			}else if(result == 0){
        				location.href = "<%=request.getContextPath() %>/sub_info.do?userId="+id;
        			}
        		}
        	});
        	
        }else {
            location.href = "user_login_sub.do";
        }
    });

	// 페이지가 새로고침될 때마다 스크롤을 최상단으로 이동
	$(document).ready(function () {
		$('html, body').animate({
			scrollTop: $('html').offset().top
		}, 'fast');
	});

	window.onload = function () {
		$(".loading").fadeOut(100,function(){
			$("#div_load_image").fadeOut(300);
		});
	}
	
	// 배너 이미지 효과
	$(document).ready(function(){
		$(".sub_banner").fadeIn(1000);
		$(".sub_title").fadeIn(100,function(){
			$(".sub_banner2").fadeIn(1200);
			$(".sub_title2").animate({right:"0"}, 800);
		});
		$(".sub_title").animate({left:"0"}, 800);	
	});
	

	// section 한개가 내려갈때마다 이벤트 발생
 	var ani1 = false;
    var ani2 = false;
    var height1 = $("#section1").height();
    var height2 = $("#section2").height();
    var height3 = $("#section3").height();
    
    var mHtml = $("html");
    
    $(document).ready(function(){
    	$("#footer").css("top", height1);
    });
    
    $("#section1").on('mousewheel',function(e){ 
        var wheels = e.originalEvent.wheelDelta; 
              if(wheels>0){ 
                //스크롤 올릴때 
              } else { 
                //스크롤  내릴때 
                if(ani1==false){
                  //ani1 false 이면 true 로 바꿔주고 애니메이션 동작 진행
                    ani1=true;
                    $("#section2").fadeIn(100, function(){
                    	$("#section2 .sub_title3").animate({left:"0"}, 500);
                        $("#section2 .sub_title3_cont").animate({right:"0"}, 500);
                        $(".sub2").slideDown(500);
                        $(".sub2_title").fadeIn(500);
                    });
                    $("#footer").animate({top : height1});
                }
              }
            }); 
    
    $("#section2").on('mousewheel',function(e){ 
    	var wheels2 = e.originalEvent.wheelDelta;
              if(wheels2>0){ 
              } else { 
                if(ani2==false){
                    ani2=true;
                    $("#section3").fadeIn(300);
                    $("#footer").animate({top : height1+height2});
                }
              }
            }); 
</script>	

<jsp:include page="../banner/bottom.jsp" />