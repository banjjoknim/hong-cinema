<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/admin_page.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 20px;
}

.select_img img {margin:20px 0;}


.dropbtn {
    background-color: #00000;
    color: black;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}
.dropdown {
    position: relative;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {
    background-color: #f1f1f1;
}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown:hover .dropbtn {
    background-color: #f1f1f1;
    color:red;
}
</style>

<title>관리자 페이지</title>
</head>

<body>
	<%@ include file="../board/header.jsp"%>
	<div class="container">
	
	
		<!--  <ol class="breadcrumb" style="vertical-align: middle;">
			<li style="margin: 10px 0 -20px 10px; padding-bottom: -60px"
				class="breadcrumb-item active"><a href="admin_mov">영화 관리</a></li>
			<li style="margin: 10px 0 -20px -128px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="admin_res">예매 관리</a></li>
			<li style="margin: 10px 0 -20px -108px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="admin_shw">상영 관리</a></li>
			<li style="margin: 10px 0 -20px -108px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="admin_scr">상영관 관리</a></li>
			<li style="margin: 10px 0 -20px -88px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="#">매출 관리</a></li>
			<li style="margin: 10px 0 -20px -108px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="admin_mem">회원 관리</a></li>
		</ol> --> 
	
	
	
	<div class="dropdown">
      <button class="dropbtn">영화 관리</button>
      <div class="dropdown-content">
        <a href="admin_mov">영화 정보 등록</a>
        <a href="admin_movList">영화 정보 리스트</a>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropbtn">예매 관리</button>
      <div class="dropdown-content">
        <a href="admin_res">예매 정보 리스트</a>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropbtn">상영 관리</button>
      <div class="dropdown-content">
        <a href="admin_shw">상영 정보 등록</a>
        <a href="admin_shwList">상영 정보 리스트</a>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropbtn">상영관 관리</button>
      <div class="dropdown-content">
        <a href="admin_scr">상영관 정보 등록</a>
        <a href="admin_scrList">상영관 정보 리스트</a>
      </div>
    </div>
    <div class="dropdown">
      <button class="dropbtn">회원 관리</button>
      <div class="dropdown-content">
        <a href="adminSignup">회원 등록</a>
        <a href="admin_mem">회원 정보 리스트</a>
      </div>
    </div>

		<%--     <form action="/uploadFormAction" method="post" enctype="multipart/form-data">
        
        <input type='file' name='mov_Picture' multiple>
        <button>Submit</button>
        
        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
        </form> --%>
		
		
	<!-- <div class='uploadDiv'>
			<input type='file' name='mov_Picture' multiple>
		</div>

		<div class='uploadResult'>
			<ul>

			</ul>
		</div> -->


		<div class="container">
		<h4 style="font-weight: 600; margin-top: 100px;">영화 정보 등록</h4>
		<hr color="black">
		<form role="form" method='POST' action="/createMov">
				<fieldset>
					<div class="form-group row">
						<label for="movieName" class="col-sm-2 col-form-label">영화제목</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='movieName' id="movieName" class="form-control" multiple>
						</div>
					</div>
					
					<hr color="lightgray">
					<div class="form-group row">
						<label for="director" class="col-sm-2 col-form-label">감독</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='director' id="director" class="form-control" multiple>
						</div>
					</div>
					
					<hr color="lightgray">
					<div class="form-group row">
						<label for="openDate" class="col-sm-2 col-form-label">개봉일</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='openDate' id="openDate" class="form-control" multiple>
						</div>
					</div>
					
						<hr color="lightgray">
					<div class="form-group row">
						<label for="showtime" class="col-sm-2 col-form-label">상영시간</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='showTime' id="showTime" class="form-control" multiple>
						</div>
					</div>
					
						<hr color="lightgray">
					<div class="form-group row">
						<label for="nationName" class="col-sm-2 col-form-label">국가</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='nationName' id="nationName" class="form-control" multiple>
						</div>
					</div>
					
							<hr color="lightgray">
					<div class="form-group row">
						<label for="actors" class="col-sm-2 col-form-label">출연진</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='actors' id="actors" class="form-control" multiple>
						</div>
					</div>
					
					
					<hr color="lightgray">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label" >상영등급</label> 
						 <div class="col-sm-10">
						 <select class="form-control" style="width: 400px; height: 40px;" id="grade" name="grade">
							<option value="">선택해주세요</option>
							<option value="전체 관람가">전체 관람가</option>
							<option value="12세 이상 관람가">12세 이상 관람가</option>
							<option value="15세 이상 관람가">15세 이상 관람가</option>
							<option value="청소년 관람 불가">청소년 관람 불가</option>
						</select>
						</div>
					</div>
					
					
				
					<hr color="lightgray">
					<div class="form-group row">
						<label for="poster" class="col-sm-2 col-form-label">포스터등록</label>
						<div class="col-sm-10">
							<div class='uploadDiv'>
								<input type="file" name="poster" id="poster" multiple>
							
							<div class="select_img"><img src="" /></div>
							<script>
								$("#poster").change(function(){
   								if(this.files && this.files[0]) {
								var reader = new FileReader;
    							reader.onload = function(data) {
     							$(".select_img img").attr("src", data.target.result).width(250);        
    							}
								reader.readAsDataURL(this.files[0]);
   								}
  									});
 							</script>
						
							</div>

							<!-- <input style="width: 400px; height: 40px; display: block;"
								type="file" class="form-control" name="mov_Picture"> -->
							<!-- <input type="file" class="form-control-file" name="mov_Picture" id="exampleInputFile" aria-describedby="fileHelp">	 -->
						</div>
					</div>
					
					<hr color="lightgray">
					<div class="form-group row">
						<label for="intro" class="col-sm-2 col-form-label">줄거리</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="intro" id="intro" 
							rows="3" style="margin-top: 0px; margin-bottom: 0px; width: 500px; height: 100px;"></textarea>
						</div>
					</div>
					
					<hr color="lightgray">
					<div class="form-group row">
					<label for="genre" class="col-sm-2 col-form-label">영화장르</label>
					<div class="col-sm-10">
						 <input style="margin: 15px 5px 0 0;" id="genre"
							name="genre" type="checkbox" value="스포츠"><span
							style="font-size: medium; margin-right: 50px;">스포츠</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="범죄"><span
							style="font-size: medium; margin-right: 50px;">범죄</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="드라마"><span
							style="font-size: medium; margin-right: 50px;">드라마</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="코미디"><span
							style="font-size: medium; margin-right: 50px;">코미디</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="로맨스/멜로"><span
							style="font-size: medium;">로맨스/멜로</span> <br> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="스릴러"><span
							style="font-size: medium; margin-right: 50px;">스릴러</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="가족"><span
							style="font-size: medium; margin-right: 50px;">가족</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="공포"><span
							style="font-size: medium; margin-right: 65px;">공포</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="전쟁"><span
							style="font-size: medium; margin-right: 67px;">전쟁</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="로맨스/코미디"><span
							style="font-size: medium;">로맨스/코미디</span> <br> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="판타지"><span
							style="font-size: medium; margin-right: 50px;">판타지</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="액션"><span
							style="font-size: medium; margin-right: 50px;">액션</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="SF"><span
							style="font-size: medium; margin-right: 80px;">SF</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="애니메이션"><span
							style="font-size: medium; margin-right: 19px;">애니메이션</span> <input
							style="margin: 15px 5px 0 0;" id="genre" name="genre"
							type="checkbox"   value="다큐멘터리"><span
							style="font-size: medium;">다큐멘터리</span>

					</div>
				</div>
		
					<hr color="lightgray">

					<div align="center" class="buttonbox">
						<button type="submit" style="margin: 0 150px 0 200px;"
							class="btn btn-primary btn-lg" id="uploadBtn">영화등록</button>
						<button type="button" style="width: 100px;"
							class="btn btn-danger btn-lg" id="cancel">취소</button>
					</div>
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> 
				</form>
		</div>






		<!-- jQuery -->
		<script src="/resources/js/jquery-3.5.1.min.js"></script>
		<script>
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 52428800; //50MB
			var cloneObj = $(".uploadDiv").clone();
			var uploadResult = $(".uploadResult ul");

			$(document).ready(function() {

					function showUploadedFile(uploadResultArr) {

							var str = "";

							$(uploadResultArr).each(function(i, obj) {

										if (!obj.image) {
											str += "<li><img src='/resources/images/attach.png'>"
												+ obj.fileName
												+ "</li>";
											} else {
												//str += "<li>" + obj.fileName + "</li>";
												var fileCallPath = encodeURIComponent(obj.uploadPath
												+ "/s_"
												+ obj.uuid
												+ "_"
												+ obj.fileName);
												str += "<li><img src='/display?fileName="
												+ fileCallPath
												+ "'><li>";

											}
								});

									uploadResult.append(str);

								}

								function checkExtension(fileName, fileSize) {

									if (fileSize >= maxSize) {
										alert("파일 사이즈 초과");
										return false;
									}

									if (regex.test(fileName)) {
										alert("해당 종류의 파일은 업로드 할 수 없습니다.");
										return false;
									}
									return true;
								}

								$("#uploadBtn")
										.on(
												"click",
												function(e) {

													var formData = new FormData();

													var inputFile = $("input[name='poster']");

													var files = inputFile[0].files;

													console.log(files);

													 //add filedate to formdata
													for (var i = 0; i < files.length; i++) {

														if (!checkExtension(
																files[i].name,
																files[i].size)) {
															return false;
														}

														formData.append(
																"poster",
																files[i]);
													} 

													$.ajax({
																url : '/uploadAjaxAction',
																processData : false,
																contentType : false,
																beforeSend : function(xhr) {
																	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
																},
																data : formData,
																type : 'POST',
																dataType : 'json',
																success : function(result) {
																
																	console.log(result);

																	showUploadedFile(result); //업로드 결과 처리 함수 */

																	$(".uploadDiv").html(cloneObj.html());
																	
																	
																}
															}); //$.ajax

												});
							});
		</script>

	<script type="text/javascript">
		$(document).ready(function() {
							// 취소
		$("#cancel").on("click", function() {
			
			alert("영화 정보 등록이 취소되었습니다.");
			location.href = "/admin_mov";
				});
							
		$(".btn-primary").on("click",function() {
			
			if ($("#movieName").val() == "") {
				alert("영화 제목을 입력해주세요");
				$("#movieName").focus();
				return false;
			}
			
			if ($("#director").val() == "") {
				alert("감독을 입력해주세요");
				$("#director").focus();
				return false;
			}
			
			if ($("#openDate").val() == "") {
				alert("개봉일을 입력해주세요");
				$("#openDate").focus();
				return false;
			}
			
			if ($("#director").val() == "") {
				alert("개봉일을 입력해주세요");
				$("#director").focus();
				return false;
			}
			
			if ($("#showTime").val() == "") {
				alert("상영시간을 입력해주세요");
				$("#showTime").focus();
				return false;
			}
			
			if ($("#nationName").val() == "") {
				alert("국가를 입력해주세요");
				$("#nationName").focus();
				return false;
			}
			
			if ($("#nationName").val() == "") {
				alert("국가를 입력해주세요");
				$("#nationName").focus();
				return false;
			}
			
			if ($("#actors").val() == "") {
				alert("출연진을 입력해주세요");
				$("#actors").focus();
				return false;
			}
			
			if ($("#grade").val() == "") {
				alert("상영등급을 선택해주세요");
				$("#grade").focus();
				return false;
			}
			
			if ($("#actors").val() == "") {
				alert("출연진을 입력해주세요");
				$("#actors").focus();
				return false;
			}
			
			if ($("#intro").val() == "") {
				alert("줄거리를 입력해주세요");
				$("#intro").focus();
				return false;
			}
			
			
			var hobbyCheck = false;
			
			//관심장르 유효성 검사
			for (var i = 0; i < $('[name="genre"]').length; i++) {
				if ($(
						'input:checkbox[name="genre"]')
						.eq(i).is(
								":checked") == true) {
					hobbyCheck = true;
					break;
				}
			}

			if (!hobbyCheck) {
				alert("장르를 선택해주세요.");
				return false;
			}
			
			alert("영화 정보가 등록되었습니다.");
		
				});
		
		});
		
				
	</script>

	</div>


</body>

</html>