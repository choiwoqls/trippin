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

select {
	max-width: 100%;
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

table {
	border-collapse: collapse;
}

input, select {
	outline: none;
	font-family: inherit
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
	margin-left: 42%;
	margin-top: 1%;
}

.stitle {
	font-weight: bold;
	color: #9B9D9B;
	margin-left: 43%;
	margin-top: 2%;
	display: flex;
}

.stitle-p {
	font-family: 'Jua', sans-serif;
	color: #50E3C2;
	font-size: 25px;
	margin-top: -0.5%;
}

.minfo {
	border-top: 2px solid;
	margin-left: 10%;
	margin-right: 10%;
	border-bottom: 2px solid;
}

.mi-one, .mi-two, .mi-thr {
	border-bottom: 1px solid #EDEDED;
	padding: 1%;
	display: flex;
}

.mi-name, .exp, .licens {
	font-weight: bold;
	font-size: 16px;
	padding: 2%;
}

.input-one {
	padding: 1%;
	width: 50%;
	margin-left: 19%;
}

.input-one input, .input-thr input {
	border: 2px solid #E8E8E8;
	width: 50%;
	height: 90%;
}

.input-one input:focus, .input-thr input:focus {
	border: 1px solid #50E3C2;
	box-shadow: #50E3C2 0px 0px 0px 1px;
}

.input-one input, .input-thr input {
	font-size: 16px;
	color: #9B9D9B;
	font-weight: bold;
}

.main {
	margin-top: 5%;
}

.input-two {
	margin-left: 10%;
	padding: 1%;
	margin-top: 1%;
	width: 50%;
	font-size: 16px;
	font-weight: 600;
	color: #666666;
}

.lab-one {
	padding-left: 5%;
	accent-color: gray;
}

.lab-two {
	padding-left: 10%;
	accent-color: gray;
}

.input-thr {
	padding: 1%;
	width: 50%;
	margin-left: 17.7%;
}

.check-title {
	margin-left: 10%;
	margin-top: 2%;
	font-weight: bolder;
	font-size: 20px;
}

.check-list {
	margin-top: 2%;
	border: 1px solid #cccccc;
	margin-left: 10%;
	margin-right: 10%;
	padding-left: 2%;
	padding-top: 2%;
}

#check1 {
	margin-bottom: 2%;
}

.cl-one, .cl-two {
	font-weight: bold;
	font-size: 14px;
}

.ch-sp {
	color: #FF4080;
}

.ft-submit {
	margin-top: 3%;
	margin-left: 38%;
	margin-right: 35%;
	margin-bottom: 5%;
	border: 0px;
	background-color: #50E3C2;
	padding: 1%;
	border-radius: 45px;
}

.ft-submit:hover {
	border: 2px solid #04CFD4;
}

.fts-one {
	padding: 2%;
	border: 0px;
	margin-left: 39%;
	background-color: #50E3C2;
	color: white;
	font-weight: bold;
	font-size: 20px;
}

.fts-two {
	margin-left: 23%;
	font-size: 20px;
	font-weight: bold;
	color: white;
}

.emailbtn {
	margin-left: -25.5%;
	background-color: #EFEFEE;
	color: silver;
	border: 0px;
	height: 46.2px;
	margin-top: 1%;
}

input[type=checkbox] {
	accent-color: #50E3C2;
}

.sbox {
	position: relative;
	width: 150px;
	height: 35px;
	border-radius: 4px;
	border: 2px solid #50E3C2;
}

.sobx .scity {
	width: inherit;
	height: inherit;
	background: transparent;
	border: 0 none;
	outline: 0 none;
	padding: 0 5px;
	position: relative;
	z-index: 3;
}

.sbox .scity option {
	background: gray;
	color: #fff;
	padding: 3px 0;
	font-size: 15px;
}

.sbox .sarrow {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 1;
	width: 35px;
	height: inherit;
	border-left: 2px solid #50E3C2;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sbox .sarrow img {
	width: 50%;
	transition: 0.5s;
	background-color: white;
}

.sbox .scity:focus+.sarrow img {
	transform: rotate(180deg);
}

#roomstar {
	display: none;
}

.title img {
	position: relative;
	left: 500px;
	top: 120px;
}

.title-img img {
	width: 100px;
	position: relative;
	border-radius: 50%;
}

.input-time1 {
	padding: 1%;
	width: 80%;
	margin-left: 5%;
	display: flex;
	justify-content: space-around;
	margin-top: 3%;
}

.input-time1 input {
	border: 2px solid #E8E8E8;
	width: 150px;
	height: 40px;
}

.input-time1 input:focus {
	border: 2px solid #04CFD4;
}

.it-day {
	margin-left: -3%;
	font-size: 20px;
	font-weight: bold;
}

.it-info {
	margin-left: -20%;
}

