<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <!-- top include 지정 -->
		<jsp:include page="../banner/none_top.jsp" />


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<link href="resources/css/user/login.css" rel="stylesheet" type="text/css">

<div style="height:auto; min-height: 100%;">
		
		
                        <!-- 로그인 창 -->
		                  
                             <div class="login_input_wrap" align="center" >
                             	
                             			<form action="user_check.do" method="post">
                             		
                             		<div class="login_input_wrap_title">
                             			<span>입장하기</span>
                             		</div>
                             		
                             <div class="login_input_inner_wrap">
                             
                             	<br>
                            
                                <div class="login_input_id_pw_wrap">
                                
                                	<!-- 아이디 입력 창 -->
                                    <div class="login_input_id">
                                        <i class="bi bi-person" style="font-size: 25px;"></i>&nbsp;<input type="text" id="id" name="id" placeholder="아이디" title="아이디"
                                               class="input_id" maxlength="41"
                                               >
                                       </div>
                                       
                                       <br>
                                       
                                       <!-- 비밀번호 입력 창 -->
                                       <div class="login_input_pw">
                                        
                                        <i class="bi bi-lock" style="font-size: 25px;"></i>&nbsp;<input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호"
                                               class="input_pw" maxlength="16">
                                        </div>
                                        
                                </div>
                                
                                   <br>
                                
                                <div class="login_input_btn" >

                                   <button type="submit" class="btn_login" >
                                        <span class="btn_text">로그인</span>
                                    </button>

                                </div>
                                <br>
                                
                                </div>
                                
                                	<!-- 아이디, 비밀번호 찾기 및 회원가입 버튼 -->
                                	
                                	<div class="find_wrap">
                                	
                                		
                                		
                                		<div class="find_id">
                                			<a class="find_id_a"   onclick="location.href = '<%=request.getContextPath() %>/find_idpw.do'">아이디 / 비밀번호 찾기</a>
                                		</div>
                                		
                                		
                                		<%-- 
                                		<div class="find_pw">
                                		   <a class="find_pw_a"  href="<%=request.getContextPath() %>/find_pw.do">비밀번호 찾기</a>
                                		</div>
                                		 --%>
                                		<div class="join_form">
                                			<a  class="join_form_a"  href="<%=request.getContextPath() %>/join_form.do">회원가입</a>
                                		
                                		</div>
                                		
                                		
                                	</div>
                                	</form>
                             
                                
                              </div>
                             </div>
                              <!-- 로그인 창 end -->
                        
                            
                        
     <script type="text/javascript">

    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }
    
    

</script>              
		

<jsp:include page="../banner/bottom.jsp" />
   