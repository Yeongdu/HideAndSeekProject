<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${User }" />

<c:set var="page" value="${page }" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>${dto.user_no }) ${dto.user_name } 회원 수정 </title>
<script type="text/javascript">


	function swalUserDelete(){
		swal({
			text : "회원을 탈퇴처리 하겠습니까?",
			buttons: ["취소" , "탈퇴"]
		})
		.then(function(result){
			console.log(result);
	        
	        if(result){
	        	location.href = "/";
	        }
	        
		})
	}

$(document).on("click",".userDeleteBtn", function(){
	swal({
		text : "텍스트",
		closeOnClickOutside : false // 백그라운드 클릭해도 안꺼짐
	})
	.then(function(result){ //  창 꺼질때 실행할 함수
		console.log(result);
		// background 클릭 => null
		// 확인버튼 클릭 => true
	    
	    if(result) {
	    	location.href = "/";
	    }
	    
	})
	
});



</script>
<br><br><br>

	<br>
<div style="height: auto; min-height: 100%;" align="center">
<!-- 	<p class="adminPdContTitle1"> -->

			<form method="post" action="<%=request.getContextPath()%>/admin_user_update_ok.do" class="border-top">
	<div align="center" style="width: 60%;">
	
			<input type="hidden" name="page" value="${page }">
            <input type="hidden" name="user_no" value="${dto.user_no }">
		
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
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">전화번호</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_phone1 }</span>
				</div>
			</div>
			

			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">포인트</label>
				<div class="col-sm-10">
					<span class="form-control">
					<input type="number" name="user_point" id="user_point" value="${dto.user_point }"/>
					</span>
				</div>
			</div>

			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">회원가입일</label>
				<div class="col-sm-10">
					<span class="form-control"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.user_date }" /></span>
				</div>
			</div>
			
			<c:if test="${!empty dto.user_addr1 }">
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">주소</label>
				<div class="col-sm-10">
					<span class="form-control">${dto.user_addr1 }</span>
				</div>
			</div>
			</c:if>
			
			<c:if test="${empty dto.user_addr1 }">
			</c:if>
			
			<c:if test="${dto.user_leave == 0 }">
			<h4>탈퇴회원 입니다</h4>
			<br>
			</c:if>
			
			
			
</div>
	<!-- 네번째 end -->

		<input type="button" type="submit" class="btn btn-primary-2" value="수정" onclick="location.href='admin_user_update.do?no=${dto.user_no }&page=${page}'">
			</form>
		<input type="button" class="btn btn-primary-2" class="userDeleteBtn" value="삭제" >

		<input type="button" class="btn btn-primary-2" value="전체회원목록" onclick="location.href='admin_user_list.do'">

<div></div>
<div></div>
<div></div>
<div></div>






</div>
<br><br><br>




<jsp:include page="../banner/bottom.jsp" />