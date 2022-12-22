<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${PCont }" />
<c:set var="pcdto" value="${PCCont }" />
<c:set var="page" value="${page }" />
<c:set var="DBfile1" value="${file1 }" />
<c:set var="DBfile2" value="${file2 }" />
<c:set var="DBfile3" value="${file3 }" />


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<jsp:include page="../banner/admin_top.jsp" />

<title>${pcdto.product_no }) ${dto.product_name } 수정</title>

<script type="text/javascript">

$(function() {
// 	function readURL(input) {
// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();
// 	    reader.onload = function(e) {
// 	      document.getElementById('preview1').src = e.target.result;
// 	      document.getElementById('product_thumbnail').value = e.target.result;
// 	    };
// 	    reader.readAsDataURL(input.files[0]);
// 	  } else {
// 	    document.getElementById('preview1').src = "";
// 	  }
// 	}
	
	function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	      document.getElementById('product_file1').value = e.target.result;
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
	      document.getElementById('product_file2').value = e.target.result;
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
	      document.getElementById('product_file3').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview4').src = "";
	  }
	}

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
	
// 	function resize(obj) {
// 	  obj.style.height = obj.scrollHeight;
// 	  obj.style.height = (12 + obj.scrollHeight) + "px";
// 	  obj.style.height = obj.scrollHeight + "px";
// 	}
	
});
</script>
<br><br>
<div style="min-height:100%; width:66em; height:auto; margin: 50px auto; text-align: center;" align="center">
<!-- <div style="width:80em;"> -->
        <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_product_content_update_ok.do" class="border-top">
            <input type="hidden" name="product_no" value="${dto.product_no }">
            <input type="hidden" name="page" value="${page }">
            <input type="hidden" name="no" value="${dto.product_no }">
         
         
         
         		<!-- 상품 사진, 설명 더 작성하기 -->

			<br><br>

				
				

				<div class="form-group row border-bottom py-2">
					<label for="product_file1" class="col-sm-2 col-form-label">상품사진1</label>
					<div class="col-sm-8">
						<input type="file" name="product_file1file" id="product_file1file"  class="thumbnailInput" onchange="readURL2(this);"/>
						<img width="300px;" id="preview2" 
							<c:if test="${!empty pcdto.product_file1 }">
								src = "resources/upload/${pcdto.product_file1 }"
							</c:if>
							<c:if test="${empty pcdto.product_file1 }" > </c:if>
						/>
						<input type="hidden" name="product_file1" value="${pcdto.product_file1 }"/>
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont1" class="col-sm-2 col-form-label">상품설명1</label>
					<div class="col-sm-8">
					 <textarea class="form-control" name="product_cont1" id="admin_product_cont1">${pcdto.product_cont1 }</textarea>
					</div>
				</div>

				<div class="form-group row border-bottom py-2">
					<label for="product_file2" class="col-sm-2 col-form-label">상품사진2</label>
					<div class="col-sm-8">
						<input type="file" class="thumbnailInput" name="product_file2file" id="product_file2file" onchange="readURL3(this);" value="${pcdto.product_file2 }"/> 
						<img width="300px;" id="preview3"
							<c:if test="${!empty pcdto.product_file2 }" >
							src = "resources/upload/${pcdto.product_file2 }"
							</c:if>
							<c:if test="${empty pcdto.product_file2 }" >
							</c:if>
						 />
						 <input type="hidden" name="product_file2" value="${pcdto.product_file2 }"/>
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont2" class="col-sm-2 col-form-label">상품설명2</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="product_cont2" id="admin_product_cont2">${pcdto.product_cont2 }</textarea>
					</div>
				</div>

				<div class="form-group row border-bottom py-2">
					<label for="product_file3" class="col-sm-2 col-form-label">상품사진3</label>
					<div class="col-sm-8">
						<input type="file" name="product_file3file" id="product_file3file" class="thumbnailInput" onchange="readURL4(this);" value="${pcdto.product_file3 }"/>
						<img width="300px;" id="preview4"
							<c:if test="${!empty pcdto.product_file3 }" >
							src = "resources/upload/${pcdto.product_file3 }"
							</c:if>
							<c:if test="${empty pcdto.product_file3 }" >
							</c:if>
						 />
						 <input type="hidden" name="product_file3" value="${pcdto.product_file3 }"/>
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont3" class="col-sm-2 col-form-label">상품설명3</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="product_cont3" id="admin_product_cont3">${pcdto.product_cont3 }</textarea>
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