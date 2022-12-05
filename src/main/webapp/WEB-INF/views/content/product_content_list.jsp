<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/cont/content.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../banner/none_top.jsp" />
	<div id="main"align="center">
		<c:set var="list" value="${List }" />
		<c:forEach items="${list }" var="dto">
			<div class="productContentWrap">
				<div class="picture_1">
					<img src="resources/image/${dto.getProduct_file1() }">
				</div>

				<div class="product_cont" align="left">
					<span class="name">이름</span>

					<div class="ex_box">
						<span class="sub_ex"># #</span>
						<span class="ssub_ex">주종 : 주류</span>
						<span class="ssub_ex">도수 : %</span>
						<span class="ssub_ex">주량 : ml</span>
					</div>

					<span class="price_w">판매가격: </span>
					<span class="price">00,000원</span>
					<hr class="first">

					<span class="su">수량</span>
					<span class="total_price_w">총 상품 가격</span>
					<div class="total_price" align="center">
						<span class="final_price">00,000원</span>
					</div>
					<input type="button" class="buybtn" onclick="location.href='<%=request.getContextPath()%>/product_buy.do'" value="바로 구매">
					<input type="button" class="cartbtn" onclick="location.href='<%=request.getContextPath()%>/product_cart.do'" value="장바구니">
				</div>
			</div>
			
			<hr class="second">
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
						<span>${dto.getProduct_cont5() }</span>
					</div>
					<%-- <div id="warn" class="warn" align="left">
						<span>${dto.getProduct_cont5() }</span>
					</div> --%>
					<script type="text/javascript">
						function review() {
							const element = document.getElementById('my_div');
							element.innerHTML = '<div style="color:blue">InnerHTML<div>';
						}
					
						function change() {
							const element = document.getElementById('my_div');
							element.innerText = '<div style="color:blue">InnerText<div>';
						}
					</script>
			</div>
		</c:forEach>
	</div>
</body>
</html>