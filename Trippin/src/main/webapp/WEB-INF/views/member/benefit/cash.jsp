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

</head>
     <body>
     	<div>
     		사용 가능 캐시 ${canUse }원
     	</div>
     	<div>
     		소멸 예정(30일 이내) ${soonEnd }원
     	</div>
     	<c:if test="${list != null }">
	     	<c:forEach var="c" items="${list }">
		     	<div>
		     		<div>
		     			<span>${c.DATETIME }</span>
		     			<span>${c.WHAT==0?'적립예정' :c.WHAT==1? '적립':c.WHAT==2? '사용' :c.WHAT==3? '소멸': '적립 예정 취소'}</span>
		     		</div>
		     		<div>
		     			<span>${c.TICKET_NAME}</span>
		     			<span>${c.WHAT==0 || c.WHAT==1 ? '+' : '-'}${c.CASH }</span>	
		     		</div>
		     		<c:if test="${c.SERIAL_NO != null }">
		     			<div>예약번호&nbsp;<a href="location.href='${cpath }/member/ticket/myOne?purchase=${c.PURCHASE_NO }'">${c.SERIAL_NO }</a></div>
		     		</c:if>
		     		<c:if test="${c.WHAT == 0 }">
		     			<div>적립예정&nbsp;${c.CASH_DATE }</div>
		     		</c:if>
		     	</div>
	     		
	     	</c:forEach>
     	</c:if>
     	<c:if test="${list == null }">
     		<div>캐시 내역이 존재하지 않습니다.</div>
     	</c:if>	
     </body>
 </html>