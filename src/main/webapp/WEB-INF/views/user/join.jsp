<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/user/join.css" rel="stylesheet" type="text/css">
</head>
<body>

		<!-- top include 지정 -->
		<jsp:include page="../banner/none_top.jsp" />






      <div align="center">
		   <form  method="post" action="<%=request.getContextPath() %>/user_join_ok.do">
			
			<fieldset class="join_field">
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
								<input type="text" name="email1" id="email1"> @ <input type="text" name="email2" id="email2">
								<select name="select_email" id="select_email"   onchange="selectEmail(this)">
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
								<input type="text" class="user_zipcode" name="user_zipcode" id="sample6_postcode" size="7" readonly="readonly">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기">
						</div>
						
						<div class="join_user_addr1">
							<label for="user_addr1">기본주소</label>
								<input type="text" class="user_addr1"   name="user_addr1" id="sample6_address" readonly="readonly">
						</div>
						
						<div class="join_user_addr2">
							<label for="user_addr2">상세주소</label>
								<input type="text" class="user_addr2"   name="user_addr2"   id="sample6_extraAddress">
						</div> 
						
						<br>
						
						<div class="agreement-text">
							<a href="<%=request.getContextPath() %>/policy.do">이용약관</a>
							및
							<a href="<%=request.getContextPath() %>/privacy.do">개인정보처리방침</a>
							내용을 확인 하였으며, 이에 동의합니다.
						</div>
						
							<div class="agreement-checkbox">
							
								<label for="agree_all">
                                  <input type="checkbox" name="agree_all" id="agree_all">
                                    <span>모두 동의합니다</span>
                                 </label>
                                 
                                <label for="agree">
                                  <input type="checkbox" name="agree" value="1">
                                    <span>이용약관 동의<strong>(필수)</strong></span>
                                 </label>
                                 
                                 
                                  <label for="agree">
                                    <input type="checkbox" name="agree" value="2">
                                      <span>개인정보처리방침 동의<strong>(필수)</strong></span>
                                    </label>
                             </div>
                             
                             <div class="join_ok_btn">
                             	<button type="submit">가입완료</button>
                             </div>
						
						
			</fieldset>
		
		</form>
	
	</div>
	
	
			
 		
	   <!-- 회원가입 페이지 -->
             <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
               <script type="text/javascript">
	            
             //이메일 입력방식 선택
	               $('#select_email').change(function(){
		             $("#select_email option:selected").each(function () {
				
				       if($(this).val()== '1'){ //직접입력일 경우
					      $("#email2").val(''); //값 초기화
					        $("#email2").attr("disabled",false); //활성화
				              }else{ //직접입력이 아닐경우
					            $("#email2").val($(this).text());      //선택값 입력
					              $("#email2").attr("disabled",true); //비활성화
				               }
		                    });
		                  });
             
             <!-- 이용약관 및 개인정보처리 방침 checkbox 전체선택-->
             
          // 동의 모두선택 / 해제
             const agreeChkAll = document.querySelector('input[name=agree_all]');
                 agreeChkAll.addEventListener('change', (e) => {
                 let agreeChk = document.querySelectorAll('input[name=agree]');
                 for(let i = 0; i < agreeChk.length; i++){
                   agreeChk[i].checked = e.target.checked;
                 }
             });
             
             
             </script>
       </body>

     <!-- 카카오 주소 API  -->
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
             <script>
                function sample6_execDaumPostcode() {
                   new daum.Postcode({
                     oncomplete: function(data) {
                      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                             var addr = ''; // 주소 변수
                             var extraAddr = ''; // 참고항목 변수

                              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                  addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                         addr = data.jibunAddress;
                                          }

                                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                  if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                       extraAddr += data.bname;
                                  }
                                     // 건물명이 있고, 공동주택일 경우 추가한다.
                                       if(data.buildingName !== '' && data.apartment === 'Y'){
                                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                      }
                                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                      extraAddr = ' (' + extraAddr + ')';
                                  }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    // 주소변수 문자열과 참고항목 문자열 합치기
                                    addr += extraAddr;
                                       } else {
                                                addr += ' ';
                                              }

                             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                             document.getElementById('sample6_postcode').value = data.zonecode;
                             document.getElementById("sample6_address").value = addr;
                             // 커서를 상세주소 필드로 이동한다.
                             document.getElementById("sample6_extraAddress").focus();
                        }
             }).open();
        }
</script>
	
	
</html>