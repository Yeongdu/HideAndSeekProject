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
	
	<div class="main_wrap">
		<div class="cart_wrap">
			<div class="cart_head_wrap">
				<div class="top_item_wrap">
					<div class="item_wrap">
						<input type="checkbox" id="checkbox" name="cart" value="35" style="display: none;">
						<div class="checkbox_wrap">
							<button type="button" class="checkbox_button">
								<img alt="checkbox" src="resources/image/checkbox.png">
							</button>
						</div>
						<div class="text">모두 선택 (0/${totalcart })</div>
					</div>
					
					<button type="button" class="delete_button" disabled>선택삭제</button>
				</div>			
			</div>
			<span></span>
			
			<div class="cart_content_wrap">
				<c:forEach items="${list }" var="dto">
				<div class="cart_content">
					<div class="head">
						<div class="company_name">
							${dto.product_company }
						</div>
					</div>
			
					<div class="none_block"></div>
					
					<div class="content">
						<div class="product_wrap">
							<div class="checkbox_wrap">
								<button type="button" class="checkbox_button">
									<img alt="checkbox" src="resources/image/checkbox.png">
								</button>
							</div>
							
							<div class="product_info_top">
								<div class="thumbnail">
									<a href="<%=request.getContextPath()%>/product_content_list.do?no=${dto.product_no}">
										<img src="resources/upload/${dto.product_thumbnail }">
									</a>
								</div>
								<div class="product_name">${dto.product_name }</div>
								<button type="button" class="product_remove_button">
									<img src="resources/image/remove_button.png" onclick="location.href='<%=request.getContextPath()%>/cart_delete.do?no${dto.cart_no }'">
								</button>
							</div>
							<div></div>
							<div class="product_info_bottom">
								<div class="amount_control">
									<div class="minus_wrap">
										<button type="button">
											<img src="resources/image/icon_minus.png">
										</button>
									</div>
									
									<div class="amount">
										<input type="number" pattern="\d*" maxlength="3" value="1" style="display: none;">
										<div>${dto.cart_amount}</div>
									</div>
									
									<div class="plus_wrap">
										<button type="button">
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
			
			<div class="cart_bill_wrap">
				<div class="bill">
					<div class="bill_title">계산서</div>
					<div class="solid_top"></div>
					<div class="bill_content">
						<div class="bill_content_row">
							<div>총 상품금액</div>
							<div class="bill_price">13,000원</div>
						</div>
						<div class="bill_content_row">
							<div>총 배송비</div>
							<div class="bill_price">3,000원</div>
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
						<div class="bill_footer_price">16,000원</div>
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