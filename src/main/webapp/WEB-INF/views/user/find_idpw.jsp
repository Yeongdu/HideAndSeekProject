<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 
<link href="resources/css/user/find_idpw.css" rel="stylesheet" type="text/css">
   
   <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
<title>아이디/비밀번호 찾기</title>


		
		
    <div class="main_wrap" align="center">
       
       <div class="main_title_wrap">
       		<span>아이디 / 비밀번호 찾기</span>
       </div>
   
        <!-- 아이디찾기 폼 -->
   
		<div class="find_id_main_wrap">
	      <h4 class="find_id_title">아이디 찾기</h4>
            <form action="findIdMail.do" method="post">
              <div class="find_id_emailinput_wrap">
                <input type="text" name="tomail"  id="tomail" placeholder="회원가입 시 입력했던 이메일을 기재해주세요." class="find_id_input">
                </div>

    
    
                <div align="center">
                  <input type="button" value="아이디 찾기"   onclick="findIdCheck()" class="find_id_btn">
                </div>
             </form>
           </div>
           
           <div style="width: 550px;">
           	<hr style="width: 100%; margin-top: 40px; color: #dcdcdc;">
           </div>
    
    
    		<!-- 비밀번호 폼 -->
    		
    		<div class="find_pw_main_wrap">
              <h4 class="find_pw_title">비밀번호 찾기</h4>
                <form action="<%=request.getContextPath() %>/findPwMail.do" method="post">
    
    	          <div class="find_pw_idinput_wrap">
    		        <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." class="find_pw_idinput">
    	          </div>
    
    
    
                   <div class="find_pw_emailinput_wrap">
                      <input type="text" name="tomail1"  id="tomail1" placeholder="회원가입 시 입력했던 이메일을 기재해주세요."
                      class="find_pw_emailinput">
                   </div>


                <div align="center">
                  <input type="button" value="비밀번호 찾기"   onclick="findPwCheck()"    class="find_pw_btn">
               </div>
            </form>
          </div>
      </div>
    
    
    
    
    
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
    <!-- 아이디 찾기 -->
    var findIdCheck = function() {
    	
    	var email = document.getElementById('tomail').value;
		
    	$.ajax({
    		type: 'post',
    		url: '<%=request.getContextPath() %>/findIdMail.do',
    		data : {'tomail':email},
    		dataType: 'text',
    		success :function(result){
    			if(result == 1){
    				alert('해당 이메일로 아이디를 보냈습니다.');
    				location.href = "store.do";
    			}else{
    				alert('해당 이메일로 확인되는 아이디가 없습니다.');
    				
    			}
    		}
    	});
	}
    
    
          <!-- 비밀번호 찾기 -->
    
        var findPwCheck = function() {
    	
    	var email = document.getElementById('tomail1').value;
    	var id = document.getElementById('id').value;
		
    	$.ajax({
    		type: 'post',
    		url: '<%=request.getContextPath() %>/findPwMail.do',
    		data : {tomail1: $("#tomail1").val(),
    			     id:$("#id").val()},
    		dataType: 'text',
    		success :function(result){
    			 if(result == 1){
    				 alert('해당 이메일로 임시 비밀번호를 보냈습니다.');
    				 location.href="store.do";
    			 }else{
    				 alert('해당 정보로 확인되는 데이터가 없습니다.');
    			
    			}
    		}
    	});
	} 
    
        
    <!-- 로딩 조절-->
    
    
    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }
    
    
    
    
    
    
    
    </script>

<!-- bottom include 지정  -->
<jsp:include page="../banner/bottom.jsp" />