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
		<h4 style="font-weight: 600; margin-top: 100px;">포스터 수정</h4>
		<hr color="black">
		<form role="form" method='POST' action="/posterUpdate">
				<fieldset>
				<input type="hidden" name="movieCode"
				value="${mo.movieCode}" />
					<hr color="lightgray">
					<div class="form-group row">
						<label for="poster" class="col-sm-2 col-form-label">포스터수정</label>
						<div class="col-sm-10">
							<div class='uploadDiv'>
								<input type="file" name="poster"  id="poster" multiple>
							
							<div class="select_img"><img width="250" src='/resources/upload/${mo.poster}' /></div>
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

					<div align="center" class="buttonbox">
						<button type="submit" style="margin: 0 150px 0 200px;"
							class="btn btn-primary btn-lg" id="uploadBtn">포스터 수정</button>
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

								$("#uploadBtn").on("click", function(e) {

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
			alert("영화 정보 수정이 취소 되었습니다.");
			
			location.href = "/admin_movList";
				});
							
		$(".btn-primary").on("click",function() {
			
			alert("포스터가 수정되었습니다.");
		
				});
		
		});
				
	</script>
	
	<!--체크된 상태로 값 넘기기 -->
	 <script>
	     var DATA = "${mo.genre}";
         console.log(DATA);
         
         var splitDATA = DATA.split(",");
         for (var i=0; i<splitDATA.length; i++) {
            $('input:checkbox[name="genre"][value='+splitDATA[i]+']').attr("checked", true).parent().addClass('on');
         }
	</script>
	
	<!--select option 선택된 상태로 값 넘기기 -->
	 <script>
	 
     var grade="${mo.grade}";

     $("#grade").val(grade);

     
	</script>

    <script>

	var pullfiles=function(){ 
    	// love the query selector
   	var fileInput = document.querySelector("#poster");
   	var files = fileInput.files;
    // cache files.length 
    var fl = files.length;
    var i = 0;

    while ( i < fl) {
        // localize file var in the loop
        var file = files[i];
        alert(file.name);
        i++;
    	}    
	}

	// set the input element onchange to call pullfiles
	.querySelector("#poster").onchange=pullfiles;

	//a.t
	</script>



	</div>
</body>
</html>