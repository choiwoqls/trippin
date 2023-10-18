<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<style>

</style>
<script>
function check(f) {
	var memo = document.getElementById("memo").value;
	
	if(memo === ''){
		alert("사유를 입력하세요!");
		return false;
	}
	return true;
	
}
</script>
</head>
<body>
	<header class="header">
		<div align="center">
		<form action="${cpath }/admin/mreport/doMemo" method="post" onsubmit="return check(this);" target="_parents">
		
		  <c:forEach var="mrs" items="${m_report_seq}">
        <input type="hidden" name="m_report_seq" value="${mrs}" />
    </c:forEach>
		
		<textarea rows="6" cols="50" name="memo" id="memo" placeholder="승인/부적격 사유를 입력해주세요"></textarea>
		<br>
		<input type="submit" value="확인">	
		</form>
		</div>
	

</body>
</html>






