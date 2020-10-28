<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="/resources/css/simplex.css">
<link rel="stylesheet" href="/resources/css/my_page.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!-- jQuery -->
	<script src="/resources/js/jquery-3.5.1.min.js"></script>
<title>회원정보</title>
</head>
<body>
<%@ include file="../board/header.jsp" %>
	<div class="nav_container">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="/myReservation">예매내역</a></li>
			<li class="nav-item"><a class="nav-link"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="/myBoard">게시글정보</a></li>
			<li class="nav-item"><a class="nav-link active"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="/myInfo">회원정보수정</a></li>
		</ul>
		
		<sec:authorize access="isAuthenticated()">

       	
       	<sec:authentication property="principal.username" var="userid"/>
       	<sec:authentication property="principal.member.userName" var="userName"/>
       	<sec:authentication property="principal.member.userEmail" var="userEmail"/>
       	<sec:authentication property="principal.member.userPhone" var="userPhone"/>
       	<sec:authentication property="principal.member.userBirth" var="userBirth"/> 
       	<sec:authentication property="principal.member.userGenre" var="userGenre"/> 


		<form action="/memberUpdate" method="post">
			<fieldset>
				<h4 style="font-weight: 600; margin-top: 100px;">회원정보수정</h4>
				<hr color="black">
				<div class="form-group row">
					<label for="userid" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input class="form-control-plaintext"  style="outline: none;"
							type="text" class="form-control" id="userid" name="userid"
							value="${userid}" readonly>
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="userpw" class="col-sm-2 col-form-label">비밀번호 변경</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; display: block;"
							type="password" class="form-control" id="userpw" name="userpw"
							placeholder="변경할 비밀번호를 입력해주세요."> <span
							style="font-size: small; color: red;">8-15자리의 영문/숫자/특수문자를
							함께 입력해주세요.</span>
					</div>
					<label style="margin-top: 10px;" for="userPasswordChk"
						class="col-sm-2 col-form-label">비밀번호 확인</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; margin-top: 10px;"
							type="password" class="form-control" id="userPasswordChk"
							name="userPasswordChk" placeholder="입력하신 비밀번호를 다시 입력해주세요.">
					</div>
					
					<div class="alert alert-success" style="margin: -43px 0 0 620px;"
						id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" style="margin: -43px 0 0 620px;"
						id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</div>
				
				<hr color="lightgray">
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input class="form-control-plaintext" style="outline: none;"
							type="text" class="form-control" id="userEmail" name="userEmail"
							value="${userEmail}" readonly>			
					</div>
				</div>
				<hr color="lightgray">

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
							<input class="form-control-plaintext" style="outline: none;"
							type="text" class="form-control" id="userEmail" name="userEmail"
							value="${userName}" readonly>
					</div>

				</div>
			
				<hr color="lightgray">
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userPhone" name="userPhone"
							value="${userPhone}">
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
					<div class="col-sm-10">
						<input class="form-control-plaintext" style="outline: none;"
							type="text" class="form-control" id="userBirth" name="userBirth"
							value="${userBirth}" readonly>			
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="userGenre" class="col-sm-2 col-form-label">관심장르</label>
					<div class="col-sm-10">
						<span
							style="display: block; margin-bottom: 10px; font-size: small; color: red;">※ 관심장르를 선택해주세요. <b>(최대 3개)</b> 선택하지 않으면 현재 설정 그대로 유지됩니다.
						</span> <input style="margin: 15px 5px 0 0;" id="userGenre"
							name="userGenre" type="checkbox" onclick="count_ck(this);"
							value="스포츠"><span
							style="font-size: medium; margin-right: 50px;">스포츠</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="범죄"><span
							style="font-size: medium; margin-right: 50px;">범죄</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="드라마"><span
							style="font-size: medium; margin-right: 50px;">드라마</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="코미디"><span
							style="font-size: medium; margin-right: 50px;">코미디</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="로맨스/멜로"><span
							style="font-size: medium;">로맨스/멜로</span> <br> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="스릴러"><span
							style="font-size: medium; margin-right: 50px;">스릴러</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="가족"><span
							style="font-size: medium; margin-right: 50px;">가족</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="공포"><span
							style="font-size: medium; margin-right: 65px;">공포</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="전쟁"><span
							style="font-size: medium; margin-right: 67px;">전쟁</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="로맨스/코미디"><span
							style="font-size: medium;">로맨스/코미디</span> <br> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="판타지"><span
							style="font-size: medium; margin-right: 50px;">판타지</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="액션"><span
							style="font-size: medium; margin-right: 50px;">액션</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="SF"><span
							style="font-size: medium; margin-right: 80px;">SF</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="애니메이션"><span
							style="font-size: medium; margin-right: 19px;">애니메이션</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" onclick="count_ck(this);" value="다큐멘터리"><span
							style="font-size: medium;">다큐멘터리</span>

					</div>
				</div>
				<hr color="lightgray">

				<div align="center" class="buttonbox">
					<button type="submit" style="margin: -5px 150px 0 0;"
						class="btn btn-primary btn-lg" id="submit">정보수정</button>
					<button type="button" style="width: 100px;" class="cancel btn-primary btn-lg" id="cancel">취소</button>
				</div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		</sec:authorize>
	</div>
