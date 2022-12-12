<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../banner/admin_top.jsp" />

<title>관리자 상품 등록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
	
	function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}
	
	function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview3').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
	
	function readURL4(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview4').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview4').src = "";
	  }
	}
	
// 	function printFile()  {
// 		  const name = document.getElementById('product_thumbnail').value;
// 		  $('input[name=product_thumbnail_result]').attr('value',name);
// 		}


</script>


<div style="width:45em; height:auto; margin: 50px auto; text-align: center;" align="center">

<br><br>
<%--         <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_product_insert_ok.do" class="border-top"> --%>
            <form method="post" action="<%=request.getContextPath()%>/file_upload.do" enctype="multipart/form-data">
           
            <%--상품이름 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">상품이름</label>
                <div class="col-sm-8">
                    <input type="text" name="product_name" id="product_name" class="form-control-plaintext" required />
                </div>
            </div>
            
            <%--상품 카테고리 --%>
			<c:set var="slist" value="${CategoryList }" />
			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">카테고리</label>
				<div class="col-sm-8">
					<select required class="form-select" name="product_category"
						aria-label="Default select example">
						<option value="">카테고리 선택</option>

						<c:if test="${empty slist }">
							<option value="">:: 카테고리 없음 ::</option>
						</c:if>

						<c:if test="${!empty slist }">
							<c:forEach items="${slist }" var="dto">
								<option value="${dto.product_category }">${dto.product_category }</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>
			
			<%--상품설명1 --%>
			<div class="form-group row border-bottom py-2">
                <label for="product_introduce1" class="col-sm-4 col-form-label">상품설명1</label>
                <div class="col-sm-8">
                    <input type="text" name="product_introduce1" id="product_introduce1" class="form-control-plaintext" required />
                </div>
            </div>
            
            <%--상품설명2 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_introduce2" class="col-sm-4 col-form-label">상품설명2</label>
                <div class="col-sm-8">
                    <input type="text" name="product_introduce2" id="product_introduce2" class="form-control-plaintext" required />
                </div>
            </div>
            
            <%--제조사 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_company" class="col-sm-4 col-form-label">제조사</label>
                <div class="col-sm-8">
                    <input type="text" name="product_company" id="product_company" class="form-control-plaintext" required />
                </div>
            </div>
            

			<%--도수 (%) 0~50 --%>
			<div class="form-group row border-bottom py-2">
                <label for="product_alcohol" class="col-sm-4 col-form-label">도 수</label>
                <div class="col-sm-8">
                    <input type="number" id="product_alcohol" name="product_alcohol"
         min="0" max="50" class="form-control-plaintext" required />
                </div>
            </div>
            

			<%--단맛 (단계) low, middle, high --%>
			<div class="form-group row border-bottom py-2">
				<label for="product_sweet" class="col-sm-4 col-form-label">단맛</label>
				<div class="col-sm-8">

					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="row" required> 
					<label class="form-check-label" for="inlineRadio1">낮음</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="middle" required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_sweet" id="product_sweet" value="high" required>
					<label class="form-check-label" for="inlineRadio1">높음</label>

				</div>
			</div>

			<%--신맛 (단계) low, middle, high --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_acidity" class="col-sm-4 col-form-label">신 맛</label>
                <div class="col-sm-8">
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="row" required> 
					<label class="form-check-label" for="inlineRadio1">낮음</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="middle" required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_acidity" id="product_acidity" value="high" required>
					<label class="form-check-label" for="inlineRadio1">높음</label>
                </div>
            </div>

            <%--탄산 (단계) nosoda, low, middle, high --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_soda" class="col-sm-4 col-form-label">탄 산</label>
                <div class="col-sm-8">
                
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="nosoda" required>
					<label class="form-check-label" for="inlineRadio1">탄산없음</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="row" required>
					<label class="form-check-label" for="inlineRadio1">적음</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="middle" required>
					<label class="form-check-label" for="inlineRadio1">보통</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="product_soda" id="product_soda" value="high" required>
					<label class="form-check-label" for="inlineRadio1">많음</label>
                
                </div>
            </div>
            
            
            <%--원료 fruit, flower, nut, herb, other --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_material" class="col-sm-4 col-form-label">원료</label>
                <div class="col-sm-8">
                
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="fruit" required>
				  <label class="form-check-label" for="inlineRadio1">과일</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="flower" required>
				  <label class="form-check-label" for="inlineRadio1">꽃</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="nut" required>
				  <label class="form-check-label" for="inlineRadio1">견과류</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="herb" required>
				  <label class="form-check-label" for="inlineRadio1">허브</label>
                	&nbsp;&nbsp;&nbsp;&nbsp;
				  <input class="form-check-input" type="radio" name="product_material" id="product_material" value="other" required>
				  <label class="form-check-label" for="inlineRadio1">기타</label>
                
                </div>
            </div>
            
            
            
            
            
            <%--판매가 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_price" class="col-sm-4 col-form-label">판매가</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_price" id="product_price" class="form-control-plaintext" required />
                </div>
            </div>
			
			<%--재고수량(입고량) --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_stock" class="col-sm-4 col-form-label">재고수량</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_stock" id="product_stock" class="form-control-plaintext" required />
                </div>
            </div>
            
