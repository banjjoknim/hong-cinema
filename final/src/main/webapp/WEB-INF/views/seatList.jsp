<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/simplex.css" rel="stylesheet">
<style>
div.seatRow {
	position: relative;
}

div.seatRow button {
	cursor: pointer;
	background-color: lightgray;
	position: absolute;
	padding: 2px;
	width: 25px;
	height: 25px;
}

div.seatRow button:hover {
	background-color: crimson;
}

button {
	cursor: pointer;
}

div.seatRow button.represent {
	background-color: lightgray;
}

li.theaterInfo {
	margin-bottom: 10px;
}

button.selectedSeat {
	margin: 5px;
	float: left;
	width: 50px;
	height: 50px;
}

/* row button start */
button.row-A {
	top: 120px;
}

button.row-B {
	top: 150px;
}

button.row-C {
	top: 180px;
}

button.row-D {
	top: 210px;
}

button.row-E {
	top: 240px;
}

button.row-F {
	top: 270px;
}

button.row-G {
	top: 300px;
}

button.row-H {
	top: 330px;
}

button.row-I {
	top: 360px;
}

button.row-J {
	top: 390px;
}

button.row-K {
	top: 420px;
}

button.row-L {
	top: 450px;
}

/* col button start */
button.col-1 {
	left: 120px;
}

button.col-2 {
	left: 150px;
}

button.col-3 {
	left: 160px;
}

button.col-4 {
	left: 190px;
}

button.col-5 {
	left: 220px;
}

button.col-6 {
	left: 250px;
}

button.col-7 {
	left: 280px;
}

button.col-8 {
	left: 310px;
}

button.col-9 {
	left: 340px;
}

button.col-10 {
	left: 370px;
}

button.col-11 {
	left: 400px;
}

button.col-12 {
	left: 430px;
}

button.col-13 {
	left: 460px;
}

button.col-14 {
	left: 490px;
}

button.col-15 {
	left: 520px;
}

button.col-16 {
	left: 550px;
}

button.col-17 {
	left: 580px;
}

.movieInfo {
	color: white;
}

body {
	margin-bottom: 500px;
}

div.selectType button {
	outline: none;
	cursor: pointer;
	border: solid 1px gray;
}
div.seatRow button.selected{
background-color: crimson;
outline: none;
}

div.seatRow button.reserved{
cursor: default !important;
outline: none;
background-color: rgb(21,21,21) !important;
}