<%@ include file="../board/footer.jsp" %>
</body>
</html>

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cancel").on("click", function(){
				location.href = "/";		    
			});
			
			$("#submit").on("click",function() {

				var useridCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
				var userpwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,15}$/);
				var userNameCheck = RegExp(/^[가-힣a-z]{2,6}$/);
				var userEmailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				var userBirthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
				var userPhoneCheck = RegExp(/^01[0179][0-9]{7,8}$/);
				var hobbyCheck = false;
			
				if ($("#userpw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}

				//비밀번호 유효성검사
				if (!userpwCheck.test($(
						"#userpw").val())) {
					alert("비밀번호 형식에 맞게 입력해주세요");
					$("#userpw").val("");
					$("#userpw").focus();
					return false;
				}
				
				//휴대폰 번호 유효성 검사
				if (!userPhoneCheck.test($(
						"#userPhone").val())) {
					alert("휴대폰 번호 형식에 맞게 입력해주세요")
					$("#userPhone").val("");
					$("#userPhone").focus();
					return false;
				}
				
			
				
			
				//관심장르 유효성 검사
				for (var i = 0; i < $('[name="userGenre"]').length; i++) {
					if ($(
							'input:checkbox[name="userGenre"]')
							.eq(i).is(
									":checked") == true) {
						hobbyCheck = true;
						break;
					}
				}

				if (!hobbyCheck) {
					alert("하나 이상의 관심장르를 체크해 주세요");
					return false;
				} 
			
			});
		});
	</script>
	
	
	<script>
		// 관심장르 3개까지만 체크되게 하기

		function count_ck(obj) {

			var chkbox = $('[name="userGenre"]');
			var chkCnt = 0;

			for (var i = 0; i < chkbox.length; i++) {
				if (chkbox[i].checked) {
					chkCnt++;
				}
			}

			if (chkCnt > 3) {
				alert("3개까지만 선택할 수 있습니다.");

				obj.checked = false;

				return false;

			}

		}
	</script>
	
	 <!--체크된 상태로 값 넘기기 -->
	 <script>
	     var DATA = "${userGenre}";
         console.log(DATA);
         
         var splitDATA = DATA.split(",");
         for (var i=0; i<splitDATA.length; i++) {
            $('input:checkbox[name="userGenre"][value='+splitDATA[i]+']').attr("checked", true).parent().addClass('on');
         }
	</script>
	
	<script type="text/javascript">
		//비밀번호 일치 여부 검사
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("#userPasswordChk").keyup(function() {
				var userpw = $("#userpw").val();
				var userPasswordChk = $("#userPasswordChk").val();
				if (userpw != "" || userPasswordChk != "") {
					if (userpw == userPasswordChk) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});
		});
	</script>