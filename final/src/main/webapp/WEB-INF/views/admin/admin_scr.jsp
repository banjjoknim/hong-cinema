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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>관리자 페이지</title>
</head>

<body>
<%@ include file="../board/header.jsp" %>
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/admin_mov">영화 관리</a></li>
            <li class="breadcrumb-item"><a href="/admin_res">예매 관리</a></li>
            <li class="breadcrumb-item"><a href="/admin_shw">상영 관리</a></li>
            <li class="breadcrumb-item active"><a href="/admin_scr">상영관 관리</a></li>
            <li class="breadcrumb-item"><a href="#">매출 관리</a></li>
            <li class="breadcrumb-item"><a href="/admin_mem">회원 관리</a></li>
        </ol>
    </div>
    <%@ include file="../board/footer.jsp" %>
</body>

</html>