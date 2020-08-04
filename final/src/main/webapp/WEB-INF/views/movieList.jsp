<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/simplex.css" rel="stylesheet">
</head>
<style>
body {
	box-sizing: border-box;
}
/* 스크롤바 가리기 */
/* ::-webkit-scrollbar {
        display: none;
    } */
ul {
	list-style: none;
}

a {
	text-decoration: none;
}

li:hover {
	cursor: pointer;
	color: #212529;
	background-color: rgba(0, 0, 0, 0.3);
}

li.selected {
	color: #212529;
	background-color: rgba(0, 0, 0, 0.3);
}

li.region {
	padding: 10px;
	margin: 0px auto;
	border-top: 1px solid gray;
}

li.theater {
	padding: 10px;
	margin: 0px auto;
	border-top: 1px solid gray;
}

li.movieTitle {
	padding: 20px;
	margin: 0px auto;
	border-top: 1px solid gray;
}

li.movieSchedule {
	padding: 15px;
	margin: 0px auto;
	border-bottom: 1px solid gray;
}

li.date {
	padding: 8px;
	margin: 0 auto;
	border-top: 1px solid gray;
}
</style>

<body>
	<!-- navbar start -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor02" aria-controls="navbarColor02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- navbar end -->
	<header>

		<h1 style="text-align: center; margin: 40px;">좌석선택</h1>

	</header>
	<!-- reservationBox -->
	<form name="reservationFrm" action="/seatList" method="GET">
		<input type="hidden" name="selectedMovie" value="" id="selectedMovie">
		<input type="hidden" name="selectedDate" value="${today }"
			id="selectedDate"> <input type="hidden"
			name="selectedTheaterNumber" value="" id="selectedTheaterNumber">
		<input type="hidden" name="selectedStartTime" value=""
			id="selectedStartTime"> <input type="hidden"
			name="selectedEndTime" value="" id="selectedEndTime">

		<div class="reservationBox"
			style="margin: 0 auto; width: 900px; height: 490px; border: 5px solid black;">


			<!-- regionBox -->
			<div id="regionBox" style="float: left; width: 220px;">
				<div style="border: 1px solid black; width: 220px;">
					<h1 style="text-align: center;">지역별</h1>
				</div>
				<div class="regionList">
					<div
						style="border-right: 1px solid black; overflow: hidden; height: 432px; float: left; width: 98px; overflow-y: scroll; -ms-overflow-style: none;">
						<ul style="margin: 0px; padding: 0px;">
							<li class="region"><b>서울</b></li>
							<li class="region"><b>경기</b></li>
							<li class="region"><b>인천</b></li>
							<li class="region"><b>대구</b></li>
							<li class="region"><b>울산</b></li>
							<li class="region"><b>부산</b></li>
							<li class="region"><b>서울</b></li>
							<li class="region"><b>경기</b></li>
							<li class="region"><b>인천</b></li>
							<li class="region"><b>대구</b></li>
							<li class="region"><b>울산</b></li>
							<li class="region"><b>부산</b></li>
						</ul>
					</div>
					<div
						style="border-right: 1px solid black; overflow: hidden; width: 122px; height: 432px; float: left; overflow-y: scroll;">
						<ul style="margin: 0px; padding: 0px;">
							<li class="theater"><b>1호점</b></li>
							<li class="theater"><b>2호점</b></li>
							<li class="theater"><b>3호</b></li>
							<li class="theater"><b>4호</b></li>
							<li class="theater"><b>5호</b></li>
							<li class="theater"><b>6호</b></li>
							<li class="theater"><b>7호</b></li>
							<li class="theater"><b>8호</b></li>
							<li class="theater"><b>인천</b></li>
							<li class="theater"><b>대구</b></li>
							<li class="theater"><b>울산</b></li>
							<li class="theater"><b>부산</b></li>

						</ul>
					</div>
				</div>
			</div>
			<!-- regionBox end -->

			<!-- movieBox -->

			<div id="movieBox" style="float: left;">
				<div style="border: 1px solid black; width: 218px;">
					<h1 style="text-align: center;">영화목록</h1>
				</div>
				<div class="movieList">
					<div
						style="border-right: 1px solid black; overflow: hidden; width: 218px; height: 432px; float: left; overflow-y: scroll;">
						<ul style="margin: 0px; padding: 0px;">
							<c:forEach items="${movieList}" var="movie" varStatus="stat">
								<li class="movieTitle">${movie.movieName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<!-- movieBox end -->

			<!-- dateBox -->
			<div id="dateBox" style="float: left;">
				<div style="border: 1px solid black; width: 96px;">
					<h1 style="text-align: center;">날짜</h1>
				</div>
				<div
					style="border-right: 1px solid black; overflow: hidden; width: 96px; height: 432px; float: left; overflow-y: scroll;">
					<ul style="margin: 0px; padding: 0px;">
						<c:forEach var="date" items="${dateList }">
							<li class="date"><span class="year"
								style="visibility: hidden; font-size: 0%;">${date.year }</span>
								<span class="month">${date.month }</span>/ <span class="day">${date.day }</span>
								(${date.dayOfWeek })</li>
						</c:forEach>
					</ul>

				</div>
			</div>
			<!-- dateBox end -->

			<!-- timeTableBox -->
			<div id="timeTableBox" style="float: left;">
				<div style="border: 1px solid black; width: 356px;">
					<h1 style="text-align: center;">상영시간표</h1>
				</div>
				<div
					style="border-right: 1px solid black; overflow: hidden; width: 356px; height: 432px; float: left; overflow-y: scroll;">
					<ul style="margin: 0px; padding: 0px;">
						<c:forEach items="${scheduleList }" var="schedule">
							<li class="movieSchedule"><span
								style="font-weight: bold; font-size: 160%">${schedule.movieName }</span>
								<span style="float: right; font-size: 110%"><span
									class="startTime">${schedule.startTime }</span> ~ <span
									class="endTime">${schedule.endTime }</span></span> <span
								style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span
									class="theaterNumber">${schedule.theaterNumber }</span>관</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- timeTableBox end -->
		</div>
		<!-- reservationBox end -->
	</form>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {

			$("#selectedMovie").val();
			var reservationFrm = $("form[name=reservationFrm]");

			//-----------------------------------------------------
			
			var scheduleByName = function(){
				
			}

			$(".movieTitle").on("click", function(e) { //영화 제목 누르면 그에 맞는 DB상의 상영시간표 나오게 함.
				alert('영화제목 클릭함');
				$("#selectedMovie").val($(this).html());
				$(".movieTitle").removeClass("selected");
				$(this).addClass("selected");
				
				//console.log($("#selectedMovie").val());
				console.log("선택 영화: " + $("#selectedMovie").val());

			});

			$(".date").on("click", function(e) {
				alert('날짜 클릭함');
				var year = $(this).children(".year").html();
				var month = $(this).children(".month").html();
				var day = $(this).children(".day").html();
				$(".date").removeClass("selected");
				$(this).addClass("selected");
				//console.log(year);
				//console.log(month);
				//console.log(day);
				if (month < 10) {
					$("#selectedDate").val(year + "0" + month + day);
				} else {
					$("#selectedDate").val(year + month + day);
				}
				console.log("선택 날짜: " + $("#selectedDate").val());
			});

			$(".movieSchedule").on("click", function(e) {
				alert('스케쥴 클릭함');
				var theaterNumber = $(this).find(".theaterNumber").html();
				var startTime = $(this).find(".startTime").html();
				var endTime = $(this).find(".endTime").html();
				$(".movieSchedule").removeClass("selected");
				$(this).addClass("selected");

				$("#selectedTheaterNumber").val(theaterNumber);
				$("#selectedStartTime").val(startTime);
				$("#selectedEndTime").val(endTime);

				console.log("선택 영화: " + $("#selectedMovie").val());
				console.log("선택 상영관: " + $("#selectedTheaterNumber").val());
				console.log("선택 상영시작시간: " + $("#selectedStartTime").val());
				console.log("선택 상영끝시간: " + $("#selectedEndTime").val());
				if (confirm('선택하신 영화와 시간으로 예매를 진행하시겠습니까?')) {
					//reservationFrm.submit();
				}
			});

		}); //end $(document).ready
	</script>














</body>

</html>