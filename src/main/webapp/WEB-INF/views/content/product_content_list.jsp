<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${List }" />
<c:set var="pdto" value="${Cont }" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="resources/css/product_content/content.css" rel="stylesheet"
	type="text/css">
<title>${pdto.product_name }</title>
<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	window.onload = function() {
		$(".loading").fadeOut(100, function() {
			$("#div_load_image").fadeOut(300);
		});
	}
	
	//결제 api
	var IMP = window.IMP; 
    IMP.init("imp68070036"); 
      
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
    function requestPay() {
    	IMP.request_pay({
      	pg : 'kcp',
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : '${pdto.product_name }',
        amount : '${pdto.product_price }',
        buyer_email : '',
        buyer_name : '${m_name}',
        buyer_tel : '010-5654-0265',
        buyer_addr : '서울특별시 중구',
        buyer_postcode : '123-456'
    	}, function (rsp) {           
    		console.log(rsp);            
    		if (rsp.success) {   
    		var msg = '결제가 완료되었습니다.\n';       
    		msg += '결제 금액 : ' + rsp.paid_amount+'\n';            
    		msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
    		window.location.href = "";
    		} else {               
    			var msg = '결제에 실패하였습니다.\n';           
    			msg += '에러내용 : ' + rsp.error_msg;
    			window.history.go(-2);
    		}         
    		alert(msg);       
    		});
    	}
</script>
</head>
<jsp:include page="../banner/none_top.jsp" />
<div id="main" align="center">
	<c:forEach items="${list }" var="dto">
		<div class="productContentWrap">
			<div class="picture_1">
				<img src="resources/upload/${pdto.product_thumbnail }">
			</div>

			<div class="product_cont" align="left">
				<span class="name">${pdto.product_name }</span>

				<div class="ex_box">
					<span class="sub_ex">#${pdto.product_introduce1}&nbsp;&nbsp;#${pdto.product_introduce2 }</span>
					<span class="ssub_ex">주종 : ${pdto.product_company }</span>
					<span class="ssub_ex">도수 : ${pdto.product_alcohol }%</span>
					<span class="ssub_ex">용량 : ml</span>
				</div>

				<span class="price_w">판매가격: </span> <span class="price">${pdto.product_price }원</span>
				<hr class="first">
				
				<form name="form" method="get">
					<span class="su">수량</span>
					<input type="button" class="minus" value=" - " onclick="del();"
					><input type="text" class="numBox" name="amount" min="1" max="${pdto.product_stock}" value="1" size="3" onchange="change();"
					><input type="button" class="plus" value=" + " onclick="add();"><br>
					<span class="total_price_w">총 상품 가격</span>
					<input type=hidden name="sell_price" value="${pdto.product_price }">
					<div class="total_price" align="center">
						<input type="text" class="final_price" name="sum" size="13" readonly>
					</div>
				</form>
				
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script>
				    window.addEventListener('load', function() {
				    	init();
					});
					var sell_price;
					var amount;
			
					function init() {
						sell_price = document.form.sell_price.value;
						amount = document.form.amount.value;
						document.form.sum.value = sell_price;
						change();
					}
			
					function add() {
						hm = document.form.amount;
						sum = document.form.sum;
						hm.value++;
						
						if(hm.value >= ${pdto.product_stock}) {
						    swal('',"${pdto.product_stock -1}개까지 주문 할 수 있습니다",'warning');
						    hm.value--;
							sum.value = parseInt(hm.value) * sell_price;
						} else {
							sum.value = parseInt(hm.value) * sell_price원;
						}
						
					}
			
					function del() {
						hm = document.form.amount;
						sum = document.form.sum;
			
						if (hm.value > 1) {
							hm.value--;
							sum.value = parseInt(hm.value) * sell_price;
						}
					}
			
					function change() {
						hm = document.form.amount;
						sum = document.form.sum;
						if (hm.value < 0) {
							hm.value = 0;
						}
						sum.value = parseInt(hm.value) * sell_price;
					}
				</script>

				
				<input type="button" class="buybtn" onclick="requestPay()" value="바로 구매">
				<input type="button" class="cartbtn" onclick="location.href='<%=request.getContextPath()%>/product_cart.do'" value="장바구니">
			</div>
		</div>

		<div class="main_cont">
			<div class="picture_2">
				<img src="resources/image/${dto.getProduct_file1() }">
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

			<!-- 버튼 클릭 시 화면 변경 수정중 -->
			<div id="btn">
				<input id="title" class="btn" type='button' value='리뷰'
					onclick='review()' /> <input id="title1" class="btn1" type='button'
					value='교환/반품' onclick='change()' />
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
			<!-- 버튼 클릭 시 화면 변경 수정끝 -->
		</div>
	</c:forEach>
	<a href="#" class="back_to_top"> <img src="resources/image/top.png" />
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
				jQuery('html, body').animate({
					scrollTop : 0
				}, duration);
				return false;
			})
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
	<script type="text/javascript">
	
	    window.onload = function () {
	        $(".loading").fadeOut(100,function(){
	            $("#div_load_image").fadeOut(300);
	        });
	    }
	
	</script>
</div>