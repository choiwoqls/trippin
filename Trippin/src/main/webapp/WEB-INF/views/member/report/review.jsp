<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

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

ol, ul {
	list-style: none
}

li {
	list-style-type: none;
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

body {
	background-color: #F2F2F2;
	height: auto;
}

.header {
	margin-left: 10%;
	margin-right: 10%;
	background-color: white;
	height: 12vh;
	border-bottom: 1px solid #F2F2F2;
}

.hd-in {
	height: 12vh;
	padding-left: 10%;
}

.hd-in img {
	width: 55px;
	position: relative;
	top: 2.3vh;
}

.hd-in span {
	line-height: 12vh;
	font-size: 21px;
	font-weight: 550;
	padding-left: 2%;
}

.main {
	margin-left: 10%;
	margin-right: 10%;
	background-color: white;
}

.main-top {
	padding-top: 3%;
}

.s-box {
	width: 85%;
	height: 6vh;
	padding-right: 3%;
}

.s-top, .e-top {
	display: flex;
	width: 90%;
	border-bottom: 1px solid #CDCDCD;
	margin: 0 auto;
	padding-bottom: 1%;
	height: 10vh;
}

.s-title, .e-title {
	width: 15%;
	font-size: 17px;
	font-weight: bold;
	line-height: 10vh;
	color: rgba(58, 58, 58, 0.4);
}

.e-input {
	width: 85%;
	padding-right: 3%;
	padding-left: 1.5%;
}

.m-select {
	padding: 10px;
	font-size: 16px;
	border: 0;
	border-radius: 5px;
	width: 100%;
	height: 10vh;
	font-weight: 500;
	color: #CDCDCD;
}

input[type=email] {
	height: 10vh;
	font-size: 16px;
	width: 100%;
	border: 0;
}

input[type=email]::placeholder {
	color: #CDCDCD;
}

.m-select:focus {
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.m-select option {
	color: black;
	font-weight: bold;
}

.t-area {
	width: 90%;
	margin: 0 auto;
	padding-top: 3%;
	padding-bottom: 2%;
	border-bottom: 1px solid #CDCDCD;
}

textarea {
	width: 100%;
	height: 50vh;
	resize: none;
	outline: none;
	border: 0;
	font-size: 15px;
	font-weight: bold;
	padding-top: 2%;
	padding-left: 2%;
	line-height: 150%;
	font-family: Arial, Helvetica, sans-serif;
}

textarea::placeholder {
	font-weight: bold;
	color: #897E7F !important;
}

.main-foot {
	width: 100%;
}

.submit input {
	width: 100%;
	padding-top: 5%;
	padding-bottom: 5%;
	cursor: pointer;
	background-color: white;
	border-radius: 5px;
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
	border: 2px solid rgb(77, 77, 77);
	font-weight: bold;
	font-size: 14px;
}

.submit input:hover {
	background-color: rgb(77, 77, 77);
	color: white;
}

.submit {
	width: 20%;
	margin: 0 auto;
	padding-top: 5%;
	padding-bottom: 3%;
}
</style>

<script>
	function check(f) {
		var cate = f.report_cate_seq;
		var email = f.email;
		var content = f.content;

		if (cate.value == 0) {
			alert('신고 유형을 선택하세요!');
			cate.focus();
			return false;
		}
		if (email.value == '') {
			alert('이메일을 입력해주세요!');
			email.focus();
			return false;
		}
		if (content.value == '') {
			alert('신고 내용을 자세히 입력해주세요!');
			content.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body style="overflow-x: hidden">
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<img
					src="https://img.freepik.com/premium-vector/police-alarm-or-emergency-siren-icon_153791-1113.jpg">
				<span>신고하기</span>
			</div>
		</div>
	</header>
	<div class="main">
		<form action="${cpath }/member/report/rv_insert" method="post"
			onsubmit="return check(this)" enctype="multipart/form-data">
			<input type="hidden" name="kind" value="${param.kind }"> <input
				type="hidden" name="board_no" value="${param.rv_seq }">
			<div class="main-top">
				<div class="s-top">
					<div class="s-title">
						<span>신고 유형</span>
					</div>
					<div class="s-box">
						<select class="m-select" name="report_cate_seq" id="cate">
							<option value="" disabled selected>사유를 선택해주세요.</option>
							<c:forEach var="r" items="${list }">
								<option value="${r.report_cate_seq }">${r.report_cate_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="e-top">
					<div class="e-title">
						<span>이메일</span>
					</div>
					<div class="e-input">
						<input class="inemail" type="email" name="email"
							placeholder="이메일을 입력해주세요.">
					</div>
				</div>
			</div>
			<div class="main-mid">
				<div class="t-area">
					<textarea name="content" placeholder="신고 내용을 입력해주세요."></textarea>
				</div>
			</div>
			<div class="main-foot">
				<div class="submit">
					<input type="submit" value="제출하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>