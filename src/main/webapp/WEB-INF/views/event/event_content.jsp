<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "dto" value = "${Event }" />
    
    <c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	
    <link href="resources/css/event/event_main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function() {

	function adjustHeight1() {
		var textEle = $('#admin_product_cont1');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight+8);
		};
	function adjustHeight2() {
		var textEle = $('#admin_product_cont2');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight+8);
		};
	function adjustHeight3() {
		var textEle = $('#admin_product_cont3');
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
#admin_product_cont1, #admin_product_cont2, #admin_product_cont3{
    font-size: 2vw;
    font-weight: bold;
    border: 0px solid white;
    width: 80%;
    }

    textarea:focus{
    color: black;
    }

 .event_wrap {
 	width: 100%;
 	height: 15%;
 	margin : 10px auto;
 	position: relative;
 	}

.event_image > img {
	width: 100%;
	height: 20vw;
	vertical-align: middle;
	object-fit: cover;
	overflow:hidden;
}

.event_cont_file{
	width: 100%;
	height: 40vw;
	vertical-align: middle;
	object-fit: cover;
	overflow:hidden;
}

 .event_text { 
 	position: absolute; 
 	top: 40%; 
 	left: 50%; 
 	transform: translate(-50%, -50%); 
 	font-size: 4vw;; 
 	font-weight: bold; 
 	color: white; 
 	text-align: left; 
 }
 
 .btn.btn-primary_eventBtn{
 	font-size:3vw;
 	border: 1px solid lightgray;
 }

/* .event_imageThumbnail { */
/* 	width: 100%; */
/* } */
</style>

<div style="height: auto; min-height: 100%;">
<br>
<br>

    
    <div class="event_wrap">
    	<div class="event_image">
    	<img src = "resources/image/${dto.event_thumbnail }"
    	onclick = "location.href ='<%=request.getContextPath() %>/event_content.do?event_no=${dto.event_no }'"
    	>
    	</div>
    	<div class="event_text">
    	<p>${dto.event_cont1 }</p>
    	</div>
    
    </div>
    
    <br><br>
    
    <div align="center">
    <div>
    <c:if test="${!empty dto.event_file1  }">
			<img class="event_cont_file" width="650px;"
				src="resources/image/${dto.event_file1 }"
				>
		</c:if>
		<c:if test="${empty dto.event_file1  }">
		</c:if>
		</div>
		<textarea class="admin_product_cont" id="admin_product_cont1" spellcheck="false" readonly style="resize: none;"> ${dto.event_cont1 } </textarea>
		<br>
		<br>
		<br>
		<div>
		<c:if test="${!empty dto.event_file2  }">
			<img class="event_cont_file" width="650px;"
				src="resources/image/${dto.event_file2 }"
				>
		</c:if>
		<c:if test="${empty dto.event_file2  }">
		</c:if>
		</div>
		<textarea class="admin_product_cont" id="admin_product_cont2" spellcheck="false" readonly style="resize: none;"> ${dto.event_cont3 } </textarea>
		<br>
		<br>
		<br>
		<div>
		<c:if test="${!empty dto.event_file3  }">
			<img class="event_cont_file" width="650px;"
				src="resources/image/${dto.event_file3 }"
				>
		</c:if>
		<c:if test="${empty dto.event_file3  }">
		</c:if>
		</div>
		<textarea class="admin_product_cont" id="admin_product_cont3" spellcheck="false" readonly style="resize: none;"> ${dto.event_cont3 } </textarea>
    <br /><br />
    <input type="button" value="사러가기" class="btn btn-primary_eventBtn" onclick="location.href='<%=request.getContextPath() %>/product_content_list.do?no=${dto.product_no }'">
    </div>
    
    
    <br /><br />
    <br /><br />
    
    
    
<!-- 	<div align = "center" id = "event"> -->
<!-- 		<h1 class = "title">EVENT</h1> -->
<!-- 		<div id = "event_center"> -->
<!-- 		<input type = "hidden" name = "event_no"> -->
<!-- 			<div class = "event_span" align = "center"> -->
<!-- 				<h3 class = "event_ing">현재 진행중인 이벤트</h3> -->
<!-- 			</div> -->
<%-- 			<c:set var = "list" value = "${list }" /> --%>
<%-- 			<c:forEach items="${list }" var = "dto"> --%>
<!-- 			<div class = "event_wrap"> -->
<%-- 				<img src = "resources/image/event${dto.getEvent_no() }.png" class = "event_img" --%>
<%-- 					onclick = "location.href ='<%=request.getContextPath() %>/event_content?event_no=${dto.getEvent_no() }'"> --%>
<!-- 			</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->

</div>

<script>
window.onload = function () {
	$(".loading").fadeOut(100,function(){
		$("#div_load_image").fadeOut(300);
	});
}
</script>	

<jsp:include page="../banner/bottom.jsp" />
