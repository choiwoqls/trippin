<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<title>Motel</title>
</head>
<body>
	<div align="center">
		<c:forEach var="m" items="${mlist }">
			<table border="1" cellspacing="0" onclick="document.location.href='${cpath}/admin/member/accom/selectMot?f_seq=${m.F_SEQ }'">
			<tr>
				<td>${m.NAME }</td>
				<td>★${m.SAVG }</td>
				<td>♥${m.JJ }
				<td>${m.PRICE }</td>
				<td>${m.ADDR2_NAME }</td>
				<td>${m.MAIN_IMG }</td>
				<td>${m.INTRO }</td>
			</tr>
			</table>
		
		</c:forEach>
	</div>

</body>
</html>