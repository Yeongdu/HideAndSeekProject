<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="list" value="${list }" />
<c:set var="page" value="${page }"/>
<c:set var="field" value="${field }"/>
<c:set var="keyword" value="${keyword }"/>
<jsp:include page="../banner/admin_top.jsp" />


<title>전체 유저 목록</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

<div style="height: auto; min-height: 100%;">
<br>
<br>
<br>

	<div class="adminProductListTitle" align="center">
		<h4>전체 유저 목록</h4>
		<br>
	</div>
	<div align="center">
	<div class="admin_userTopBtn" align="center">
	<input type="button" class="btn btn-light" value="탈퇴제외 활동회원" onclick="location.href='<%=request.getContextPath() %>/admin_ing_user_list.do'">
	&nbsp;
	<input type="button" class="btn btn-light" value="탈퇴회원" onclick="location.href='<%=request.getContextPath() %>/admin_del_user_list.do'">
	&nbsp;
	<input type="button" class="btn btn-secondary" value="탈퇴회원 포함 전체" onclick="location.href='<%=request.getContextPath() %>/admin_user_list.do'" disabled>
	</div>
	</div>
	<div align="center">

		<table class="table table-hover table-bordered" style="margin-left: auto; margin-right: auto; text-align: center; width: 66em;">
			<tr>
				<th style="width: 80px;">번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>메일</th>
				<th>보유포인트</th>
				<th>가입일</th>
				<th></th>
			</tr>

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">${dto.user_no }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">${dto.user_id }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">${dto.user_name }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">${dto.user_email }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">${dto.user_point }</td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.user_date }" /></td>
						<td onclick="location.href='<%=request.getContextPath()%>/admin_user_content.do?no=${dto.user_no }&page=${page.page }'">
							<c:if test="${dto.user_leave eq '1' }">
									<span></span>
							</c:if>
							<c:if test="${dto.user_leave eq '0' }">
									<span>탈퇴한 회원</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="7" align="center">
						<h4>게시물이 없습니다.</h4>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="7" align="center">
					<c:if test="${!empty keyword }">
						<input type="button" value="전체목록" onclick="location.href='admin_user_list.do'">
					</c:if>
				</td>
			</tr>
		</table>
		<br>
	</div>

	<%-- 페이징 처리 --%>
		<div class="page-paging">
		    <c:if test="${page.startBlock > 1}"><span><a href="admin_user_list.do?page=1"><i class="fa fa-angle-double-left"></i></a></span></c:if>
		    <c:if test="${page.startBlock <= 1}"><span class="nolink"><i class="fa fa-angle-double-left"></i></span></c:if>
		
		    <c:if test="${page.page > 1}"><span><a href="admin_user_list.do?page=${page.page - 1}"><i class="fa fa-angle-left"></i></a></span></c:if>
		    <c:if test="${page.page <= 1}"><span class="nolink"><i class="fa fa-angle-left"></i></span></c:if>
		
		    <ol class="paging_1">
		        <c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="i">
		        <c:if test="${i == page.page}"><li class="now">${i}</li></c:if>
		        <c:if test="${i != page.page}"><li><a href="admin_user_list.do?page=${i}">${i}</a></li></c:if>
		        </c:forEach>
		    </ol>
		
		    <c:if test="${page.page < page.allPage}"><span><a href="admin_user_list.do?page=${page.page + 1}"><i class="fa fa-angle-right"></i></a></span></c:if>
		    <c:if test="${page.page >= page.allPage}"><span class="nolink"><i class="fa fa-angle-right"></i></span></c:if>
		
		    <c:if test="${page.endBlock < page.allPage}"><span><a href="admin_user_list.do?page=${page.allPage}"><i class="fa fa-angle-double-right"></i></a></span></c:if>
		    <c:if test="${page.endBlock >= page.allPage}"><span class="nolink"><i class="fa fa-angle-double-right"></i></span></c:if>
		</div>
	<%-- 페이징 처리 end --%>
		
		<br>
		
		<div class="searchWrab" align="center">
		<div>
			<form method="post"
				action="<%=request.getContextPath()%>/admin_user_search.do">
 				<span> <input type="text" name="keyword" value="${keyword}"
					class="form-control" style="width: 20em; display: inline-block;" /></span>
				&nbsp;&nbsp;&nbsp;

				<button type="submit" class="btn btn-secondary ml-1">
					<i class="fa fa-search"></i> 검색
				</button>

			</form>
		</div>
		</div>
</div>
<br><br>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../banner/bottom.jsp" />