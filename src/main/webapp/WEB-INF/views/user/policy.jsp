<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  
</head>
<body>

	<c:if test="${empty id }">
	<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty id }">
	<jsp:include page="../banner/user_top.jsp" />
	</c:if>

 <div class="container-fluid" style="min-height: calc(100vh - 136px);">
 
 
      <h3 align="center">${id}님 환영합니다.</h3>
      
     
      
      	
      	
      
     
      
      </div>
    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    
      <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
      <div class="panel panel-default">
        <div class="panel-heading" role="tab">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
            이용약관 동의
          </a>
        </div>
        <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
          <div class="panel-body">
            Hello world1
          </div>
        </div>
      </div>
      
      
      
      <!-- -->
      <!-- 하나의 item입니다.  -->
      <div class="panel panel-default">
        <div class="panel-heading" role="tab">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
           개인정보처리방침 동의
          </a>
        </div>
        <div id="collapse2" class="panel-collapse collapse" role="tabpanel">
          <div class="panel-body">
            Hello world2
          </div>
        </div>
      </div>
      
      
     
    
    </div>
  
  </div>
  
  <script type="text/javascript">

    window.onload = function () {
        $(".loading").fadeOut(100,function(){
            $("#div_load_image").fadeOut(300);
        });
    }

</script>     
  

   
</body>
</html>