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
</style>

<title>관리자 페이지</title>
</head>

<body>
	<%@ include file="../board/header.jsp"%>
	<div class="container">
		<ol class="breadcrumb" style="vertical-align: middle;">
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
		</ol>

	

		<%--     <form action="/uploadFormAction" method="post" enctype="multipart/form-data">
        
        <input type='file' name='uploadFile' multiple>
        <button>Submit</button>
        
        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
        </form> --%>
		
		
	<!-- 	<div class='uploadDiv'>
			<input type='file' name='uploadFile' multiple>
		</div>

		<div class='uploadResult'>
			<ul>

			</ul>
		</div>

		<button id='uploadBtn'>Upload</button> -->


		<div class="container">
		<h4 style="font-weight: 600; margin-top: 100px;">영화 관리</h4>
		<hr color="black">
		
				<fieldset>
					<legend>새영화등록</legend>
					
					
					<hr color="black">
					
					<div class="form-group row">
						<label for="poster" class="col-sm-2 col-form-label">포스터등록</label>
						<div class="col-sm-10">
							<!-- <input style="width: 400px; height: 40px; display: block;"
								type="file" class="foㅁrm-control" name="uploadFile"> -->
							<input type="file" class="form-control-file" name="uploadFile" id="exampleInputFile" aria-describedby="fileHelp">	
						</div>
					</div>
					<hr color="lightgray">
					<div class="form-group row">
						<label for="userid" class="col-sm-2 col-form-label">영화제목</label>
						<div class="col-sm-10">
							<input style="width: 400px; height: 40px; display: block;"
								type='text' name='title' class="form-control" multiple>
						</div>
					</div>

					
					<!-- 	<div class='uploadResult'>
							<ul>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                        
							</ul>
						</div> -->
					
					
					<hr color="lightgray">
					<div class="form-group row">
      					<label class="col-sm-2 col-form-label" >영화 장르</label>
      						<select  style="margin-left: 15px; width: 400px; height: 40px; display: block;" class="form-control"  name="grade">
        						<option>스포츠</option>
        						<option>범죄</option>
        						<option>드라마</option>
        						<option>코미디</option>
        						<option>로맨스/멜로</option>
        						<option>스릴러 </option>
        						<option>가족 </option>
        						<option>공포</option>
        						<option>전쟁</option>
        						<option>로맨스/코미디</option>
        						<option>판타지</option>
        						<option>액션</option>
        						<option>SF</option>
        						<option>애니메이션</option>
        						<option>다큐멘터리</option>
      						</select>
    					</div>
					<hr color="lightgray">

					<div align="center" class="buttonbox">
						<button type="submit" style="margin: 0 150px 0 200px;"
							class="btn btn-primary btn-lg" id="submit">영화등록</button>
						<button type="button" style="width: 100px;"
							class="btn btn-danger btn-lg" id="cancel">취소</button>
					</div>
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
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

			$(document)
					.ready(
							function() {

								function showUploadedFile(uploadResultArr) {

									var str = "";

									$(uploadResultArr)
											.each(
													function(i, obj) {

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

													var inputFile = $("input[name='uploadFile']");

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
																"uploadFile",
																files[i]);
													}

													$
															.ajax({
																url : '/uploadAjaxAction',
																processData : false,
																contentType : false,
																beforeSend : function(
																		xhr) {
																	xhr
																			.setRequestHeader(
																					csrfHeaderName,
																					csrfTokenValue);
																},
																data : formData,
																type : 'POST',
																dataType : 'json',
																success : function(
																		result) {
																	/* alert("Uploaded"); */
																	console
																			.log(result);

																	showUploadedFile(result); //업로드 결과 처리 함수 */

																	$(
																			".uploadDiv")
																			.html(
																					cloneObj
																							.html());
																}
															}); //$.ajax

												});
							});
		</script>



	</div>

<%@ include file="../board/footer.jsp" %>
</body>

</html>