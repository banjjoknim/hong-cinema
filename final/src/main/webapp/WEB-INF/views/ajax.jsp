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
		<div></div>
		<button>클릭</button>
		<script>
		/* $("button").on("click", function(){
		
			// XMLHttpRequest 객체의 인스턴스를 생성합니다.
			var xhr = new XMLHttpRequest();

			// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
			xhr.open("GET", "data/test.json", true);

			// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
			xhr.send("search=alice");
			
			
		}); */
		
		var xhr = new XMLHttpRequest();

		xhr.onload = function() {
		  if (xhr.status === 200) {
		    document.getElementById("content").innerHTML = xhr.responseText;
		  }
		};

		xhr.open("GET", "data/data.html", true);
		xhr.send(null);
		
		</script>
</body>
</html>