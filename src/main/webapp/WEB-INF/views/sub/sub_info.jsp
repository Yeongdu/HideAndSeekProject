<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	
		<div class = "sub_info_deli_title">
			<span>배송지를 선택하세요</span>
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
						<input type = "radio" class = "sub_delivery_check${s.index }" name = "radio" style = "display:none;">
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
			
			var len = 0;
			
			function checkdelivery(no){
				// 배송지 클릭시 이벤트
				
				len = $("input:radio[name=radio]:checked").length;
				
				let count = ${dlist.size()};
				
				$(document).on("click",".delivery_main_wrap", function(){
					
					$("input:radio[class=sub_delivery_check"+no+"]").prop("checked", true);
					
					var radioCheck = $("input:radio[class=sub_delivery_check"+no+"]").is(":checked");
					
					for(var i = 0; i<=count; i++){
						if($("input:radio[class=sub_delivery_check"+i+"]").is(":checked") == false) {
							$(".delivery_main_wrap"+i).css("border", "1px solid black");	
							$(".delivery_main_wrap"+i).css("width", "20%");	
							$(".delivery_main_wrap"+i).css("padding", "10px");	
							$(".delivery_main_wrap"+i).css("text-align", "left");	
							$(".delivery_main_wrap"+i).css("margin-bottom", "10px");	
							$(".delivery_main_wrap"+i).css("border-radius", "5px");	
						}else{
							$(".delivery_main_wrap"+i).css("border", "2px solid #0097F3");	
							$(".delivery_main_wrap"+i).css("width", "20%");	
							$(".delivery_main_wrap"+i).css("padding", "10px");	
							$(".delivery_main_wrap"+i).css("text-align", "left");	
							$(".delivery_main_wrap"+i).css("margin-bottom", "10px");	
							$(".delivery_main_wrap"+i).css("border-radius", "5px");
						}
					}
					
					
				});
			}
			
			function submit(no){
				var deli_no = $(".deli_no"+no).val();
				var check = $("input:radio[name=radio]:checked").val();
				
				var id = '<%=(String)session.getAttribute("userId")%>';
				
				len = $("input:radio[name=radio]:checked").length;
				
				$(document).on("click",".sub_delivery_btn", function(){
					
						location.href = "<%=request.getContextPath() %>/sub_pay.do?deli_no="+deli_no+"&userId="+id+"";
					
				});
				
			}
			
		
		</script>
		
	

	
<jsp:include page="../banner/bottom.jsp" />
