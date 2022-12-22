<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- top include 지정 -->
<jsp:include page="../banner/none_top.jsp" />

<title>회원가입완료</title>
<link href="resources/css/user/join_ok.css" rel="stylesheet" type="text/css">

	<div style="height: auto; min-height: 100%">
	
		<div class="join_ok_wrap" align="center">
			<div class="join_ok_logo">
			<img src="resources/image/logo.png"  style="width: 100px; height: 100px;">
			</div>
			
			<div class="join_ok_msg1_wrap">
			 	<span class="join_ok_msg1">회원가입이 완료되었습니다.</span>
			</div>
			
			<div class="join_ok_msg2_wrap">
				<span class="join_ok_msg2">지금부터 술을 특별하고 의미있게 즐길 준비가 되셨나요?</span>
			</div>
			
			<div class="join_ok_msg3_wrap">
				<span class="join_ok_msg3">술래잡기와 함께 나만의 인생술을 찾고 다채로운 술자리를 만들어가봐요!</span>
			</div>
			
			<div class="login_btn_wrap">
				<input type="button" value="로그인하러가기" onclick="location.href='<%=request.getContextPath() %>/user_login.do'">
			</div>
			
		
		</div>
	
	
	
	
	</div>
	
	
	                     
     <script type="text/javascript">

    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }
    
    

</script>              
		

<jsp:include page="../banner/bottom.jsp" />
   

