<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

	var IMP = window.IMP; 
	IMP.init("imp68070036"); 
	  
	var today = new Date();   
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	 
	function requestPay() {
		
		var zipcode = $(".zipcode").text();
		var addr = $(".addr1").text() + $(".addr2").text();
		var tel = $(".phone").text();
		var name = '${name}';
		
		let product_no = [];
		let amount = [];
		
		let delivery_no = $('input[name=delivery_spot]:checked').val();
		let userId = '${userId}';
		product_no = ${product_no};
		let cart_no = ${cart_no};
		amount = ${amount};
		
		let point = 0;
		
		if($('input[name=point]').val() != ""){
			point = $('input[name=point]').val();
		}
		
		let price = ${sum};
		
		IMP.request_pay({
	  	pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid: "IMP"+makeMerchantUid, 
	    name : name,
	    amount : (${sum + delivery} - point),
	    buyer_email : '${email}',
	    buyer_name : '${userId}',
	    buyer_tel : tel,
	    buyer_addr : addr,
	    buyer_postcode : zipcode
		}, function (rsp) {           
			console.log(rsp);            
			if (rsp.success) {   
 			var msg = '결제가 완료되었습니다.\n';       
 			msg += '결제 금액 : ' + rsp.paid_amount+'원\n';            
 			msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
 			
			} else {               
 				window.history.go(-2);
 				swal('결제 실패',rsp.error_msg,'warning');
			}
			
 			const Toast = Swal.mixin({
			      toast: true,
			      position: 'center-center',
			      showConfirmButton: false,
			      timer: 6000,
			      timerProgressBar: true,
			    })
			
			    Toast.fire({
			      icon: 'success',
			      title: msg
			    })
			    
			window.location.href = "<%=request.getContextPath() %>/insert_order.do?delivery_no="+delivery_no+"&amount="+amount+"&cart_no="+cart_no+"&product_no="+product_no+"&userId="+userId+"&price="+price+"&point="+point
					
			});
	}

	$(document).on("change", "input[name='delivery_spot']", function(){
		
		let delivery_no = this.value;
		
		$.ajax({
			url:"<%=request.getContextPath()%>/cart_delivery_list.do",
			method:"post",
			async: false,
			data: {delivery_no : delivery_no},
			datatype: "json",
			success:function(data){
				
				$(".content_delivery_wrap").empty();
				
				let html = "";
				
				$.each(data, function(index, item){
					
					html += "<div class='delivery_info'>"
					html += "<div class='delivery_title'>우편 번호</div>"
					html += "<div class='zipcode'>"+item.deli_zipcode+"</div></div>"
					html += "<div class='delivery_info'>"
					html += "<div class='delivery_title'>주소</div>"
					html += "<div class='addr1'>"+item.deli_addr1+"</div></div>"
					html += "<div class='delivery_info'>"
					html += "<div class='delivery_title'>상세 주소</div>"
					html += "<div class='addr2'>"+item.deli_addr2+"</div></div>"
					html += "<div class='delivery_info'>"
					html += "<div class='delivery_title'>핸드폰</div>"
					html += "<div class='phone'>"+item.deli_phone1+"-"+item.deli_phone1+"-"+item.deli_phone1+"</div></div>"
					
					html += "<div class='delivery_point_info'>"
					html += "<div class='delivery_title'>포인트</div>"
					html += "<div class='point_info'>"
					html += "<div class='point_input'><input name='point' placeholder='사용 할 포인트를 입력해 주세요' ></div>"
					html += "<div class='point'>사용 가능한 포인트: "+${point }+"</div></div></div>"
				
				});
				
				$(".content_delivery_wrap").append(html);
				
			},
			
			error:function(data){
				alert("통신 실패");
			}
			
		});
		
	});
	
	$(document).on("click", ".insert_button", function(){
		
		requestPay();
		
	});

	
	$(document).on("change", "input[name='point']", function(){
		
		let point = parseInt(this.value);
			
		if(point > ${point}){
			
			Swal.fire({
			      icon: 'warning',
			      title: '알림',
			      text: '사용 가능한 포인트를 초과했습니다.',
			      confirmButtonColor: '#3085d6'
			    });
			
			$("input[name='point']").val("");
			
		}else if(point < 10){
			
			Swal.fire({
			      icon: 'warning',
			      title: '알림',
			      text: '100포인트 이상부터 사용 가능합니다.',
			      confirmButtonColor: '#3085d6'
			    });
			
			$("input[name='point']").val("");
			
		}else {
			
			
			let total = ${sum + delivery} - point;
			
			$(".bill_point").empty();
			
			$(".bill_footer_price").empty();
			
			$(".bill_point").append(point.toLocaleString('ko-KR')+"원");
			
			$(".bill_footer_price").append(total.toLocaleString('ko-KR') +"원");
		}
		
	});
	
</script>