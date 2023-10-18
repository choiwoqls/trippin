<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>
</head>
<body style="margin-left: 20%; margin-right: 20%;">
	<div>
		<c:if test="${list != null }">
			<c:forEach var="nt" items="${list }">
				<div onclick="location.href='${cpath}${nt.PATH }'">
					<div>${nt.DATA }</div>
					<div>
						<c:if test="${nt.WHAT == 0 }">
							<c:if test="${nt.DAY == '0' }">
								오늘
							</c:if>
							<c:if test="${nt.DAY != '0' }">
								${nt.DAY }일 전
							</c:if>
						</c:if>
						<c:if test="${nt.WHAT == 1 }">
							${nt.MONTHDIFF }달 전
						</c:if>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${list ==null }">
			<h2>알림 내역이 없습니다.</h2>
		</c:if>
	</div>
</body>
</html>