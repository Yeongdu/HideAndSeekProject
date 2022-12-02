<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
	
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../banner/admin_top.jsp" />

<div style="width:45em; margin: 50px auto; text-align: center;" align="center">

<br><br><br>
        <form method="post" action="<%=request.getContextPath()%>/${page}" class="border-top">
        <input type="hidden" value="${ dto.empno }" name="${ empno }" />

            
            <div class="form-group row border-bottom py-2">
                <label for="ename" class="col-sm-4 col-form-label">상품이름</label>
                <div class="col-sm-8">
                    <input type="text" name="ename" id="ename" value="${dto.ename}" class="form-control-plaintext" required />
                </div>
            </div>

			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">카테고리</label>
				<div class="col-sm-8">
					<select required class="form-select" name="job"
						aria-label="Default select example">
						<option value="">담당업무 선택</option>
						
						<c:if test="${empty jlist }">
							<option value="">:: 담당업무 없음 ::</option>
						</c:if>
						
						<c:if test="${!empty jlist }">
							<c:forEach items="${jlist }" var="str">
								<c:if test="${dto.job == str}">
									<option value="${str }" selected>${str }</option>
								</c:if>

								<c:if test="${dto.job != str}">
									<option value="${str }">${str }</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			
			
			<div class="form-group row border-bottom py-2">
                <label for="alcohol_volume" class="col-sm-4 col-form-label">도 수&nbsp;&nbsp;&nbsp;&nbsp; <span id="alcohol_volume"></span></label>
                <div class="col-sm-8">
                    <input  type="range" id="volume" name="alcohol_volume"
         min="0" max="50" value="${dto.ename}" class="form-control-plaintext" oninput="document.getElementById('alcohol_volume').innerHTML=this.value;" required />
                
                </div>
            </div>
            
           <div class="form-group row border-bottom py-2">
                <label for="sweet_volume" class="col-sm-4 col-form-label">단 맛&nbsp;&nbsp;&nbsp;&nbsp; <span id="sweet_volume"></span></label>
                <div class="col-sm-8">
                    <input  type="range" id="volume" name="sweet_volume"
         min="0" max="5" value="${dto.ename}" class="form-control-plaintext" oninput="document.getElementById('sweet_volume').innerHTML=this.value;" required />
                <span id="sweet_volume"></span>
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="alcohol_volume" class="col-sm-4 col-form-label">신 맛&nbsp;&nbsp;&nbsp;&nbsp; <span id="acidity_volume"></span></label>
                <div class="col-sm-8">
                    <input  type="range" id="volume" name="alcohol_volume"
         min="0" max="5" value="${dto.ename}" class="form-control-plaintext" oninput="document.getElementById('acidity_volume').innerHTML=this.value;" required />
                
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="soda_volume" class="col-sm-4 col-form-label">탄산&nbsp;&nbsp;&nbsp;&nbsp; <span id="soda_volume"></span></label>
                <div class="col-sm-8">
                    <input  type="range" id="volume" name="alcohol_volume"
         min="0" max="5" value="${dto.ename}" class="form-control-plaintext" oninput="document.getElementById('soda_volume').innerHTML=this.value;" required />
                
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="ename" class="col-sm-4 col-form-label">원료</label>
                <div class="col-sm-8">
                    <input type="text" name="ename" id="ename" value="${dto.ename}" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="ename" class="col-sm-4 col-form-label">판매가</label>
                <div class="col-sm-8">
                    <input type="text" name="ename" id="ename" value="${dto.ename}" class="form-control-plaintext" required />
                </div>
            </div>
			
	
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">재고수량</label>
                <div class="col-sm-8">
                    <input type="number" name="sal" id="sal" value="${dto.sal}" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">구매 포인트</label>
                <div class="col-sm-8">
                    <input type="number" name="comm" id="comm" value="${dto.comm}" class="form-control-plaintext" required />
                </div>
            </div>


			<div class="form-group row mt-4" align="center">
                <div>
                    <button type="submit" class="btn btn-success">${btn }</button>
                    <button type="reset" class="btn btn-outline-danger">다시작성</button>
                    <input type="button" class="btn btn-secondary" value="사원목록" onclick="location.href='emp_list.do'">
                </div>
            </div>
        </form>
        </div>



</body>
</html>