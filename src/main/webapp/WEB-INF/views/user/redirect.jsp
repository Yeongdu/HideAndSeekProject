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
	alert('${msg}');
	//swal('로그인 실패', '${msg}', 'warning');
	/* swal({
		title: ""
		
	}); */
	location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>

</body>
</html>