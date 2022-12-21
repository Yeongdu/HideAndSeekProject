<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/sub/sub_info.css" rel="stylesheet" type="text/css">
<title>구독 신청하기</title>
<script>
	var no = 0;
</script>
    
    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	
	<div id = "sub_info_main">
	<c:set var = "dlist" value = "${ddto }" />
	
		<div class = "sub_info_deli_title">
			<span>어디로 보내드릴까요?</span>
		</div>
			
			<c:forEach items = "${dlist }" var = "ddto" varStatus = "s">
				<div class = "delivery_main_wrap" >
					<div class = "delivery_title delivery_title${s.index }" onmouseover = "arcodian(${s.index })">
						<div class = 'delivery_name'>${ddto.getDeli_name() }</div>
						<c:if test="${ddto.getDeli_default() == 1 }">
							<input type = 'button' value = '기본 배송지' class = 'delivery_default_badge' disabled>
						</c:if>
					</div>
						<div class = "delivery_arco delivery_arco${s.index }">
							<div class = "delivery_phone">
								${ddto.getDeli_phone1() }<span> - </span>
								${ddto.getDeli_phone2() }<span> - </span>
								${ddto.getDeli_phone3() }
							</div>
							<div class = "delivery_addr">
								<div class = "delivery_addr1">${ddto.getDeli_addr1() }</div>
								<div class = "delivery_addr2">${ddto.getDeli_addr2() }</div>
							</div>
						</div>
						<input type = "hidden" value = "${ddto.getDeli_no() }">
						<input type = "hidden" value = "${ddto.getDeli_default() }" class = "deli_de${s.index }">
				</div> 
				
				<script>
					var de = $(".deli_de"+no).val();
					
					
					if(de == 0){
						$(".delivery_arco"+no).css("display", "none");
					}
					
					no += 1;
					
					
					function arcodian(no){
						$(".delivery_title"+no).on("click",function(){
							$(".delivery_arco"+no).slideDown(300);
							$(".delivery_title"+no).attr("class", "delivery_title-active"+no);
						});
						
						$(".delivery_title-active"+no).on("click",function(){
							$(".delivery_arco"+no).slideUp(300);
							$(".delivery_title-active"+no).attr("class", "delivery_title"+no);
						});
					}
					
					
					
				</script>
				
			</c:forEach>
		</div> <%-- sub_info_main의 end --%>
		
		
	

	
<jsp:include page="../banner/bottom.jsp" />
