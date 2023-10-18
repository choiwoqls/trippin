<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lzc8p76rjy&submodules=geocoder"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">

<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video,
	fieldset {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

img {
	max-width: 100%;
	height: auto;
}

mark {
	background: none
}

caption, legend {
	display: none;
}

hr {
	display: none;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
}

.inner {
	width: 100%;
	height: 50px;
}

.hd-in {
	margin-top: 0.5%;
	height: 40px;
}

.hd-left {
	font-weight: bold;
	color: #929292;
	font-size: 13px;
	margin-left: 2%;
}

.title {
	width: 100%;
	height: 200px;
}

.mtitle {
	font-weight: bold;
	font-size: 35px;
	margin-left: 45%;
	margin-top: 1%;
}

.stitle {
	font-weight: bold;
	color: #9B9D9B;
	margin-left: 43%;
	margin-top: 1%;
	display: flex;
}

.stitle-p {
	font-family: 'Jua', sans-serif;
	color: #50E3C2;
	font-size: 25px;
	margin-top: -0.5%;
}

.mbtn{
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 3%;
}

.inbtn{
	padding-top: 0.5%;
	padding-bottom: 0.5%;
	padding-left: 1%;
	padding-right: 1%;
	border-radius: 16px;
	background-color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	border: 2px solid;
}

.inbtn:hover {
	border: 2px solid #50E3C2;
	background-color: #50E3C2;
	color: white;
}

.minfo {
	border-top: 2px solid;
	margin-left: 10%;
	margin-right: 10%;
	border-bottom: 2px solid;
}

.main {
	margin-bottom : 7%; 
}

table {
    border: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
    padding: 10px; 
}

td {
    text-align: center;
    padding: 8px;
}

table td, table th {
    text-align: center; 
    vertical-align: middle; 
}

.one-hp{
	cursor: pointer;
}

.one-hp:hover {
	font-weight: bold;
}

.paging{
	display: flex;
    justify-content: center; 
    margin-top:2%
}

a{
	text-decoration: none;
	color: #929292;
}

</style>


</head>
<body style="overflow-x: hidden">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<img
						src="https://business.yanolja.com/common/kr/web/img/icon-home.png"
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 업체등록 
						> <a href="${cpath }/admin/ticketList">투어·티켓 관리</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">투어·티켓 목록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<p class="stitle-p">Trippin'</p>
			</div>
		</div>
	</header>
	
	<div class="main">
		<div class="mbtn">
			<input class="inbtn" type="button" value="투어·티켓 등록" onclick="location.href='${cpath}/admin/ticket/insertForm'">
		</div>
		<div class="minfo" id="dataTable">
			<table width="100%" border="1">
				<tr>
					<th>No</th>
					<th>상품명</th>
					<th>분류</th>
					<th>지역</th>
					<th>투어파트너사</th>
					<th>수정</th>
				</tr>
				<c:forEach var="t" items="${tlist }">
						<tr class="one-hp">
						<td onclick="location.href='${cpath}/admin/ticket/one?ticket_seq=${t.TICKET_SEQ }'">${t.TICKET_SEQ }</td>
						<td onclick="location.href='${cpath}/admin/ticket/one?ticket_seq=${t.TICKET_SEQ }'">${t.TICKET_NAME }</td>
						<td onclick="location.href='${cpath}/admin/ticket/one?ticket_seq=${t.TICKET_SEQ }'">${t.tcateNames }</td>
						<td onclick="location.href='${cpath}/admin/ticket/one?ticket_seq=${t.TICKET_SEQ }'">${t.ADDR2_NAME }</td>
						<td onclick="location.href='${cpath}/admin/ticket/one?ticket_seq=${t.TICKET_SEQ }'">${t.T_PARTNER_NAME }</td>
						<td>
							<input type="button" value="수정하기" onclick="document.location.href='${cpath}/admin/ticket/updateTK?ticket_seq=${t.TICKET_SEQ }'">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${tlist !=null}">
			<div class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }/admin/ticketList?page=${paging.begin - 1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }/admin/ticketList?page=${i}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }/admin/ticketList?page=${paging.end + 1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
	</div>
	
	<script>
		function changeStatus(num){
			var list = document.getElementsByClassName("check");
			
		}
	</script>
</body>
</html>

