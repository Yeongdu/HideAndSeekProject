<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<body>

<h4>아이디 찾기</h4>
    <form action="findIdMail.do" method="post">
    
    	<div>
    		<input type="text" name="user_id" id="user_id" size="120" style="width: 80%"
    		placeholder="아이디를 입력해주세요" class="form-control">
    	</div>
    
    
    
      <div>
        <input type="text" name="tomail"  id="tomail" size="120"
        style="width: 100%" placeholder="회원가입 시 입력했던 이메일을 기재해주세요"
        class="form-control">
      </div>


     
       
      <div align="center">
        <input type="button" value="메일 보내기"   onclick="findPwCheck()"    class="btn btn-warning">
      </div>
    </form>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
    
    var findPwCheck = function() {
    	
    	var email = document.getElementById('tomail').value;
    	var id = document.getElementById('user_id').value;
		
    	$.ajax({
    		type: 'post',
    		url: '<%=request.getContextPath() %>/findPwMail.do',
    		data : {'tomail':email,
    			     'id':id},
    		dataType: 'text',
    		success :function(result){
    			if(result == 1){
    				alert('해당 이메일로 임시 비밀번호를 보냈습니다.');
    				location.href = "store.do";
    			}else{
    				alert('입력하신 정보를 확인해주세요.'');
    				
    			}
    		}
    	});
	}
    
    
    </script>



</body>
</html>