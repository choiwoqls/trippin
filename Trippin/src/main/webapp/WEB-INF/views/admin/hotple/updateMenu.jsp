<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script src="${cpath}/resources/js/httpRequest.js"></script>

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

input[type=file]::file-selector-button {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 2%;
}

input[type=file]::file-selector-button:hover {
	background: rgb(77, 77, 77);
	color: #fff;
}

#file {
	display: flex;
	background: white;
}

select::-ms-expand {
	display: none;
}

.scity {
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	width: 150px;
	height: 35px;
	background:
		url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png')
		calc(100% - 5px) center no-repeat;
	background-size: 20px;
	padding: 5px 30px 5px 10px;
	border: 0px;
	outline: 0 none;
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

textarea {
	width: 100%;
	height: 6.25em;
	border: 2px solid #cccccc;
	resize: none;
	outline: none;
}

textarea:hover {
	border: 2px solid #04CFD4;
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

.menu {
	padding: 2px 5px;
	cursor: context-menu;
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

.menu-btnz label {
	margin-left: 60%;
}

.menu-btnz {
	margin-top: 3%;
	margin-bottom: 3%;
}
</style>

<script>
function check(f) {
    // 모든 메뉴 폼들을 가져옵니다.
    const menuForms = f.querySelectorAll(".menu-item");

    for (const menuForm of menuForms) {
        const nameInput = menuForm.querySelector(".menu-name");
        const fileInput = menuForm.querySelector(".menu-image");
        const priceInput = menuForm.querySelector(".menu-price");
        const seqList= menuForm.querySelector(".menu-seq");

        const nameValue = nameInput.value.trim();
        const fileValue = fileInput.value.trim();
        const priceValue = priceInput.value.trim();
        const seqValue = seqList.value.trim();

        if (nameValue == '') {
            alert('메뉴명을 입력하세요!');
            nameInput.focus();
            return false;
        }

        if (seqValue== '' && fileValue == '') {
            alert('새 메뉴의 사진 등록은 필수입니다.');
            return false;
        }

        if (priceValue == '') {
            alert('가격을 입력하세요!');
            return false;
        }
    }

    return true;
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
						onclick="document.location.href='${cpath}/admin/main'"> >
					관리자 > 맛집등록 > 기존 맛집 수정
				</div>
			</div>
		</div>
		<div class="title">
			<div class="title-img">
				<img
					src="https://play-lh.googleusercontent.com/G3tedZ7VBJZlDs3BRuY9lyy5YGjR_m-l0yaVsir2zhu-76o6tqLuDVhHa4OW5Ys80Ic">
			</div>
			<div class="mtitle">기존 메뉴 수정</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<p class="stitle-p">Trippin'</p>
			</div>
		</div>
	</header>
<div class="main">
	<form action="${cpath }/admin/hotple/updateMenu?f_seq=${param.f_seq}" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
        <div class="mi-one">
            <div class="mi-name">메뉴 등록</div>
            <div id="input-one" style="margin-left: 17%; margin-top: 2%; width: 70%;">
                <input type="button" class="input-label" value="메뉴 추가하기" onclick="addMenu()">
                <c:forEach var="m" items="${mlist }">
                <div class="menu-item">
	                <input type="hidden" value="${m.menu_seq }" name="menu_seq" class="menu-seq">
                    <div class="mi-one">
                        <div class="mi-name">메뉴 사진</div>
                        <div class="" style="margin-left: 14.09%; margin-top: 1.5%;">
                            <input type="file" name="file" class="menu-image"/>
                        </div>
                    </div>
                    <div class="mi-one">
                        <div class="mi-name">메뉴명</div>
                        <div class="input-one" style="margin-left: 15.65%;">
                            <input type="text" name="name" class="menu-name" value="${m.name }">
                        </div>
                    </div>
                    <div class="mi-one">
                        <div class="mi-name">메뉴설명</div>
                        <div class="input-one" style="margin-left: 13.7%; width: 60%;">
                            <textarea name="info">${m.info }</textarea>
                        </div>
                    </div>
                    <div class="mi-one">
                        <div class="mi-name">가격</div>
                        <div class="input-one" style="margin-left: 17.7%;">
                            <input type="number" min="1" name="price" class="menu-price" value="${m.price }">
                        </div>
                    </div>
                    <div class="mi-one">
                        <div class="mi-name">가격상세</div>
                        <div class="input-one" style="margin-left: 17.7%;">
                            <input type="text" min="1" name="price_detail" value="${m.price_detail }">
                        </div>
                    </div>
		            <div class="menu-btnz">
		                <input type="button" class="input-label" value="X" onclick="removeMenu(this)">
		            </div>
                </div>
                </c:forEach>
            </div>
        </div>
			<div class="foot">
				<div class="ft-submit">
					<input class="fts-one" type="submit" value="메뉴 등록"> 
					<span class="fts-two">⭧</span>
				</div>
			</div>
    </form>
</div>

<script>
	const menuList = document.getElementsByClassName("menu-item");
    let menuCount = menuList.length;

    function addMenu() {
        if (menuCount >= 5) {
            alert("메뉴 추가는 5개까지만 가능합니다.");
            return;
        }

        const newMenuItem = document.createElement("div");
        newMenuItem.className = "menu-item";
        newMenuItem.innerHTML = `
        	<input type="hidden" name="menu_seq" class="menu-seq" value="0">
            <div class="mi-one">
                <div class="mi-name">메뉴 사진</div>
                <div class="" style="margin-left: 14.09%; margin-top: 1.5%;">
                    <input type="file" name="file" class="menu-image"/>
                </div>
            </div>
            <div class="mi-one">
                <div class="mi-name">메뉴명</div>
                <div class="input-one" style="margin-left: 15.65%;">
                    <input type="text" name="name" class="menu-name">
                </div>
            </div>
            <div class="mi-one">
                <div class="mi-name">메뉴설명</div>
                <div class="input-one" style="margin-left: 13.7%; width: 60%;">
                    <textarea name="info" class="menu-description"></textarea>
                </div>
            </div>
            <div class="mi-one">
                <div class="mi-name">가격</div>
                <div class="input-one" style="margin-left: 17.7%;">
                    <input type="number" min="1" name="price" class="menu-price">
                </div>
            </div>
            <div class="mi-one">
            	<div class="mi-name">가격상세</div>
            	<div class="input-one" style="margin-left: 17.7%;">
               		<input type="text" min="1" name="price_detail">
           	 	</div>
        	</div>
            <div class="menu-btnz">
                <input type="button" class="input-label" value="X" onclick="removeMenu(this)">
            </div>
        `;

        const inputOne = document.getElementById("input-one");
        inputOne.appendChild(newMenuItem);

        menuCount++;
    }

    function removeMenu(button) {
        const menuContainer = button.closest(".menu-item");
        menuContainer.remove();
        menuCount--;
    }
</script>

</body>
</html>

