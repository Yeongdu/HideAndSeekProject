<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>술래잡기 장바구니</title>
	<c:if test="${empty userId }">
		<jsp:include page="../banner/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
		<jsp:include page="../banner/user_top.jsp" />
	</c:if>
<link href="resources/css/cart/cart.css" rel="stylesheet" type="text/css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

		function total(){
			
 			let count = $(".cart_check").length;
			
			let ckcount = $("input:checkbox[name=price]:checked").length;
			
			let price = 0;
			
			let tamount = 0;
			
			let sum = 0;
			
			for(let i=0; i<count; i++){
				
				if($(".cart_check")[i].checked == true){
					
					price = parseInt($(".cart_check")[i].value);
					
					tamount = parseInt($('.amount_info'+i).text());
					
					sum += price * tamount;
					
				}
				
			}
			
			$(".bill_price").empty();
			
			$(".bill_delivery").empty();
			
			$(".bill_footer_price").empty();
			
			$(".text").empty();
			
			$(".bill_price").append(sum.toLocaleString('ko-KR')+"원");
			
			$(".bill_delivery").append((ckcount * 3000).toLocaleString('ko-KR')+"원");
			
			let total = (sum + (ckcount * 3000)).toLocaleString('ko-KR');
			
			$(".text").append("모두 선택 ("+ckcount+"/${totalcart })");
			
			$(".bill_footer_price").append((sum + (ckcount * 3000)).toLocaleString('ko-KR') +"원");
			
			
		}
		
		$(document).on("click", ".total_ckbox", function(){
			
			let count = $(".cart_check").length;
			
			if(document.getElementById("total_aomount").checked == true){
				
				$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
				
				document.getElementById("total_aomount").checked = false;
				
				for(let i = 0; i<count; i++){
					
					if($(".cart_check")[i].checked == true){
					
						$(".cart_check")[i].checked = false;
						
						$(".checkbox_button"+i+" > img").attr({src:"resources/image/checkbox.png"});
					
					}
					
				};
				
				total();
				
			}else if(document.getElementById("total_aomount").checked == false){
				
				$(".total_ckbox").attr({src:"resources/image/checkbox-active.png"});
				
				document.getElementById("total_aomount").checked = true;
				
				for(let i = 0; i<count; i++){
					
					if($(".cart_check")[i].checked == false){
						
						$(".cart_check")[i].checked = true;
						
						$(".checkbox_button"+i+" > img").attr({src:"resources/image/checkbox-active.png"});
					
					}
					
				};
				
				total();
			}
			
		});
		
		$(function(){
			
			total();
			
		});

		var id = '<%=(String)session.getAttribute("userId")%>';
		
		var size = ${list.size()};
		
		for(var i=0; i<size; i++){
			
			(function(j) {
				
				$(document).on('click', '.checkbox_button' + j, function() {
					
					let count = $(".cart_check").length;
					
					if($(".cart_check")[j].checked == true){
						
						$(".cart_check")[j].checked = false;
						
						$('.checkbox_button'+j+" > img").attr({src:"resources/image/checkbox.png"});
						
						$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
						
						document.getElementById("total_aomount").checked = false;
						
						total();
						
					}else if($(".cart_check")[j].checked == false){
						
						$(".cart_check")[j].checked = true;
						
						$('.checkbox_button'+j+" > img").attr({src:"resources/image/checkbox-active.png"});
						
						let ckcount = $("input:checkbox[name=price]:checked").length;
						
						if(count == ckcount){
							
							$(".total_ckbox").attr({src:"resources/image/checkbox-active.png"});
							
							document.getElementById("total_aomount").checked = true;
							
						}
						
						total();
						
					}
					
				});
				
			    $(document).on('click','.minusbutton' + j, function() {
			    	
			    	let cart_no = $('input[name=cartno'+j+']').val();
			    	
			    	let amount = $('.amount_info'+j).text();
			    	
			    	if(amount != 1){
			    		
			    		$.ajax({
							url:"<%=request.getContextPath()%>/cart_amount_minus.do",
							method:"post",
							async: false,
							data: {
								userId : id,
	 							cart_no : cart_no
								},
							datatype: "json",
							success:function(data){
								
	 							$(".cart_content_wrap").empty();
								
								$.each(data, function(index, item){			// 데이터 = item
									
	 								html = "";
								
	 								html += "<div class='cart_content cart_content"+index+"'>"
	 								html += "<input type='hidden' name='cartno"+index+"' value='"+item.cart_no+"'>"
		 							html += "<input type='hidden' name='stock"+index+"' value='"+item.product_stock+"'>"
	 								html += "<div class='head head"+index+"'>"
	 								html += "<div class='company_name company_name"+index+"'>"+item.product_company+"</div></div>"
	 								html += "<div class='none_block none_block"+index+"'></div>"
	 								html += "<div class='content content"+index+"'>"
	 								html += "<div class='product_wrap product_wrap"+index+"'>"
	 								html += "<div class='checkbox_wrap checkbox_wrap"+index+"'>"
	 								html += "<input type='checkbox' class='cart_check' name='price' value='"+item.product_price+"' checked='checked' >"
	 								html += "<button type='button' class='checkbox_button checkbox_button"+index+"'>"
	 								html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
	 								html += "<div class='product_info_top product_info_top"+index+"'>"
	 								html += "<div class='thumbnail'>"
									html += "<a href='<%=request.getContextPath()%>/product_content_list.do?no="+item.product_no+"'>"
									html += "<img src='resources/upload/"+item.product_thumbnail+"'></a></div>"
	 								html += "<div class='product_name product_name"+index+"'>"+item.product_name+"</div>"
	 								html += "<button type='button' class='product_remove product_remove"+index+"'>"
									html += "<img src='resources/image/remove_button.png'></button></div><div></div>"
									html += "<div class='product_info_bottom product_info_bottom"+index+"'>"
	 								html += "<div class='amount_control amount_control"+index+"'>"
	 								html += "<div class='minus_wrap minus_wrap"+index+"'>"
	 								html += "<button type='button' class='minusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_minus.png'></button></div>"
		 							html += "<div class='amount amount"+index+"'>"
		 							html += "<div class='amount_info"+index+"'>"+item.cart_amount+"</div></div>"
	 								html += "<div class='plus_wrap plus_wrap"+index+"'>"
	 								html += "<button type='button' class='plusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_plus.png'></button></div></div>"
	 								html += "<div class='price price"+index+"'>"
	 								html += "<div class='product_price product_price"+index+"'>"
	 								
	 								let price = (item.product_price * item.cart_amount).toLocaleString('ko-KR');
	 								
	 								html += price+"원</div></div></div><div class='solid'></div></div></div>"
									html += "<div class='footer footer"+index+"'>"
	 								html += "<div class='footer_product_price footer_product_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>상품금액</div>"
	 								html += "<div class='price price"+index+"'>"+price+"원</div></div>"
	 								html += "<div class='footer_delivery_price footer_delivery_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>배송비</div>"
	 								html += "<div class='price price"+index+"'>3,000원</div></div>"
	 								html += "<div class='footer_total_price footer_total_price"+index+"'>"
	 										
	 								let total = ((item.product_price * item.cart_amount) + 3000).toLocaleString('ko-KR');
	 								
	 								html += "<div class='total_title total_title"+index+"'>총 금액</div>"
	 								html += "<div class='total_price total_price"+index+"'>"+total+"원</div></div></div></div>"
									
	 								$(".cart_content_wrap").append(html);
	 								
	 								
								});
								
								total();
								
							},
							
							error:function(data){
								alert("통신 실패");
							}
						});
			    		
			    	}else {
			    		
			    		swal('알림',"최소 구매 수량은 1개 입니다.",'warning');
			    		
			    	}
			      
			    });
			    
				$(document).on('click','.plusbutton' + j, function() {
			    	
			    	let cart_no = $('input[name=cartno'+j+']').val();
			    	
			    	let stock = $('input[name=stock'+j+']').val();
			    	
			    	let amount = $('.amount_info'+j).text();
			    	
			    	if(amount != stock){
			    		$.ajax({
							url:"<%=request.getContextPath()%>/cart_amount_plus.do",
							method:"post",
							async: false,
							data: {
								userId : id,
	 							cart_no : cart_no
								},
							datatype: "json",
							success:function(data){
								
	 							$(".cart_content_wrap").empty();
								
								$.each(data, function(index, item){			// 데이터 = item
									
	 								html = "";
								
	 								html += "<div class='cart_content cart_content"+index+"'>"
	 								html += "<input type='hidden' name='cartno"+index+"' value='"+item.cart_no+"'>"
		 							html += "<input type='hidden' name='stock"+index+"' value='"+item.product_stock+"'>"
	 								html += "<div class='head head"+index+"'>"
	 								html += "<div class='company_name company_name"+index+"'>"+item.product_company+"</div></div>"
	 								html += "<div class='none_block none_block"+index+"'></div>"
	 								html += "<div class='content content"+index+"'>"
	 								html += "<div class='product_wrap product_wrap"+index+"'>"
	 								html += "<div class='checkbox_wrap checkbox_wrap"+index+"'>"
	 								html += "<input type='checkbox' class='cart_check' name='price' value='"+item.product_price+"' checked='checked' >"
	 								html += "<button type='button' class='checkbox_button checkbox_button"+index+"'>"
	 								html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
	 								html += "<div class='product_info_top product_info_top"+index+"'>"
	 								html += "<div class='thumbnail'>"
									html += "<a href='<%=request.getContextPath()%>/product_content_list.do?no="+item.product_no+"'>"
									html += "<img src='resources/upload/"+item.product_thumbnail+"'></a></div>"
	 								html += "<div class='product_name product_name"+index+"'>"+item.product_name+"</div>"
	 								html += "<button type='button' class='product_remove product_remove"+index+"'>"
									html += "<img src='resources/image/remove_button.png'></button></div><div></div>"
									html += "<div class='product_info_bottom product_info_bottom"+index+"'>"
	 								html += "<div class='amount_control amount_control"+index+"'>"
	 								html += "<div class='minus_wrap minus_wrap"+index+"'>"
	 								html += "<button type='button' class='minusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_minus.png'></button></div>"
	 								html += "<div class='amount amount"+index+"'>"
	 								html += "<div class='amount_info"+index+"'>"+item.cart_amount+"</div></div>"
	 								html += "<div class='plus_wrap plus_wrap"+index+"'>"
	 								html += "<button type='button' class='plusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_plus.png'></button></div></div>"
	 								html += "<div class='price price"+index+"'>"
	 								html += "<div class='product_price product_price"+index+"'>"
	 								
	 								let price = (item.product_price * item.cart_amount).toLocaleString('ko-KR');
	 								
	 								html += price+"원</div></div></div><div class='solid'></div></div></div>"
									html += "<div class='footer footer"+index+"'>"
	 								html += "<div class='footer_product_price footer_product_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>상품금액</div>"
	 								html += "<div class='price price"+index+"'>"+price+"원</div></div>"
	 								html += "<div class='footer_delivery_price footer_delivery_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>배송비</div>"
	 								html += "<div class='price price"+index+"'>3,000원</div></div>"
	 								html += "<div class='footer_total_price footer_total_price"+index+"'>"
	 										
	 								let total = ((item.product_price * item.cart_amount) + 3000).toLocaleString('ko-KR');
	 								
	 								html += "<div class='total_title total_title"+index+"'>총 금액</div>"
	 								html += "<div class='total_price total_price"+index+"'>"+total+"원</div></div></div></div>"
									
	 								$(".cart_content_wrap").append(html);
								});
								
								total();
								
							},
							
							error:function(data){
								alert("통신 실패");
							}
						});
			    		
			    	}else {
			    		
			    		swal('알림',"해당 상품은 현재 최대 "+stock+"개 까지 구매 가능합니다.",'warning');
			    		
			    	}
			      
			    });
				
				$(document).on('click','.product_remove' + j, function() {
			    	
			    	let cart_no = $('input[name=cartno'+j+']').val();
			    	
			    	let total = 0;
			    	
			    	$.ajax({
						url:"<%=request.getContextPath()%>/cart_delete.do",
						method:"post",
						async: false,
						data: {
							userId : id,
	 						cart_no : cart_no
							},
						datatype: "json",
						success:function(data){
							
							let check = false;
							
							$.each(data, function(index, item){	
								
								if(item.totalcart != 'null' && !check){
									
									total = item.totalcart;
									
									check = true;
									
								}
								
							});
							
	 						$(".cart_wrap").empty();
	 						
	 						html = "";
							
 							html += "<div class='cart_head_wrap'>"
 							html += "<div class='top_item_wrap'>"
 							html += "<div class='item_wrap'>"
 							html += "<div class='checkbox_wrap'>"
 							html += "<button type='button' class='checkbox_button'>"
 							html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
 							html += "<div class='text'>모두 선택 (0/"+total+")</div></div>"
							html += "<button type='button' class='delete_button' disabled>선택삭제</button></div></div><span></span>"
							
							if(total != '0'){
							
							html += "<div class='cart_content_wrap'>";
							
								$.each(data, function(index, item){			// 데이터 = item
										
									html += "<div class='cart_content cart_content"+index+"'>"
	 								html += "<input type='hidden' name='cartno"+index+"' value='"+item.product_price+"'>"
		 							html += "<input type='hidden' name='stock"+index+"' value='"+item.product_stock+"'>"
	 								html += "<div class='head head"+index+"'>"
	 								html += "<div class='company_name company_name"+index+"'>"+item.product_company+"</div></div>"
	 								html += "<div class='none_block none_block"+index+"'></div>"
	 								html += "<div class='content content"+index+"'>"
	 								html += "<div class='product_wrap product_wrap"+index+"'>"
	 								html += "<div class='checkbox_wrap checkbox_wrap"+index+"'>"
	 								html += "<input type='checkbox' class='cart_check' name='cart_no' value='"+item.product_price+"' checked='checked' >"
	 								html += "<button type='button' class='checkbox_button checkbox_button"+index+"'>"
	 								html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
	 								html += "<div class='product_info_top product_info_top"+index+"'>"
	 								html += "<div class='thumbnail'>"
									html += "<a href='<%=request.getContextPath()%>/product_content_list.do?no="+item.product_no+"'>"
									html += "<img src='resources/upload/"+item.product_thumbnail+"'></a></div>"
	 								html += "<div class='product_name product_name"+index+"'>"+item.product_name+"</div>"
	 								html += "<button type='button' class='product_remove product_remove"+index+"'>"
									html += "<img src='resources/image/remove_button.png'></button></div><div></div>"
									html += "<div class='product_info_bottom product_info_bottom"+index+"'>"
	 								html += "<div class='amount_control amount_control"+index+"'>"
	 								html += "<div class='minus_wrap minus_wrap"+index+"'>"
	 								html += "<button type='button' class='minusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_minus.png'></button></div>"
	 								html += "<div class='amount amount"+index+"'>"
	 								html += "<div class='amount_info"+index+"'>"+item.cart_amount+"</div></div>"
	 								html += "<div class='plus_wrap plus_wrap"+index+"'>"
	 								html += "<button type='button' class='plusbutton"+index+"'>"
	 								html += "<img src='resources/image/icon_plus.png'></button></div></div>"
	 								html += "<div class='price price"+index+"'>"
	 								html += "<div class='product_price product_price"+index+"'>"
	 								
	 								let price = (item.product_price * item.cart_amount).toLocaleString('ko-KR');
	 								
	 								html += price+"원</div></div></div><div class='solid'></div></div></div>"
									html += "<div class='footer footer"+index+"'>"
	 								html += "<div class='footer_product_price footer_product_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>상품금액</div>"
	 								html += "<div class='price price"+index+"'>"+price+"원</div></div>"
	 								html += "<div class='footer_delivery_price footer_delivery_price"+index+"'>"
	 								html += "<div class='title title"+index+"'>배송비</div>"
	 								html += "<div class='price price"+index+"'>3,000원</div></div>"
	 								html += "<div class='footer_total_price footer_total_price"+index+"'>"
	 										
	 								let total = ((item.product_price * item.cart_amount) + 3000).toLocaleString('ko-KR');
	 								
	 								html += "<div class='total_title total_title"+index+"'>총 금액</div>"
	 								html += "<div class='total_price total_price"+index+"'>"+total+"원</div></div></div></div>"
		 							
										
								});
								
								html += "</div>"
								
							}else if(total == '0'){
								
								html += "<div class='above'><div class='guide'>지금 장바구니가 비어 있어요.</div></div>"
								
							}
							
							html += "<div class='cart_bill_wrap'>"
							html += "<div class='bill'>"
							html += "<div class='bill_title'>계산서</div>"
							html += "<div class='solid_top'></div>"
							html += "<div class='bill_content'>"
							html += "<div class='bill_content_row'><div>총 상품금액</div>"
							html += "<div class='bill_price'>13,000원</div></div>"
							html += "<div class='bill_content_row'>"
							html += "<div>총 배송비</div><div class='bill_delivery'>3,000원</div></div>"
							html += "<div class='bill_info'><div class='icon'>"
							html += "<img src='resources/image/icon_circle_info.png'></div>"
							html += "<div class='bill_text'>제주도 및 도서산간의 경우 배송비가 추가될 수 있습니다.</div></div></div>"
							html += "<div class='solid_bottom'></div>"
							html += "<div class='bill_footer'>"
							html += "<div class='bill_footer_text'>총 결제 예상 금액</div>"
							html += "<div class='bill_footer_price'>16,000원</div></div></div>"
							html += "<div class='action_button_wrap'>"
							html += "<button type='button'>구매하기</button></div></div>"
							
							
							
							$(".cart_wrap").append(html);
								
						},
							
						error:function(data){
							alert("통신 실패");
						}
					});
			    		
			    });
			    
			  })(i);
			
		}
		
