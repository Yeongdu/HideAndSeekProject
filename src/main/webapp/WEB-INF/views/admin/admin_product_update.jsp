<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${PCont }" />
<c:set var="pcdto" value="${PCCont }" />
<c:set var="page" value="${page }" />
<c:set var="slist" value="${CategoryList }" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>${dto.product_no }) ${dto.product_name } 수정</title>
<div style="width:45em; height:auto; margin: 50px auto; text-align: center;" align="center">
<script type="text/javascript">
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	      document.getElementById('product_thumbnail').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
	
// 	function readURL2(input) {
// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();
// 	    reader.onload = function(e) {
// 	      document.getElementById('preview2').src = e.target.result;
// 	      document.getElementById('product_file1').value = e.target.result;
// 	    };
// 	    reader.readAsDataURL(input.files[0]);
// 	  } else {
// 	    document.getElementById('preview2').src = "";
// 	  }
// 	}
	
// 	function readURL3(input) {
// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();
// 	    reader.onload = function(e) {
// 	      document.getElementById('preview3').src = e.target.result;
// 	      document.getElementById('product_file2').value = e.target.result;
// 	    };
// 	    reader.readAsDataURL(input.files[0]);
// 	  } else {
// 	    document.getElementById('preview3').src = "";
// 	  }
// 	}
	
