<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User join</title>
</head>
<body>

<!-- 회원가입 페이지 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


//이메일 입력방식 선택
$('#selectEmail').change(function(){
	   $("#selectEmail option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력일 경우
				 $("#str_email02").val('');                        //값 초기화
				 $("#str_email02").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#str_email02").val($(this).text());      //선택값 입력
				 $("#str_email02").attr("disabled",true); //비활성화
			}
	   });
	});
</script>

	<div align="center">
		<form  method="post" action="<%=request.getContextPath() %>/user_join_ok.do">
			<fieldset>
				<legend>회원가입</legend>
				
					<div class="title_1">
						<span>기본정보</span>
						<hr width="45%" align="center">
					</div>
					
						<div class="join_id">
						  <label for="user_id">아이디</label>
						    <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." >
						</div>
						
						<div class="join_pwd">
							<label for="user_pwd">비밀번호</label>
								<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력해주세요.">
						</div>
						
						<div class="join_pwd_check">
							<label for="user_pwd_check">비밀번호 확인</label>
								<input type="password" id="user_pwd_check" name="user_pwd_check" placeholder="비밀번호를 확인해주세요.">
						</div>
						
						<div class="join_name">
							<label for="user_name">이름</label>
								<input type="text" id="user_name" name="user_name">
						</div>
						
						<div class="join_email">
							<label for="user_email">이메일</label>
								<input type="text" name="email1"> @ <input type="text" name="email2">
								<select name="select_email" onchange="selectEmail(this)">
									<option value="" selected>선택하세요.</option>
									<option value="naver">naver.com</option>
									<option value="gmail">gmail.com</option>
									<option value="hanmail">hanmail.com</option>
									<option value="1">직접입력</option>
								</select>
						</div>
						
						<div class="join_phone">
							<label for="user_phone">전화번호</label>
								<input type="text" id="user_phone" name="user_phone" placeholder="전화번호를 입력해주세요.">
						</div>
						
						<div class="join_idnum">
							<label for="user_idnum">주민등록번호</label>
							<input type="text" maxlength="6"> - <input type="password" maxlength="7">
						</div>
						
						<br>
						
						<div class="title_2">
						  <span>선택정보</span>
						    <hr width="45%" align="center">
						</div>
						
						<div class="join_zipcode">
							<label for="user_zipcode">우편번호</label>
								<input type="text" name="user_zipcode" id="user_zipcode" size="7">
								<input type="button" value="우편번호찾기">
						</div>
			
			</fieldset>
		
		</form>
	
	</div>

</body>
</html>