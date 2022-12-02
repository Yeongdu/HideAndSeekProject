<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="resources/css/banner/admin_banner.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
</head>
<body>
<jsp:include page="../banner/admin_top.jsp" />

<div style="width:45em; margin: 50px auto; text-align: center;" align="center">

<br><br><br>
        <form method="post" action="<%=request.getContextPath()%>/admin_product_insert_ok.do" class="border-top">
            
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">상품이름</label>
                <div class="col-sm-8">
                    <input type="text" name="product_name" id="product_name" class="form-control-plaintext" required />
                </div>
            </div>
            
            
			<c:set var="slist" value="${CategoryList }" />
			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">카테고리</label>
				<div class="col-sm-8">
					<select required class="form-select" name="job"
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


			<div class="form-group row border-bottom py-2">
                <label for="product_alcohol" class="col-sm-4 col-form-label">도 수</label>
                <div class="col-sm-8">
                    <input type="number" id="volume" name="product_alcohol"
         min="0" max="50" class="form-control-plaintext" required />
                </div>
            </div>
            
           <div class="form-group row border-bottom py-2">
                <label for="sweet_volume" class="col-sm-4 col-form-label">단 맛</label>
                <div class="col-sm-8">
                    <input  type="range" id="volume" name="sweet_volume"
         min="0" max="5" class="form-control-plaintext-range" oninput="document.getElementById('sweet_volume').innerHTML=this.value;" required />
                &nbsp;<span id="sweet_volume"></span>
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="alcohol_volume" class="col-sm-4 col-form-label">신 맛</label>
                <div class="col-sm-8">
                    <input type="range" id="volume" name="alcohol_volume"
         min="0" max="5" class="form-control-plaintext-range" oninput="document.getElementById('acidity_volume').innerHTML=this.value;" required />
                &nbsp; <span id="acidity_volume"></span>
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="soda_volume" class="col-sm-4 col-form-label">탄 산</label>
                <div class="col-sm-8">
                    <input type="range" id="volume" name="alcohol_volume"
         min="0" max="5" class="form-control-plaintext-range" oninput="document.getElementById('soda_volume').innerHTML=this.value;" required />
                &nbsp; <span id="soda_volume"></span>
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="product_material" class="col-sm-4 col-form-label">원 료</label>
                <div class="col-sm-8">
                    <input type="text" name="product_material" id="product_material" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="product_price" class="col-sm-4 col-form-label">판매가</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_price" id="product_price" class="form-control-plaintext" required />
                </div>
            </div>
			
	
            <div class="form-group row border-bottom py-2">
                <label for="product_stock" class="col-sm-4 col-form-label">재고수량</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_stock" id="product_stock" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="product_point" class="col-sm-4 col-form-label">구매 포인트</label>
                <div class="col-sm-8">
                    <input type="number" min="0" name="product_point" id="product_point" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="product_thumbnail" class="col-sm-4 col-form-label">썸네일</label>
                <div class="col-sm-8">
                    <input type="file" class="thumbnailInput" name="product_thumbnail" id="product_thumbnail" onchange="readURL(this);" required />
                <img width="120px;" id="preview" />
                </div>
            </div>


			<div class="form-group row mt-4" align="center">
                <div>
                    <button type="submit" class="btn btn-success">등록하기</button>
                    <button type="reset" class="btn btn-outline-danger">다시작성</button>
                    <input type="button" class="btn btn-secondary" value="메인화면" onclick="location.href='admin_main.do'">
                </div>
            </div>
        </form>
        </div>



</body>
</html>