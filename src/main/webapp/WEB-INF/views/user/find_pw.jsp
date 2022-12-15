<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<body>

<h4>비밀번호 찾기</h4>
    <form action="<%=request.getContextPath() %>/findPwMail.do" method="post">
    
    	<div>
    		<input type="text" name="id" id="id" size="120" style="width: 80%"
    		placeholder="아이디를 입력해주세요" class="form-control">
    	</div>
    
    
    
      <div>
        <input type="text" name="tomail"  id="tomail" size="120"
        style="width: 100%" placeholder="회원가입 시 입력했던 이메일을 기재해주세요"
        class="form-control">
      </div>


     
       
      <div align="center">
        <input type="submit" value="메일 보내기"   onclick="findPwCheck()"    class="btn btn-warning">
      </div>
    </form>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
  
    var findPwCheck = function() {
    	
    	var email = document.getElementById('tomail').value;
    	var id = document.getElementById('id').value;
		
    	$.ajax({
    		type: 'post',
    		url: '<%=request.getContextPath() %>/findPwMail.do',
    		data : {tomail: $("#tomail").val(),
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
    
    
    </script>



</body>
</html>