</style>
</head>

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
		<div class="selectType"
			style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 20px; border-bottom: 1px solid gray;">
			<h1 style="text-align: left;">좌석선택</h1>
		</div>
	</header>

	<!-- selectType start -->
	<div class="selectType"
		style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 50px;">
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">성인</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton adultCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType adultType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton adultCountUp">+</button>
		</div>
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">청소년</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton youthCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType youthType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton youthCountUp">+</button>
		</div>
		<!-- <div style="float: left; padding: 10px 5px;">
            <span style="float: left; margin-right: 10px;">어린이</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div> -->
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">우대</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton preferentialCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType preferentialType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton preferentialCountUp">+</button>
		</div>
	</div>
	<!-- selectType end -->

	<!-- reservationBox -->
	<form:form modelAttribute="SeatReservationVO" name="reservationFrm" action="/payment" method="post">
	<%-- <form name="seatFrm" action="/payment"> --%>
		<input type="hidden" name="adultType" value="0"> <input
			type="hidden" name="youthType" value="0"> <input type="hidden"
			name="preferentialType" value="0">
			<input type="hidden" name="totalPeople" value="0">
			<input type="hidden" name="payAmount" value="0">
			
	<%-- </form> --%>
	</form:form>
	<div class="reservationBox"
		style="margin: 0 auto; width: 900px; height: 555px;">




		<div class="seatRow"
			style="padding: 0 100px; width: 560px; height: 555px; background-color: rgb(80, 80, 80); float: left;">

			<h3 style="margin-left: 150px; color: white; margin-top: 30px;">SCREEN</h3>

			<!-- row A start -->

			<button type="button" class="row-A represent"
				style="border: 2px solid black; left: 20px;">A</button>
			<button type="button" class="row-A col-1 seat"
				style="border: 2px solid black;" value="A1">1</button>
			<button type="button" class="row-A col-2 seat"
				style="border: 2px solid black;" value="A2">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-A col-5 seat"
				style="border: 2px solid black;" value="A5">5</button>
			<button type="button" class="row-A col-6 seat"
				style="border: 2px solid black;" value="A6">6</button>
			<button type="button" class="row-A col-7 seat"
				style="border: 2px solid black;" value="A7">7</button>
			<button type="button" class="row-A col-8 seat"
				style="border: 2px solid black;" value="A8">8</button>
			<button type="button" class="row-A col-9 seat"
				style="border: 2px solid black;" value="A9">9</button>
			<button type="button" class="row-A col-10 seat"
				style="border: 2px solid black;" value="A10">10</button>
			<button type="button" class="row-A col-11 seat"
				style="border: 2px solid black;" value="A11">11</button>
			<button type="button" class="row-A col-12 seat"
				style="border: 2px solid black;" value="A12">12</button>
			<button type="button" class="row-A col-13 seat"
				style="border: 2px solid black;" value="A13">13</button>
			<button type="button" class="row-A col-14 seat"
				style="border: 2px solid black;" value="A14">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row A end -->

			<!-- row B start -->

			<button type="button" class="row-B represent"
				style="border: 2px solid black; left: 20px;">B</button>
			<button type="button" class="row-B col-1 seat"
				style="border: 2px solid black;" value="B1">1</button>
			<button type="button" class="row-B col-2 seat"
				style="border: 2px solid black;" value="B2">2</button>
			<!-- <button type="button" class="row-B col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-B col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-B col-5 seat"
				style="border: 2px solid black;" value="B5">5</button>
			<button type="button" class="row-B col-6 seat"
				style="border: 2px solid black;" value="B6">6</button>
			<button type="button" class="row-B col-7 seat"
				style="border: 2px solid black;" value="B7">7</button>
			<button type="button" class="row-B col-8 seat"
				style="border: 2px solid black;" value="B8">8</button>
			<button type="button" class="row-B col-9 seat"
				style="border: 2px solid black;" value="B9">9</button>
			<button type="button" class="row-B col-10 seat"
				style="border: 2px solid black;" value="B10">10</button>
			<button type="button" class="row-B col-11 seat"
				style="border: 2px solid black;" value="B11">11</button>
			<button type="button" class="row-B col-12 seat"
				style="border: 2px solid black;" value="B12">12</button>
			<button type="button" class="row-B col-13 seat"
				style="border: 2px solid black;" value="B13">13</button>
			<button type="button" class="row-B col-14 seat"
				style="border: 2px solid black;" value="B14">14</button>
			<!-- <button type="button" class="row-B col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-B col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-B col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row B end -->

			<!-- row C start -->

			<button type="button" class="row-C represent"
				style="border: 2px solid black; left: 20px;">C</button>
			<button type="button" class="row-C col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-C col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-C col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-C col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-C col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-C col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-C col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-C col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-C col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-C col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-C col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-C col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row C end -->

			<!-- row D start -->

			<button type="button" class="row-D represent"
				style="border: 2px solid black; left: 20px;">D</button>
			<button type="button" class="row-D col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-D col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-D col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-D col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-D col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-D col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-D col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-D col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-D col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-D col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-D col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-D col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row D end -->

			<!-- row E start -->

			<button type="button" class="row-E represent"
				style="border: 2px solid black; left: 20px;">E</button>
			<button type="button" class="row-E col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-E col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-E col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-E col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-E col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-E col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-E col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-E col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-E col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-E col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-E col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-E col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row E end -->

			<!-- row F start -->

			<!-- <button type="button" class="row-F represent" style=" border: 2px solid black; left: 20px;">F</button>
            <button type="button" class="row-F col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-F col-2" style=" border: 2px solid black;">2</button> -->
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<!-- <button type="button" class="row-F col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-F col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-F col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-F col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-F col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-F col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-F col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-F col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-F col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-F col-14" style=" border: 2px solid black;">14</button> -->
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row F end -->

			<!-- row G start -->

			<!-- <button type="button" class="row-G represent" style=" border: 2px solid black; left: 20px;">G</button>
            <button type="button" class="row-G col-1" style=" border: 2px solid black;">1</button>
            <button type="button" class="row-G col-2" style=" border: 2px solid black;">2</button> -->
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<!-- <button type="button" class="row-G col-5" style=" border: 2px solid black;">5</button>
            <button type="button" class="row-G col-6" style=" border: 2px solid black;">6</button>
            <button type="button" class="row-G col-7" style=" border: 2px solid black;">7</button>
            <button type="button" class="row-G col-8" style=" border: 2px solid black;">8</button>
            <button type="button" class="row-G col-9" style=" border: 2px solid black;">9</button>
            <button type="button" class="row-G col-10" style=" border: 2px solid black;">10</button>
            <button type="button" class="row-G col-11" style=" border: 2px solid black;">11</button>
            <button type="button" class="row-G col-12" style=" border: 2px solid black;">12</button>
            <button type="button" class="row-G col-13" style=" border: 2px solid black;">13</button>
            <button type="button" class="row-G col-14" style=" border: 2px solid black;">14</button> -->
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row G end -->

			<!-- row H start -->

			<button type="button" class="row-H represent"
				style="border: 2px solid black; left: 20px;">H</button>
			<button type="button" class="row-H col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-H col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-H col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-H col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-H col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-H col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-H col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-H col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-H col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-H col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-H col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-H col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row H end -->

			<!-- row I start -->

			<button type="button" class="row-I represent"
				style="border: 2px solid black; left: 20px;">I</button>
			<button type="button" class="row-I col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-I col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-I col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-I col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-I col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-I col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-I col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-I col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-I col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-I col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-I col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-I col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row I end -->

			<!-- row J start -->

			<button type="button" class="row-J represent"
				style="border: 2px solid black; left: 20px;">J</button>
			<button type="button" class="row-J col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-J col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-J col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-J col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-J col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-J col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-J col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-J col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-J col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-J col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-J col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-J col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row J end -->

			<!-- row K start -->

			<button type="button" class="row-K represent"
				style="border: 2px solid black; left: 20px;">K</button>
			<button type="button" class="row-K col-1"
				style="border: 2px solid black;">1</button>
			<button type="button" class="row-K col-2"
				style="border: 2px solid black;">2</button>
			<!-- <button type="button" class="row-A col-3" style=" border: 2px solid black;">3</button>
            <button type="button" class="row-A col-4" style=" border: 2px solid black;">4</button> -->
			<button type="button" class="row-K col-5"
				style="border: 2px solid black;">5</button>
			<button type="button" class="row-K col-6"
				style="border: 2px solid black;">6</button>
			<button type="button" class="row-K col-7"
				style="border: 2px solid black;">7</button>
			<button type="button" class="row-K col-8"
				style="border: 2px solid black;">8</button>
			<button type="button" class="row-K col-9"
				style="border: 2px solid black;">9</button>
			<button type="button" class="row-K col-10"
				style="border: 2px solid black;">10</button>
			<button type="button" class="row-K col-11"
				style="border: 2px solid black;">11</button>
			<button type="button" class="row-K col-12"
				style="border: 2px solid black;">12</button>
			<button type="button" class="row-K col-13"
				style="border: 2px solid black;">13</button>
			<button type="button" class="row-K col-14"
				style="border: 2px solid black;">14</button>
			<!-- <button type="button" class="row-A col-15" style=" border: 2px solid black;">15</button>
            <button type="button" class="row-A col-16" style=" border: 2px solid black;">16</button>
            <button type="button" class="row-A col-17" style=" border: 2px solid black;">17</button> -->

			<!-- row K end -->

		</div>

		<div class="infoBox"
			style="background-color: rgb(51, 51, 51); width: 328px; height: 555px; float: left; margin-left: 10px; padding-top: 30px;">
			<div class="movieInfo">

				<div style="margin: 5px; padding: 0 30px; margin-bottom: 10px;">
					<div style="width: 250px; border-bottom: 1px solid darkgrey;">
						<h3>${schedule.selectedMovie }</h3>
					</div>
				</div>

				<div
					style="float: left; width: 328px; padding: 0 30px; margin-top: 10px;">
					<div
						style="width: 250px; height: 140px; border-bottom: 1px solid darkgrey; margin-left: 6px;">
						<ul
							style="list-style: none; float: left; margin-right: 15px; margin-left: 10px; padding: 10px 20px;">
							<li class="theaterInfo">가산시네마</li>
							<li class="theaterInfo">${schedule.selectedTheaterNumber }관</li>
							<li class="theaterInfo">${schedule.selectedDate.substring(4, 6) }.${schedule.selectedDate.substring(6, 8) } (${dayOfWeek })</li>
							<li class="theaterInfo">${schedule.selectedStartTime }~
								${schedule.selectedEndTime }</li>
						</ul>
						<img src="https://via.placeholder.com/90x120.png" width="90px"
							height="120px" style="margin-bottom: 0px; float: left;">
					</div>
				</div>

				<div>

					<h3 style="margin-left: 35px;">선택좌석</h3>
					<div
						style="width: 250px; height: 120px; margin: 0 auto; border-bottom: 1px solid darkgrey; padding: 0 10px;">
						<ul style="list-style: none; padding: 0px 15px;" id="selectedSeatList">
							<!-- <li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">A13</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">A7</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">B10</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">B8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; clear: both; border: none;">F8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F12</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F12</button></li> -->
						</ul>
					</div>
				</div>
				<div>
					<div style="float: left; margin-top: 25px; padding: 0 30px;">
						성인 <span class="adultType">0</span> 명 청소년 <span class="youthType">0</span>
						명 우대 <span class="preferentialType">0</span> 명
					</div>
					<div
						style="clear: both; padding: 0 30px; margin-top: 20px; font-size: 140%;">
						최종 결제금액 <span style="float: right;">원</span> <span
							style="float: right; color: cadetblue; font-size: 120%;"
							class="payment">0</span>
					</div>
				</div>
				<div class="buttonBox"
					style="text-align: center; clear: both; margin-top: 25px;">
					<button type="button" class="payBtn"
						style="width: 164px; height: 55px; float: left; z-index: 999; background-color: #029ACF; outline: none; border: none; color: white; font-size: 150%;">결제</button>
					<button type="button" class="cancelBtn"
						style="width: 164px; height: 55px; float: left; z-index: 999; background-color: rgb(120, 120, 120); outline: none; border: none; color: white; font-size: 150%;">취소</button>
				</div>
			</div>

		</div>

	</div>
	<!-- reservationBox end -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {

					var reservationFrm = $("form[name=reservationFrm]");
					
					var selectedSeat = [];

					var adultNumber = $(".adultType").html();
					var adultCount = Number(adultNumber);
					var youthNumber = $(".youthType").html();
					var youthCount = Number(youthNumber);
					var preferentialNumber = $(".preferentialType").html();
					var preferentialCount = Number(preferentialNumber);
					
					console.log("총 좌석 수 : "+$(".seat").length);
					console.log("예약된 좌석 수 : "+$(".reserved").length);
					console.log($(".seat").eq(0).val());

					//---------------버튼 누를시 고객타입 숫자 변경-------------------------
					$(".adultCountUp").on("click", function() {
						var totalCount = adultCount + youthCount + preferentialCount;
						if(totalCount < 8){
						adultCount = adultCount + 1;
						$(".adultType").html(adultCount);
						$("input[name=adultType]").val(adultCount);
						//console.log(adultCount);
						console.log($("input[name=adultType]").val());
						} else {
							alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
						}
					});
					$(".adultCountDown").on("click", function() {
						if (adultCount > 0) {
							adultCount = adultCount - 1;
						}
						$(".adultType").html(adultCount);
						$("input[name=adultType]").val(adultCount);
						//console.log(adultCount);
					});
					$(".youthCountUp").on("click", function() {
						var totalCount = adultCount + youthCount + preferentialCount;
						if(totalCount < 8){
						youthCount = youthCount + 1;
						$(".youthType").html(youthCount);
						$("input[name=youthType]").val(youthCount);
						//console.log(youthCount);
						} else {
							alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
						}
					});
					$(".youthCountDown").on("click", function() {
						if (youthCount > 0) {
							youthCount = youthCount - 1;
						}
						$(".youthType").html(youthCount);
						$("input[name=youthType]").val(youthCount);
						//console.log(youthCount);
					});
					$(".preferentialCountUp").on("click", function() {
						var totalCount = adultCount + youthCount + preferentialCount;
						if(totalCount < 8){
								preferentialCount = preferentialCount + 1;
								$(".preferentialType").html(preferentialCount);
								$("input[name=preferentialType]").val(
										preferentialCount);
								//console.log(preferentialCount);
						} else {
							alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
						}
							});
					$(".preferentialCountDown").on(
							"click",
							function() {
								if (preferentialCount > 0) {
									preferentialCount = preferentialCount - 1;
								}
								$(".preferentialType").html(preferentialCount);
								$("input[name=preferentialType]").val(
										preferentialCount);
								//console.log(preferentialCount);
							});
					//---------------버튼 누를시 고객타입 숫자 변경-------------------------

					//-------------------버튼 누를시 구매창 금액 및 인원 변경-----------------
					$(".countButton").on(
							"click",
							function() {
								var payment = $(".payment").html(
										adultCount * 8000 + youthCount * 5000 + preferentialCount * 0);
								console.log(payment);
							});
					//-------------------버튼 누를시 구매창 금액 및 인원 변경-----------------

					//-------------------결제 버튼----------------------

					$(".payBtn").on("click", function() {
						var totalCount = adultCount + youthCount + preferentialCount;
						$("input[name=totalPeople]").val(totalCount);
						$("input[name=payAmount]").val($(".payment").html());
						console.log($("input[name=totalPeople]").val());
						console.log($("input[name=payAmount]").val()+"원");
						if(totalCount == 0){
							alert("인원 수를 선택해주세요.");
						}
						if (totalCount != 0 && confirm("선택하신 좌석으로 예매를 진행하시겠습니까?")) {
							if(selectedSeat.length != totalCount){
								alert("인원수만큼 좌석을 선택해주세요.");
								$("input[name=selectedSeatList]").remove();
								return;
							}
							for(var i = 0; i<selectedSeat.length; i++){
							var str = "";
							str += '<input type="hidden" name="selectedSeatList" value="'+selectedSeat[i]+'">';
							reservationFrm.append(str);
							console.log("선택좌석은 "+$("input[name=selectedSeatList]").eq(i).val()+" 입니다.");
							}
							reservationFrm.submit();
						} else {
							$("input[name=selectedSeatList]").remove();
						}
					});
					
					//-------------------결제 버튼----------------------
					
					//-----------------좌석 클릭하면 오른쪽 목록에 나오게 하기------------
					
					$(".seatRow").find("button").on("click", function(){
						var totalCount = adultCount + youthCount + preferentialCount;
						var selectedSeatList = $("#selectedSeatList");
						
						if($(this).hasClass("reserved")){
							event.preventDefault();
							alert("이미 예매된 좌석입니다.");
							return;
						}
						
						
						if(totalCount == 0){
							event.preventDefault();
							alert("인원 수를 선택해주세요.");
						} else {
							
							console.log("총 예매 좌석 수 : "+totalCount);
							
							if(selectedSeat.length<totalCount){
								
									console.log("누른 버튼 : " + $(this));
									
									if($(this).hasClass("selected")){
										$(this).removeClass("selected");
										$(this).html($(this).val().substring(1));
										for(var i = 0; i<selectedSeat.length; i++){
											if(selectedSeat[i] === $(this).val()){
												selectedSeat.splice(i,1);
											}
										}
										var str = "";
										for(var i = 0; i<selectedSeat.length; i++){
										str += '<li class="finalSeat"><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
											+selectedSeat[i]+'</button></li>';
										}
										selectedSeatList.html(str);
										
										console.log("선택된 좌석 수 : "+selectedSeat.length);
									} else {
									$(this).addClass("selected");
										$(this).html("");
										selectedSeat.push($(this).val());
										
										var str = "";
										for(var i = 0; i<selectedSeat.length; i++){
										str += '<li class="finalSeat"><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
											+selectedSeat[i]+'</button></li>';
										}
										
										selectedSeatList.html(str);
										console.log("선택된 좌석 수 : "+selectedSeat.length);
									}                                                                                          
									
								} else {
									
									if($(this).hasClass("selected")){
										$(this).removeClass("selected");
										$(this).html($(this).val().substring(1));
										for(var i = 0; i<selectedSeat.length; i++){
											if(selectedSeat[i] === $(this).val()){
												selectedSeat.splice(i,1);
											}
										}
										var str = "";
										for(var i = 0; i<selectedSeat.length; i++){
										str += '<li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
											+selectedSeat[i]+'</button></li>';
										}
										selectedSeatList.html(str);
										
										console.log("선택된 좌석 수 : "+selectedSeat.length);
									} else {
										event.preventDefault();
										alert("최대 인원수만큼 좌석을 선택하셨습니다.");
									}
								}
						
					}
						
						
						
					});
					
					//-----------------좌석 클릭하면 오른쪽 목록에 나오게 하기------------
					
					//-----------------오른쪽 목록에 좌석버튼 클릭하면 없애기-----------------
					$(document).on("click",".selectedSeat", function(){
						//alert($(this));
						var selectedSeatList = $("#selectedSeatList");
					
					for(var i = 0; i<selectedSeat.length; i++){
						
						for(var j = 0; j<$(".seat").length; j++){
							if($(this).val() === $(".seat").eq(j).val()){
								$(".seat").eq(j).removeClass("selected");
								$(".seat").eq(j).html($(this).val().substring(1));
								console.log("목록에서 취소한 좌석 : "+$(".seat").eq(j).val());
							}
						}
						
						if(selectedSeat[i] === $(this).val()){
							selectedSeat.splice(i,1);
							
							console.log("취소한 좌석 번호 : "+$(this).val());
						}
					}
						
					var str = "";
					for(var i = 0; i<selectedSeat.length; i++){
					str += '<li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
						+selectedSeat[i]+'</button></li>';
					}
					
					selectedSeatList.html(str); 
					});
					
					//-----------------오른쪽 목록에 좌석 클릭하면 없애기-----------------
					
					//-----------------DB반영된 좌석표 출력--------------------------
				
				
					var getEnabledSeatList = function(scheduleCode, callback){
						
						$.ajax({
							url: "/getEnabledSeatList/"+scheduleCode+".json",
							type: "get",
							dataType: "json",
							success: function(data){
								callback(data);
							}
						});
					};
				
					 getEnabledSeatList(1, function(list){
						for(var i = 0; i<list.length; i++){
							for(var j = 0; j<$(".seat").length; j++){
								if(list[i].seat === $(".seat").eq(j).val()){
									$(".seat").eq(j).addClass("reserved");
									$(".seat").eq(j).html("");
									console.log("예매처리된 좌석 : "+$(".seat").eq(j).val());
								}
							}
						}
					});
				
				
				
				    //------------------------------------------------------------
					

				});
	</script>




</body>

</html>