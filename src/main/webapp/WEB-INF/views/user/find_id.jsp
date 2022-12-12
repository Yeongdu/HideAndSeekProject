<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>


<title>아이디 찾기</title>

	<div class="find_id_Wrap">
	
		<div class="find_id">
			<form method="post"  action="<%=request.getContextPath() %>/find_id_email">
				
				
				<div class="find_id_title">
                             			<span>아이디 찾기</span>
                             		</div>
                             		
                             <div class="find_id_inner_wrap">
                             
                             	<div class="find_id_inner_title">
                             		<span>아이디는 가입시 입력한 이메일을 통해 찾을 수 있습니다.</span>
                             	
                             	</div>
                             
                             	<br>
                            
                                <div class="find_id_input_wrap">
                                
                                	<!-- 이메일 입력 창 -->
                                    <div class="find_id_input">
                                        <i class="bi bi-person" style="font-size: 25px;"></i>&nbsp;<input type="text" id="findid_email" name="user_email" placeholder="이메일을 입력하세요." title="아이디"
                                               class="input_id" maxlength="41">
                                       </div>
                                       
                                       <br>
                                       
                                        
                                </div>
                                
                                   <br>
                                
                                <div class="find_id_input_btn" >

                                   <button type="submit" class="btn_find_id" id="btn_find_id" >
                                        <span class="btn_text">아이디 찾기</span>
                                    </button>

                                </div>
                                <br>
                                
                                </div>
                                
                                	<!-- 아이디, 비밀번호 찾기 및 회원가입 버튼 -->
                                	
                                	<div class="find_wrap">
                                	
                                		
                                		
                                		
                                		
                                		<div class="find_pw">
                                		   <a class="find_pw_a"  href="<%=request.getContextPath() %>/find_pw.do">비밀번호 찾기</a>
                                		</div>
                                		
                                		<div class="join_form">
                                			<a  class="join_form_a"  href="<%=request.getContextPath() %>/join_form.do">회원가입</a>
                                		
                                		</div>
                                		
                                		<div class="login_form">
                                			<a class="login_form_a"   onclick="location.href = '<%=request.getContextPath() %>/user_login.do'">로그인</a>
                                		</div>
                                		
                                		
                                	</div>
			
			
			
			
			</form>
		</div>
	
	
	
	
	</div>
	
	<%-- <script type="text/javascript">
	
	$("#btn_find_id").click(function() {
		const userEmail = $("#findid_email").val();
		
		$ajax({
			type:'post',
			url: '<%=request.getContextPath() %>/find_id_check.do',
			data: {userEmail:userEmail},
			dataType : 'text',
			success: function (result) {
				if(result == "no"){
					//일치하는 이메일이 있을 때
					alert('이메일을 전송 했습니다.');
					sendEmail.submit();
				}
				
			}
			
		})
	});

	
	
</script> --%>



<jsp:include page="../banner/bottom.jsp" />
