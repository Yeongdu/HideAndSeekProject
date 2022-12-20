<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

	let totalcart = 0;
	
	var id = '<%=(String)session.getAttribute("userId")%>';
	
	var size = ${list.size()};
	
	let html = "";

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
		
		$(function(){
			
			let count = $(".cart_check").length;
			
			if(count != 0){
				
				total();
				
			}else {
				
				$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
				
				document.getElementById("total_amount").checked = false;
				
			}
			
		});
		
		$(document).on("click", ".delete_button", function(){
			
			let count = $(".cart_check").length;
			
			for(let i=0; i<count; i++){
				
				if($(".cart_check")[i].checked == true){
					
					let cart_no = $('.cartno'+i).val();
			    	
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
							
							$(".cart_content"+i).remove();
							
							let iset = i;
							
							i += 1;
							
							if(totalcart != 0){
							
								$.each(data, function(index, item){
									
									$(".cart_content"+i).attr("class","cart_content cart_content"+(i - 1));
									$(".cartno"+i).attr("class","cartno"+(i - 1));
									$(".stock"+i).attr("class","stock"+(i - 1));
									$(".checkbox_button"+i).attr("class","checkbox_button checkbox_button"+(i - 1));
									$(".product_remove"+i).attr("class","product_remove product_remove"+(i - 1));
									$(".minusbutton"+i).attr("class","minusbutton"+(i - 1));
									$(".amount_info"+i).attr("class","amount_info"+(i - 1));
									$(".plusbutton"+i).attr("class","plusbutton"+(i - 1));
									
									i += 1;
									
								});
							
							}else if(totalcart == 0){
								
								let html = "<div class='above'><div class='guide'>지금 장바구니가 비어 있어요.</div></div>"
								
								$(".cart_content_wrap").append(html);
								
								$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
								
								document.getElementById("total_amount").checked = false;
								
							}
							
							i = iset;
							
							i -= 1;
							
							count -= 1;
							
							total();
							
							$(".cart_count").empty();
							
							$(".cart_count").append(totalcart);
							
						},
						
						error:function(data){
							alert("통신 실패");
						}
						
					});
					
				}
				
			}
			
		});
		
		$(document).on("click", ".insert_button", function(){
			
			let count = $(".cart_check").length;
			
			for(let i=0; i<count; i++){
				
				if($(".cart_check")[i].checked == true){
					
					let cart_no = $('.cartno'+i).val();
			    	
				}
				
			}
		
		})
		
		
		$(document).on("click", ".total_ckbox", function(){
			
			let count = $(".cart_check").length;
			
			if(count != 0){
				
				if(document.getElementById("total_amount").checked == true){
					
					$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
					
					document.getElementById("total_amount").checked = false;
					
					for(let i = 0; i<count; i++){
						
						if($(".cart_check")[i].checked == true){
						
							$(".cart_check")[i].checked = false;
							
							$(".checkbox_button"+i+" > img").attr({src:"resources/image/checkbox.png"});
						
						}
						
					};
					
					total();
					
				}else if(document.getElementById("total_amount").checked == false){
					
					$(".total_ckbox").attr({src:"resources/image/checkbox-active.png"});
					
					document.getElementById("total_amount").checked = true;
					
					for(let i = 0; i<count; i++){
						
						if($(".cart_check")[i].checked == false){
							
							$(".cart_check")[i].checked = true;
							
							$(".checkbox_button"+i+" > img").attr({src:"resources/image/checkbox-active.png"});
						
						}
						
					};
					
					total();
				}
				
			}
			
		});
		
		for(var i=0; i<size; i++){
			
			(function(j) {
				
				$(document).on('click', '.checkbox_button' + j, function() {
					
					let count = $(".cart_check").length;
					
					if($(".cart_check")[j].checked == true){
						
						$(".cart_check")[j].checked = false;
						
						$('.checkbox_button'+j+" > img").attr({src:"resources/image/checkbox.png"});
						
						$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
						
						document.getElementById("total_amount").checked = false;
						
						total();
						
					}else if($(".cart_check")[j].checked == false){
						
						$(".cart_check")[j].checked = true;
						
						$('.checkbox_button'+j+" > img").attr({src:"resources/image/checkbox-active.png"});
						
						let ckcount = $("input:checkbox[name=price]:checked").length;
						
						if(count == ckcount){
							
							$(".total_ckbox").attr({src:"resources/image/checkbox-active.png"});
							
							document.getElementById("total_amount").checked = true;
							
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
								
								$(".total_ckbox").attr({src:"resources/image/checkbox.png"});
								
								document.getElementById("total_amount").checked = false;
								
							}
							
							j = jset;
							
							let count = $(".cart_check").length;
							
							total();				
							
							$(".cart_count").empty();
							
							$(".cart_count").append(totalcart);
							
						},
						
						error:function(data){
							alert("통신 실패");
						}
						
					});
		    		
			    });
			    
			  })(i);
			
		}
		
</script>