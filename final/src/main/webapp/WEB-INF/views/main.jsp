<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="board/header.jsp"%>

<html>
<head>
	<title>메인화면</title>

</head>
<body>


<div id="container">
	<div id="contents">
	<ol>
		<c:forEach items="${list}" var="list">
		<li>
		<div class="box-image">
			<strong class="rank">${list.ranks}</strong>
			<span class="thumb-image">
				<img src="${list.imgs}">
				<c:set var="name" value="${list.movieAges}" /> 
					<c:choose>
						<c:when test="${name eq '전체'}" >
							<span class="ico-grade grade-all"></span>
						</c:when>
						<c:otherwise>
							<span class="ico-grade grade-${list.movieAges}"></span>
						</c:otherwise>
					</c:choose>
			</span>
		</div>
		<div class="box-contents">
			<strong class="title">
				${list.movieTitles}
			</strong>
			<div class="score">
				<strong class="percent">
					예매율 <span>${list.movieRates}</span>
				</strong>
			</div>
			<span class="txt-info">
				<strong>${list.movieOpenDates}</strong>
			</span>
			<span class="like">
				<a class="link-reservation" >예매</a>
			</span>
		</div>
		</li>
		</c:forEach>
	</ol>
	</div>
</div>
<form name="startReservationFrm" action="/movieList" method="get">
<input type="hidden" name="selectedMovieCode" value="">
</form>
<%@ include file="board/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.link-reservation').on('click', function(){
		var movieName = $(this).parent().parent().find('.title').html().trim();
		$('input[name=selectedMovieCode]').val(movieName);
		console.log($('input[name=selectedMovieCode]').val());
		$('form[name=startReservationFrm]').submit();
	})
})
</script>

</body>
</html>