.it-info1 {
	font-size: 17px;
	font-weight: bold;
	margin-right: 10%;
}

.it-info2 {
	font-size: 17px;
	font-weight: bold;
	margin-right: 2.6%;
}

.it-title1, .it-title2, .it-title3 {
	font-size: 16px;
	font-weight: bold;
	position: relative;
}

.it-title1 {
	left: 400px;
}

.it-title2 {
	left: 555px;
	top: -22px;
}

.it-title3 {
	left: 815px;
	top: -42px;
}

.input-btn {
	padding-top: 2%;
	padding-bottom: 2%;
	padding-left: 3%;
	padding-right: 3%;
	border-radius: 16px;
	background-color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.input-btn:hover {
	border: 2px solid black;
	background-color: rgb(77, 77, 77);
	color: white;
}

.input-label {
	padding-top: 2%;
	padding-bottom: 2%;
	padding-left: 3%;
	padding-right: 3%;
	border-radius: 16px;
	background-color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	border: 2px solid;
}

.input-label:hover {
	border: 2px solid black;
	background-color: rgb(77, 77, 77);
	color: white;
}
</style>

<script>
//전체 필터링
function applyFilter(){
	var use = document.getElementById("use").value;
	var status = document.getElementById("status").value;
	
	var dataTable = document.getElementById("dataTable");
	var rows = dataTable.getElementsByTagName("tr");
	
	for(let i =1; i<rows.length; i++){
		var rowCate1 = rows[i].getElementsByTagName("td")[3].innerText; 
		var rowCate2 = rows[i].getElementsByTagName("td")[4].innerText; 
		
		var showRow = true;
		
		//if로 각각 조건 걸어야 개별 필터링 가능
		
		if(use !== "" && use !== rowCate1){
			showRow = false;
		} 
		if(status !== "" && status !== rowCate2){
			showRow = false;
		}
		if(showRow){
			rows[i].style.display ="table-row";
		}else{
			rows[i].style.display = "none";
		}
	}

} 

</script>

</head>
<body style="overflow-x: hidden">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<img
						src="https://business.yanolja.com/common/kr/web/img/icon-home.png"
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 업체등록 
						> <a href="${cpath }/admin/list?cate=2">맛집관리</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">맛집 목록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<p class="stitle-p">Trippin'</p>
			</div>
		</div>
	</header>
	<div class="main">
		<c:choose>
			<c:when test="${cate2 == 1}">
				<div class="mi-one">
					<input type="button" value="관광지 등록" onclick="location.href='${cpath}/admin/tour/insertForm'">
				</div>
			</c:when>
			<c:otherwise>
				<div class="mi-one">
					<input type="button" value="맛집 등록" onclick="location.href='${cpath}/admin/hotple/insertForm'">
				</div>
			</c:otherwise>
		</c:choose>
		<div class="minfo" id="dataTable">
			<table width="100%" border="1">
				<tr>
					<th><input type="checkbox" id="selectAll" onchange="selectAllRows()"></th>
					<th>No</th>
					<th>업체명</th>
					<th>분류</th>
					<th>지역</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
				<c:forEach var="h" items="${list }">
					<tr onclick="location.href='${cpath}/admin/hotple/one?f_seq=${h.F_SEQ }'">
						<td><input type="checkbox"></td>
						<td>${h.F_SEQ }</td>
						<td>${h.NAME }</td>
						<td>${h.KIND_NAME }</td>
						<td>${h.ADDR2_NAME }</td>
						<td>${h.ADDR }</td>
						<td>${h.TEL }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${clist !=null}">
			<div align="center" class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }${url }?page=${paging.begin - 1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
					<c:choose>
						<c:when test="${i == paging.page }">
							<strong>[${i}]</strong>
						</c:when>
						<c:otherwise>
							<a href="${cpath }${url }?page=${i}" style="width:20.37px;">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next }">
					<a href="${cpath }${url }?page=${paging.end + 1}">[다음]</a>
				</c:if>
			</div>
		</c:if>
	</div>
	<c:if test="${list !=null}">
		<div align="center" class="paging">
			<c:if test="${paging.prev }">
				<a href="${cpath }${url }&page=${paging.begin - 1}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
				<c:choose>
					<c:when test="${i == paging.page }">
						<strong>[${i}]</strong>
					</c:when>
					<c:otherwise>
						<a href="${cpath }${url }&page=${i}" style="width:20.37px;">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.next }">
				<a href="${cpath }${url }&page=${paging.end + 1}">[다음]</a>
			</c:if>
		</div>
	</c:if>
	
	<script>
		function changeStatus(num){
			var list = document.getElementsByClassName("check");
			
		}
		
		$(function(){
			console.log(${cate2});
			console.log("야호");
		});
	</script>
</body>
</html>

