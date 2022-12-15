<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${udto }" />

<c:set var="page" value="${page }" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>${dto.user_no }) ${dto.user_name } 회원 상세정보 </title>
<script type="text/javascript">




</script>
<br><br><br>

	<br>
<div style="height: auto; min-height: 100%;" align="center">
<!-- 	<p class="adminPdContTitle1"> -->

	<div align="center" style="width: 60%;">
		
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원명</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_name }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원아이디</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_id }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원이메일</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_email }</span>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">생년월일</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_jumin1 }</span>
				</div>
			</div>
			
			
</div>
	<!-- 네번째 end -->

		<input type="button" class="btn btn-primary-2" value="전체회원목록" onclick="location.href='admin_user_list.do'">
<div></div>
<div></div>
<div></div>
<div></div>






</div>
<br><br><br>




<jsp:include page="../banner/bottom.jsp" />