<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림창</title>
</head>
<body>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	
    var id = '<%=(String)session.getAttribute("userId")%>';
    
    location.href = "<%=request.getContextPath() %>/sub_info.do?userId="+id;
    
	
	
	/* swal({
		title: "로그인 실패!",
		text: "아이디, 비밀번호를 확인해주세요!",
		icon: "warning",
		closeOnClickOutside : false
		})
		.then(function(loginfail) {
			if(loginfail == true){
				//location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
				history.back();
				
				console.log("id");
			} 
		}); */
	
</script>

</body>
</html>