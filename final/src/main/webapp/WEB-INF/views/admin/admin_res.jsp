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
    <style>

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
<%@ include file="../board/header.jsp" %>
    <div class="container">
       <!--  <ol class="breadcrumb" style="vertical-align: middle;">
			<li style="margin: 10px 0 -20px 10px; padding-bottom: -60px"
				class="breadcrumb-item"><a href="admin_mov">영화 관리</a></li>
			<li style="margin: 10px 0 -20px -128px; padding-bottom: -60px"
				class="breadcrumb-item active"><a href="admin_res">예매 관리</a></li>
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
    <h4 style="font-weight: 600; margin-top: 100px;">예매 관리</h4>
<hr color="black">
  <table class="table table-hover">
    <thead>
      <tr class="table-active">
        <th scope="col">예매번호</th>
        <th scope="col">아이디</th>
        <th scope="col">영화제목</th>
        <th scope="col">상영관명</th>
        <th scope="col">상영날짜</th>
        <th scope="col">예매날짜</th>
        <th scope="col">예매인원</th>
        <th scope="col">예매좌석</th>
        <th scope="col">구입가격</th>
        <th scope="col">비고</th>
      </tr>
    </thead>
    <tbody>
    <tr>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td>Column</td>
        <td><button type="button" class="btn btn-outline-primary">상세</button>
        <button type="button" class="btn btn-outline-primary">취소</button></td>
      </tr>
      
    </tbody>
</table>
<hr color="lightgray">

</div> 
 <%@ include file="../board/footer.jsp" %>
</body>
</html>