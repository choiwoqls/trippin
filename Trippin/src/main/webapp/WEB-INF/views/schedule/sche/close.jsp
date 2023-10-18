<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: 50px;" align="center">
	<h3>${msg }</h3>
	<button onclick="closeThis()">닫기</button>
</div>

<script>
function closeThis(){
	window.opener.location.reload();
	window.close();
}
</script>

</body>
</html>