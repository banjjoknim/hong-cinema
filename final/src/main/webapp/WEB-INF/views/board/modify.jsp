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
<style>
tr {
	padding: 20px;
	margin: 0 auto;
}

td {
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
	<form:form modelAttribute="BoardVO" name="modifyFrm" id="modifyFrm"
		action="/modify.do" method="post">
		<table class="readTable" style="width: 100%;">
			<tr>
				<td class="table-active" style="width: 10%;">작성자</td>
				<td class="writerName"></td>
				<td class="table-active" style="width: 10%;">분류</td>
				<td class="categoryName"></td>
			</tr>
			<tr>
				<td class="table-active" style="width: 10%;">작성일</td>
				<td class="writeDate"></td>
				<td class="table-active" style="width: 10%;">조회수</td>
				<td class="hit"></td>
			</tr>
			<tr>
				<td colspan="4" class="table-active">내용</td>
			</tr>
			<tr>
				<td colspan="4"><textarea class="content" name="contents"
						style="text-align: left; width: 100%; height: 300px; resize: none; overflow-y: scroll;"></textarea></td>
			</tr>
		</table>
		<input type="hidden" name="writer" value=""/>
		<input type="hidden" name="boardNumber" value=""/>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form:form>
</body>
</html>