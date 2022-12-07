<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <link href="resources/css/join.css" rel="stylesheet" type="text/css">
  


		<!-- top include 지정 -->
		<jsp:include page="../banner/none_top.jsp" />






      <div align="center" style="height: 100%;">
		   <form  name="form1" method="post" action="<%=request.getContextPath() %>/user_join_ok.do">
			
			<fieldset class="join_field">
				<legend>회원가입</legend>
				
					<div class="title_1">
						<span>기본정보</span>
						<hr width="45%" align="center">
					</div>
					
						<div class="join_id">
						  <label for="user_id">아이디</label>
						  	<div>
						       <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." >
						     </div>
						        <button id="idbtn" type="button" class="idbtn">중복검사</button>
                                  <span id="spanid"></span>
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
							<input type="text"  name="juminnum" maxlength="6"> - <input type="password"  name="juminnum2" maxlength="7">
							<input type="button" value="성인인증" onclick="getAge();">
 
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
						<hr width="45%" align="center">
						
						
						
							<div class="agreement-checkbox">
							
								<label for="agree_all">
                                  <input type="checkbox" name="agree_all" id="agree_all">
                                    <span>모두 동의합니다</span>
                                 </label><br>
                                 
                                 
                                 
                                
                                 
    <div class="container-fluid">
 
    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    
      <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
      <div class="panel panel-default" style="width: 800px;">
        <div class="panel-heading"  role="tab">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
            이용약관 동의 
            </a>
            <label for="agree">
          <input type="checkbox" name="agree" value="1">
             <span>이용약관 동의<strong>(필수)</strong></span>
               </label><br>
        </div>
       
       
       <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
          <div class="panel-body">
            Hello world1
          </div>
        </div>
      </div>
      
      
      
      <!-- -->
      <!-- 하나의 item입니다.  -->
      <div class="panel panel-default" style="width: 800px;">
        <div class="panel-heading" role="tab">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
           개인정보처리방침 동의
          </a>
          <label for="agree">
            <input type="checkbox" name="agree" value="2">
               <span>개인정보처리방침 동의<strong>(필수)</strong></span>
                 </label><br>
        </div>
        <div id="collapse2" class="panel-collapse collapse" role="tabpanel">
          <div class="panel-body">
            Hello world2
          </div>
        </div>
      </div>
      
      
     
    
    </div>
  
  </div>
  
          </div>
                             
              <div class="agreement-text">
				 <p>이용약관 및 개인정보처리방침 내용을 확인 하였으며, 이에 동의합니다.</p>
					
						</div>
                             
                             <div class="join_ok_btn">
                             	<button type="submit">가입완료</button>
                             </div>
						
						
			</fieldset>
		
		</form>
	
	</div>
	
	
			
 		
	   <!-- 회원가입 페이지 -->
             
           <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
                 
                 <!-- 생년월일로 성인인증 처리 -->
                 // 주민등록상 생일을 현재 날짜와 비교하여 나이계산 (만)
                 function getAge() {
                 
                  jumin1 = document.form1.juminnum.value;
                 
                  jumin2 = document.form1.juminnum2.value;
                 
                 
                  var curDateObj = new Date(); // 날짜 Object 생성
                  var tmpSSN = jumin1; // 주민번호
                  var curDate = ''; // 현재일자
                  var tmpAge = 0; // 임시나이
                  var y = curDateObj.getFullYear(); // 현재년도
                  var m = curDateObj.getMonth() + 1; // 현재월
                  if(m < 10) m = '0' + m; // 현재 월이 10보다 작을경우 '0' 문자 합한다
                  var d = curDateObj.getDate(); // 현재일
                  if(d < 10) d = '0' + d; // 현재 일이 10보다 작을경우 '0' 문자 합한다
                  curDate = y + m + d;
                 
                  var genType = jumin2.substring(0, 1); // 주민번호 성별구분 문자 추출
                 

                if(parseInt(tmpSSN.substring(0, 2))<25 && genType < 3 ){

                 alert("주민등록번호를 다시 확인해주세요.");

                  return false;

                }


                if(parseInt(tmpSSN.substring(0, 2))>25 && genType > 2 ){

                 alert("주민등록번호를 다시 확인해주세요.");

                  return false;

                }



                  if(genType <= 2) {
                  tmpAge = y - (1900 + parseInt(tmpSSN.substring(0, 2))); // 1, 2 일경우
                  } else {
                  tmpAge = y - (2000 + parseInt(tmpSSN.substring(0, 2))); // 그 외의 경우
                  }


                 
                  var tmpBirthday = tmpSSN.substring(2, 6); // 주민번호 4자리 생일문자 추출
                 
                  if(curDate > (y + tmpBirthday)) {
                  tmpAge += 1;
                  }
                 
                 
                  if(parseInt(tmpAge)>19){
                 
                  alert ("성인인증 완료")
                 
                 
                 
                  }else{
                  alert ("미성년으로 구입할 수 없습니다.")
                   
                   document.form1.juminnum.value = "";
                  
                   document.form1.juminnum2.value = "";
                  
                    

                  }
                 
                 
                 }//getAge() end
                 
                 $(function() {
                	 
                	 
                	//id입력시 - id keyup
                		$('#user_id').on('keyup', function(){ // keyup -> 입력할 때 
                			idval = $('#user_id').val().trim();
                			
                			idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/; // [a-zA-Z]한 자리 차지해서 4~12자리
                			
                			if(!(idreg.test(idval))){
                				$(this).css('border', '2px solid red');
                				//중복검사버튼 비활성 - 속성설정 prop
                				$('#idbtn').prop('disabled',true);
                			}else{
                				$(this).css('border', '2px solid blue');
                				//중복검사버튼 활성
                				$('#idbtn').prop('disabled',false);
                				
                			}
                		});  //id입력시 - id keyup end
                		
                		
                		
                		/* 아이디 중복검사 */
                		$('#idbtn').on('click',function(){
                			idvalue = $('#user_id').val().trim();
                			
                			if(idvalue.length < 1){
                				alert("아이디를 입력하세요");
                				return false;
                			}
                			
                			if(idvalue.length < 4 || idvalue.length > 12){
                				alert("id는 4~12 사이");
                				return false;
                			}
                			
                			//정규식 체크 - idcheck() 호출
                			if(!idcheck())return false;
                			
                			//정규식 체크 통과하면 서버로 전송하기
                			$.ajax({
                				url : '/finalPJ/CheckId.do',
                				data : {"user_id" : idvalue}, // data : "id=" + idvalue
                				type : 'get',
                				success : function(res){
                					$('#spanid').html(res.sw).css('color', 'red');
                				},
                				error : function(xhr){
                					alert("상태 : " + xhr.status); //404(이름,path), 500(콘솔확인), 200(json형태 - jsp페이지확인)
                				},
                				dataType : 'json'
                			});
                			
                		});
                	
                	
                	
					
				})
                 
				  window.onload = function () {
                     $(".loading").fadeOut(100,function(){
                         $("#div_load_image").fadeOut(300);
                     });
                 }

                 
                 
              
                 
                 
                 
             
             
             </script>
     
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
	
<jsp:include page="../banner/bottom.jsp" />