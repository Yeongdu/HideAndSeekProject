<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${List }" />
<c:set var="pdto" value="${Cont }" />
<c:set var="rlist" value="${RList }" />
<c:set var="paging" value="${Paging }" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="resources/css/product_content/content.css" rel="stylesheet"
	type="text/css">
<title>${pdto.product_name }</title>
<c:if test="${empty userId }">
	<jsp:include page="../banner/none_top.jsp" />
</c:if>
	
<c:if test="${!empty userId }">
	<jsp:include page="../banner/user_top.jsp" />
</c:if>
<script src="https://code.jquery.com/jquery-3.1.0.js%22%3E"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
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
					<div class="review_info_star-rating" style="margin: 0%">
		    			<div class="star-ratings-fill space-x-2 text-lg" style="width:${rdto.getReview_star() }%">
		    				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		    			</div>
			    		<div class="star-ratings-base space-x-2 text-lg">
			    			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			   			</div>
		    		</div>
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
						<span class="p_price"></span>
						<span class="won">원</span>
					</div>
				</form>
				
				<c:if test="${!empty userId}">
			   		<input type="button" class="buybtn" onclick="requestPay();" value="바로 구매">
			   		<input type="button" class="cartbtn" onclick="cart()" value="장바구니">
			   	</c:if>
				<c:if test="${empty userId}">
			   		<input type="button" class="buybtn" onclick="login_check();" value="바로 구매">
			   		<input type="button" class="cartbtn" onclick="login_check();" value="장바구니">
			   	</c:if>
			</div>
		</div>

		<div class="main_cont">
			<div class="picture_2">
				<img src="resources/upload/${dto.getProduct_file1() }" onerror="this.style.display='none'"> 
				<textarea class="sub_cont" id="sub_cont1" spellcheck="false" readonly> ${dto.getProduct_cont1() } </textarea>
				<img src="resources/upload/${dto.getProduct_file2() }" onerror="this.style.display='none'"> 
				<textarea class="sub_cont" id="sub_cont2" spellcheck="false" readonly> ${dto.getProduct_cont2() } </textarea>
				<img src="resources/upload/${dto.getProduct_file3() }" onerror="this.style.display='none'">
				<textarea class="sub_cont" id="sub_cont3" spellcheck="false" readonly> ${dto.getProduct_cont3() } </textarea>
			</div>
		</div>
	</c:forEach>
	
			<!-- 버튼 클릭 시 화면 변경 수정중 -->
			<div class="tabs">
				<div class="tab-button-outer">
					<ul id="tab-button">
						<li>
							<a class="tab01" href="#tab01">리뷰</a>
						</li>
					</ul>
					<ul id="tab-button">
						<li>
							<a class="tab02" href="#tab02">교환/반품</a>
						</li>
					</ul>
				</div>
				<br>
				<!-- 리뷰 수정중 -->
				<div id="tab01" class="tab-contents">
					<div class="data_header">
						<div class="wrapper flex">
							<div class="search_result flex">
								<input class="check_pic" type='checkbox' name='animal' value='dog' onclick='getCheckboxValue(event)'/>
								포토리뷰만 보기
							</div>
							<div class="sort-wrapper flex">
								<div class="sort-box">
									<select class="sort-menu" name="sort">
										<option value="released" selected>최신순</option>
										<option value="rating_high">평점 높은 순</option>
										<option value="rating_low">평점 낮은 순</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
					
					</script>
				
			<div class="review" >
				<c:if test="${!empty rlist}">
					<c:forEach items="${rlist }" var="rdto">
					<div class="review_cont">
						<div class="review_top">
							<div>
							<span class="review_info_product_name">${rdto.getUser_id() }</span>
							</div>
							<div class="review_main_cont" align="right">
								[${pdto.product_amount }ml] ${pdto.product_name }
								<div class="review_info_star-rating">
		    						<div class="star-ratings-fill space-x-2 text-lg" style="width:${rdto.getReview_star() }%">
		    							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		    						</div>
		    						<div class="star-ratings-base space-x-2 text-lg">
		    							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		    						</div>
		    					</div>
								<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${rdto.getReview_date() }" />
							</div>
						</div>
						<div class="review_main" align="left">
							<div class="review_cont">
								<pre style="margin-bottom: 1%">${rdto.getReview_cont() }</pre>
							</div>
							<img src="resources/review_img/${rdto.getReview_file() }" class="review_image${pdto.product_no}" onmouseover="zoomImg(${pdto.product_no})" style="height: 100px; cursor: zoom-in;" onerror="this.style.display='none'">
						</div>
					</div>
					</c:forEach>
				</c:if>
			
	
				<c:if test="${empty rlist}">
					<pre class="no_review">첫 리뷰를 작성해주세요!</pre>
				</c:if>
			</div>
					
				<%-- 페이징 처리 부분 --%>
				<c:if test="${paging.getPage() > paging.getBlock()}">
					<a href="product_content_list.do?no=${pdto.product_no }&page=1">[처음으로]</a>
					<a href="product_content_list.do?no=${pdto.product_no }&page=${paging.getStartBlock() - 1 }">◀︎</a>
				</c:if>
				<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var ="i">
					<c:if test="${i == paging.getPage() }">
						<b><a href="product_content_list.do?no=${pdto.product_no }&page=${i }">[${i }]</a></b>
					</c:if>
					<c:if test="${i != paging.getPage() }">
						<a href="product_content_list.do?no=${pdto.product_no }&page=${i }">[${i }]</a>
					</c:if>
				</c:forEach>
					<c:if test="${paging.getEndBlock() < paging.getAllPage()}">
						<a href="product_content_list.do?no=${pdto.product_no }&page=${paging.getEndBlock() + 1 }">▶︎</a>
						<a href="product_content_list.do?no=${pdto.product_no }&page=${paging.getAllPage() }">[마지막으로]︎</a>
					</c:if>	
					
				</div>
				<!-- 리뷰 수정끝 -->
				<div id="tab02" class="tab-contents">
					<p align="left" class="change_cont">
						<span class="t">교환/반품 문의</span><br><br>
						<span class="s">01.<br>
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
	$(document).on("change", ".sort-menu", function(){
		let sort = $('.sort_menu').val();
		
		product_no = ${pdto.product_no};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/product_content_list.do?no=${pdto.product_no }",
			method:"post",
			data: {
				sort : sort,
				product_no : '${pdto.product_no}'
			},
			datatype : "json",
			success:function(data) {
				$(".review").empty();
				$.each(data, function(index, item){
					html = "";
					html += <div class="review" >
					if(${empty rlist}) {
						html += "<c:forEach items='${rlist }' var='rdto'>"
						html += "<div class='review_cont'>"
						html += "<div class='review_top'>"
						html += "<div>"
						html += "<span class='review_info_product_name'>${rdto.getUser_id() }</span>"
						html += "</div>"
						html += "<div class='review_main_cont' align='right'>"
						html += "[${pdto.product_amount }ml] ${pdto.product_name }"
						html += "<div class='review_info_star-rating'>"
						html += "<div class='star-ratings-fill space-x-2 text-lg' style='width:${rdto.getReview_star() }%'>"
						html += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
						html += "</div>"
						html += "<div class='star-ratings-base space-x-2 text-lg'>"
						html += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
						html += "</div>"
						html += "</div>"
						html += "<fmt:formatDate pattern='yyyy년 MM월 dd일' value='${rdto.getReview_date() }' />"
						html += "</div>"
						html += "</div>"
						html += "<div class='review_main' align='left'>"
						html += "<div class='review_cont'>"
						html += "<pre style='margin-bottom: 1%'>${rdto.getReview_cont() }</pre>"
						html += "</div>"
						html += "<img src='resources/review_img/${rdto.getReview_file() }' class='review_image${pdto.product_no}' onmouseover='zoomImg(${pdto.product_no})' style='height: 100px; cursor: zoom-in;' onerror='this.style.display='none''>"
						html += "</div>"
						html += "</div>"
						html += "</c:forEach>"
					}else if(${empty rlist}) {
						html += "<pre class='no_review'>첫 리뷰를 작성해주세요!</pre>"
						html += "</div>"
					}
				})
			}
		})
	});
	
	//리뷰, 교환/환불 버튼 색 변경
	var first = document.querySelector('.tab01');
	var second = document.querySelector('.tab02');
	
	first.onclick = function() {
		first.style.backgroundColor = '#4295ec';
		first.style.color = "white";
		first.style.borderColor = '#4295ec';
		second.style.backgroundColor = '#efefef';
		second.style.color = "black";
		second.style.borderColor = 'rgb(178, 178, 178)';
	}
	second.onclick = function() {
		second.style.backgroundColor = '#4295ec';
		second.style.color = "white";
		second.style.borderColor = '#4295ec';
		first.style.backgroundColor = '#efefef';
		first.style.color = "black";
		first.style.borderColor = 'rgb(178, 178, 178)';
	}
	//리뷰, 교환/환불 버튼 색 변경	 끝	
	
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
	var total;
	var total_price;

	function init() {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		change();
	}

	function add() {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value++;
		
		if(hm.value >= ${pdto.product_stock}) {
		    swal('',"${pdto.product_stock -1}개까지 주문 할 수 있습니다",'warning');
		    hm.value--;
				if(${pdto.product_stock} == 0 ){
					swal('',"품절되었습니다",'warning');
				}
		} else {
			change();
		}	
	}

	function del() {
		hm = document.form.amount;
		sum = document.form.sum;

		if (hm.value > 1) {
			hm.value--;
			change();
		}
	}

	function change() {
		hm = document.form.amount;
		sum = document.form.sum;
		if (hm.value < 0) {
			hm.value = 0;
		}
		total = parseInt(hm.value) * sell_price;
		total_price = total.toLocaleString('ko-KR');
		$('.p_price').text('');
		$('.p_price').append(total_price);
	}
	//금액, 수량 변동 끝
	
	//로그인 확인
	function login_check() {
		swal({
			text : "회원가입 및 로그인 부탁드려요!\n실례지만 민증 검사하겠습니다!",
			icon: "warning",
			buttons: ["취소" , "이동"]
		})
		.then(function(result){
			console.log(result);        
		       if(result){
		       	location.href = "<%=request.getContextPath() %>/user_login.do";
		       }
		})
	}
	//로그인 확인 끝
	
	//장바구니 확인
	function cart() {
		swal({
			title : "주문내역을 확인해주세요",
			text : "${pdto.product_name}\n"+hm.value+"개\n"+total_price+"원",
			icon: "info",
			buttons: ["취소" , "확인"]
		})
		.then(function(cart){
			console.log(cart);        
		       if(cart){
		    	   $.ajax({
		               type: 'post',
		               url: '<%=request.getContextPath() %>/cart_ok.do',
		               data : {cart_amount: hm.value,
		            	  	   user_id: '${userId}',
		            	  	   product_no: '${pdto.product_no}'},	               
		               dataType: 'text',
		               success :function(result){
		                   if(result==0){
		                       swal({
		               			text : "장바구니로 이동하시겠습니까?",
		               			icon: "info",
		               			buttons: ["취소" , "이동"],
		               			closeOnClickOutside : false
		               			})
		               			.then(function(cart_result){
									if(cart_result==true) {
										location.href="<%=request.getContextPath() %>/cart.do";
									} else {
										
									} 
								}) 
		                   }else{
		                	   alert("실패:"+result);
		                   }
		                  }
		               }
		           );
		       }
		})
	}
	//장바구니 확인 끝
	
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
        amount : total_price,
        buyer_email : '',
        buyer_name : '${userId}',
        buyer_tel : '010-5654-0265',
        buyer_addr : '서울특별시 중구',
        buyer_postcode : '123-456'
    	}, function (rsp) {           
    		console.log(rsp);            
    		if (rsp.success) {   
    		var msg = '결제가 완료되었습니다.\n';       
    		msg += '결제 금액 : ' + rsp.paid_amount+'\n원';            
    		msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
    		window.location.href = "<%=request.getContextPath() %>/store.do";
    		} else {               
    			var msg1 = '결제에 실패하였습니다.\n';           
    			msg1 += '에러내용 : ' + rsp.error_msg;
    			window.history.go(-2);
    			swal('',msg1,'warning');
    		}         
    		swal('',msg,'success');
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
  	
  	//본문 textarea 높이 자동조절 함수
	$(function() {

		function adjustHeight1() {
			var textEle = $('#sub_cont1');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight+8);
			};
		function adjustHeight2() {
			var textEle = $('#sub_cont2');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight+8);
			};
		function adjustHeight3() {
			var textEle = $('#sub_cont3');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight+8);
			};
			
		adjustHeight1();
		adjustHeight2();
		adjustHeight3();
		
		});
		//본문 textarea 높이 자동조절 함수 끝
		
		//리뷰이미지 확대/축소
		function zoomImg(no){
			$(document).on("click",".review_image"+no, function(){
				$(".review_image"+no).css("width", "auto");
				$(".review_image"+no).css("height", "80%");
				$(".review_image"+no).attr("class", "review_image_zoom"+no);
			});
						
			$(document).on("mouseover", ".review_image"+no, function(){
				$(".review_image"+no).css("cursor", "zoom-in");
			});			
						
			$(document).on("click",".review_image_zoom"+no, function(){
				$(".review_image_zoom"+no).css("width", "auto");
				$(".review_image_zoom"+no).css("height", "100px");
				$(".review_image_zoom"+no).attr("class", "review_image"+no);
			});
						
			$(document).on("mouseover", ".review_image_zoom"+no, function(){
				$(".review_image_zoom"+no).css("cursor", "zoom-out");
			});
		}
		//리뷰이미지 확대/축소 끝
	</script>
<jsp:include page="../banner/bottom.jsp" />