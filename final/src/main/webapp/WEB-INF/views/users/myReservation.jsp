<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/simplex.css">
    <link rel="stylesheet" href="/resources/css/my_page.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>예매내역</title>
    <style>
    .table td {
    vertical-align : middle !important;
    }
    </style>
</head>
<body>
<%@ include file="../board/header.jsp" %>


       	
  <div class="nav_container">
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link active" style="text-align:center; width:300px; " data-toggle="tab" href="/myReservation" >예매내역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="text-align:center; width:300px; " data-toggle="tab" href="/myBoard">게시글정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="text-align:center; width:300px; " data-toggle="tab" href="/myInfo">회원정보수정</a>
      </li>
    </ul>
  
<sec:authorize access="isAuthenticated()">

       	<sec:authentication property="principal.username" var="userid" />
       	<sec:authentication property="principal.member.userName" var="userName"/>  
  
<h4 style="font-weight: 600; margin-top: 100px;">예매내역</h4>

<hr color="black">
  <table class="table table-hover">
    <thead>
      <tr class="table-active">
        <th scope="col">예매번호</th>
        <th scope="col">포스터</th>
        <th scope="col">영화제목</th>
        <th scope="col">상영관</th>
        <th scope="col">상영날짜</th>
        <th scope="col">예매날짜 및  시간</th>
        <th scope="col">예매인원</th>
        <th scope="col">예매좌석</th>
        <th scope="col">결제금액</th>
        <th scope="col">취소여부</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<hr color="lightgray">
</sec:authorize>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="/resources/js/myReservation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	getPaymentHistory(function(list){
		
		var str = "";
		for(var i = 0; i<list.length; i++){
			console.log(list[i]);
			var totalPeople = list[i].adultType + list[i].youthType + list[i].preferentialType;
			str += "<tr>"
			str += "<td class='paymentNumber'>"+list[i].paymentNumber+"</th>"
			str += "<td><img src='/resources/images/"+list[i].poster+"' width='90' height='120'></th>"
			str += "<td>"+list[i].movieName+"</td>"
			str += "<td>"+list[i].theaterNumber+"관</td>"
			str += "<td>"+list[i].playDate.substring(0,4)+"."+list[i].playDate.substring(4,6)+"."+list[i].playDate.substring(6,8)+"</td>"
			str += "<td>"+list[i].payDate+"</td>"
			str += "<td>"+totalPeople+"</td>"
			str += "<td>"+list[i].seatList+"</td>"
			str += "<td>"+list[i].payAmount+"</td>"
			if(list[i].cancelable === "Y"){
				str += '<td><button type="button" class="btn btn-outline-primary cancelBtn">취소</button></td>'
			} else {
				str += '<td>취소불가</td>'
			}
			str += '</tr>'
		}
		$('tbody').html(str);
	});
	
	$('tbody').on('click', '.cancelBtn', function(){
		var paymentNumber = $(this).parent().parent().find('td.paymentNumber').html();
		console.log(paymentNumber);
		if(confirm('취소하시겠습니까?')){
			$.ajax({
				url: '/cancelPayment/'+paymentNumber,
				type: 'post',
				beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					  }, 
				contentType: 'application/json; charset=utf-8',
				success: function(data) {
					console.log("ok!");
					alert('결제내역이 취소되었습니다.');
				},
				error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			$(this).replaceWith('취소되었음');
		}
	})
	
	function getPaymentHistory(callback, error){
		$.ajax({
			url: '/getPaymentHistory/'+'${userid}',
			type: 'post',
			dataType: 'json',
			beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				  }, 
			contentType: 'application/json; charset=utf-8',
			success: function(data) {
				if (callback) {
					callback(data);
				}
				//console.log("ok!");
			},
			error:function(request,status,error){
	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	
});
//$(document).ready(function()) end
</script>
</body>
</html>