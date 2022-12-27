<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="resources/css/sub/sub_complete.css" rel="stylesheet" type="text/css">
<title>구독 결제</title>

    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
	<div class = "sub_complete_main">
	
		<c:set var = "sdto" value = "${sdto }" />
		<c:set var = "ddto" value = "${ddto }" />
		
		<div class = "sub_complete_wrap">
			<div class = "sub_complete_wrap_top">
				<div class = "sub_complete_title">구독이 신청되었습니다</div>
			</div>
			<div class = "sub_complete_wrap_center">
				<div class = "sub_complete_package">
					<span>구독 정보</span>
					<div class = "sub_complete_package_wrap">
						<div class = "sub_package_title">${sdto.getSub_package() }</div>
						<div class = "sub_package_price"><fmt:formatNumber>${sdto.getSub_price() }</fmt:formatNumber>원/월</div>
						<div class = "sub_package_date"><span>구독 시작일 : </span><span class = "todayDate"></span></div>
						<span class = "complete_warning">*패키지는 구독 신청일의 다음달 부터 발송됩니다.</span>
					</div>
				</div>
				<div class = "sub_complete_package">
					<span>배송지 정보</span>
					<div class = "sub_complete_package_wrap">
						<div class = "sub_delivery_name">${ddto.getDeli_name() }</div>
						<div class = "sub_delivery_addr">${ddto.getDeli_addr1() } ${ddto.getDeli_addr2() }</div>
						<div class = "sub_delivery_phone">${ddto.getDeli_phone1() } - ${ddto.getDeli_phone2() } - ${ddto.getDeli_phone3() }</div>
						<span class = "complete_warning">*구독에 대한 정보 확인 및 배송지 변경은 마이페이지 구독관리에서 할 수 있습니다.</span>
					</div>
				</div>
			</div>
			<div class = "sub_complete_wrap_bottom">
				<input type ="button" value = "구독 확인하기" onclick = "location.href = 'mypage.do'" class = "sub_complete_btn">
			</div>
		</div>
		
	</div>
	
	<script>
		date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		
		$(".todayDate").text(year + " / " + month + " / " + day + " ~ ");
	
	</script>

<jsp:include page="../banner/bottom.jsp" />