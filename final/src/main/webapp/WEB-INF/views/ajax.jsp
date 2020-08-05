<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<button id="btn1">simpleAJAX</button>
	<div id="result"></div>
</body>
<script>
	$(document).ready(function() {
		console.log("loading...");
		getList(function(list){
			
			for(var i = 0, len = list.length||0; i<len; i++){
				console.log(list[i]);//콘솔에 리스트 출력.
				$("#result").append(list[i].movieName);
			}
		});
	});
	
	function getList(callback, error) {

		$.getJSON("/getScheduleByDate.json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
</script>
</body>
</html>