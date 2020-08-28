<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button>요청</button>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('button').on('click',function(){
		$.ajax({
			url: "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=N&director=%EB%B0%95%EC%B0%AC%EC%9A%B1&title=%EC%8A%A4%ED%86%A0%EC%BB%A4&ServiceKey=FLEG4U4H7XDMM834PTOF", 
			type: 'get',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			success: function(data){
				alert();
				for(var i = 0; i<data.Data[0].Result.length; i++){
					if(data.Data[0].Result[i].title === ' 심판'){
				$('body').append(data.Data[0].Result[i].titleEng);
				break;
					}
				}
			},
			error: function(){
				alert('error!');
			}
		});
	})
})
</script>
</body>
</html>