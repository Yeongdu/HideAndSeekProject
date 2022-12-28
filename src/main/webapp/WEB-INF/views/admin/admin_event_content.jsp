<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${eventCont}" />
<c:set var="pdto" value="${productCont}" />

<jsp:include page="../banner/admin_top.jsp" />

<title>관리자 이벤트</title>

<script type="text/javascript">
$(function() {
	

	function adjustHeight1() {
		var textEle = $('#admin_event_cont1');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight+8);
		};
	function adjustHeight2() {
		var textEle = $('#admin_event_cont2');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight+8);
		};
	function adjustHeight3() {
		var textEle = $('#admin_event_cont3');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight+8);
		};

	adjustHeight1();
	adjustHeight2();
	adjustHeight3();


	});


</script>
<style>



</style>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;" align="center">
	<br> <br> <br>



<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event_insert.do'"
>이벤트 생성</button>
<br />
<div align = "center" id = "event">
		<div id = "event_center">
		<input type = "hidden" name = "event_no">
			<div class = "event_span" align = "center">
			<br />
				<h3 class = "event_ing">이벤트 상세</h3>
			</div>

			<div class = "event_wrap">
				<img src = "resources/image/${dto.event_thumbnail}" class = "event_img" >
			</div>
			

		</div>
		
			<br />
		<button class="btn btn-secondary" 
			onclick = "location.href ='<%=request.getContextPath() %>/admin_event_update.do?no=${dto.event_no }'">
			이벤트 상세정보 수정</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event.do'"
>전체 이벤트</button>
			<br />
			<br />
			
			<%-- 이벤트 진행 상태 --%>
			<div align="center" style="display: flex; justify-content: center;">
			<div class="mb-3 row">
				<label for="exampleFormControl"
					class="col-sm-5 col-form-label">상태</label>
				<div class="col-sm-2">
					<span class="form-control" style="width: 200px">
					${dto.event_status }
					</span>
				</div>
			</div>
			</div>
			
			<%-- 이벤트 진행 상품 --%>
			<div align="center" style="display: flex; justify-content: center;">
			<div class="mb-3 row">
				<label for="exampleFormControl"
					class="col-sm-4 col-form-label">진행 상품</label>
				<div class="col-sm-8">
					<span class="form-control" style="width: 300px"

					<c:if test="${dto.product_no != null }" >
					onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=1'"
					</c:if>
					
					<c:if test="${dto.product_no == '0' }" >
					</c:if>

>
					${dto.product_no }&nbsp;&nbsp;  ${pdto.product_name }
					</span>
					<br /><br /><br />
					<input type="date" id="event_start" name="event_start"
					value="${dto.event_start.substring(0,10) }"> ~ <input type="date"
					id="event_end" name="event_end" value="${dto.event_end.substring(0,10) }">
				</div>
				<div class="col-sm-3">
				<img width="130px" class="img-thumbnail" style="margin-left: 50px;"
				<c:if test="${dto.product_no != null }" >
					onclick="location.href='<%=request.getContextPath()%>/admin_product_content.do?no=${dto.product_no }&page=1'"
					src = "resources/upload/${pdto.product_thumbnail }"
				</c:if>
				<c:if test="${dto.product_no == '0' }" >
				src = "resources/image/image_not_found.jpg"
				</c:if> 
				/>
				</div>
			</div>
			</div>


		<br />
		<br />
		<br />

		<!-- 첫번째 영역 -->
		<div class="admin_event1Wrap" style="display: flex;">
			<div class="admin_event_cont1Wrap">
				<textarea class="admin_event_cont1" id="admin_event_cont1"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;">${dto.event_cont1 }</textarea>
					

			</div>
			<div class="admin_event_file1Wrap">
<%-- 				<img width="50%" src="resources/image/${dto.event_file1}" --%>
<!-- 					class="admin_event_file1"> -->
					
					
				<img class="admin_event_file2" width="50%" class="admin_event_file1"
				<c:if test="${!empty dto.event_file1 }" >
					src = "resources/image/${dto.event_file1 }"
				</c:if>
				<c:if test="${empty dto.event_file1 }" >
				src = "resources/image/image_not_found.jpg"
				</c:if>
				/>
			</div>
		</div>
		
		<!-- 두번째 영역 -->
		<div class="admin_event2Wrap" style="display: flex;">
			<div class="admin_event_cont2Wrap">
				<textarea class="admin_event_cont2" id="admin_event_cont2"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;">${dto.event_cont2 }</textarea>
			</div>
			<div class="admin_event_file2Wrap">
<%-- 				<img width="30%" src="resources/image/${dto.event_file2}" --%>
<!-- 					class="admin_event_file2"> -->
					
				<img class="admin_event_file2" width="30%" class="admin_event_file2"
				<c:if test="${!empty dto.event_file2 }" >
					src = "resources/image/${dto.event_file2 }"
				</c:if>
				<c:if test="${empty dto.event_file2 }" >
				src = "resources/image/image_not_found.jpg"
				</c:if>
				/>
			</div>
		</div>
		
		<!-- 세번째 영역 -->
		<div class="admin_event3Wrap" style="display: flex;">
			<div class="admin_event_cont3Wrap">
			<div>
				<textarea class="admin_event_cont3" id="admin_event_cont3"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;">${dto.event_cont3 }</textarea>
			</div>
			</div>
			<div class="admin_event_file3Wrap">
<%-- 				<img width="30%" src="resources/image/${dto.event_file3}" --%>
<!-- 					class="admin_event_file3"> -->
					
				<img class="admin_event_file3" width="30%" class="admin_event_file3"
				<c:if test="${!empty dto.event_file3 }" >
					src = "resources/image/${dto.event_file3 }"
				</c:if>
				<c:if test="${empty dto.event_file3 }" >
				src = "resources/image/image_not_found.jpg"
				</c:if>
				/>
					
					
			</div>
		</div>

		
		
		
		
		
		
			<br />
			<br />
			<br />
		
			<button class="btn btn-secondary" 
			onclick = "location.href ='<%=request.getContextPath() %>/admin_event_update.do?no=${dto.event_no }'">
			이벤트 상세정보 수정</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event.do'"
>전체 이벤트</button>
			<br />
			<br />
			<br />
			<br />
			<br />
			
	</div>

	</div>

<jsp:include page="../banner/bottom.jsp" />