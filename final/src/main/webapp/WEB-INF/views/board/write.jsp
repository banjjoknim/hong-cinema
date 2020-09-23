<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/simplex.css">
<link rel="stylesheet" href="/resources/css/boardList.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
tr {
	padding: 20px;
	margin: 0 auto;
}

table td {
	padding: 20px;
	text-align: center;
	border: 1px solid rgb(200, 200, 200);
}

content {
	height: 70%;
	overflow: scroll;
}
</style>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="userid" />
		<sec:authentication property="principal.member.userName"
			var="userName" />
		<sec:authentication property="principal.member.userEmail"
			var="userEmail" />
	</sec:authorize>
	<form:form modelAttribute="BoardVO" name="writeFrm" id="writeFrm"
		action="/write.do" method="post">
		<%-- <form name="seatFrm" action="/payment"> --%>

		<%-- </form> --%>

		<table style="border: 1px solid darkgray; width: 100%;">
			<tbody>
				<tr>
					<td class="table-active" style="width: 25%;">작성자</td>
					<td style="width: 25%;">${userid }</td>
					<td class="table-active" style="width: 25%;">분류</td>
					<td style="width: 25%;"><select name="category"
						style="width: 100%;">
							<option value="영화 리뷰">영화 리뷰</option>
							<option value="영화 추천">영화 추천</option>
							<option value="잡담">잡담</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="1" class="table-active" style="width: 30%;">제목</td>
					<td colspan="3"><input type="text" name="title"
						style="width: 100%;"></td>
				</tr>
				<tr>
					<td colspan="4" class="table-active">내용</td>
				</tr>
				<tr>
					<td colspan="4"><textarea
							style="width: 100%; height: 300px; outline: none;"
							class="textarea" name="contents"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" class="completeWrite btn btn-info" value="작성완료" />
		<input type="button" class="cancelWrite btn btn-primary" value="취소" />
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form:form>
</body>
</html>