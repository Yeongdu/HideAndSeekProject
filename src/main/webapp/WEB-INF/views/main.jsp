<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href="resources/css/main.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div id = "main" align = "center">
		<div align = "center" id = "title">
			<span class = "title">양조장에서 집 까지 찾아오는</span>
			<span class = "title2">한국의 전통적인 전통주</span>
		</div>

		<div align = "center" id = "btn">
			<input type = "button" class = "inputBtn" onclick = "location.href = '<%=request.getContextPath() %>/store.do'" value = "about">
		</div>
	</div>

</body>

</html>
