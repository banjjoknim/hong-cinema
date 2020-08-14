<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/simplex.css" rel="stylesheet">
    <style>
        .form-group {
            margin-left: 50px;
        }

        tr {
            border: 1px solid darkgray;
        }

        table {
            border-collapse: collapse;
            border: 1px solid darkgray;
            margin: 0 auto;
        }

        td {
            padding: 20px;
            border-right: 1px solid darkgray;
        }
    </style>
</head>

<body>

    <!-- navbar start -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <!-- navbar end -->

    <header>

        <!-- <h1 style="text-align: center; margin: 40px; font-size: 300%;">결제정보</h1> -->

    </header>

    <!-- paymentBox start -->
    <div class="paymentBox" style="margin: 0 auto; width: 900px;">

        <!-- form start -->
        <h3 style="font-size: 250%; margin-top: 150px; margin-left: 50px;">예매정보</h3>

        <div class="form-group" style="border-top: 1px solid darkgrey;">
            <fieldset style="margin: 0px auto; width: 700px; padding: 30px 0;">
                <img src="https://via.placeholder.com/240x320.png" style="float: left;">

                <div class="form-group row"
                    style="float: left; width: 460px; padding: 10px 20px 15px 80px; margin: 0; font-size: 200%; font-weight: bold;">
                    <span style="font-weight: bold;">${movie.selectedMovie }</span>
                </div>

                <div class="form-group row"
                    style="float: left; width: 460px; padding: 10px 20px 15px 80px; margin: 0; font-size: 135%;">
                    <span style="font-weight: bold;">가산시네마</span>
                </div>

                <div class="form-group row"
                    style="float: left; width: 460px; padding: 10px 20px 15px 80px; margin: 0; font-size: 135%;">
                    <span style="font-weight: bold;">상영관 : ${movie.selectedTheaterNumber }관<br> 
                    상영시간 : ${movie.selectedStartTime } ~ ${movie.selectedEndTime }</span>
                </div>

                <div class="form-group row"
                    style="float: left; width: 460px; padding: 10px 20px 15px 80px; margin: 0; font-size: 135%;">
                    <span style="font-weight: bold;">인원 수 : 총 ${seatReservation.totalPeople }명<br>
                    (성인 ${seatReservation.adultType }명/청소년 ${seatReservation.youthType }명/우대 ${seatReservation.preferentialType }명)</span>
                </div>

                <div class="form-group row"
                    style="float: left; width: 460px; padding: 10px 20px 15px 80px; margin: 0; font-size: 135%;">
                    <span style="font-weight: bold;">선택좌석 : 
                    <c:forEach items="${seatReservation.selectedSeatList }" var="seat" varStatus="status">
                    <c:choose>
                    <c:when test="${status.last }">${seat }</c:when>
                    <c:otherwise>${seat }, </c:otherwise>
                    </c:choose>
                    </c:forEach></span>
                </div>

            </fieldset>
        </div>




        <!-- customer start -->
            <div style="float: left; width: 340px; padding: 20px;">
                <h3 style="font-size: 200%; margin-top: 30px; margin-left: 50px;">구매자정보</h3>

                <div class="form-group row"
                    style="border-top: 1px solid darkgrey; margin-bottom: 0; padding: 5px 10px;">
                    <label for="staticEmail" class="col-form-label"
                        style="width: 80px; padding: 10px; float: left;">이름</label>
                    <div style="float: left;">
                        <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                            readonly="" style="width: 150px; margin-top: 3px;">
                    </div>
                </div>

                <div class="form-group row"
                    style="border-top: 1px solid darkgrey; margin-bottom: 0; padding: 5px 10px;">
                    <label for="staticEmail" class="col-form-label"
                        style="width: 80px; padding: 10px; float: left;">연락처</label>
                    <div style="float: left;">
                        <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                            readonly="" style="width: 150px; margin-top: 3px;">
                    </div>
                </div>

                <div class="form-group row"
                    style="border-bottom: 1px solid darkgrey; border-top: 1px solid darkgrey; margin-bottom: 0; padding: 5px 10px;">
                    <label for="staticEmail" class="col-form-label"
                        style="width: 80px; padding: 10px; float: left;">이메일</label>
                    <div style="float: left;">
                        <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                            readonly="" style="width: 150px; margin-top: 3px;">
                    </div>
                </div>

                <div class="form-group row"
                    style="border-bottom: 1px solid darkgrey; border-top: 1px solid darkgrey; margin-bottom: 0; padding: 5px 10px;">
                    <label for="staticEmail" class="col-form-label"
                        style="width: 80px; padding: 10px; float: left;">추가내용1</label>
                    <div style="float: left;">
                        <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                            readonly="" style="width: 150px; margin-top: 3px;">
                    </div>
                </div>

                <div class="form-group row"
                    style="border-bottom: 1px solid darkgrey; border-top: 1px solid darkgrey; margin-bottom: 0; padding: 5px 10px;">
                    <label for="staticEmail" class="col-form-label"
                        style="width: 80px; padding: 10px; float: left;">추가내용2</label>
                    <div style="float: left;">
                        <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                            readonly="" style="width: 150px; margin-top: 3px;">
                    </div>
                </div>

            </div>
            <!-- customer end -->

            <!-- payment way start -->
            <div style="float: left; width: 540px; padding: 20px;">
                <h3 style="font-size: 200%; margin-top: 30px; margin-left: 10px; ">결제수단</h3>

                <legend></legend>
                <table style="width: 540px;">
                    <tr>
                        <td style="width: 100px;">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optionsRadios"
                                        id="optionsRadios1" value="option1" checked=""
                                        style="width: 15px; height: 15px;">
                                    <span style="font-size: 120%;">카드</span>
                                </label>
                            </div>
                        </td>
                        <td style="width: 100px;">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optionsRadios"
                                        id="optionsRadios2" value="option2" style="width: 15px; height: 15px;">
                                    <span style="font-size: 120%;">계좌이체</span>
                                </label>
                            </div>
                        </td>
                        <td style="width: 100px;">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optionsRadios"
                                        id="optionsRadios3" value="option3" style="width: 15px; height: 15px;">
                                    <span style="font-size: 120%;">휴대폰 결제</span>
                                </label>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="3" style="font-size: 150%;">
                            <div style="width: 40%; float: left; margin-left: 20px;">
                                여기는 카드 또는 은행 선택영역 카드 은행 그림.
                            </div>
                            <div style="width: 40%; float: left; margin-left: 40px;">
                                <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                                    readonly="" style="width: 200px; margin-top: 3px;">
                                <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                                    readonly="" style="width: 200px; margin-top: 3px;">
                                <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                                    readonly="" style="width: 200px; margin-top: 3px;">
                                <input class="form-control" id="readOnlyInput" type="text" placeholder="naver@naver.com"
                                    readonly="" style="width: 200px; margin-top: 3px;">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- payment way end -->

        <!-- form end -->
    </div>
    <!-- paymentBox end -->
        <!-- decision button start -->
        <div style="clear: both; margin: 0 auto; width: 280px;">
        <button type="button" class="btn btn-info" id="pay"
            style="padding: 15px 25px; font-size: 150%;">결제하기</button>
        <button type="button" class="btn btn-primary" id="cancel"
            style="padding: 15px 25px; font-size: 150%;">취소</button>
        </div>
        <!-- decision button end -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			
			var timeoutCancel = setTimeout(function(){
				reservationCancel();
			}, 1000*5 // 5초 후에 예약취소.
			);			
			
			var reservationCancel = function(){
			
				$.ajax({
					url: "/reservationCancel",
					type: "get",
					success: function(){
						alert("결제를 취소하셨습니다.");
						window.location.replace("http://localhost:8080/movieList");
					}
				});
			}
			
			$("#cancel").on("click", function(){
				reservationCancel();
			});
			
			$("#pay").on("click", function(){
					
			});
			
			
			
			
			
			
		});
		//$(document).ready(function(){ end
		</script>
</body>

</html>