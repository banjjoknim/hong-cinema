<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/simplex.css">
<link rel="stylesheet" href="/resources/css/boardList.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>게시판</title>
</head>
<body>

			<sec:authorize access="isAuthenticated()">
            	<sec:authentication property="principal.username" var="userid" />
       			<sec:authentication property="principal.member.userName" var="userName"/>
       			<sec:authentication property="principal.member.userEmail" var="userEmail"/>
			</sec:authorize>

	<%@ include file="../board/header.jsp"%>
	<div class="boardContainer">

		<div style="height: 30px;">
		<span class="thisBoardTitle" style="font-weight: 600; font-size: 200%; margin-top: 100px;">게시글 목록</span>
		<button type="button" class="btn btn-outline-primary btn-category" value="category3">category3</button>
		<button type="button" class="btn btn-outline-primary btn-category" value="recommand">영화 추천</button>
		<button type="button" class="btn btn-outline-primary btn-category" value="review">영화 리뷰</button>
		</div>
		<hr color="black">
		<div class="contents">
			<table class="table table-hover" style="padding-bottom: 0px; width: 100%;">
				<thead>
					<tr class="table-active">
						<th class="no" scope="col">번호</th>
						<th class="category" scope="col">분류</th>
						<th class="boardTitle" scope="col" style="margin: 0px;">제목</th>
						<th class="writer" scope="col">작성자</th>
						<th class="writeDate" scope="col">작성일</th>
						<th class="hit" scope="col">조회수</th>
					</tr>
				</thead>
				<tbody class="boardList" style="width: 100%;">
				</tbody>
			</table>
		</div>
		<button class="registButton btn btn-info">게시글 작성</button>
		<button class="goToListButton btn btn-info">목록으로</button>
		<button class="btn-modify btn btn-success">게시글 수정</button>
		<button class="btn-delete btn btn-primary">게시글 삭제</button>
		<button class="completeModify btn btn-success">수정완료</button>
		<button class="cancelModify btn btn-primary">취소</button>
	</div>
	<%@ include file="../board/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			
			$('.btn-modify').hide();
			$('.btn-delete').hide();
			$('.completeModify').hide();
			$('.cancelModify').hide();
			
			var showList = function(list){
				
				for(var i = 0; len = list.length||0, i<len; i++){
					var str = "";
					
					str += '<tr style="margin-bottom: 0px;">'
					str += '<td class="boardNumberInList">'+list[i].boardNumber +'</td>'
					str += '<td>'+list[i].category +'</td>'
					str += '<td class="boardTitleInList">'+list[i].title +'</td>'
					str += '<td class="writerInList">'+list[i].writer +'</td>'
					str += '<td>'+list[i].writeDate +'</td>'
					str += '<td>'+list[i].hit +'</td>'
					str += '</tr>'
 					
					$('tbody').append(str);
				}
			} 
			
			$.ajax({
                url: "/getBoardList.json",
                method: "get"
                //headers: { "Content-Type": "application/json" },
                //beforeSend: function(xhr){
				//	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				//  }
            }).done(function (data) {
                // alert('게시글 불러오기 완료.');
                showList(data);
            })
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$('.contents').on('click','.completeWrite', function(){
				alert('게시글 작성이 완료되었습니다.');
				$('#writeFrm').submit();
			})
			
			$('.contents').on('click', '.cancelWrite', function(){
				alert('게시글 작성이 취소되었습니다.');
				window.location.href ='http://localhost:8080/board/boardList';
			})
			
			$(".registButton").on("click",function(){
				//alert('게시글 작성!');
				$(".contents").load("/board/write #writeFrm");
				$(this).hide();
				$('.goToListButton').hide();
		    	$('h4').html('게시글 작성');
			})
			
			$('.goToListButton').on('click', function(){
				//alert('목록으로');
				window.location.href ='http://localhost:8080/board/boardList';
			})
			
			var thisBoardNumber;
			$('.boardList').on('click', '.boardTitleInList', function(){
				var requestUrl = "http://localhost:8080/board/boardList/"+$(this).parent().find('.boardNumberInList').html()+".json";
				// console.log($(this).parent().find('.boardNumberInList').html());
				$.ajax({
					url: requestUrl,
					type: 'get',
					contentType: 'application/json;charset=utf-8',
					//headers: { "Content-Type": "application/json" },
					beforeSend: function(xhr){
  						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  					  },
				}).done(function (data) {
					//console.log(data);
					thisBoardNumber = data.boardNumber;
					$(".contents").load("/board/read", function(){
						$('.thisBoardTitle').html(data.title);
						$('.categoryName').html(data.category);
						$('.writerName').html(data.writer);
						$('.content').html(data.contents);
						$('.writeDate').html(data.writeDate);
						$('.hit').html(data.hit);
						if('${userid}' === data.writer){
							console.log(data);
							$('input[name=writer]').val('${userid}');
							$('input[name=boardNumber]').val(thisBoardNumber);
						}
					});
					$('.registButton').hide();
					$('.btn-category').hide();
					$('.btn-modify').hide();
					$('.btn-delete').hide();
					$('.completeModify').hide();
					$('.cancelModify').hide();
					if('${userid}' === data.writer){
						$('.btn-delete').show();
						$('.btn-modify').show();
					}
                  })
			})
			
			$('.contents').on('click','.writerInList', function(){
				window.location.href = "http://localhost:8080/board/boardList/"+$(this).html();
			})
			
			$('.btn-category').on('click', function(){
				//alert('카테고리 선택');
				
				$.ajax({
					url: '/getBoardList/'+$(this).val()+".json",
					type: 'get',
					contentType: 'application/json;charset=utf-8',
					beforeSend: function(xhr){
  						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  					  },
				}).done(function (data) {
					console.log(data);
					$('tbody').html('');
					showList(data);
                  })
			})
			
			$('.btn-modify').on('click', function(){
				//alert('수정하기');
				console.log(thisBoardNumber);
				$.ajax({
					url: '/board/modify/'+thisBoardNumber,
					type: 'get',
					contentType: 'application/json;charset=utf-8',
					beforeSend: function(xhr){
  						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  					  },
				}).done(function (data) {
					//alert('수정페이지 진입.');
					$(".contents").load("/board/modify", function(){
						$('.thisBoardTitle').html(data.title);
						$('.categoryName').html(data.category);
						$('.writerName').html(data.writer);
						$('.content').html(data.contents);
						$('.writeDate').html(data.writeDate);
						$('.hit').html(data.hit);
						$('input[name=boardNumber]').val(data.boardNumber);
						$('input[name=writer]').val(data.writer);
					});
					$('.btn-modify').hide();
					$('.btn-delete').hide();
					$('.completeModify').show();
					$('.cancelModify').show();
                  })
			})
			
			$('.completeModify').on('click',function(){
				$('form[name=modifyFrm]').submit();
				alert('수정이 완료되었습니다.');
			})
			
			$('.btn-delete').on('click', function(){
				if(confirm('게시글을 삭제하시겠습니까?')){
					$('form[name=deleteFrm]').submit();
					alert('게시글 삭제가 완료되었습니다.');
				};
			})
			
			
			
		})
		</script>
		
</body>
</html>