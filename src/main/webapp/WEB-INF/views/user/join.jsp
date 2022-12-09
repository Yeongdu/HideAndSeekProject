<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<title>회원가입</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <link href="resources/css/join.css" rel="stylesheet" type="text/css">
  


		<!-- top include 지정 -->
		<jsp:include page="../banner/none_top.jsp" />






      <div align="center">
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
						       <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요."   onblur="idCheck()"     required><br>
						     		<span id="idcheck"></span>
						     </div>
						        
          
						</div>
						
						<div class="join_pwd">
							<label for="user_pwd">비밀번호</label>
								<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력해주세요."  required><br>
								    <span id="pwcheck"></span>
						</div>
						
						<div class="join_pwd_check">
							<label for="user_pwd_check">비밀번호 확인</label>
								<input type="password" id="user_pwd_check" name="user_pwd_check" placeholder="비밀번호를 확인해주세요." required><br>
								<span id="pwcheck2"></span>
						</div>
						
						<div class="join_name">
							<label for="user_name">이름</label>
								<input type="text" id="user_name" name="user_name" required>
						</div>
						
						<div class="join_email">
							<label for="user_email">이메일</label>
								<input type="email" name="user_email" id="user_email" onblur="emailCheck()" required><br>
								<span id="emailcheck"></span>
						</div>
						
						<div class="join_phone">
                            <label for="user_phone">전화번호</label>
                              <select name="user_phone1" id="user_phone1" onchange="user_phone1(this.value)" required>
                                <option value="" selected>선택하세요.</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                </select>

                            <span> - </span><input type="text" name="user_phone2" id="user_phone2" required><span> - </span><input type="text" name="user_phone3" id="user_phone3" required>
                        </div>



						
						<div class="join_idnum">
							<label for="user_idnum">주민등록번호</label>
							<input type="text"  name="user_jumin1" id="user_jumin1"   maxlength="6" required><span> - </span><input type="password"  name="user_jumin2"  id="user_jumin2"  maxlength="7" required>
							<input type="checkbox" value="성인인증"  class="chk1" id="chk1"  name="chk1" onclick="getAge();" required>
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
                      <input type="checkbox" name="agree_all" id="agree_all" required>
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
                                               <input type="checkbox" name="agree" value="1" required>
                                             <span>이용약관 동의<strong>(필수)</strong></span>
                                            </label><br>
                                          </div>
       
       
                <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
                  <div class="panel-body">
                    Hello world1
                  </div>
                </div>
             </div>
      
      <!-- 하나의 item입니다.  -->
      <div class="panel panel-default" style="width: 800px;">
        <div class="panel-heading" role="tab">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
           개인정보처리방침 동의
          </a>
          <label for="agree">
            <input type="checkbox" name="agree" value="2" required>
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
                 
                  jumin1 = document.form1.user_jumin1.value;
                 
                  jumin2 = document.form1.user_jumin2.value;
                 
                 
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
                  
                  
                  if(document.form1.user_jumin1.value == ''){
                	  
                	  document.getElementById("chk1").checked = false;
                	  
                	  return false;
                  }
                  
                 

                if(parseInt(tmpSSN.substring(0, 2))<25 && genType < 3 ){

                 alert("주민등록번호를 다시 확인해주세요.");
                 
                 document.getElementById("chk1").checked = false;

                  return false;

                }


                if(parseInt(tmpSSN.substring(0, 2))>25 && genType > 2 ){

                 alert("주민등록번호를 다시 확인해주세요.");
                 
                 document.getElementById("chk1").checked = false;

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
                   
                   document.form1.user_jumin1.value = "";
                  
                   document.form1.user_jumin2.value = "";
                   
                   document.getElementById("chk1").checked = false;
                  
                    

                  }
                 
                 
                 }//getAge() end
                 

                <!-- 성인인증 체크박스 되어있을 시 변화감지되면 입력창 초기화 -->
                 $(document).ready(function(){
                	 
                	 jumin1 = document.form1.user_jumin1.value;
                     
                     jumin2 = document.form1.user_jumin2.value;
                    
                     $("#user_jumin1").change(function(){
                         if($("#chk1").is(":checked")){
                        	 document.form1.user_jumin1.value = "";
                        	 document.form1.user_jumin2.value = "";
                        	 document.getElementById("chk1").checked = false;
                             //alert("체크박스 체크했음!");
                             
                         }else{
                             //alert("체크박스 체크 해제!");
                         }
                     });
                 });
                 
                 

                 $(document).ready(function(){
                	 
                	 jumin1 = document.form1.user_jumin1.value;
                     
                     jumin2 = document.form1.user_jumin2.value;
                    
                     $("#user_jumin2").change(function(){
                         if($("#chk1").is(":checked")){
                        	 document.form1.user_jumin1.value = "";
                        	 document.form1.user_jumin2.value = "";
                        	 document.getElementById("chk1").checked = false;
                             //alert("체크박스 체크했음!");
                             
                         }else{
                             //alert("체크박스 체크 해제!");
                         }
                     });
                 });
                 
                 function idCheck() {

             		const id = document.getElementById('user_id').value;
             		const checkResult = document.getElementById('idcheck');
             		const idLength = id.length;
             		console.log(idLength);
             		const exp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,10}$/;
             		
             		if(idLength == 0){
             	    	checkResult.innerHTML = '필수항목입니다'
             	    	checkResult.style.color = 'red';
             	    }else if(!id.match(exp)){
             	    	checkResult.innerHTML = '4~10자의 영문자와 숫자를 조합해서 입력해주세요'
             	    	checkResult.style.color = 'red';
             	    	document.getElementById('user_id').value = '';
             	    }
             		
             	    else if(id.match(exp)) {
             		$.ajax({
             			 type:'post',
             			url:'<%=request.getContextPath() %>/idCheck.do',
             			data:{user_id:id},
             			dataType : 'text',
             			success : function(cnt) {
             				if (cnt == 1) {				
             					checkResult.style.color = 'green';
             					checkResult.innerHTML = '이미 사용중인 아이디';
             					document.getElementById('user_id').value = '';
             				} else {
             					checkResult.style.color = 'red';
             					checkResult.innerHTML = '멋진아이디';
             				}
             			},
             			error : function() {
             				console.log('오타 찾으세요')
             			}

             		});
             	}
             	}
                 
                 
                 
                 function emailCheck() {

              		const email = document.getElementById('user_email').value;
              		const checkResult = document.getElementById('emailcheck');
              		const emailLength = email.length;
              		console.log(emailLength);
              		const exp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
              		
              		if(emailLength == 0){
              	    	checkResult.innerHTML = '필수항목입니다'
              	    	checkResult.style.color = 'red';
              	    }else if(!email.match(exp)){
              	    	checkResult.innerHTML = '유효한 이메일이 아닙니다.'
              	    	checkResult.style.color = 'red';
              	    	document.getElementById('user_email').value = '';
              	    }
              		
              	    else if(email.match(exp)) {
              		$.ajax({
              			 type:'post',
              			url:'<%=request.getContextPath() %>/emailCheck.do',
              			data:{user_email:email},
              			dataType : 'text',
              			success : function(cnt) {
              				if (cnt == 1) {				
              					checkResult.style.color = 'green';
              					checkResult.innerHTML = '이미 사용중인 이메일';
              					document.getElementById('user_email').value = '';
              				} else {
              					checkResult.style.color = 'red';
              					checkResult.innerHTML = '멋진이메일';
              				}
              			},
              			error : function() {
              				console.log('오타 찾으세요')
              			}

              		});
              	}
              	}
                 
                 
                 
                 
                 
                 
                 
                 <!-- 아이디, 이메일 중복 검사 -->
          $(function () {           
               <%--   //아이디 중복검사
                 $('#user_id').on('keyup', function(){
                  
                
               var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
               	 
                    console.log(id);
               	 $.ajax({
                        url:'<%=request.getContextPath() %>/idCheck.do', //Controller에서 요청 받을 주소
                        type:'post', //POST 방식으로 전달
                        async: false,
                        data:{user_id:id},
                        datatype : "text",
                        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                       	 
                       	 if(id == ''){
                             	 let warningTxt = '<font color="red" size="1.5em">아이디를 입력하세요.</font>';
                				$("#idcheck").text('');		// span 태그 영역 초기화
                				
                				$("#idcheck").append(warningTxt);
                           }else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                           	let warningTxt = '<font color="green" size="1.5em">사용가능한 아이디입니다.</font>';
                				
                				$("#idcheck").text('');		// span 태그 영역 초기화
                				
                				$("#idcheck").append(warningTxt);
                            } else if(cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는 아이디
                           	 let warningTxt = '<font color="red" size="1.5em">중복 아이디입니다.</font>';
                 				 
                           	 
                 				$("#idcheck").text('');		// span 태그 영역 초기화
                 				
                 				$("#idcheck").append(warningTxt);
                 				
                 				 
                            }
                        	
                            
                        
                        },
                        error:function(request,status,error){
                            //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                        }
                    });
               	 
                    });
                 
              	//id입력시 - 정규식확인id keyup
          		$('#user_id').on('keyup', function(){ // keyup -> 입력할 때 
          		  var idval = $('#user_id').val().trim();
          			
          		  var idreg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,10}$/; // [a-zA-Z]한 자리 차지해서 4~12자리
          			
          			if(!(idreg.test(idval))){
          				let warningTxt = '<font color="red" size="1.5em">아이디는 4~10자의 영문자와 숫자를 조합해서 입력해주세요</font>';
  						
  						$("#idcheck").text('');		// span 태그 영역 초기화
  							
  						$("#idcheck").append(warningTxt);
  						
  						$("#idcheck").val('');
          				//중복검사버튼 비활성 - 속성설정 prop
          				//$('#idbtn').prop('disabled',true);
          			}else{
                          let warningTxt = '<font color="green" size="1.5em">사용가능한 아이디입니다.</font>';
  						
  						$("#idcheck").text('');		// span 태그 영역 초기화
  							
  						$("#idcheck").append(warningTxt);
          				
          			}
          		});  //id입력시 - id keyup end
          		 --%>
                
                
            <%--   //이메일 중복검사
                $('#user_email').on('focusout', function(){
                  
             	 var email = $('#user_email').val(); //id값이 "id"인 입력란의 값을 저장
                  console.log(email);
             	 $.ajax({
                      url:'<%=request.getContextPath() %>/emailCheck.do', //Controller에서 요청 받을 주소
                      type:'post', //POST 방식으로 전달
                      data:{user_email:email},
                      datatype : "text",
                      success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                   	   if(email == ''){
                           	 let warningTxt = '<font color="red" size="1.5em">이메일을 입력하세요.</font>';
              				$("#emailcheck").text('');		// span 태그 영역 초기화
              				
              				$("#emailcheck").append(warningTxt);
                   	   
                   	   }else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                         	let warningTxt = '<font color="green" size="1.5em">사용가능한 이메일입니다.</font>';
              				
              				$("#emailcheck").text('');		// span 태그 영역 초기화
              				
              				$("#emailcheck").append(warningTxt);
                          } else if(cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는 아이디
                         	 let warningTxt = '<font color="red" size="1.5em">중복 이메일입니다.</font>';
               				
               				$("#emailcheck").text('');		// span 태그 영역 초기화
               				
               				$("#emailcheck").append(warningTxt);
                          }
                      },
                      error:function(request,status,error){
                          //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                      }
                  });
             	 
                  }); --%>
                
                

                
                 
                 
                 
                 <!-- 아이디, 비밀번호, 이메일 정규식 검사 -->
             
                	 
                	 
                
                		
                		//비밀번호입력시 - 정규식확인 pw
                		$("#user_pwd").blur(function(){
                		//$('#user_pwd').on('keyup', function(){ // keyup -> 입력할 때 
                		  var pwd = $('#user_pwd').val().trim();
                			
                		  var num = pwd.search(/[0-9]/g);
              			  var eng = pwd.search(/[a-zA-Z]/ig);
              			  var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
                			
              			if(pwd.length < 8 || pwd.length > 20){

            				let warningTxt = '<font color="red" size="1.5em">8자리 ~ 20자리 이내로 입력해주세요.</font>';
            				
            				$("#pwcheck").text('');		// span 태그 영역 초기화
            				
            				$("#pwcheck").append(warningTxt);
            				
            				//$("#user_pwd").val('');
            				
            				
            			 }else if(num < 0 || eng < 0 || spe < 0 ){
            				 
            			  	let warningTxt = '<font color="red" size="1.5em">영문, 숫자, 특수문자를 혼합하여 입력해주세요.</font>';
            				
            				$("#pwcheck").text('');		// span 태그 영역 초기화
            				
            				$("#pwcheck").append(warningTxt);
            				
            				//$("#user_pwd").val('');
            				
            				
            			 }else {
            				 
            				let warningTxt = '<font color="green" size="1.5em">사용 가능한 비밀번호 입니다.</font>';
            					
            				$("#pwcheck").text('');		// span 태그 영역 초기화
            					
            				$("#pwcheck").append(warningTxt);
            				
            			 }
                		});  //비밀번호입력시 - 정규식확인 pw end
                		
                		
                		//비밀번호확인입력시 - 정규식확인 pwcheck
                		$("#user_pwd_check").blur(function(){
                		//$('#user_pwd_check').on('keyup', function(){ // keyup -> 입력할 때 
                		  
                			var pwd = $('#user_pwd').val().trim();
                			var pwdck = $('#user_pwd_check').val().trim();
                			
                			if(pwd == pwdck){
                				
                				let warningTxt = '<font color="green" size="1.5em">비밀번호가 일치합니다.</font>';
                				
                				$("#pwcheck2").text('');		// span 태그 영역 초기화
                				
                				$("#pwcheck2").append(warningTxt);
                				
                				
                				
                			}else {
                				
                				let warningTxt = '<font color="red" size="1.5em">비밀번호가 일치하지 않습니다.</font>';
                				
                				$("#pwcheck2").text('');		// span 태그 영역 초기화
                				
                				$("#pwcheck2").append(warningTxt);
                				
                				document.getElementById('user_pwd_check').value = '';
                				
                				//$("#user_pwd_check").text('');
                				
                			}
                		});  //비밀번호확인입력시 - 정규식확인 pwcheck end
                		
                		
                		
                		/* //이메일입력시 - 유효성확인 keyup
                		$('#user_email').on('keyup', function(){ // keyup -> 입력할 때 
                		  var email = $('#user_email').val().trim();
                			
                		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
                		  var emailck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
                			
                		  if(!(emailck.test(email))){
              				let warningTxt = '<font color="red" size="1.5em">유효한 이메일이 아닙니다.</font>';
      						
      						$("#emailcheck").text('');		// span 태그 영역 초기화
      							
      						$("#emailcheck").append(warningTxt);
      						
      						//$("#user_id").val('');
              				//중복검사버튼 비활성 - 속성설정 prop
              				//$('#idbtn').prop('disabled',true);
              			}else{
                              let warningTxt = '<font color="green" size="1.5em"></font>';
      						
      						$("#emailcheck").text('');		// span 태그 영역 초기화
      							
      						$("#emailcheck").append(warningTxt);
              				
              			}
                		});  //id입력시 - id keyup end
                		  */
                   
                 
             
                 
                 
                 
                 
                 
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
                
                window.onload = function () {
                    $(".loading").fadeOut(100,function(){
                        $("#div_load_image").fadeOut(300);
                    });
                }
</script>
	
	
<jsp:include page="../banner/bottom.jsp" />
