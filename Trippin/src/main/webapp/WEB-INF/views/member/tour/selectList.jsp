<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>
</head>
<body style=" margin-left : 20%; margin-right : 20%; ">
	<div>
		<span style="align:right">
			<input type="button" value="새로운 장소 등록하기" onclick="document.location.href='${cpath}/member/newplace/searchAddr'">
		</span>
	</div>

	<div align="center" style="display : flex; flex-wrap : wrap; width : 80vw;">
		<c:forEach var="l" items="${list }" varStatus="i">
			<c:choose>
				<c:when test="${l.CATE_SEQ == 1 }">
					<table border="0" cellspacing="5px" style= " width:35%; border-bottom : 1px solid #EBEBEB; cursor: pointer ;margin-right : 6%;" onclick="document.location.href='${cpath}/member/tour/selectTour?f_seq=${l.F_SEQ }'">
				</c:when>
				<c:otherwise>
					<table border="0" cellspacing="5px" width="400px" style="border-bottom : 1px solid #EBEBEB; cursor: pointer;" onclick="document.location.href='${cpath}/member/hotple/selectHotple?f_seq=${l.F_SEQ }'">
				</c:otherwise>
			</c:choose>
					<tr width="400px">
						<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
						<td width="63%"><b>${l.NAME }</b></td>
						<td rowspan="4" valign="top" width="29%">${l.MAIN_IMG }</td>
					</tr>
					<tr>
						<td>${l.INTRO }</td>
					</tr>
					<tr>
						<td><font color="#F0DA49">★</font>${l.SAVG }<span style="color : #BABABA;">(${l.RV })</span>·<font color="red">♥</font>${l.JJ }</td>
					</tr>
					<tr>
						<td style="color : #BABABA;">${l.KIND_NAME }·${l.ADDR2_NAME }</td>
					</tr>
				</table>
		</c:forEach>
		
	</div>
</body>
</html>