<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
.co-red{
	color:red;
}
.co-blue{
	color:blue;
}
</style>

</head>
     <body>
     	<c:if test="${list != null }">
	     	<c:forEach var="p" items="${list }">
	     		<c:if test="${p.PATH != '' }">
		     		<div onclick="location.href='${cpath}${p.PATH }'">
		     	</c:if>
		     	<c:if test="${p.PATH == '' }">
		     		<div>
		     	</c:if>
		     		<div>
		     			<span>${p.DATA }</span>
		     			<span class="${p.POINT<0 ? 'co-red':'co-blue' }">${p.POINT }</span>
		     		</div>
		     		<div>
						<c:if test="${p.WHAT == 0 }">
							<c:if test="${p.DAY == '0' }">
								오늘
							</c:if>
							<c:if test="${p.DAY != '0' }">
								${p.DAY }일 전
							</c:if>
						</c:if>
						<c:if test="${p.WHAT == 1 }">
							${p.MONTHDIFF }달 전
						</c:if>
					</div>
				</div>
	     	</c:forEach>
     	</c:if>
     	<c:if test="${list == null }">
     		<div>포인트 내역이 존재하지 않습니다.</div>
     	</c:if>
     </body>
 </html>