<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%@ include file="../board/header.jsp"%>
	<div class="boardContainer">

		<h4 style="font-weight: 600; margin-top: 100px;">게시글 목록</h4>
		<hr color="black">
		<div class="contents">
			<table class="table table-hover" style="padding-bottom: 0px;">
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
				<tbody class="boardList">
					<%-- <c:forEach var="board" items="${boards }">
						<tr style="margin-bottom: 0px;">
							<td class="boardNumberInList">${board.boardNumber }</td>
							<td>${board.category }</td>
							<td class="boardTitleInList">${board.title }</td>
							<td class="writerInList">${board.writer }</td>
							<td>${board.writeDate }</td>
							<td>${board.hit }</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		<button class="registButton btn btn-info">게시글 작성</button>
		<hr color="lightgray">
	</div>
	<%@ include file="../board/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			
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
			
			$(".registButton").on("click",function(){
				alert('게시글 작성!');
				$(".contents").load("/board/write #writeFrm");
				$(this).hide();
		    	$('h4').html('게시글 작성');
			})
			
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
                      //alert('게시글 읽기 성공.');
                      //alert(data.boardNumber);
                  })
			})
			
			$('.contents').on('click','.writerInList', function(){
				var requestUrl = "http://localhost:8080/board/boardList/"+$(this).parent().find('.writerInList').html()+".json";
				window.location.href = "http://localhost:8080/board/boardList/"+$(this).html();
			})
			
			
			
			
		})
		/* $.ajax({
					url:"/board/write.do",
					type:"post",
					contentType:'application/json;charset=utf-8',
					headers: { "Content-Type": "application/json" },
					data: JSON.stringify({
                  	  writer : "userId",
                  	  category : "분류",
                  	  title : $('input[name=title]').val(),
                  	  content : $('input[name=content]').val()
                    }),
					success: function(){
						alert('게시글 등록 성공!');
					}
				}) */
		</script>
		
</body>
</html>