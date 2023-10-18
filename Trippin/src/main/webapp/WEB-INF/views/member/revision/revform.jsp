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
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
	height: 10vh;
	border-bottom: 1px solid #F2F2F2;
}

.hd-in {
	height: 9vh;
	padding-left: 10%;
	padding-top: 2%;
}

.hd-in a {
	text-decoration: none;
}

.hd-in a img {
	width: 25px;
	margin-top: 2%;
}

.hd-in span {
	position: relative;
	bottom: 0.7vh;
	left: 3vw;
	font-size: 21px;
	font-weight: 550;
}

.main {
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
}

.s-top {
	display: flex;
	width: 90%;
	border-bottom: 1px solid #CDCDCD;
	margin: 0 auto;
	padding-bottom: 1%;
}

.main-top {
	padding-top: 3%;
}

.s-box {
	width: 85%;
	height: 6vh;
	padding-right: 3%;
}

.m-select {
	padding: 10px;
	font-size: 16px;
	border: 0;
	border-radius: 5px;
	width: 100%;
	height: 6vh;
	font-weight: 500;
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

.s-title {
	width: 15%;
	font-size: 17px;
	font-weight: bold;
	line-height: 6vh;
	color: rgba(58, 58, 58, 0.4);
}

.t-area {
	width: 90%;
	margin: 0 auto;
	padding-top: 3%;
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
	font-size: 12px;
	font-weight: bold;
	color: #897E7F !important;
}

.img-area {
	display: flex;
	padding-top: 3%;
	padding-left: 5%;
	padding-bottom: 3%;
}

.iu-custom {
	background-color: #F2F2F2;
	width: 100px;
	height: 100px;
	border: 0;
	cursor: pointer;
}

.iu-custom img {
	width: 40px;
	height: 40px;
	margin-left: 29%;
	margin-top: 29%;
	filter: invert(70%) sepia(4%) saturate(32%) hue-rotate(352deg)
		brightness(93%) contrast(89%);
}

input[type=file]::file-selector-button {
	display: none;
}

.submit {
	width: 20%;
	margin: 0 auto;
	padding-top: 5%;
	padding-bottom: 3%;
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
</style>
<script type="text/javascript">
function check(f) {

	var kind = document.getElementById("revision_cate_name").value;
	var text = document.getElementById("text").value;

	if (kind === "") {
		alert("유형을 선택해주세요!");
		return false;

	} else if (text === "") {
		alert("내용을 입력해주세요!");
		return false;
	}

	f.submit();
}

</script>
</head>
<body>
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<a href="#" onclick="history.back();"> <img
					src="https://cdn-icons-png.flaticon.com/512/109/109602.png">
				</a> <span>정보 수정 제안하기</span>
			</div>
		</div>
	</header>
	<div class="main">
		<form enctype="multipart/form-data"
			action="${cpath}/member/revision/write" method="post" onsubmit="return check(this);">
			<input type="hidden" value="${f_seq}" name="f_seq">
			<div class="main-top">
				<div class="s-top">
					<div class="s-title">
						<span>유형</span>
					</div>
					<div class="s-box">
						<select id="revision_cate_name" name="revision_cate_seq" class="m-select">
							<option value="" disabled selected>유형을 선택해주세요.</option>
							<c:forEach var="rvc" items="${revCateList }">

								<option value="${rvc.revision_cate_seq }">${rvc.revision_cate_name}</option>

							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="main-mid">
				<div class="t-area">
					<textarea id="text" name="content"
						placeholder="정보 수정 제안 시, 여행포인트를 지급해 드려요.
                                                &#13;&#10;- 수정 제안 시 : 1 포인트 (한 장소마다 1회)
                                                &#13;&#10;- 수정 반영 후 : 3~5 포인트 
                                                &#13;&#10; *여행 포인트란?*
                                                &#13;&#10;트리플 내 다양한 활동을 통해 지급되는 포인트로,
                                                &#13;&#10;쌓인 포인트에 따라 다음 여행에 필요한 혜택을
                                                &#13;&#10;받을 수 있어요."></textarea>
				</div>
			</div>
			<div class="main-foot">
				<div class="img-area">
					<label for="file">
						<div class="iu-custom">
							<img src="imgupload.png">
						</div>
					</label> <input type="file" name="photos" id="file" multiple
						style="margin-left: 10%; margin-top: 10%;" />
				</div>
				<div class="submit">
					<input type="submit" value="제출하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>