<!--              <form action="file_upload" method="post" enctype="multipart/form-data"> -->
            <%--썸네일 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_thumbnail" class="col-sm-4 col-form-label">썸네일</label>
                <div class="col-sm-8">
                    <input type="file" class="thumbnailInput" name="product_thumbnailFile" id="product_thumbnailFile" onchange="readURL(this);" required />
                <img width="120px;" id="preview1" />
                </div>
            </div>
             <button type="submit">Upload</button>
            </form>
            
            <input type="hidden" name="product_thumbnail_result" value="">


			<div class="form-group row mt-4" align="center">
                <div>
                    <button type="submit" class="btn btn-success">등록하기</button>
                    &nbsp;&nbsp;
                    <input type="button" class="btn btn-secondary" value="메인화면" onclick="location.href='admin_main.do'">
                </div>
            </div>
            <br>

		<!-- 상품 사진, 설명 더 작성하기 -->
<!-- 			<details> -->
<!-- 			<br><br> -->
<!-- 				<summary class="btn btn-secondary">계속 작성</summary> -->

<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_file1" class="col-sm-4 col-form-label">상품사진1</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<img width="300px;" id="preview2" /> -->
<!-- 						<input type="file" class="thumbnailInput" name="product_file1" -->
<!-- 							id="product_file1" onchange="readURL2(this);" required /> -->
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_cont1" class="col-sm-4 col-form-label">상품설명1</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 					 <textarea class="form-control" name="product_cont1" id="product_cont1"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_file2" class="col-sm-4 col-form-label">상품사진2</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<img width="300px;" id="preview3" /> -->
<!-- 						<input type="file" class="thumbnailInput" name="product_file1" -->
<!-- 							id="product_file2" onchange="readURL3(this);" required />  -->
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_cont2" class="col-sm-4 col-form-label">상품설명2</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<textarea class="form-control" name="product_cont2" id="product_cont2"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_file3" class="col-sm-4 col-form-label">상품사진3</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<img width="300px;" id="preview4" /> -->
<!-- 						<input type="file" class="thumbnailInput" name="product_file3" -->
<!-- 							id="product_file1" onchange="readURL4(this);" required /> -->
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="form-group row border-bottom py-2"> -->
<!-- 					<label for="product_cont3" class="col-sm-4 col-form-label">상품설명3</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<textarea class="form-control" name="product_cont3" id="product_cont3"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!-- 				<button type="submit" class="btn btn-success">등록하기</button> -->

<!-- 			</details> -->
		<!-- 상품 사진, 설명 더 작성하기 end -->

<!-- 		</form> -->
        </div>
<jsp:include page="../banner/bottom.jsp" />