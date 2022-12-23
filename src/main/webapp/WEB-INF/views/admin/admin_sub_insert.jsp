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

                html += "<div class='product_wrap'>"
                html += "<div class='product_info'>"
                html += "<img class='product_img' alt='img' src='resources/upload/"+item.product_thumbnail+"' style='width: 60px;'>"
                html += "<input type='checkbox' name='product_no' value='"+item.product_no+"'>"+item.product_name+"</div><div>"

            });

                $(".product_img").css({"width" : "60px"}); 
                $(".sub_product1").append(html);
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

</style>

<div class="admin_sub_main_Wrab" style="height: auto; min-height: 100%;" align="center">
<br><br><br>

<!-- <button type="button" class="btn btn-light_admin_sub_mainBtn">버튼 ?</button> -->

<!-- <button type="button" class="btn btn-light_admin_sub_mainBtn" -->
<%-- onclick="location.href='<%=request.getContextPath()%>/admin_sub_insert.do?'">만들기</button> --%>
<br><br><br><br>
	<h4>구독 만들기</h4><br>
<br><br><br><br> 

	<select class="product_category1" required>
		<option value="" selected disabled hidden>카테고리</option>
		<option value="takju">탁주</option>
		<option value="chungju">약.청주</option>
		<option value="wine">과실주</option>
		<option value="soju">증류주</option>
	</select>
	

		<div class="sub_product1">
		


		</div>

	
	





</div>

<jsp:include page="../banner/bottom.jsp" />