// 	function readURL4(input) {
// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();
// 	    reader.onload = function(e) {
// 	      document.getElementById('preview4').src = e.target.result;
// 	      document.getElementById('product_file3').value = e.target.result;
// 	    };
// 	    reader.readAsDataURL(input.files[0]);
// 	  } else {
// 	    document.getElementById('preview4').src = "";
// 	  }
// 	}

	
</script>
<br><br>
        <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_product_update_ok.do" class="border-top">
            <input type="hidden" name="product_no" value="${dto.product_no }">
            <input type="hidden" name="page" value="${page }">
            <input type="hidden" name="no" value="${dto.product_no }">
            
            <%--상품이름 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">상품이름</label>
                <div class="col-sm-8">
                    <input type="text" name="product_name" id="product_name" value="${dto.product_name }" class="form-control-plaintext" required/>
                </div>
            </div>
            
            <%--등록일 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">등록일</label>
                <div class="col-sm-8">
                    <input type="text" name="product_date" id="product_date" value="${dto.product_date }" class="form-control-plaintext" disabled/>
                </div>
            </div>
            
            <%--상품 카테고리 --%>
			
			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">카테고리</label>
				<div class="col-sm-8">
					<select required class="form-select" name="product_category"
						aria-label="Default select example">
						<option value="">카테고리 선택</option>
						
						
						
						<c:if test="${empty slist }">
							<option value="">:: 담당업무 없음 ::</option>
						</c:if>
						<c:if test="${!empty slist }">
							<c:forEach items="${slist }" var="str">
																				
								<c:if test="${dto.product_category eq str.product_category}">
									<option value="${dto.product_category }" selected>${str.product_category }</option>
								</c:if>
								
								<c:if test="${dto.product_category ne str.product_category}">
									<option value="${dto.product_category }">${str.product_category }</option>
								</c:if>
							</c:forEach>
						</c:if>
						
					</select>
				</div>
			</div>
			
			<%--상품설명1 --%>
			<div class="form-group row border-bottom py-2">
                <label for="product_introduce1" class="col-sm-4 col-form-label">상품설명1</label>
                <div class="col-sm-8">
                    <input type="text" name="product_introduce1" id="product_introduce1" value="${dto.product_introduce1 }" class="form-control-plaintext" required />
                </div>
            </div>
            
            <%--상품설명2 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_introduce2" class="col-sm-4 col-form-label">상품설명2</label>
                <div class="col-sm-8">
                    <input type="text" name="product_introduce2" id="product_introduce2" value="${dto.product_introduce2 }" class="form-control-plaintext" required />
                </div>
            </div>
            
            <%--제조사 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_company" class="col-sm-4 col-form-label">제조사</label>
                <div class="col-sm-8">
                    <input type="text" name="product_company" id="product_company" value="${dto.product_company }" class="form-control-plaintext" required />
                </div>
            </div>
            

			<%--도수 (%) 0~50 --%>
			<div class="form-group row border-bottom py-2">
                <label for="product_alcohol" class="col-sm-4 col-form-label">도 수 [ % ]</label>
                <div class="col-sm-8">
                    <input type="number" id="product_alcohol" value="${dto.product_alcohol }" name="product_alcohol"
         min="0" max="50" class="form-control-plaintext" required />
                </div>
            </div>
            
            <input type="hidden" name="product_dosu" value="${dto.product_dosu }">
            

			<%--단맛 (단계) low, middle, high --%>
			<div class="form-group row border-bottom py-2">
				<label for="product_sweet" class="col-sm-4 col-form-label">단맛</label>
				<div class="col-sm-8">

					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="low" <c:if test="${dto.product_sweet eq 'low'}">checked</c:if> required> 
					<label class="form-check-label" for="inlineRadio1">낮음</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="middle" <c:if test="${dto.product_sweet eq 'middle'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="high" <c:if test="${dto.product_sweet eq 'high'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">높음</label>

				</div>
			</div>

			<%--신맛 (단계) low, middle, high --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_acidity" class="col-sm-4 col-form-label">신 맛</label>
                <div class="col-sm-8">
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="low" <c:if test="${dto.product_acidity eq 'low'}">checked</c:if> required> 
					<label class="form-check-label" for="inlineRadio1">낮음</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="middle" <c:if test="${dto.product_acidity eq 'middle'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="high" <c:if test="${dto.product_acidity eq 'high'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">높음</label>
                </div>
            </div>

            <%--탄산 (단계) nosoda, low, middle, high --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_soda" class="col-sm-4 col-form-label">탄 산</label>
                <div class="col-sm-8">
                
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="nosoda" <c:if test="${dto.product_soda eq 'nosoda'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">탄산없음</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="low" <c:if test="${dto.product_soda eq 'low'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">적음</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="middle" <c:if test="${dto.product_soda eq 'middle'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="high" <c:if test="${dto.product_soda eq 'high'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">많음</label>
                
                </div>
            </div>
            
            
            <%--원료 fruit, flower, nut, herb, other --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_material" class="col-sm-4 col-form-label">원료</label>
                <div class="col-sm-8">
                
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="fruit" <c:if test="${dto.product_material eq 'fruit'}">checked</c:if> required>
				  <label class="form-check-label" for="inlineRadio1">과일</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="flower" <c:if test="${dto.product_material eq 'flower'}">checked</c:if> required>
				  <label class="form-check-label" for="inlineRadio1">꽃</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="nut" <c:if test="${dto.product_material eq 'nut'}">checked</c:if> required>
				  <label class="form-check-label" for="inlineRadio1">견과류</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="herb" <c:if test="${dto.product_material eq 'herb'}">checked</c:if> required>
				  <label class="form-check-label" for="inlineRadio1">허브</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="other" <c:if test="${dto.product_material eq 'other'}">checked</c:if> required>
				  <label class="form-check-label" for="inlineRadio1">기타</label>
                
                </div>
            </div>
            
            
            
            
            
            <%--용량 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_price" class="col-sm-4 col-form-label">용량</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_amount" id="product_amount" class="form-control-plaintext" value="${dto.product_amount }" required />
                </div>
            </div>
            
            <%--판매가 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_price" class="col-sm-4 col-form-label">판매가</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_price" id="product_price" class="form-control-plaintext" value="${dto.product_price }" required />
                </div>
            </div>
			
			<%--재고수량(입고량) --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_stock" class="col-sm-4 col-form-label">재고수량</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_stock" id="product_stock" class="form-control-plaintext" value="${dto.product_stock }" required />
                </div>
            </div>
            
			<%--적립 포인트 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_point" class="col-sm-4 col-form-label">재고수량</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_point" id="product_point" class="form-control-plaintext" value="${dto.product_point }" required />
                </div>
            </div>
            
            <%--판매 상태 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_status" class="col-sm-4 col-form-label">상품상태</label>
                <div class="col-sm-8">
					<input class="form-check-input" type="radio" name="product_status" id="product_acidity" value="판매" <c:if test="${dto.product_status eq '판매'}">checked</c:if> required> 
					<label class="form-check-label" for="inlineRadio1">판매</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="product_status" id="product_acidity" value="품절" <c:if test="${dto.product_status eq '품절'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">품절</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_status" id="product_acidity" value="종료" <c:if test="${dto.product_status eq '종료'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">종료</label>
                </div>
            </div>
            
            <%--썸네일 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_thumbnail" class="col-sm-4 col-form-label">썸네일</label>
                <div class="col-sm-8">
                 <input type="file" class="thumbnailInput" name="product_thumbnailFile" id="product_thumbnailFile" onchange="readURL(this);"/>
                <c:if test="${empty product_thumbnailFile}">
                <img width="120px;" id="preview1" src = "resources/upload/${dto.product_thumbnail }"/>
                <input type="hidden" name="product_thumbnail" id="product_thumbnail" value="${dto.product_thumbnail }"/>
                </c:if>

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