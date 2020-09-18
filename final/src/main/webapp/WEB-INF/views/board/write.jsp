<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/simplex.css">
<link rel="stylesheet" href="/resources/css/boardList.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<form:form modelAttribute="BoardVO" name="writeFrm" id="writeFrm"
		action="/write.do" method="post">
		<%-- <form name="seatFrm" action="/payment"> --%>

		<%-- </form> --%>

		<table>
			<tr>
				<td>작성자</td>
				<td>아이디</td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="category">
						<option value="영화 리뷰">영화 리뷰</option>
						<option value="영화 추천">영화 추천</option>
						<option value="category3">category3</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" class="textarea"
						name="contents"></textarea></td>
			</tr>
		</table>
		<input type="submit" class="completeWrite btn btn-info" value="작성완료" />
		<input type="button" class="cancelWrite btn btn-primary" value="취소" />
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form:form>
</body>
</html>