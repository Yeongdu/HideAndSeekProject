<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${Cont }" />
<c:set var="pcdto" value="${PCCont }" />
<c:set var="page" value="${page }" />
<c:set var="thumbnail" value="${thumbnail }" />
<c:set var="DBfile1" value="${file1 }" />
<c:set var="DBfile2" value="${file2 }" />
<c:set var="DBfile3" value="${file3 }" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>${dto.product_no }) ${dto.product_name } 상세 </title>
<script type="text/javascript">

//본문 textarea 높이 자동조절 함수
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
<br><br><br>

	<br>
<div style="height: auto; min-height: 100%;" align="center">
<!-- 	<p class="adminPdContTitle1"> -->

	<div class="adminPdContTopWrab">
	<div>
	기본 정보&nbsp;&nbsp;<input type="button"
					class="btn btn-primary-2" value="수정"
					onclick="location.href='<%=request.getContextPath()%>/admin_product_update.do?no=${dto.product_no }&page=${page}'">
					</div>
					
					<div>
					<input type="button" class="btn btn-primary-2" value="상품 삭제"
					onclick="if(confirm('상품을 삭제하시겠습니까? 되돌릴 수 없습니다.')){
					location.href='<%=request.getContextPath() %>/admin_product_delete.do?no=${dto.product_no }'} 
					else{return; }">
		<input type="button" class="btn btn-primary-2" value="전체목록" onclick="location.href='admin_product_list.do'">
					</div>
					</div>
<!-- 					</p> -->

	<!-- 첫번째 (썸네일 사진, 상품명, 가격, 판매상태) -->
	<div class="adminPdContFirstWrab">
		<div class="adminPdContImgWrab" style="margin-right: 50px;">
			<img class="img-thumbnail" width="200px;"
				src="resources/upload/${thumbnail }"
				alt="${dto.product_name } 썸네일 사진">
		</div>

		<div class="adminPdContNameWrab">
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">상품명</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 300px">${dto.product_name }</span>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">가격</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 300px">
					<fmt:formatNumber value="${dto.product_price }" pattern="#,### 원"/> 
					</span>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">적립포인트</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 300px">
					<fmt:formatNumber value="${dto.product_point }" pattern="#,### 원"/> 
					</span>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">판매상태</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 300px">${dto.product_status }</span>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label-1">재고</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 300px">
					<fmt:formatNumber value="${dto.product_stock }" pattern="#,### 개"/> 
					</span>
				</div>
			</div>
			
		</div>
	</div>
	<!-- 첫번째 end -->





	<!-- 두번째  -->
	<div class="adminPdContSecondWrab">
	
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-2" style="text-align: right;">당도</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 150px">${dto.product_sweet } </span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-2" style="text-align: right;">산미</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 150px">${dto.product_acidity } </span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-2" style="text-align: right;">탄산</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 150px">${dto.product_soda } </span>
			</div>
		</div>

	</div>
	<!-- 두번째 end -->
	
	
	
	<div class="adminPdContSecondWrab">
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-2" style="text-align: right;">용량</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 150px">
				<fmt:formatNumber value="${dto.product_amount }" pattern="#,### ml"/> 
				</span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-2" style="text-align: right;">도수</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 150px">${dto.product_alcohol } % ( ${dto.product_dosu } ) </span>
			</div>
		</div>
	</div>

	<!-- 세번째-->
	<div class="adminPdContThirdWrab">
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-3" style="text-align: right;">상품등록일</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 237px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.product_date }" /></span>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label-3-2" style="text-align: right;">제조사</label>
			<div class="col-sm-5">
				<span class="form-control" style="width: 276px">${dto.product_company } </span>
			</div>
		</div>
	
	</div>
	<!-- 세번째 end -->
	<br>
	<br>
	<p class="adminPdContTitle1">상세 정보&nbsp;&nbsp;<input type="button"
					class="btn btn-primary-2" value="수정"
					onclick="location.href='<%=request.getContextPath()%>/admin_product_content_update.do?no=${dto.product_no }&page=${page}'">
					</p>
	<hr width="660px;" style="margin-left: 15px;">
	<br>
	
	<!-- 네번째-->
	<div class="adminPdContFourthWrab">
		<c:if test="${!empty pcdto.product_file1  }">
			<img class="img-thumbnail" width="650px;"
				src="resources/upload/${DBfile1 }"
				alt="${pcdto.product_file1 } 사진 1">
		</c:if>
		<c:if test="${empty pcdto.product_file1  }">
		</c:if>
		<textarea class="admin_product_cont" id="admin_product_cont1" spellcheck="false" readonly style="resize: none;"> ${pcdto.product_cont1 } </textarea>
		<br>
		<c:if test="${!empty pcdto.product_file2  }">
			<img class="img-thumbnail" width="650px;"
				src="resources/upload/${DBfile2 }"
				alt="${pcdto.product_file2 } 사진 2">
		</c:if>
		<c:if test="${empty pcdto.product_file2  }">
		</c:if>
		<textarea class="admin_product_cont" id="admin_product_cont2" spellcheck="false" readonly style="resize: none;"> ${pcdto.product_cont2 } </textarea>
		<br>
		<c:if test="${!empty pcdto.product_file3  }">
			<img class="img-thumbnail" width="650px;"
				src="resources/upload/${DBfile3 }"
				alt="${pcdto.product_file3 } 사진 3">
		</c:if>
		<c:if test="${empty pcdto.product_file3  }">
		</c:if>
		<textarea class="admin_product_cont" id="admin_product_cont3" spellcheck="false" readonly style="resize: none;"> ${pcdto.product_cont3 } </textarea>



	</div>
	<!-- 네번째 end -->
	<input type="button" class="btn btn-primary-2" value="상품 삭제"
					onclick="if(confirm('상품을 삭제하시겠습니까? 되돌릴 수 없습니다.')){
					location.href='<%=request.getContextPath() %>/admin_product_delete.do?no=${dto.product_no }'} 
					else{return; }">
		<input type="button" class="btn btn-primary-2" value="전체목록" onclick="location.href='admin_product_list.do'">
<div></div>
<div></div>
<div></div>
<div></div>






</div>
<br><br><br>




<jsp:include page="../banner/bottom.jsp" />