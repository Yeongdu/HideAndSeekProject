<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../banner/admin_top.jsp" />
<c:set var="cdto" value="${cateList }"  />
<c:set var="takjuList" value="${takjuList }"  />
<c:set var="chungjuList" value="${chungjuList }"  />
<c:set var="wineList" value="${wineList }"  />
<c:set var="sojuList" value="${sojuList }"  />

<title>관리자 구독 등록</title>
<script type="text/javascript">

    var genre1 = "";
    var genre2 = "";
    var genre3 = "";
function checkForm() {

    $('input:radio[name=product_no1]:checked').each(function() {
        genre1=(this.value);
    });
    
    console.log(genre1);
    //other code
}

function checkForm2() {

    $('input:radio[name=product_no2]:checked').each(function() {
        genre2=(this.value);
    });
    
    console.log(genre2);
    //other code
}


function checkForm3() {

    $('input:radio[name=product_no3]:checked').each(function() {
        genre3=(this.value);
    });
    
    console.log(genre3);
    //other code
}


$(document).on("click", ".adminSubItemInputBtn", function(){
	$("#sub_product1").slideToggle(400);
	$("#sub_item1").val(genre1);
});

$(document).on("click", ".adminSubItemInputBtn2", function(){
	$("#sub_product2").slideToggle(400);
	$("#sub_item2").val(genre2);
});

$(document).on("click", ".adminSubItemInputBtn3", function(){
	$("#sub_product3").slideToggle(400);
	$("#sub_item3").val(genre3);
});



$(document).on("change", ".product_category1", function(){

    let product_category1 = $('.product_category1').val();
    let html = "";

    $.ajax({
        url:"<%=request.getContextPath()%>/admin_sub_list.do",
        method:"post",
        async: false,
        data: { category: product_category1},
        datatype: "json",
        success:function(data){
        	
        	$(".sub_product1").empty();

                $.each(data, function(index, item){

                html += "<div class='product_wrap' style=''>"
                html += "<div class='product_info' style='width:100px; height:150px; display:flex; flex-direction: column;align-items: center;'>"
                html += "<img class='product_img' alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 60px;'>"
                html += "<input type='radio' name='product_no1' style='margin-top: 5px;' value='"+item.product_no+"' onclick='checkForm();'>"+item.product_name+"</div></div>"

            });

                $(".product_img").css({"width" : "60px"}); 
                $(".sub_product1").append(html);
        },

        error:function(data){
            alert("통신 실패");
        }

    });
 });
		
		
		
		
		
		

$(document).on("change", ".product_category2", function(){

    let product_category1 = $('.product_category2').val();
    let html = "";

    $.ajax({
        url:"<%=request.getContextPath()%>/admin_sub_list.do",
        method:"post",
        async: false,
        data: { category: product_category1},
        datatype: "json",
        success:function(data){
        	
        	$(".sub_product2").empty();

                $.each(data, function(index, item){

                html += "<div class='product_wrap' style=''>"
                html += "<div class='product_info' style='width:100px; height:150px; display:flex; flex-direction: column;align-items: center;'>"
                html += "<img class='product_img' alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 60px;'>"
                html += "<input type='radio' name='product_no2' style='margin-top: 5px;' value='"+item.product_no+"' onclick='checkForm2();'>"+item.product_name+"</div></div>"

            });

                $(".product_img").css({"width" : "60px"}); 
                $(".sub_product2").append(html);
        },

        error:function(data){
            alert("통신 실패");
        }

    });
 });
		
		
		
		
		
$(document).on("change", ".product_category3", function(){

    let product_category1 = $('.product_category3').val();
    let html = "";

    $.ajax({
        url:"<%=request.getContextPath()%>/admin_sub_list.do",
        method:"post",
        async: false,
        data: { category: product_category1},
        datatype: "json",
        success:function(data){
        	
        	$(".sub_product2").empty();

                $.each(data, function(index, item){

                html += "<div class='product_wrap' style=''>"
                html += "<div class='product_info' style='width:100px; height:150px; display:flex; flex-direction: column;align-items: center;'>"
                html += "<img class='product_img' alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 60px;'>"
                html += "<input type='radio' name='product_no3' style='margin-top: 5px;' value='"+item.product_no+"' onclick='checkForm3();'>"+item.product_name+"</div></div>"

            });

                $(".product_img").css({"width" : "60px"}); 
                $(".sub_product3").append(html);
        },

        error:function(data){
            alert("통신 실패");
        }

    });
 });
