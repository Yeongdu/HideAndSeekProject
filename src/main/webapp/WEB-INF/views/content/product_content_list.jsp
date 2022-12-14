<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${List }" />
<c:set var="pdto" value="${Cont }" />
<c:set var="rlist" value="${RList }" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="resources/css/product_content/content.css" rel="stylesheet"
	type="text/css">
<title>${pdto.product_name }</title>
<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
					<span class="ssub_ex">주종 : ${pdto.product_category }</span>
					<span class="ssub_ex">도수 : ${pdto.product_alcohol }%</span>
					<span class="ssub_ex">용량 : ${pdto.product_amount }ml</span>
				</div>

				<span class="price_w">판매가격: </span>
				<span id="money" class="price">${pdto.product_price }원</span>
				<hr class="first">
				
				<form name="form" method="get">
					<span class="su">수량</span>
					<input type="button" class="minus" value=" - " onclick="del();"
					><input type="text" class="numBox" name="amount" min="1" max="${pdto.product_stock}" value="1" size="3" onchange="change();"
					><input type="button" class="plus" value=" + " onclick="add();"><br>
					<span class="total_price_w">총 상품 가격</span>
					<input type=hidden id="sell_price" name="sell_price" value="${pdto.product_price}">
					<div class="total_price" align="center">
						<input type="text" class="final_price" name="sum" size="13" readonly>
						<input type="text" class="won" size="13" value="원" readonly>
					</div>
				</form>
				
				<input type="button" class="buybtn" onclick="requestPay()" value="바로 구매">
				<input type="button" class="cartbtn" onclick="location.href='<%=request.getContextPath()%>/product_cart.do'" value="장바구니">
			</div>
		</div>

		<div class="main_cont">
			<div class="picture_2">
				<img src="resources/upload/${dto.getProduct_file1() }"> 
				<strong class="cont1">${dto.getProduct_cont1() }</strong>
				<div class="sub_cont">
					<span>${dto.getProduct_cont2() }</span>
				</div>
				<img src="resources/upload/${dto.getProduct_file2() }"> 
				<strong class="cont1">${dto.getProduct_cont3() }</strong>
				<div class="sub_cont">
					<span>${dto.getProduct_cont4() }</span>
				</div>
				<img src="resources/upload/${dto.getProduct_file3() }">
			</div>
		</div>
	</c:forEach>
			<!-- 버튼 클릭 시 화면 변경 수정중 -->
			<c:forEach items="${rlist }" var="rdto">
			</c:forEach>
			<div class="tabs">
				<div class="tab-button-outer">
					<ul id="tab-button">
						<li><a href="#tab01">리뷰</a></li>
						<li><a href="#tab02">교환/반품</a></li>
					</ul>
				</div>
				<br>
				<div id="tab01" class="tab-contents">
					<p>리뷰</p>
				</div>
				<div id="tab02" class="tab-contents">
					<p align="left" class="change_cont">
						<span class="t">교환/반품 문의</span><br><br>
						<span class="st">01.<br>
						상품의 파손 및 하자, 변질 등 문제가 있는 경우</span><br>
						- 성함, 연락처, 상품의 사진과 함께 술래잡기 고객센터<br>
						 로 문의 부탁드립니다.<br><br>
						<span class="st">02.<br>
						수령하신 상품의 불량, 파손, 오배송의 경우</span><br>
						- 교환/반품이 가능하며 배송비는 판매자가 부담합니다.<br><br>
						<span class="st">03.<br>
						교환 / 반품 / 환불이 제한되는 경우</span><br>
						- 배송완료 후 7일이 지나 자동으로 수령확인 처리가 되거나,<br>
						 상품을 확인하고 직접 수령확인하신 이후<br><br>
						<span class="b">※ 식품 특성상, 아래와 같은 경우 교환/반품/환불이<br>
						제한될 수 있습니다.</span><br>
						- 제품이 개봉되었거나 포장이 훼손된 경우<br>
						 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)<br>
						- 사전 연락없이 임의 반송된 경우<br>
						- 주소의 오기재, 잘못된 주문, 주소 불명, 수취인 부재의 경우<br>
						- 단순 변심에 의한 경우<br>
						- 잘못된 방법으로 보관하거나 고객님의 부주의로 인한<br>
						 오염, 파손, 변질된 제품<br>
					</p>
				</div>
			</div>
			<!-- 버튼 클릭 시 화면 변경 수정끝 -->
		</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
	<script type="text/javascript">
	//로딩
	window.onload = function() {
		$(".loading").fadeOut(100, function() {
			$("#div_load_image").fadeOut(300);
		});
	}	
	//로딩 끝

	//<span>태그 금액(,)
	var money = $('#money').text();
	var money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#money').text(money2);
	//<span>태그 금액(,) 끝
	
	//금액, 수량 변동
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
				if(${pdto.product_stock} == 0 ){
					swal('',"품절되었습니다",'warning');
				}
		} else {
			sum.value = parseInt(hm.value) * sell_price;
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
	//금액, 수량 변동 끝
	
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
    	if (${pdto.product_stock } > 0) {
    	IMP.request_pay({
      	pg : 'kcp',
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : '${pdto.product_name }',
        amount : sum.value,
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
    	} else {
    		swal('',"품절되었습니다",'warning');
		}
    }
  	//결제 api 끝
  	
  	//리뷰, 교환/환불 버튼
  	$(document).ready(function() {
  		var $tabButtonItem = $('#tab-button li'),
  		$tabSelect = $('#tab-select'),
  		$tabContents = $('.tab-contents'),
  		activeClass = 'is-active';

  		$tabButtonItem.first().addClass(activeClass);
  		$tabContents.not(':first').hide();

  		// button
  		$tabButtonItem.find('a').on('click', function(e) {
  	  		var target = $(this).attr('href');

  	  		$tabButtonItem.removeClass(activeClass);
  	  		$(this).parent().addClass(activeClass);
  	  		$tabSelect.val(target);
  	  		$tabContents.hide();
  	  		$(target).show();
  	  		e.preventDefault();
  	  		});

  		// select
  		$tabSelect.on('change', function() {
  	  		var target = $(this).val(),
  	  		targetSelectNum = $(this).prop('selectedIndex');

  	  		$tabButtonItem.removeClass(activeClass);
  	  		$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
  	  		$tabContents.hide();
  	  		$(target).show();
  	  		});
  		});
  	//리뷰, 교환/환불 버튼 끝
	</script>
<jsp:include page="../banner/bottom.jsp" />