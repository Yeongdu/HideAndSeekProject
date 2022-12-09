<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${List }" />
<c:set var="pdto" value="${Cont }" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="resources/css/product_content/content.css" rel="stylesheet" type="text/css">
<title>${pdto.product_name }</title>
<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
<script type="text/javascript">
	window.onload = function() {
		$(".loading").fadeOut(100, function() {
			$("#div_load_image").fadeOut(300);
		});
	}
</script>
</head>
	<jsp:include page="../banner/none_top.jsp" />
	<div id="main"align="center">
		<c:forEach items="${list }" var="dto">
			<div class="productContentWrap">
				<div class="picture_1">
					<img src="resources/upload/${pdto.product_thumbnail }">
				</div>

				<div class="product_cont" align="left">
					<span class="name">${pdto.product_name }</span>

					<div class="ex_box">
						<span class="sub_ex">#${pdto.product_introduce1 } #${pdto.product_introduce2 }</span>
						<span class="ssub_ex">주종 : ${pdto.product_company }</span>
						<span class="ssub_ex">도수 : ${pdto.product_alcohol }%</span>
						<span class="ssub_ex">용량 : ml</span>
					</div>

					<span class="price_w">판매가격: </span>
					<span class="price">${pdto.product_price }원</span>
					<hr class="first">

					<!-- <span class="su">수량</span>
					
					<span class="total_price_w">총 상품 가격</span>
					<div class="total_price" align="center">
						<span class="final_price">00,000원</span>
					</div> -->
					
					<!-- 수량 변경 수정중 -->
					   <span class="su">수량</span>
					   <div class="quan">
						   <button type="button" class="minus">-</button>
						   <input type="number" class="numBox" min="1" max="${pdto.product_stock}" value="1" readonly="readonly"/>
						   <button type="button" class="plus">+</button>
					   </div>
					   <script>
					   $(".plus").click(function(){
						   var num = $(".numBox").val();
						   var plusNum = Number(num) + 1;
						   
						   if(plusNum >= ${pdto.product_stock}) {
						    $(".numBox").val(num);
						   } else {
						    $(".numBox").val(plusNum);          
						   }
						  });
						  
						  $(".minus").click(function(){
						   var num = $(".numBox").val();
						   var minusNum = Number(num) - 1;
						   
						   if(minusNum <= 0) {
						    $(".numBox").val(num);
						   } else {
						    $(".numBox").val(minusNum);          
						   }
						  });
						 </script>
						 <span class="total_price_w">총 상품 가격</span>
							<div class="total_price" align="center">
								<span class="final_price">00,000원</span>
							</div>
					
					<input type="button" class="buybtn" onclick="location.href='<%=request.getContextPath()%>/product_buy.do'" value="바로 구매">
					<input type="button" class="cartbtn" onclick="location.href='<%=request.getContextPath()%>/product_cart.do'" value="장바구니">
				</div>
			</div>
			
			<div class="main_cont">
				<div class="picture_2">
					<img src="resources/image/${dto.getProduct_file2() }">
					<strong class="cont1">${dto.getProduct_cont1() }</strong>
						<div class="sub_cont">
							<span>${dto.getProduct_cont2() }</span>
						</div>
					<img src="resources/image/${dto.getProduct_file3() }">
					<strong class="cont1">${dto.getProduct_cont3() }</strong>
						<div class="sub_cont">
							<span>${dto.getProduct_cont4() }</span>
						</div>
					<img src="resources/image/${dto.getProduct_file4() }">
				</div>
				
				<!-- 수정중 -->
				<div id="btn">
					<input id="title" class="btn" type='button' value='리뷰' onclick='review()'/>
					<input id="title1" class="btn1" type='button' value='교환/반품' onclick='change()'/>
				</div>
				<script type="text/javascript">
					const title = document.querySelector("#title");
					function handleClick() {
						title.style.backgroundColor = "rgb(0, 151, 243)";
						title.style.color = "white";
						title1.style.backgroundColor = "#efefef";
						title1.style.color = "black";
					}
					title.addEventListener("click", handleClick);

					const title1 = document.querySelector("#title1");
					function handleClick1() {
						title1.style.backgroundColor = "rgb(0, 151, 243)";
						title1.style.color = "white";
						title.style.backgroundColor = "#efefef";
						title.style.color = "black";
					}
					title1.addEventListener("click", handleClick1);
				</script>
				<div id='my_div' align="left">
					<span class="txt">${dto.getProduct_cont5() }</span>
				</div>
				<script type="text/javascript">
					function review() {
						const element = document.getElementById('my_div');
						element.innerHTML = '<div style="color:blue">InnerHTML<div>';
					}
					function change() {
						const element = document.getElementById('my_div');
						let text = document.getElementsByClassName('txt');
						/* element.innerHTML = text.value; */
						/* element.innerHTML = document.getElementById('txt'); */
						/* let text = document.getElementById("txt").innerHTML; */
					}
				</script>
			</div>
		</c:forEach>
		<a href="#" class="back_to_top"> 
			<img src="resources/image/top.png" />
		</a>
		<script type="text/javascript">
		jQuery(document).ready(function() {
		    var offset = 720;
		    var duration = 100;
		    jQuery(window).scroll(function() {
		        if (jQuery(this).scrollTop() > offset) {
		            jQuery('.back_to_top').fadeIn(duration);
		        } else {
		            jQuery('.back_to_top').fadeOut(duration);
		        }
		    });
		    
		    jQuery('.back_to_top').click(function(event) {
		        event.preventDefault();
		        jQuery('html, body').animate({scrollTop: 0}, duration);
		        return false;
		    })
		});
		</script>
	</div>