<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button class="payTest">테스트</button>
<div class="result"></div>


	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
	
		$(".payTest").on("click",function(){
			//alert('test');
			
				IMP.request_pay({
					pg : 'inisis', // 결제방식
					pay_method : 'card', // 결제 수단
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명: 결제 테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
					amount : '101', // 결제 금액
					buyer_email : 'iamport@siot.do', // 구매자 email
					buyer_name : '홍홍홍', // 구매자 이름
					buyer_tel : '010-1234-5678', // 구매자 전화번호
					buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
					buyer_postcode : '123-456', // 구매자 우편번호
					//m_redirect_url : '/khx/payEnd.action' // 결제 완료 후 보낼 컨트롤러의 메소드명
				}, function(rsp) {
					if (rsp.success) { // 성공시
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						// jQuery로 HTTP 요청
					      $.ajax({
					          url: "/showPayHistory", // 가맹점 서버
					          method: "POST",
					          headers: { "Content-Type": "application/json" },
					          data: {
					              //imp_uid: rsp.imp_uid,
					              //merchant_uid: rsp.merchant_uid
					              'name' : 'name',
					              'age' : 'age'
					          }
					      }).done(function(data){
					    	// 가맹점 서버 결제 API 성공시 로직
					    	alert(data);
					    	console.log(data[0].movieName);
					      });
						
					} else { // 실패시
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
				})
		})	
	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp00435953'); // 가맹점 식별 코드 

		
		
	});
	</script>
</body>
</html>