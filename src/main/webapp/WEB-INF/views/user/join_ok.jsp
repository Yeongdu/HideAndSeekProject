<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>







<!-- top include 지정 -->
<jsp:include page="../banner/none_top.jsp" />

<title>회원가입완료</title>

<link href="resources/css/user/join_ok.css" rel="stylesheet" type="text/css">

	<div style="height: auto; min-height: 100%; margin-top: 15%;">
	
		<div class="join_ok_wrap" align="center">
			<div class="join_ok_logo">
			<img src="resources/image/logo.png"  style="width: 100px; height: 100px;">
			</div>
			
			<div class="join_ok_msg1_wrap">
			 	<span class="join_ok_msg1">회원가입이 완료되었습니다!</span>
			</div>
			
			<div class="join_ok_msg2_wrap">
				<span class="join_ok_msg2">지금부터 술을 특별하고 의미있게 즐길 준비가 되셨나요?</span>
			</div>
			
			<div class="join_ok_msg3_wrap">
				<span class="join_ok_msg3">술래잡기와 함께 나만의 인생술을 찾고 다채로운 술자리를 만들어가봐요!</span>
			</div>
			
			<div class="login_btn_wrap" align="center">
				<input type="button" class="login_btn" value="로그인하러가기" onclick="location.href='<%=request.getContextPath() %>/user_login.do'">
			</div>
			
		
		</div>
		
		     <div class="buttonContainer" style="display: none;">
	           <button class="canvasBtn" id="stopButton">Stop Confetti</button>
	           <button class="canvasBtn" id="startButton">Drop Confetti</button>	
            </div>
		
	
	
	
	
	</div>
	
	<!-- 꽃가루효과출처: 티스토리블로그 https://kmkblog.tistory.com/292?category=1065511 -->
	<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

    <style>
	   canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
    </style>
    
    <canvas id="canvas"></canvas>
	
	<script type="text/javascript">
      
     
    

    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }
    
    
    $(document).ready(function(){  
    	  
    	  function reAction(){
    	  	$("#startButton").trigger("click");
    	  	setTimeout(function(){
    	  		$("#stopButton").trigger("click");
    	  	}, 6000);
    	  }
    	  
    	 
    	      reAction();
    	 
    	});
    

</script>              
		

<jsp:include page="../banner/bottom.jsp" />
   