</script>
	
	<div class="main_wrap">
		<div class="cart_wrap">
			<div class="cart_head_wrap">
				<div class="top_item_wrap">
					<div class="item_wrap">
						<div class="checkbox_wrap">
							<button type="button" class="checkbox_button">
								<img class="total_ckbox" alt="checkbox" src="resources/image/checkbox-active.png">
							</button>
						</div>
						<input type="checkbox" id="total_aomount" checked="checked">
						<div class="text"></div>
					</div>
					
					<button type="button" class="delete_button" disabled>선택삭제</button>
				</div>			
			</div>
			<span></span>
			
			<c:if test="${!empty list }">
			<div class="cart_content_wrap">
				<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="cart_content cart_content${status.index}">
				<input type="hidden" name="cartno${status.index}" value="${dto.cart_no }">
				<input type="hidden" name="stock${status.index}" value="${dto.product_stock }">
					<div class="head head${status.index}">
						<div class="company_name company_name${status.index}">
							${dto.product_company }
						</div>
					</div>
			
					<div class="none_block none_block${status.index}"></div>
					
					<div class="content content${status.index}">
						<div class="product_wrap product_wrap${status.index}">
							<div class="checkbox_wrap checkbox_wrap${status.index}">
								<input type="checkbox" class="cart_check" name="price" value="${dto.product_price }" checked="checked" >
								<button type="button" class="checkbox_button checkbox_button${status.index}">
									<img alt="checkbox" src="resources/image/checkbox-active.png">
								</button>
							</div>
							
							<div class="product_info_top product_info_top${status.index}">
								<div class="thumbnail">
									<a href="<%=request.getContextPath()%>/product_content_list.do?no=${dto.product_no}">
										<img src="resources/upload/${dto.product_thumbnail }">
									</a>
								</div>
								<div class="product_name product_name${status.index}">${dto.product_name }</div>
								<button type="button" class="product_remove product_remove${status.index}">
									<img src="resources/image/remove_button.png">
								</button>
							</div>
							<div></div>
							<div class="product_info_bottom product_info_bottom${status.index}">
								<div class="amount_control amount_control${status.index}">
									<div class="minus_wrap minus_wrap${status.index}">
										<button type="button" class="minusbutton${status.index}">
											<img src="resources/image/icon_minus.png">
										</button>
									</div>
									
									<div class="amount amount${status.index}">
										<div class="amount_info${status.index}">${dto.cart_amount}</div>
									</div>
									
									<div class="plus_wrap plus_wrap${status.index}">
										<button type="button" class="plusbutton${status.index}">
											<img src="resources/image/icon_plus.png">
										</button>
									</div>
								</div>
								<div class="price price${status.index}">
									<div class="product_price product_price${status.index}">
										<c:set value="${dto.product_price * dto.cart_amount}" var="price" />
										<fmt:formatNumber>${price }</fmt:formatNumber>원
									</div>
								</div>
							</div>
							
							<div class="solid"></div>
						</div>
					</div>
					
					<div class="footer footer${status.index}">
						<div class="footer_product_price footer_product_price${status.index}">
							<div class="title title${status.index}">상품금액</div>
							<div class="price price${status.index}"><fmt:formatNumber>${price }</fmt:formatNumber>원</div>
						</div>
						<div class="footer_delivery_price footer_delivery_price${status.index}">
							<div class="title title${status.index}">배송비</div>
							<div class="price price${status.index}">3,000원</div>
						</div>
						<div class="footer_total_price footer_total_price${status.index}">
							<c:set value="${price + 3000}" var="total" />
							<div class="total_title total_title${status.index}">총 금액</div>
							<div class="total_price total_price${status.index}"><fmt:formatNumber>${total }</fmt:formatNumber>원</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</c:if>
			
			<c:if test="${empty list }">
				<div class="above">
					<div class="guide">지금 장바구니가 비어 있어요.</div>
				</div>
			</c:if>
			
			<div class="cart_bill_wrap">
				<div class="bill">
					<div class="bill_title">계산서</div>
					<div class="solid_top"></div>
					<div class="bill_content">
						<div class="bill_content_row">
							<div>총 상품금액</div>
							<div class="bill_price"></div>
						</div>
						<div class="bill_content_row">
							<div>총 배송비</div>
							<div class="bill_delivery"></div>
						</div>
						<div class="bill_info">
							<div class="icon">
								<img src="resources/image/icon_circle_info.png">
							</div>
							
							<div class="bill_text">제주도 및 도서산간의 경우 배송비가 추가될 수 있습니다.</div>
						</div>
					</div>
					<div class="solid_bottom"></div>
					<div class="bill_footer">
						<div class="bill_footer_text">총 결제 예상 금액</div>
						<div class="bill_footer_price"></div>
					</div>
				</div>
				
				<div class="action_button_wrap">
					<button type="button">구매하기</button>
				</div>
			</div>
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	
	// 로딩창 종료
	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>

<jsp:include page="../banner/bottom.jsp" />