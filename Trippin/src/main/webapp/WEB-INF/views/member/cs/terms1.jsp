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

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;



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

address, strong {
	font-style: normal;
	font-weight: normal;
}

table {
	border-collapse: collapse;
}

input, select {
	outline: none;
	font-family: inherit
}

.inner {
	position: relative;
	width: 100%;
	height: 90px;
}

.hd-in {
	width: 100%;
	display: flex;
	justify-content: space-between;
	position: fixed;
	background-color: white;
	border-bottom: 1px solid #E8E8E8;
	height: 80px;
	line-height: 80px;
	box-shadow: 0px 2px 0px 0px #F2F2F2;
}

.hd-left {
	font-weight: bold;
	font-size: 24px;
	margin-left: 4%;
	font-family: 'Jua', sans-serif;
}

.hd-left a {
	text-decoration: none;
	color: black;
}

.hd-right a {
	text-decoration: none;
	color: #797979;
}

.hd-right {
	font-weight: bold;
	font-size: 20px;
	margin-right: 6%;
}

.main-top {
	margin-left: 26%;
	height: 60px;
}

.main-title {
	font-size: 25px;
	font-weight: bold;
	color: #3A3A3A;
	line-height: 60px;
	margin-left: 1.5%;
}

.main-mid {
	margin-left: 26%;
	margin-right: 26%;
	margin-top: 3%;
	width: 50%;
}

.footer {
	margin-top: 2%;
	padding-top: 1%;
	background-color: rgb(250, 250, 250);
}

.foot-top {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.kakaot {
	font-weight: bold;
	margin-bottom: 2%;
}

.kakaot span, .telk span {
	color: #368FFF;
	margin-left: 1%;
}

.telk {
	font-weight: bold;
	margin-bottom: 1%;
}

.telf {
	font-weight: bold;
	margin-bottom: 2%;
}

.ft-info {
	font-weight: bold;
	color: #9A9A9A;
	line-height: 2.1;
	margin-bottom: 5%;
	padding-bottom: 3%;
	border-bottom: 1px solid #EFEFEF;
}

.foot-foot {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.ff {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
}

.ff2 {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
	margin-top: 2%;
	margin-bottom: 7%;
}

strong {
	font-weight: bold;
}
.header {
	margin-left : 10%;
	margin-right : 10%;
	
}
.main {
	margin-left : 10%;
	margin-right : 10%;
}
.inner {
	width : 100%;
}
.inner img {
	width : 24px;
	position : relative;
	top : 3vh;
	right : 2vw;
	cursor : pointer;
}
li {
	line-height : 200%;
	font-size : 13px;
	font-weight : bold;
	color : #616161;
	white-space : pre-line;
	appearance : none;
	padding-left : 2%;
	
}

ul {
	list-style-type : none;
	list-style : none;
	padding-left : 3%;
	padding-right : 3%;
	word-break : keep-all;
}
li::marker {
	content: "•";
}
.title {
	font-size : 22px;
	font-weight : bold;
	padding-bottom : 1.5%;
}
</style>
<script type="text/javascript">
function closePopup() {
	
	window.close();
	
	
}
</script>

</head>
<body>
	<header class="header">
		<div class="inner">
			<img onclick="closePopup();" src="https://cdn-icons-png.flaticon.com/512/109/109602.png">
		</div>
	</header>
<div class="main">
	<div class="main-text">
		<div class="title">개인정보 수집 및 이용</div>
			<ul>
				<li>수집하는 개인 정보[(필수)이메일, 휴대폰 번호,문의내용, (선택)첨부파일]는 문의 내용 처리 및 고객 불만을 해결하기 위해 사용되며, 관련 법령에 따라 3년간 보관 후 삭제됩니다.
				</li>
				<li>문의 접수, 처리 및 회신을 위해 꼭 필요한 정보이므로 동의해 주셔야 서비스를 이용하실 수 있습니다.
				</li>
			</ul>
	</div>
</div>
	


		
</body>
</html>