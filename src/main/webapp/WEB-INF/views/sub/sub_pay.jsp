<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="resources/css/sub/sub_pay.css" rel="stylesheet" type="text/css">
<script>
		let check = true;
		
		var phone = ${ddto.getDeli_phone1()}+"-"+${ddto.getDeli_phone2()}+"-"+${ddto.getDeli_phone3()}
		var addr = "${ddto.getDeli_addr1()}${ddto.getDeli_addr2()}"
		var zipcode = ${ddto.getDeli_zipcode()}
		var package_name = "${sdto.getSub_package()}"
		var deli_no = ${ddto.getDeli_no()}
		var userId = "${userId}"
		var package_no = ${sdto.getSub_package_no()}
		var price = ${sdto.getSub_price()}
		
	
		//결제 api
		var IMP = window.IMP; 
	    IMP.init("imp68070036"); 
	      
	    var today = new Date();   
	    var hours = today.getHours(); // 시
	    var minutes = today.getMinutes();  // 분
	    var seconds = today.getSeconds();  // 초
	    var milliseconds = today.getMilliseconds();
	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	     
	    function requestPay() {
	    	
	    	IMP.request_pay({
	      	pg : 'kcp',
	        pay_method : 'card',
	        merchant_uid: "IMP"+makeMerchantUid, 
	        name : package_name,
	        amount : price,
	        buyer_email : '',
	        buyer_name : '${userId}',
	        buyer_tel : phone,
	        buyer_addr : addr,
	        buyer_postcode : zipcode
	    	}, function (rsp) {           
	    		console.log(rsp);            
	    		if (rsp.success) {   
	    		var msg = '결제가 완료되었습니다.\n';       
	    		msg += '결제 금액 : ' + rsp.paid_amount+'\n원';            
	    		msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
	    		
	    		check = false;
	    		location.href = "<%=request.getContextPath() %>/sub_complete.do?deli_no="+deli_no+"&userId="+userId+"";
	    		console.log("삽입");
	    		
	    		} else {               
	    			window.history.go(-2);
	    			swal('결제 실패',rsp.error_msg,'warning');
	    			
	    			check = true;
	    		}
	    		
	    		});
	    	
	    	}
	  	//결제 api 끝
	  	
	  	$(document).on("click", ".sub_pay_btn", function(){
	    	requestPay();
	    	
// 	    	console.log("check >>> " + check);
	    	
// 	    	if(!check){
// 	    		console.log("결제");
	    		
// 	    	}
	    	
	    });
	
	</script>


<title>구독 결제</title>

    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
	<div id = "sub_info_main">
	<c:set var = "dlist" value = "${ddto }" />
		
		<div class = "package_wrap">
			<span>선택된 패키지</span>
			<div class = "sub_package_wrap">
				<div class ="sub_package_left">
					<img src = "resources/image/${sdto.getSub_image() }" class = "sub_package_img">
				</div>
				<div class = "sub_package_right">
					<div class = "sub_package_title">${sdto.getSub_package() }</div>
					<div class = "sub_package_price">월/<fmt:formatNumber>${sdto.getSub_price() }</fmt:formatNumber>원</div>
				</div>
			</div>
		</div>
		
		<div class = "delivery_wrap">
			<div class = "delivery_addr">${ddto.getDeli_addr1() }${ddto.getDeli_addr2() }</div>
			<div class = "delivery_zipcode">${ddto.getDeli_zipcode() }</div>
			<div class = "delivery_name">${ddto.getDeli_name() } (${ddto.getDeli_phone1() } - ${ddto.getDeli_phone2() } - ${ddto.getDeli_phone3() })</div>
		</div>
	
		<div class = "sub_pay">
			<input type = "button" class = "sub_pay_btn" value = "결제하기">
		</div>
	</div>

<jsp:include page="../banner/bottom.jsp" />