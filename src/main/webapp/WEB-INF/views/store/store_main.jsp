<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../banner/none_top.jsp" />


<link href="resources/css/store/store_main.css" rel="stylesheet" type="text/css">

	<div class="main">
		<img alt="banner" src="resources/image/store_banner.png">
	
		<div class="category">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/store_tlist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_takju_logo.png">
							</li>
							<li class="text">탁 주</li>
						</ul>
					</a>
				</li>
			
				<li>
					<a href="<%=request.getContextPath()%>/store_clist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_chungju_logo.png">
							</li>
							<li class="text">청 주</li>
						</ul>
					</a>
				</li>
				
				<li>
					<a href="<%=request.getContextPath()%>/store_wlist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_wine_logo.png">
							</li>
							<li class="text">과실주</li>
						</ul>
					</a>
				</li>
					
				<li>
					<a href="<%=request.getContextPath()%>/store_slist.do">
						<ul>
							<li>
								<img alt="takju" src="resources/image/store_soju_logo.png">
							</li>
							<li class="text">증류주</li>
						</ul>
					</a>
				</li>
			</ul>
		</div>
	
	<hr>
	<div class="best_wrap">
		<div class="best_choice">
			<div class="best_logo">
				<img alt="best_img" src="resources/image/best_product_logo.png">
			</div>
			
			<div class="best_title">
				<span class="best_introduse1">현재 술래잡기에서 가장 인기 있는 술</span>
				<span class="best_introduse2">&nbsp;&nbsp;이 술은 어때요?</span>
			</div>
			
			<div class="more">
			</div>
		</div>
		
		<div class="best">
			<div class="best_product">
				<div class="best_product_img">
					<img alt="best_img" src="resources/upload/fWO1-1668403134296-1Z7A1584.jpg" style="width: 86.5%; height: 39.7vh">
				</div>
				
				<div class="best_product_content">
					<div class="best_product_wrap">
						<div class="best_product_name">
						제목
						</div>
					</div>
					
					<div class="best_product_wrap">
						<div class="best_product_pr">
							<div class="best_product_price">
							00000원
							</div>
							<div class="best_product_review">
							별 0.0점 | 리뷰 00
							</div>
						</div>
						
						<hr>
					</div>
					
					<div class="best_product_coment">
						<div>#일하기싫다</div>
						<div>#집가고싶다</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="review_wrap">
		<div class="review_choice">
			<div class="review_logo">
				<img alt="review_img" src="resources/image/review_product_logo.png">
			</div>
			
			<div class="review_title">
				<span class="review_introduse1">마셔본 사람들의 이야기가 가장 많아요</span>
				<span class="review_introduse2">&nbsp;&nbsp;이 술은 어때요?</span>
			</div>
			
			<div class="more">
			</div>
		</div>
		
		<div class="review">
			<div class="review_product">
				<div class="review_product_img">
					<img alt="review_img" src="resources/upload/fWO1-1668403134296-1Z7A1584.jpg" style="width: 86.5%; height: 39.7vh">
				</div>
				
				<div class="review_product_content">
					<div class="review_product_wrap">
						<div class="review_product_name">
						제목
						</div>
					</div>
					
					<div class="review_product_wrap">
						<div class="review_product_pr">
							<div class="review_product_price">
							00000원
							</div>
							<div class="review_product_review">
							별 0.0점 | 리뷰 00
							</div>
						</div>
						
						<hr>
					</div>
					
					<div class="review_product_coment">
						<div>#일하기싫다</div>
						<div>#집가고싶다</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	</div>

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">

	window.onload = function () {
	    $(".loading").fadeOut(100,function(){
	        $("#div_load_image").fadeOut(300);
	    });
	}

</script>

<jsp:include page="../banner/bottom.jsp" />
	
