<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<title>회원가입</title>
<link href="resources/css/user/join.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  

  


   <%--    <!-- top include 지정 -->
      <jsp:include page="../banner/none_top.jsp" />
 --%>

 <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>



      <div align="center">
         <form  name="form1" method="post" action="<%=request.getContextPath() %>/user_join_ok.do">
         
             <div style="width: 800px;">
            <span class="join_legend">회원가입</span>
            </div>
            
                   <div style="width: 800px;">
                  <h3 class="title_1_span">기본정보</h3>
                  <p class="subTx">
                     <strong>* </strong>필수입력사항
                  </p>   
                  <hr style="width: 100%; margin-top: 5px;">
                  </div>
               
               
               
                              
               
                  <div class="join_id">
                    <label for="user_id" class="user_label"><strong class="join_star">* </strong>아이디</label>
                       
                         <input type="text"  class="user_id" id="user_id" name="user_id" placeholder="영문, 숫자 4-10자"   onblur="idCheck()" required><br>
                             <span id="idcheck" class="idcheck"></span>
                     </div>
                  
                  <div class="join_pwd">
                     <label for="user_pwd" class="user_label"><strong class="join_star">* </strong>비밀번호</label>
                        <input type="password" class="user_pwd" id="user_pwd" name="user_pwd" placeholder="영문, 숫자, 특수문자 조합 최소 8자"  required><br>
                            <span id="pwcheck" class="pwcheck"></span>
                  </div>
                  
                  <div class="join_pwd_check">
                     <label for="user_pwd_check" class="user_label"><strong class="join_star">* </strong>비밀번호 확인</label>
                        <input type="password"  class="user_pwd_check"    id="user_pwd_check" name="user_pwd_check" placeholder="비밀번호 재입력" required><br>
                        <span id="pwcheck2" class="pwcheck2"></span>
                  </div>
                  
               
                  
                  <div class="join_email">
                     <label for="user_email" class="user_label"><strong class="join_star">* </strong>이메일</label>
                        <input type="email"  class="user_email"  name="user_email" id="user_email" onblur="emailCheck()" required><br>
                        <span id="emailcheck" class="emailcheck"></span>
                  </div>
                  
                     <div class="join_name">
                     <label for="user_name" class="user_label"><strong class="join_star">* </strong>이름</label>
                        <input type="text"  class="user_name"     id="user_name" name="user_name" required>
                  </div>
                  
                  
                  <div class="join_idnum">
                     <label for="user_idnum" class="user_label"><strong class="join_star">* </strong>주민등록번호</label>
                      <div class="join_idnum_input">
                     <input type="text"  name="user_jumin1" id="user_jumin1"  minlength="6" maxlength="6"  placeholder="생년월일 6자리" required><span> - </span><input type="password"  name="user_jumin2"  id="user_jumin2"  maxlength="7" minlength="6"    required>
                     <!-- <input type="checkbox" value="성인인증"  class="chk1" id="chk1"  name="chk1" onclick="getAge();" required> -->
                         <!-- <label for="success" class="btn btn-success" style="margin-left: 10px;border-radius: 5px;">성인인증<input type="checkbox" id="success" class="badgebox" onclick="getAge();" required><span class="badge">&check;</span></label> -->
                         <label for="default" class="btn btn-default" style="margin-left: 10px;border-radius: 5px; height: 43px;"><span style="vertical-align: -webkit-baseline-middle; font-family: 'ChosunGu';">성인인증<input type="checkbox" id="default" class="badgebox" onclick="getAge();" required><span class="badge" style="color: black; background-color: white;">&check;</span></span>
                       
                         </label>
                        </div>
                           </div>
                  
                  
                  
                  
                  
                  
                  <div class="join_phone">
                            <label for="user_phone" class="user_label"><strong class="join_star">* </strong>전화번호</label>
                               <div class="join_phone_input">
                              <select name="user_phone1" id="user_phone1" required>
                                <option value="" selected>선택하세요.</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                </select>

                            <span> - </span><input type="text" name="user_phone2" id="user_phone2"  maxlength="10"   required><span> - </span><input type="text" name="user_phone3" id="user_phone3"  maxlength="10"  required>
                        </div>
                        
                        </div>



                  
                  
                  
                  <br>
                  
                  <div class="title_2" style="width: 800px;">
                    <h3 class="title_2_span">선택정보</h3>
                      <hr style="width: 100%; margin-top: 5px;"
                      >
                  </div>
                  
                   <div class="join_zipcode">
                     <label for="user_zipcode" class="user_label">우편번호</label>
                        <div class="join_zipcode_input">
                        <input type="text" class="user_zipcode" name="user_zipcode1" id="sample6_postcode" size="7" readonly>
                        <input type="button" onclick="sample6_execDaumPostcode()" style="font-family: 'ChosunGu';"   value="우편번호찾기">
                          </div>
                  </div>
                  
                  
                  <div class="join_user_addr1">
                     <label for="user_addr1" class="user_label">기본주소</label>
                     
                        <input type="text" class="user_addr1"   name="user_addr1" id="sample6_address" readonly>
                        
                  </div>
                  
                  <div class="join_user_addr2">
                     <label for="user_addr2" class="user_label">상세주소</label>
                        
                        <input type="text" class="user_addr2"   name="user_addr2"   id="sample6_extraAddress">
                        
                  </div> 
                  
                  <br>
                  <div style="width: 800px;">
                  <hr style="width: 100%; margin-top: 5px;">
                  </div>
                  
                  
            <div class="agreement-checkbox">
                     
              <div class="agree_all_lable">
                 <div class="agree_all_lable_wrap1">
                    <div class="agree_all_lable_wrap2">
               <label for="agree_all">
                      <input type="checkbox" name="agree_all" id="agree_all" style="zoom:1.5; vertical-align: top;"required>
                           <span style="vertical-align: text-top;">이용약관 및 개인정보처리방침에 모두 동의합니다.</span>
                          
                               </label>
                          </div>     
                      </div>
                    </div>
                    
                          <br>
                                 
                                  <div class="container-fluid">
 
                                     <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
                                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    
                                          <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
                                            <div class="panel panel-default" style="width: 800px;">
                                              <div class="panel-heading"  role="tab">
                                                     <label for="agree">
                                                       <input type="checkbox" name="agree" value="1"   style="zoom: 1.3;"   required>
                                                     </label>
                                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
                                                    
                                             <span style="vertical-align: sub; margin-left: 5px;"><strong style="font-size: 15px;">이용약관 동의 <span style="color: #F84A71;">(필수)</span></strong></span> 
                                                 </a>
                                                   
                                               
                                          </div>
       
       
                <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
                  <div class="panel-body">
                     <p>
                     제 1조(목적)<br>
                    이 약관은 술래잡기 프로젝트(이하 "spring 프로젝트")가 운영하는 인터넷사이트  술래잡기(이하 " 술래잡기")에서 제공하는 전자상거래 관련 서비스(이하 "서비스")를 이용함에 있어  술래잡기와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
                    ※ 「PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다」<br>
                     </p>
                     <br>
                     <p>
                     제 2조(정의)<br>
                    ① "술래잡기"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br>
                    ② "이용자"란 "술래잡기"에 접속하여 이 약관에 따라 "술래잡기"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                    ③ ‘회원’이라 함은 "술래잡기"에 회원등록을 한 자로서, 계속적으로 "술래잡기"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
                    ④ ‘비회원’이라 함은 회원에 가입하지 않고 "술래잡기"가 제공하는 서비스를 이용하는 자를 말합니다.<br>
                     </p>
                     <br>
                     <p>
                     제 3조 (약관 등의 명시와 설명 및 개정)<br>
                    ① "술래잡기"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보 보호책임자 등을 이용자가 쉽게 알 수 있도록 술래잡기의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
                    ② "술래잡기"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
                    ③ "술래잡기"는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「개인정보보호법」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
                    ④ "술래잡기"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 이용약관 페이지에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "술래잡기"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
                    ⑤ "술래잡기"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "술래잡기"에 송신하여 "술래잡기"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
                    ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」,공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례」에 따릅니다.<br>
                     </p>
                     <br>
                     
                     <p>
                     제 4조(서비스의 제공 및 변경)<br>
                    ① "술래잡기"는 다음과 같은 업무를 수행합니다.<br><br>
                    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
                    2. 구매계약이 체결된 재화 또는 용역의 배송<br>
                    3. 기타 "술래잡기"가 정하는 업무<br><br>
                    ② "술래잡기"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
                    ③ "술래잡기"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
                    ④ 전항의 경우 "술래잡기"는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "술래잡기"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
                     </p>
                     <br>
                     
                     <p>
                     제 5조(술래잡기 프로젝트)<br>
                     1. 술래잡기 사이트는 spring 프로젝트를 통해 만들어 졌습니다.<br>
                     2. 해당 사이트는 상업적 영리를 취득하지 않는 팀프로젝트입니다.<br>
                     </p>
                  
                     
                  </div>
                </div>
             </div>
      
      <!-- 하나의 item입니다.  -->
      <div class="panel panel-default" style="width: 800px;">
        <div class="panel-heading" role="tab">
           <label for="agree">
            <input type="checkbox" name="agree" value="2" style="zoom: 1.3;"     required>
             </label>
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
             <span style="vertical-align: sub; margin-left: 5px;"><strong style="font-size: 15px;">개인정보 수집 및 이용동의 <span style="color: #F84A71;">(필수)</span></strong></span>
          </a>
          
        </div>
        <div id="collapse2" class="panel-collapse collapse" role="tabpanel">
          <div class="panel-body">
            <p>
             술래잡기는 ‘개인정보 보호법’ 등 관련 법령에 근거하여 회원가입 신청하시는 고객님께 수집하는 개인정보의 항목, 수집 및 이용목적, 보유기간 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내드리오니 다음 내용을 자세히 읽어보신 후 동의 여부를 결정하여 주시기 바랍니다.
            </p><br>
            
            <p>
            • 목적 : 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별ㆍ인증, 회원자격 유지ㆍ관리, 제한적 본인확인제 시행에 따른 본인확인 및 서비스 계약의 이행<br>
            - 문의, 민원처리 시 응대<br><br>

            • 항목 : 이름, 핸드폰번호, 이메일(ID), 생년월일, 성별, 본인인증정보 (CI(연계정보), DI(중복정보))<br>
            - 문의 내용<br><br>

            • 회원 탈퇴 시 지체없이 파기 단, 전자상거래법, 계약 및 철회/결제 및 공급에 관한 정보는 5년 (전자상거래법)<br>
            - 3년 (전자상거래법)<br>
            </p>
            
            <p>
            ※ 서비스 이용과정에서 로그정보(홈페이지 이용기록, 접속기록, IP주소, 쿠키)가 수집될 수 있으며, 서비스 부정이용 방지 목적으로 이름, CI는 회원 탈퇴 6개월 후 파기됩니다.<br><br>

            술래잡기는 1년 이상 홈페이지 로그인 및 상품 구입 등 당사 서비스를 이용하지 않은 회원의 개인정보는 「개인정보 보호법」에 근거하여 다른 회원의 개인정보와 분리하여 별도로 저장하여 관리합니다. 미이용 기간은 회원의 홈페이지 최종 로그인 일자, 상품 구입 등 술래잡기의 서비스 이용이력으로 산정합니다.<br>
            술래잡기는 장기 휴면 회원의 개인정보 분리 저장 시점이 도래하기 30일 이전에 전자우편, 전화, 우편 또는 이와 유사한 방법 중 어느 하나의 방법으로 해당 회원에게 회원의 개인정보가 분리되어 저장되는 사실과 기간만료일 및 해당 개인정보의 항목 등 관련내용을 알려드립니다.<br>
            장기 휴면 회원의 분리 저장된 개인정보는 해당 회원의 요청에 따라 본인 인증 후 서비스 이용을 재개하는 시점부터 다시 이용 및 제공되며, 개인정보 보유기간 만료 및 관련 법령에 따른 보유기간 종료 후 파기됩니다.<br><br>

            고객님께서는 개인정보 수집 및 이용 동의를 거부할 권리가 있습니다. 다만, 회원가입 시 수집하는 필수 항목은 회원가입을 위한 최소한의 개인정보이므로 수집 및 이용 동의를 거부하실 경우 회원가입이 제한됩니다.<br>
            </p><br>
            
             <p>
              ※술래잡기 프로젝트<br>
              1. 술래잡기 사이트는 spring 프로젝트를 통해 만들어 졌습니다.<br>
              2. 해당 사이트는 상업적 영리를 취득하지 않는 팀프로젝트입니다.<br>
              </p>
          </div>
        </div>
      </div>
      
      
     
    
    </div>
  
  </div>
  
          </div>
                             
             
                             
                             <div class="join_ok_btn">
                                <!-- <button type="submit">가입완료</button> -->
                                <input type="submit" class="join_ok_btn_input"  style="font-family: 'ChosunGu';"     value="가입완료">
                             </div>
                  
                  
      
      
      </form>
   
   </div>
   
   
         
       
      <!-- 회원가입 페이지 -->
             
           <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
           	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                     
                     document.getElementById("default").checked = false;
                     
                     return false;
                  }
                  
                 

                if(parseInt(tmpSSN.substring(0, 2))<25 && genType < 3 ){

                
                // alert("주민등록번호를 다시 확인해주세요.");
                swal('확인필요!',"주민등록번호를 다시 확인해주세요.",'warning');
                 
                 document.getElementById("default").checked = false;

                  return false;

                }


                if(parseInt(tmpSSN.substring(0, 2))>25 && genType > 2 ){

                 //alert("주민등록번호를 다시 확인해주세요.");
                 swal('확인필요!',"주민등록번호를 다시 확인해주세요.",'warning');
                 
                 document.getElementById("default").checked = false;

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
                 
                  //alert ("성인인증 완료")
                swal('성인인증완료!',"성인인증을 완료했습니다.",'success');
                 
                 
                 
                  }else{
                  //alert ("미성년으로 구입할 수 없습니다.")
                  swal('구매불가!',"미성년으로 구입할 수 없습니다.",'error');
                   
                   document.form1.user_jumin1.value = "";
                  
                   document.form1.user_jumin2.value = "";
                   
                   document.getElementById("default").checked = false;
                  
                    

                  }
                 
                 
                 }//getAge() end
                 

                <!-- 성인인증 체크박스 되어있을 시 변화감지되면 입력창 초기화 -->
                 $(document).ready(function(){
                    
                    jumin1 = document.form1.user_jumin1.value;
                     
                     jumin2 = document.form1.user_jumin2.value;
                    
                     $("#user_jumin1").change(function(){
                         if($("#default").is(":checked")){
                            document.form1.user_jumin1.value = "";
                            document.form1.user_jumin2.value = "";
                            document.getElementById("default").checked = false;
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
                         if($("#default").is(":checked")){
                            document.form1.user_jumin1.value = "";
                            document.form1.user_jumin2.value = "";
                            document.getElementById("default").checked = false;
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
                            checkResult.style.color = 'red';
                            checkResult.innerHTML = '이미 사용중인 아이디입니다.';
                            document.getElementById('user_id').value = '';
                         } else {
                            checkResult.style.color = '#14aaff';
                            checkResult.innerHTML = '사용 가능한 아이디입니다.';
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
                             checkResult.style.color = 'red';
                             checkResult.innerHTML = '이미 사용중인 이메일입니다.';
                             document.getElementById('user_email').value = '';
                          } else {
                             checkResult.style.color = '#14aaff';
                             checkResult.innerHTML = '사용 가능한 이메일입니다.';
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
                            $("#idcheck").text('');      // span 태그 영역 초기화
                            
                            $("#idcheck").append(warningTxt);
                           }else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                              let warningTxt = '<font color="green" size="1.5em">사용가능한 아이디입니다.</font>';
                            
                            $("#idcheck").text('');      // span 태그 영역 초기화
                            
                            $("#idcheck").append(warningTxt);
                            } else if(cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는 아이디
                               let warningTxt = '<font color="red" size="1.5em">중복 아이디입니다.</font>';
                              
                               
                             $("#idcheck").text('');      // span 태그 영역 초기화
                             
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
                    
                    $("#idcheck").text('');      // span 태그 영역 초기화
                       
                    $("#idcheck").append(warningTxt);
                    
                    $("#idcheck").val('');
                      //중복검사버튼 비활성 - 속성설정 prop
                      //$('#idbtn').prop('disabled',true);
                   }else{
                          let warningTxt = '<font color="green" size="1.5em">사용가능한 아이디입니다.</font>';
                    
                    $("#idcheck").text('');      // span 태그 영역 초기화
                       
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
                          $("#emailcheck").text('');      // span 태그 영역 초기화
                          
                          $("#emailcheck").append(warningTxt);
                         
                         }else if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                            let warningTxt = '<font color="green" size="1.5em">사용가능한 이메일입니다.</font>';
                          
                          $("#emailcheck").text('');      // span 태그 영역 초기화
                          
                          $("#emailcheck").append(warningTxt);
                          } else if(cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는 아이디
                             let warningTxt = '<font color="red" size="1.5em">중복 이메일입니다.</font>';
                           
                           $("#emailcheck").text('');      // span 태그 영역 초기화
                           
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

                        let warningTxt = '<font color="red">8자리 ~ 20자리 이내로 입력해주세요.</font>';
                        
                        $("#pwcheck").text('');      // span 태그 영역 초기화
                        
                        $("#pwcheck").append(warningTxt);
                        
                        //$("#user_pwd").val('');
                        
                        
                      }else if(num < 0 || eng < 0 || spe < 0 ){
                         
                          let warningTxt = '<font color="red">영문, 숫자, 특수문자를 혼합하여 입력해주세요.</font>';
                        
                        $("#pwcheck").text('');      // span 태그 영역 초기화
                        
                        $("#pwcheck").append(warningTxt);
                        
                        //$("#user_pwd").val('');
                        
                        
                      }else {
                         
                        let warningTxt = '<font color="#14aaff">사용 가능한 비밀번호입니다.</font>';
                           
                        $("#pwcheck").text('');      // span 태그 영역 초기화
                           
                        $("#pwcheck").append(warningTxt);
                        
                      }
                      });  //비밀번호입력시 - 정규식확인 pw end
                      
                      
                      //비밀번호확인입력시 - 정규식확인 pwcheck
                      $("#user_pwd_check").blur(function(){
                      //$('#user_pwd_check').on('keyup', function(){ // keyup -> 입력할 때 
                        
                         var pwd = $('#user_pwd').val().trim();
                         var pwdck = $('#user_pwd_check').val().trim();
                         
                         if(pwd == pwdck){
                            
                            let warningTxt = '<font color="#14aaff">비밀번호가 일치합니다.</font>';
                            
                            $("#pwcheck2").text('');      // span 태그 영역 초기화
                            
                            $("#pwcheck2").append(warningTxt);
                            
                            
                            
                         }else {
                            
                            let warningTxt = '<font color="red">비밀번호가 일치하지 않습니다.</font>';
                            
                            $("#pwcheck2").text('');      // span 태그 영역 초기화
                            
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
                        
                        $("#emailcheck").text('');      // span 태그 영역 초기화
                           
                        $("#emailcheck").append(warningTxt);
                        
                        //$("#user_id").val('');
                          //중복검사버튼 비활성 - 속성설정 prop
                          //$('#idbtn').prop('disabled',true);
                       }else{
                              let warningTxt = '<font color="green" size="1.5em"></font>';
                        
                        $("#emailcheck").text('');      // span 태그 영역 초기화
                           
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