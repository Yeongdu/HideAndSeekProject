<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${eventCont}" />

<jsp:include page="../banner/admin_top.jsp" />


<!-- <script src="resources/assets/js/jquery.min.js"></script> -->
<!-- <script src="resources/assets/js/jquery.scrollex.min.js"></script> -->
<!-- <script src="resources/assets/js/jquery.scrolly.min.js"></script> -->
<!-- <script src="resources/assets/js/browser.min.js"></script> -->
<!-- <script src="resources/assets/js/breakpoints.min.js"></script> -->
<!-- <script src="resources/assets/js/util.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/main.css" /> -->
<!-- <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript> -->
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
#event {
	min-height: 100%;
}

.title {
	margin-top: 30px;
	font-size: 3em;
	font-family: 'yg-jalnan';
}

#event_center {
	display: flex;
	flex-direction: column;
}

.event_span {
	margin-top: 20px;
	margin-bottom: 50px;
}

.event_wrap {
	margin-bottom: 30px;
}

.event_img {
	width: 70%;
	height: 100%;
	object-fit: cover;
	border-radius: 15px;
}

.admin_event1Wrap {
	display: flex;
}

.admin_event_cont1Wrap {
	flex-grow: 1;
	width: 55%;
	border-bottom: 0.1px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file1Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 45%;
}

.admin_event_file1 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

/*  */

.admin_event2Wrap {
	display: flex;
	flex-direction: row-reverse;
}

.admin_event_cont2Wrap {
	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file2Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 40%;
}

.admin_event_file2 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

/*  */

.admin_event3Wrap {
	display: flex;
	
}

.admin_event_cont3Wrap {
	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file3Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 40%;
}

.admin_event_file3 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

.admin_event3In{
	height: 100%;
	display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.btn.btn-light-eventItemBtn{
	width: 120px;
	font-size: 1.5em;
	border: 1px solid gray;
}




</style>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;" align="center">
	<br> <br> <br>



<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event_insert.do'"
>이벤트 생성</button>
<br />
<div align = "center" id = "event">
		<h1 class = "title">EVENT</h1>
		<div id = "event_center">
		<input type = "hidden" name = "event_no">
			<div class = "event_span" align = "center">
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
			<br />
			<br />
			<br />

		<!-- 첫번째 영역 -->
		<div class="admin_event1Wrap" style="display: flex;">
			<div class="admin_event_cont1Wrap">
				<textarea class="admin_event_cont1" id="admin_event_cont1"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"> ${dto.event_cont1 } </textarea>
			</div>
			<div class="admin_event_file1Wrap">
				<img width="50%" src="resources/image/${dto.event_file1}"
					class="admin_event_file1">
			</div>
		</div>
		
		<!-- 두번째 영역 -->
		<div class="admin_event2Wrap" style="display: flex;">
			<div class="admin_event_cont2Wrap">
				<textarea class="admin_event_cont2" id="admin_event_cont2"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"> ${dto.event_cont2 } </textarea>
			</div>
			<div class="admin_event_file2Wrap">
				<img width="30%" src="resources/image/${dto.event_file2}"
					class="admin_event_file2">
			</div>
		</div>
		
		<!-- 세번째 영역 -->
		<div class="admin_event3Wrap" style="display: flex;">
			<div class="admin_event_cont3Wrap">
			<div class="admin_event3In">
			<div>
				<textarea class="admin_event_cont3" id="admin_event_cont3"
					spellcheck="false" readonly
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"> ${dto.event_cont3 } </textarea>
			</div>
			<div align="center">
				<button type="button" class="btn btn-light-eventItemBtn">사러가기</button>			
			</div>
			</div>
			</div>
			<div class="admin_event_file3Wrap">
				<img width="30%" src="resources/image/${dto.event_file3}"
					class="admin_event_file3">
			</div>
		</div>

		
		
		
		
		
		
			<br />
			<br />
			<br />
		
			<button class="btn btn-secondary" 
			onclick = "location.href ='<%=request.getContextPath() %>/admin_event_update.do?no=${dto.event_no }'">
			이벤트 상세정보 수정</button>
			<br />
			<br />
			<br />
			<br />
			<br />
			
	</div>

	</div>

<jsp:include page="../banner/bottom.jsp" />