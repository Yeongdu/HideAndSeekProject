<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link href="resources/css/sub/sub_info.css" rel="stylesheet" type="text/css">
<title>구독 신청</title>
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
				<div class = "delivery_main_wrap delivery_main_wrap${s.index }" onmouseover = "checkdelivery(${s.index})" onclick = "submit(${s.index})">
					<div class = "delivery_title delivery_title${s.index }" onmouseover = "arcodian(${s.index })">
						<c:if test="${ddto.getDeli_default() == 1 }">
							<input type = 'button' value = '기본 배송지' class = 'delivery_default_badge' disabled>
						</c:if>
						<div class = 'delivery_name'>${ddto.getDeli_name() }</div>
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
						<label for = "sub_delivery_check${s.index }">배송지 선택
							<c:if test="${ddto.getDeli_default() == 1 }">
								<input type = "radio" class = "sub_delivery_check${s.index }" name = "radio" value = "1" checked>
							</c:if>
							<c:if test="${ddto.getDeli_default() == 0 }">
								<input type = "radio" class = "sub_delivery_check${s.index }" name = "radio" value = "0">
							</c:if>
						</label>
						<input type = "hidden" value = "${ddto.getDeli_no() }" class = "deli_no${s.index }">
						<input type = "hidden" value = "${ddto.getDeli_default() }" class = "deli_de${s.index }">
				</div> 
				
				<script>
					var de = $(".deli_de"+no).val();
					
					
					if(de == 0){
						$(".delivery_arco"+no).css("display", "none");
					}else if(de == 1){
						$(".delivery_title"+no).attr("class", "delivery_title-active"+no);
					}
					
					no += 1;
					
				</script>
				
			</c:forEach>
			
			<div class = "sub_delivery_submit">
				<input type = "button" value = "다음 단계" class = "sub_delivery_btn">
			</div>
				
		</div> <%-- sub_info_main의 end --%>
		
		<script>
		
			function arcodian(no){
				// 배송지 이름을 클릭하는 경우 배송지 상세 정보 슬라이드 온 오프
				$(document).on("click",".delivery_title"+no,function(){
					$(".delivery_arco"+no).slideDown(300,function(){});
					$(".delivery_title"+no).attr("class", "delivery_title-active"+no);
					console.log("열림");
				});
				
				$(document).on("click",".delivery_title-active"+no,function(){
					$(".delivery_arco"+no).slideUp(300);
					$(".delivery_title-active"+no).attr("class", "delivery_title"+no);
					console.log("닫힘");
				});
				
			}
			
			function checkdelivery(no){
				// 배송지 클릭시 이벤트
				
				$(document).on("click",".delivery_main_wrap", function(){
					
					var radioCheck = $("input:radio[class=sub_delivery_check"+no+"]").is(":checked");
					
					if(!radioCheck){
						$("input:radio[class=sub_delivery_check"+no+"]").val(0);					
					}else{
						$("input:radio[class=sub_delivery_check"+no+"]").val(1);
					}
					
					if($("input:radio[name=radio]").val() == 0) {
						$(".delivery_main_wrap"+no).css("border", "1px solid black");	
						$(".delivery_main_wrap"+no).css("width", "20%");	
						$(".delivery_main_wrap"+no).css("padding", "10px");	
						$(".delivery_main_wrap"+no).css("text-align", "left");	
						$(".delivery_main_wrap"+no).css("margin-bottom", "10px");	
						$(".delivery_main_wrap"+no).css("border-radius", "5px");	
					}
					
					if($("input:radio[class=sub_delivery_check"+no+"]").val() == 1){
						$(".delivery_main_wrap"+no).css("border", "2px solid #0097F3");	
						$(".delivery_main_wrap"+no).css("width", "20%");	
						$(".delivery_main_wrap"+no).css("padding", "10px");	
						$(".delivery_main_wrap"+no).css("text-align", "left");	
						$(".delivery_main_wrap"+no).css("margin-bottom", "10px");	
						$(".delivery_main_wrap"+no).css("border-radius", "5px");	
					}

				});
			}
			
			function submit(no){
				var deli_no = $(".deli_no"+no).val();
				console.log("deli_no >>> " + deli_no);
				var check = $("input:radio[name=radio]:checked").val();
				console.log("check >>> " + check);
				
				var pack = ${pack}; 
				
				var id = '<%=(String)session.getAttribute("userId")%>';
				
				console.log("userId >>> " + id);
				
				$(".sub_delivery_btn").on("click", function(){
					location.href = "<%=request.getContextPath() %>/sub_pay.do?deli_no="+deli_no+"&pack="+pack+"&userId="+id+"";	
				});
				
			}
			
		
		</script>
		
	

	
<jsp:include page="../banner/bottom.jsp" />
