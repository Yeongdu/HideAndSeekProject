<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />


<title>관리자 이벤트</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  




<script type="text/javascript">

function readURL1(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
	

// function date1(obj) {
	
// 	  var x = document.getElementById("event_start").value;
// 	  console.log(x);
// 	  document.getElementById("date1").innerHTML = x;

// }
	
// function date2(obj) {

// 	  var x = document.getElementById("event_end").value;
// 	  document.getElementById("date2").innerHTML = x;

// 	}


$(function() {

	
	function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}
	
	function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview3').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
	
	function readURL4(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview4').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview4').src = "";
	  }
	}
	
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
	
	


	
});
</script>



<div style="min-height:100%; width:66em; height:auto; margin: 50px auto; text-align: center;" align="center">
<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event.do'"
>이벤트 목록</button>
<br />
<br><br>
        <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_event_insert_ok.do" class="border-top">
        
			<br><br>

				<div class="form-group row border-bottom py-2">
						<img width="500px;" id="preview1" />
					<label for="event_thumbnailfile" class="col-sm-2 col-form-label">이벤트 썸네일</label>
					<div class="col-sm-8">
						<input type="file" name="event_thumbnailfile" id="event_thumbnailfile"  class="thumbnailInput" onchange="readURL1(this);"/>
					</div>
				</div>
				
				<div class="form-group row border-bottom py-2">
					<label for="event_start" class="col-sm-2 col-form-label">이벤트 기간</label>
					<div class="col-sm-8">
					<input type="date" id="event_start" pattern="\d{4}-\d{2}-\d{2}" name="event_start" >
				     ~
				    <input type="date" id="event_end" pattern="\d{4}-\d{2}-\d{2}" name="event_end" >
					
					</div>
				</div>



         
			<div class="form-group row mt-4" align="center">
                <div>
                    <button type="submit" class="btn btn-success">등록하기</button>
                    &nbsp;&nbsp;
                    <button type="reset" class="btn btn-outline-danger">다시작성</button>
                    &nbsp;&nbsp;
                    <input type="button" class="btn btn-secondary" value="메인화면" onclick="location.href='admin_main.do'">
                </div>
            </div>
            <br>
	
		</form>
        </div>
<jsp:include page="../banner/bottom.jsp" />