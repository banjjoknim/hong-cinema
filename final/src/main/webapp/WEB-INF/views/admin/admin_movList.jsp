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

.txt_line{
width:70px; 
padding:0 5px; 
overflow:hidden; 
text-overflow:ellipsis; 
white-space:nowrap;
}


</style>
    
    <title>관리자 페이지</title>
</head>

<body>
<%@ include file="../board/header.jsp" %>
<sec:authorize access="isAuthenticated()">

    <div class="container">
        
       <!--  <ol class="breadcrumb" style="vertical-align: middle;">
            <li style="margin: 10px 0 -20px 10px; padding-bottom:-60px " class="breadcrumb-item"><a href="admin_mov">영화 관리</a></li>
            <li style="margin: 10px 0 -20px -128px; padding-bottom:-60px" class="breadcrumb-item"><a href="admin_res">예매 관리</a></li>
            <li style="margin: 10px 0 -20px -108px; padding-bottom:-60px" class="breadcrumb-item"><a href="admin_shw">상영 관리</a></li>
            <li style="margin: 10px 0 -20px -108px; padding-bottom:-60px" class="breadcrumb-item"><a href="admin_scr">상영관 관리</a></li>
            <li style="margin: 10px 0 -20px -88px; padding-bottom:-60px" class="breadcrumb-item"><a href="#">매출 관리</a></li>
            <li style="margin: 10px 0 -20px -108px; padding-bottom:-60px" class="breadcrumb-item active"><a href="admin_mem">회원 관리</a></li>
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
      
       <div class="form-group">
		<select  style="width: 110px; float: right; margin-top:95px;" class="form-control" id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
		</select>
	</div> 
        <h4 style="font-weight: 600; margin-top: 100px;">영화 정보 리스트</h4>
        <hr color="black">
       	<table class="table table-hover">
          <tbody>
         <c:choose>
          <c:when test="${empty viewAll}" >
          <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr> 
          </c:when>
		<c:when test="${!empty viewAll}">  
		<c:forEach var="list" items="${viewAll}">
       
       <tr>
         <td width="80" rowspan="6" ><b><c:out value="${list.movieCode}"/></b></td>
         </tr> 
          
          <tr>
              <td rowspan="5" width="130"><img width="130" src="/resources/upload/${list.poster}"></td>
              <td style="text-align: left;"><b>제목</b> <font color="gray">|</font> <c:out value="${list.movieName}"/></td>
              <td style="text-align: left;"><b>감독</b> <font color="gray">|</font> <c:out value="${list.director}"/></td>       
              <td style="text-align: left;"><b>장르</b> <font color="gray">|</font> <c:out value="${list.genre}"/></td>
              <td style="text-align: left;"><b>국가</b> <font color="gray">|</font> <c:out value="${list.nationName}"/></td>
          </tr> 
          <tr>
            <td style="text-align: left;"><b>개봉일</b> <font color="gray">|</font> <c:out value="${list.openDate}"/></td>
            <td style="text-align: left;"><b>상영시간</b> <font color="gray">|</font> <c:out value="${list.showTime}"/></td>
            <td style="text-align: left;"><b>상영등급</b> <font color="gray">|</font> <c:out value="${list.grade}"/></td>       
          	<td style="text-align: left;"><b>등록일</b> <font color="gray">|</font> <fmt:formatDate value="${list.regDate }" pattern="yyyy.MM.dd"/> </td>
          </tr> 
          <tr>
            <td colspan="4" style="text-align: left;"><b>출연진</b> <font color="gray">|</font> <c:out value="${list.actors}"/></td>
          </tr>
          <tr>
            <td colspan="4" style="text-align: left;"><b>줄거리</b> <font color="gray">|</font> <c:out value="${list.intro}"/></td>
          </tr>
          <tr>
          <td colspan="3"></td>
          <td>
              <button type="button" class="btn btn-outline-primary" onclick="location.href='/admin_posterModify?movieCode=${list.movieCode}'">포스터수정</button>
              <button type="button" class="btn btn-outline-primary" onclick="location.href='/admin_movModify?movieCode=${list.movieCode}'">영화정보수정</button>
              <button type="button" class="btn btn-outline-primary" onclick="confirmDelete('/movieDelete?movieCode=${list.movieCode}')">삭제</button>
          </td>
          </tr>
	      </c:forEach>
         	</c:when>
           </c:choose> 
          </tbody>
      </table>
       
       
        
      <hr color="lightgray">
      <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				
	<div >
		<ul style="width: 200px; margin: 0 auto;" class="pagination">
		<c:if test="${paging.startPage != 1 }">
    	<li class="page-item">
			<a class="page-link" href="/admin_movList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a>
			</li>	
		</c:if>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item active">
					<a class="page-link" href="/admin_movList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item">
					<a class="page-link" href="/admin_movList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
		 <li class="page-item">
			<a class="page-link" href="/admin_movList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a>
    	</li>
		</c:if>
  </ul>
	
	</div>
      
      </div>
    
 </sec:authorize>     
   <!-- jQuery -->
	<script src="/resources/js/jquery-3.5.1.min.js"></script>   
      <script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="admin_movList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	</script>
      
      <script>
       //삭제 버튼 이벤트
    	function confirmDelete(url) {
        if (confirm("영화 정보를 삭제하시겠습니까? 삭제되면 복구할 수 없습니다.")) {
        	alert("영화 정보가 삭제되었습니다.");
        	window.location.replace(url);
        } else {
            false;
        }       
    };
    </script> 
      <%@ include file="../board/footer.jsp" %>
      </body>
      
      
      </html>