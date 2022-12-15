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

	let totalcart = 0;

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
			
			$(".text").append("모두 선택 ("+ckcount+"/"+count+")");
			
			$(".bill_footer_price").append((sum + (ckcount * 3000)).toLocaleString('ko-KR') +"원");
			
			
		}
		
		$(document).on("click", ".total_ckbox", function(){
			
			let count = $(".cart_check").length;
			
			console.log("count 값 >>> "+ count);
			
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
		
		let html = "";
		
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
			    	
			    	let cart_no = $('.cartno'+j).val();
			    	
			    	let amount = $('.amount_info'+j).text();
			    	
			    	if(amount != 1){
			    		
			    		$.ajax({
							url:"<%=request.getContextPath()%>/cart_amount_minus.do",
							method:"post",
							async: false,
							data: {
								cart_no : cart_no,
								userId : id},
							datatype: "json",
							success:function(data){
								
								$(".cart_content"+j).empty();
								
								$.each(data, function(index, item){
									
									html = "";
								
									html += "<input type='hidden' class='cartno"+j+"' name='cartno' value='"+item.cart_no+"'>"
		 							html += "<input type='hidden' class='stock"+j+"' name='stock' value='"+item.product_stock+"'>"
	 								html += "<div class='head head'>"
	 								html += "<div class='company_name'>"+item.product_company+"</div></div>"
	 								html += "<div class='none_block'></div>"
	 								html += "<div class='content'>"
	 								html += "<div class='product_wrap'>"
	 								html += "<div class='checkbox_wrap'>"
	 								html += "<input type='checkbox' class='cart_check' name='price' value='"+item.product_price+"' checked='checked' >"
	 								html += "<button type='button' class='checkbox_button checkbox_button"+j+"'>"
	 								html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
	 								html += "<div class='product_info_top'>"
	 								html += "<div class='thumbnail'>"
									html += "<a href='<%=request.getContextPath()%>/product_content_list.do?no="+item.product_no+"'>"
									html += "<img src='resources/upload/"+item.product_thumbnail+"'></a></div>"
	 								html += "<div class='product_name'>"+item.product_name+"</div>"
	 								html += "<button type='button' class='product_remove product_remove"+j+"'>"
									html += "<img src='resources/image/remove_button.png'></button></div><div></div>"
									html += "<div class='product_info_bottom'>"
	 								html += "<div class='amount_control'>"
	 								html += "<div class='minus_wrap'>"
	 								html += "<button type='button' class='minusbutton"+j+"'>"
	 								html += "<img src='resources/image/icon_minus.png'></button></div>"
		 							html += "<div class='amount'>"
		 							html += "<div class='amount_info"+j+"'>"+item.cart_amount+"</div></div>"
	 								html += "<div class='plus_wrap'>"
	 								html += "<button type='button' class='plusbutton"+j+"'>"
	 								html += "<img src='resources/image/icon_plus.png'></button></div></div>"
	 								html += "<div class='price'>"
	 								html += "<div class='product_price'>"
									
	 								let price = (item.product_price * item.cart_amount).toLocaleString('ko-KR');
									
	 								html += price+"원</div></div></div><div class='solid'></div></div></div>"
									html += "<div class='footer'>"
	 								html += "<div class='footer_product_price'>"
	 								html += "<div class='titlee'>상품금액</div>"
	 								html += "<div class='price'>"+price+"원</div></div>"
	 								html += "<div class='footer_delivery_price'>"
	 								html += "<div class='title'>배송비</div>"
	 								html += "<div class='price'>3,000원</div></div>"
	 								html += "<div class='footer_total_price'>"
											
	 								let totalprice = ((item.product_price * item.cart_amount) + 3000).toLocaleString('ko-KR');
									
	 								html += "<div class='total_title'>총 금액</div>"
	 								html += "<div class='total_price'>"+totalprice+"원</div></div></div>"
								
								});
								
	 							$(".cart_content"+j).append(html);
	 							
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
			    	
			    	let cart_no = $('.cartno'+j).val();
			    	
			    	let stock = $('.stock'+j).val();
			    	
			    	let amount = $('.amount_info'+j).text();
			    	
			    	if(amount != stock){
			    		
			    		$.ajax({
							url:"<%=request.getContextPath()%>/cart_amount_plus.do",
							method:"post",
							async: false,
							data: {
								cart_no : cart_no,
								userId : id},
							datatype: "json",
							success:function(data){
								
								$(".cart_content"+j).empty();
								
								$.each(data, function(index, item){
								
	 								html = "";
	 								
	 								html += "<input type='hidden' class='cartno"+j+"' name='cartno' value='"+item.cart_no+"'>"
		 							html += "<input type='hidden' class='stock"+j+"' name='stock' value='"+item.product_stock+"'>"
	 								html += "<div class='head head'>"
	 								html += "<div class='company_name'>"+item.product_company+"</div></div>"
	 								html += "<div class='none_block'></div>"
	 								html += "<div class='content'>"
	 								html += "<div class='product_wrap'>"
	 								html += "<div class='checkbox_wrap'>"
	 								html += "<input type='checkbox' class='cart_check' name='price' value='"+item.product_price+"' checked='checked' >"
	 								html += "<button type='button' class='checkbox_button checkbox_button"+j+"'>"
	 								html += "<img alt='checkbox' src='resources/image/checkbox-active.png'></button></div>"
	 								html += "<div class='product_info_top'>"
	 								html += "<div class='thumbnail'>"
									html += "<a href='<%=request.getContextPath()%>/product_content_list.do?no="+item.product_no+"'>"
									html += "<img src='resources/upload/"+item.product_thumbnail+"'></a></div>"
	 								html += "<div class='product_name'>"+item.product_name+"</div>"
	 								html += "<button type='button' class='product_remove product_remove"+j+"'>"
									html += "<img src='resources/image/remove_button.png'></button></div><div></div>"
									html += "<div class='product_info_bottom'>"
	 								html += "<div class='amount_control'>"
	 								html += "<div class='minus_wrap'>"
	 								html += "<button type='button' class='minusbutton"+j+"'>"
	 								html += "<img src='resources/image/icon_minus.png'></button></div>"
		 							html += "<div class='amount'>"
		 							html += "<div class='amount_info"+j+"'>"+item.cart_amount+"</div></div>"
	 								html += "<div class='plus_wrap'>"
	 								html += "<button type='button' class='plusbutton"+j+"'>"
	 								html += "<img src='resources/image/icon_plus.png'></button></div></div>"
	 								html += "<div class='price'>"
	 								html += "<div class='product_price'>"
									
	 								let price = (item.product_price * item.cart_amount).toLocaleString('ko-KR');
									
	 								html += price+"원</div></div></div><div class='solid'></div></div></div>"
									html += "<div class='footer'>"
	 								html += "<div class='footer_product_price'>"
	 								html += "<div class='title'>상품금액</div>"
	 								html += "<div class='price'>"+price+"원</div></div>"
	 								html += "<div class='footer_delivery_price'>"
	 								html += "<div class='title'>배송비</div>"
	 								html += "<div class='price'>3,000원</div></div>"
	 								html += "<div class='footer_total_price'>"
											
	 								let totalprice = ((item.product_price * item.cart_amount) + 3000).toLocaleString('ko-KR');
									
	 								html += "<div class='total_title'>총 금액</div>"
	 								html += "<div class='total_price'>"+totalprice+"원</div></div></div>"
								
								});
								
	 							$(".cart_content"+j).append(html);
	 							
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
			    	
			    	let cart_no = $('.cartno'+j).val();
			    	
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
							
							$.ajax({
								url:"<%=request.getContextPath()%>/cart_delete_count.do",
								method:"post",
								async: false,
								data: {
									userId : id,
									},
								datatype: "text",
								success:function(data){
									
									totalcart = parseInt(data);
									
								},
								
								error:function(data){
									alert("통신 실패");
								}
							});
							
							$(".cart_content"+j).remove();
							
							let jset = j;
							
							j += 1;
							
							if(totalcart != 0){
							
								$.each(data, function(index, item){
									
									$(".cart_content"+j).attr("class","cart_content cart_content"+(j - 1));
									$(".cartno"+j).attr("class","cartno"+(j - 1));
									$(".stock"+j).attr("class","stock"+(j - 1));
									$(".checkbox_button"+j).attr("class","checkbox_button checkbox_button"+(j - 1));
									$(".product_remove"+j).attr("class","product_remove product_remove"+(j - 1));
									$(".minusbutton"+j).attr("class","minusbutton"+(j - 1));
									$(".amount_info"+j).attr("class","amount_info"+(j - 1));
									$(".plusbutton"+j).attr("class","plusbutton"+(j - 1));
									
									j += 1;
									
								});
							
							}else if(totalcart == 0){
								
								let html = "<div class='above'><div class='guide'>지금 장바구니가 비어 있어요.</div></div>"
								
								$(".cart_content_wrap").append(html);
								
							}
							
							j = jset;
							
							total();							
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
				<input type="hidden" class="cartno${status.index}" name="cartno" value="${dto.cart_no }">
				<input type="hidden" class="stock${status.index}"name="stock" value="${dto.product_stock }">
					<div class="head">
						<div class="company_name">
							${dto.product_company }
						</div>
					</div>
			
					<div class="none_block"></div>
					
					<div class="content">
						<div class="product_wrap">
							<div class="checkbox_wrap">
								<input type="checkbox" class="cart_check" name="price" value="${dto.product_price }" checked="checked" >
								<button type="button" class="checkbox_button checkbox_button${status.index}">
									<img alt="checkbox" src="resources/image/checkbox-active.png">
								</button>
							</div>
							
							<div class="product_info_top">
								<div class="thumbnail">
									<a href="<%=request.getContextPath()%>/product_content_list.do?no=${dto.product_no}">
										<img src="resources/upload/${dto.product_thumbnail }">
									</a>
								</div>
								<div class="product_name">${dto.product_name }</div>
								<button type="button" class="product_remove product_remove${status.index}">
									<img src="resources/image/remove_button.png">
								</button>
							</div>
							<div></div>
							<div class="product_info_bottom">
								<div class="amount_control">
									<div class="minus_wrap">
										<button type="button" class="minusbutton${status.index}">
											<img src="resources/image/icon_minus.png">
										</button>
									</div>
									
									<div class="amount">
										<div class="amount_info${status.index}">${dto.cart_amount}</div>
									</div>
									
									<div class="plus_wrap">
										<button type="button" class="plusbutton${status.index}">
											<img src="resources/image/icon_plus.png">
										</button>
									</div>
								</div>
								<div class="price">
									<div class="product_price">
										<c:set value="${dto.product_price * dto.cart_amount}" var="price" />
										<fmt:formatNumber>${price }</fmt:formatNumber>원
									</div>
								</div>
							</div>
							
							<div class="solid"></div>
						</div>
					</div>
					
					<div class="footer">
						<div class="footer_product_price">
							<div class="title">상품금액</div>
							<div class="price"><fmt:formatNumber>${price }</fmt:formatNumber>원</div>
						</div>
						<div class="footer_delivery_price">
							<div class="title">배송비</div>
							<div class="price">3,000원</div>
						</div>
						<div class="footer_total_price">
							<c:set value="${price + 3000}" var="total" />
							<div class="total_title">총 금액</div>
							<div class="total_price"><fmt:formatNumber>${total }</fmt:formatNumber>원</div>
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