// 		<c:if test="${!empty takjuList }">
// 		<c:forEach items="${takjuList }" var="tdto">
// 			<option value="${tdto.product_no }">${tdto.product_name }</option>
// 		</c:forEach>
// 		</c:if>

// 	});
</script>

<style>

.btn.btn-light_admin_sub_mainBtn{
border: 0.5px solid lightgray;
}

.adminSubItemInputBtn{
font-size: 1.3em;
font-weight: bold;
}

/* .product_wrab{ */
/* display: flex; */
/* } */

/* .product_info{ */

/* } */

</style>

<div class="admin_sub_main_Wrab" style="height: auto; min-height: 100%;" align="center">
<br><br><br>

<!-- <button type="button" class="btn btn-light_admin_sub_mainBtn">버튼 ?</button> -->

<!-- <button type="button" class="btn btn-light_admin_sub_mainBtn" -->
<%-- onclick="location.href='<%=request.getContextPath()%>/admin_sub_insert.do?'">만들기</button> --%>
<br><br><br><br>
	<h4>구독 만들기</h4><br>
<br><br><br><br>


<div align="center">
	<form method="post" action="<%=request.getContextPath()%>/admin_sub_insert_ok.do">

<span>ex) 2023-01월 패키지 </span><br />
패키지 명 : <input type="text" name="sub_package" >
<br>
<hr>
구독 시작일 : <input type="date" name="sub_date">
<input type="hidden" name="sub_date_time" value="00:00:00">
<br><br>
구독 종료일 : <input type="date" name="sub_enddate">
<input type="hidden" name="sub_date_endtime" value="23:59:59">
<br>
<hr>
구독 가격 : <input type="number" name="sub_price">
<hr>


<div style="width: 1000px;display: flex;justify-content: space-evenly;">
<span>첫번째 :<input name="sub_item1" id="sub_item1"> </span>&nbsp;&nbsp;&nbsp;&nbsp;
<span>두번째 :<input name="sub_item2" id="sub_item2"> </span>&nbsp;&nbsp;&nbsp;&nbsp;
<span>세번째 :<input name="sub_item3" id="sub_item3"> </span> <br>
</div>
<div style="width: 1000px;display: flex;justify-content: space-evenly;">
<span>
	<select class="product_category1" required>
		<option value="" selected disabled hidden>첫번째 술 선택</option>
		<option value="takju">탁주</option>
		<option value="chungju">약.청주</option>
		<option value="wine">과실주</option>
		<option value="soju">증류주</option>
	</select>
	<span class="adminSubItemInputBtn" >담기</span></span>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span>
	<select class="product_category2" required>
		<option value="" selected disabled hidden>두번째 술 선택</option>
		<option value="takju">탁주</option>
		<option value="chungju">약.청주</option>
		<option value="wine">과실주</option>
		<option value="soju">증류주</option>
	</select>
	<span class="adminSubItemInputBtn2" >담기</span></span>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span>
	<select class="product_category3" required>
		<option value="" selected disabled hidden>세번째 술 선택</option>
		<option value="takju">탁주</option>
		<option value="chungju">약.청주</option>
		<option value="wine">과실주</option>
		<option value="soju">증류주</option>
	</select>
	<span class="adminSubItemInputBtn3" >담기</span></span>
</div>

<button type="submit">제출</button>
</form>
</div>

	
	
<!-- 	<input name="sub_item1" id="sub_item1"> -->
<!-- 	<input type="hidden" name="sub_item2" id="sub_item2"> -->
<!-- 	<input type="hidden" name="sub_item3" id="sub_item3"> -->

	<div style="width: 80%">

	
			<br>
		<div
			style="display: grid; grid-template-columns: repeat(10, 1fr); grid-template-rows: repeat(3);"
			class="sub_product1" id="sub_product1">
		</div>

		<div
			style="display: grid; grid-template-columns: repeat(10, 1fr); grid-template-rows: repeat(3);"
			class="sub_product2" id="sub_product2">
		</div>

		<div
			style="display: grid; grid-template-columns: repeat(10, 1fr); grid-template-rows: repeat(3);"
			class="sub_product3" id="sub_product3">
		</div>



	</div>







</div>

<jsp:include page="../banner/bottom.jsp" />