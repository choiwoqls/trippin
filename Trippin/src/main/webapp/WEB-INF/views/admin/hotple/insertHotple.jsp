<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50a663b98a69e54c2f47df28be00018a&libraries=services"></script>

<style>
@charset "UTF-8";

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
	margin-left: 10%;
}

.input-one input, .input-thr input, textarea {
	border: 2px solid #E8E8E8;
	width: 100%;
	height: 90%;
	font-size: 16px;
	color: #9B9D9B;
	font-weight: bold;
}

.input-one input:focus, .input-thr input:focus, textarea:focus {
	border: 1px solid #50E3C2;
	box-shadow: #50E3C2 0px 0px 0px 1px;
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

/* 수정 */
#map{
	width:70%;
	height:450px;
	margin:3% 15%;
}

.mi-name{
	width:15%;
	margin-left:5%;
}

#addrCheck, #sameCheck{
	display: flex;
	width: auto;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 10px;
	cursor: pointer;
	align-self:center;
	justify-content: center;
	color: #000;
	font-size: 13px;
	font-weight: normal;
}

#addrCheck:hover, #sameCheck:hover {
	background: rgb(77, 77, 77);
	color: #fff;
}

main{
	align-content: center;
}

form {
    width: 90%;
    margin: 5% 5%;
}

#check{
    font-size: 12px;
}

.f-input{
	margin-left:11%; 
	margin-top: 1.5%;
}

.time-one{
	padding: 1%;
	width: 100%;
}

.input-time1 {
	padding-top : 3%;
	padding-left : 20%;
	padding-right : 10%;
	display: flex;
	margin-top: 3%;
}

.input-time2{
	flex-grow : 2;
}
.input-time3 {
	flex-grow : 1;
}
.input3-chbox, .it-info input {
	border: 2px solid #E8E8E8;
	width: 150px;
	height: 40px;
}

.input-time1 input:focus {
	border: 2px solid #04CFD4;
}

.it-day {
	flex-grow : 1;
	font-size: 20px;
	font-weight: bold;
	line-height: 227%;
}

.it-info {
	display: flex;
	justify-content : space-between;
	padding-right : 10%;
}

.it-info input{
	width : 40%;
	font-size : 18px;
	font-weight : bold;
	margin-bottom : 2%;
}

.it-info2 {
	font-size: 17px;
	font-weight: bold;
	margin-right: 2.6%;
}

.it-title1, .it-title2, .it-title3 {
	font-size: 20px;
	font-weight: bold;
	text-align : center;
}
.title-section {
	display : flex;
	padding-right : 10%;
	padding-left : 30%;
}
.it-title1 {
	flex-grow : 2;
}

.it-title2 {
	flex-grow : 2;
}

.it-title3 {
	flex-grow : 1;
}

a{
	text-decoration: none;
	color: #929292;
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
.itt3-btn {
	cursor: pointer;
    padding-top: 2%;
    padding-bottom: 4%;
    padding-left: 6%;
    padding-right: 6%;
    background-color: white;
    border-radius: 5px;
    font-weight: bold;
    font-size: 20px;
    position : relative;
    bottom : 1.4vh;
    margin-left : 5%;
    border : 0;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 5px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 7px -1px;
}
.input3-chbox {
	margin-left : 20%;
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
.xxx {
	position : absolute; 
	left : 62vw;
}
.notice{
	padding-left: 15%;
	padding-top: 1.5%;
	font-weight: bold;
	font-size: 15px;
}
.back-btn {
    padding-left : 15%;
    padding-top : 3%;
}
.back-btn input {
    padding-left : 2%;
    padding-right : 2%;
    padding-top : 0.5%;
    padding-bottom : 0.5%;
    cursor: pointer;
    background-color: white;
    border-radius: 10px;
    font-weight : bold;
    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
    border : 2px solid rgb(77,77,77);
}
.back-btn input:hover {
    background: rgb(77,77,77);
    color : #fff;
}
</style>

<script type="text/javascript">

function check(f){
	var kind = f.kind.value;
	var name = f.name;
	var addr1 = f.addr1_seq.value;
	var addr2 = f.addr2_seq.value;
	var intro = f.intro;
	var addr = f.addr;
	var main = f.photo;
	var sub = f.photos;
	
	if (kind == "0"){
		alert("카테고리를 선택하세요!");
		kind.focus();
		return false;
	}
	if (name.value == ""){
		alert("매장명을 입력하세요!");
		name.focus();
		return false;
	}
	if (addr1 == "0" || addr2 == "0"){
		alert("지역을 선택하세요!");
		addr1.focus();
		return false;
	}
	if (intro.value == ""){
		alert("한 줄 소개를 작성하세요!");
		intro.focus();
		return false;
	}
	if (main.value == ""){
		alert("메인 사진은 필수입니다!");
		main.focus();
		return false;
	}
	if (addr.value == ""){
		alert("주소를 검색하여 확인하세요!");
		addr.focus();
		return false;
	}
	
	var inputTime = f.getElementsByClassName("input-time2");
    for(var j = 0; j<inputTime.length ; j++){
		var inputs = inputTime[j].getElementsByTagName("input");
		var inputElements = Array.from(inputs).filter(input => input.type ==="time");
		var rest = document.getElementById("tcheck_" + (j+1)).checked;

		for(var i = 0; i<inputElements.length ; i++){
			if(inputElements[i].value == "" && rest == false){
				alert("영업시간을 올바르게 입력하세요!");
				return false;
			}
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
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 업체등록 
						> <a href="${cpath }/admin/list?cate=2">맛집관리</a>
						> <a href="${cpath }/admin/hotple/insertForm">신규등록</a>
				</div>
			</div>
		</div>
		<div class="title">
			<div class="mtitle">신규 맛집 등록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<p class="stitle-p">Trippin'</p>
			</div>
		</div>
       <div class="back-btn">
           <input type="button" value="목록으로" onclick="location.href='${cpath}/admin/list?cate=2'">
       </div>
       <div class="notice">
       	<font color="red">*</font> 는 필수 입력 항목입니다.
       </div>
	</header>
	
	<div class="main">
		<form action="${cpath }/admin/hotple/insert" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
			<div class="minfo">
				<div class="mi-one">
					<div class="mi-name">카테고리<font color="red">*</font></div>
					<div class="input-one" >
						<div class="sbox">
							<select name="kind" class="scity" id="citykindz">
								<option value="0">선택하세요</option>
								<c:forEach var="cate" items="${h_cate }">
									<option value="${cate.h_cate_seq }">${cate.h_cate_name }</option>
								</c:forEach>
							</select>
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">상호명<font color="red">*</font></div>
					<div class="input-one" >
						<input type="text" name="name" id="mapname">
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">사업자 번호<font color="red">*</font></div>
					<div class="input-one">
						<input type="text" name="h_busi" id="h_busi">
					</div>
					<div style="margin-top:1%; margin-left:1%;">
						<input type="button" value="등록여부 확인" id="sameCheck">
						<span id="check"></span>
					</div>
				</div>
				
				<script>
				
					document.getElementById("sameCheck").addEventListener("click", checkHotple);
				
					function checkHotple(){
						var busi = document.getElementById("h_busi");
						var busi_pattern = /^[0-9]{10,15}$/;
						
						if(busi.value == ''){
							alert("사업자 번호 입력 후 진행하세요!");
							busi.focus();
							return;
						}else if(!busi_pattern.test(busi.value)){
							alert("사업자 번호는 숫자 10~15자만 입력하세요!");
							busi.focus();
							return;
						}else{
							$.ajax({
								url:"${pageContext.request.contextPath}/admin/hotple/sameCheck",
								type:"post",
								data:{h_busi:busi.value},
								success: function show(data){
									const check = document.getElementById('check');
									const sub = document.getElementById('submit');
									check.innerText = '';
									
									if(data === 'true'){
										check.style.cssText="color: blue; font-size: 10px;";
										sub.disabled=false;
										busi.readOnly = true;
										data = "등록이 가능한 매장입니다.";
									}else{
										check.style.cssText="color: red; font-size: 10px;";	
										sub.disabled=true;
										data = "이미 등록된 매장입니다.";
									}
									
									check.innerText = data;
								}
							})
						}
						
					}
				</script>
				
				<div class="mi-one">
					<div class="mi-name">지역<font color="red">*</font></div>
					<div class="input-one" style="display: flex;">
						<div class="sbox">
							<select name="addr1_seq" class="scity" id="citykindz" onchange="citykindchange(this)">
								<option value="0">선택하세요</option>
								<c:forEach var="a1" items="${addr1 }">
									<option value="${a1.addr1_seq }">${a1.addr1_name }</option>
								</c:forEach>
							</select> 
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
						<div class="sbox" style="margin-left: 2%;">
							<select class="scity" id="citykindy" name="addr2_seq">
								<option value="0">선택하세요</option>
							</select> 
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
						<script>
						
						function  citykindchange(e) {
						$.ajax({
								url:"${pageContext.request.contextPath}/admin/hotple/area",
								type:"post",
								data:{addr1_seq:e.value},
								success: function sc(data) {
									let sity = document.querySelector('#citykindy');
									sity.innerHTML = '';
									data.forEach(s => {
										let newOp = document.createElement("option");
										newOp.value = s.addr2_seq;
										newOp.innerText = s.addr2_name;
										sity.appendChild(newOp);
									})
								}
								
							})
							 
						}
							
						</script>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">추가 설명</div>
					<div class="input-one" >
						<input type="text" name="h_info">
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">한줄 소개<font color="red">*</font></div>
					<div class="input-one" >
						<textarea name="intro"></textarea>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">메인 사진<font color="red">*</font></div>
					<div class="f-input" >
						<input type="file" name="photo" id="file"/>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">추가 사진</div>
					<div class="f-input" >
						<input type="file" name="photos" id="file" multiple />
					</div>
				</div>

				<div class="mi-one">
					<div class="mi-name">주소<font color="red">*</font></div>
					<div class="input-one" >
						<input id="addressii" name="addr" type="text" placeholder="검색할 주소" autocomplete="off">
					</div>
					<input style="margin-left:1%;" id="addrCheck" type="button" value="주소검색" onclick="searchAddress(); return false;">
					<input type="hidden" id="wi" name="wi">
					<input type="hidden" id="kyung" name="kyung">
				</div>
				<div id="map"></div>

				<div class="mi-one">
					<div class="mi-name">상세 주소</div>
					<div class="input-one">
						<input type="text" name="addr_detail" placeholder="상세 주소" autocomplete="off" >
					</div>
				</div>
				
				<script>
					var mapContainer = document.getElementById('map'),
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667),
					        level: 3
					    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption);
					var geocoder = new kakao.maps.services.Geocoder();
					var marker;
					
					function searchAddress() {
					    var address = document.getElementById('addressii').value;
					
					    geocoder.addressSearch(address, function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								var mapname = document.getElementById("mapname").value;
								
					            if (marker) {
					                // 기존 마커가 있으면 삭제
					                marker.setMap(null);
					            }
					
					            marker = new kakao.maps.Marker({
					                position: coords,
					                draggable: true, // 마커를 드래그 가능하도록 설정
					                map: map
					            });
								let latlng = marker.getPosition();
								
					            document.getElementById('wi').value = latlng.getLat();
					            document.getElementById('kyung').value = latlng.getLng();
					            getAddr(latlng.getLat(), latlng.getLng());
					            
					            // 마커 드래그 이벤트 처리
					            kakao.maps.event.addListener(marker, 'dragend', function() {
					                latlng = marker.getPosition();
									wi = latlng.getLat();
									kyung = latlng.getLng();
									getAddr(wi,kyung);
					            });
					
					            // 인포윈도우로 장소에 대한 설명을 표시합니다
					            var infowindow = new kakao.maps.InfoWindow({
					                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+mapname+'</div>'
					            });
					            infowindow.open(map, marker);
					
					            map.setCenter(coords);
					        } else {
					            alert("주소 검색에 실패하였습니다.");
					            $('#addressii').val('');
					        }
					    });
					}
					
			        function getAddr(lat,lng){
			            let geocoder = new kakao.maps.services.Geocoder();
		
			            let coord = new kakao.maps.LatLng(lat, lng);
			            let callback = function(result, status) {
			                if (status === kakao.maps.services.Status.OK) {
			                	
			                	if(result[0].road_address!=null){
			                		var road = result[0].road_address.address_name;
			                	}else{
			                		road = result[0].address.address_name;
			                	}
			                	$('#addressii').val(road);
			                }
			            }
			            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			        }
				</script>

				<div class="mi-one">
					<div class="mi-name">전화번호</div>
					<div class="input-one">
						<input type="text" name="tel" autocomplete="off">
					</div>
				</div>

				<div class="mi-thr">
					<div class="mi-name">홈페이지</div>
					<div class="input-one" >
						<input type="text" name="website" autocomplete="off">
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">찾아가는 법</div>
					<div class="input-one" >
						<textarea name="way"></textarea>
					</div>
				</div>
				<div class="mi-one" style="display: block;">
					<div class="mi-name">이용 시간</div>
					<div class="time-one">
						<div class="title-section">
							<div class="it-title1">오픈</div>
							<div class="it-title2">마감</div>
							<div class="it-title3">휴무 여부</div>
						</div>
							<c:forEach var="d" items="${day }">
								<div class="input-time1">
									<div class="it-day">${d.day_name }</div>
									<div class="input-time2" id="container${d.day_seq }">
										<div class="it-info">
											<input type="time" name="time${d.day_seq }"> <input type="time" name="time${d.day_seq }">
										</div>
									</div>
			
									<div class="input-time3">
										<input type="checkbox"
											class="input3-chbox" style="width: 30px;"
											id="tcheck_${d.day_seq }" onclick="toggleTextbox(this, ${d.day_seq})" name="hours_cate_seq_${d.day_seq }" value="3">
										<input type="button" value="+" class="itt3-btn" onclick="plusInput(${d.day_seq})">
									</div>
								</div>
							</c:forEach>
					</div>
				</div>
				
				<script>
				 	function toggleTextbox(checkbox, n) {
						var timeList = document.getElementsByName('time'+n);
						const checkbox_elem1 = document
								.getElementById('tcheck_'+n);
					    for (let i = 0; i < timeList.length; i++) {
					        timeList[i].disabled = checkbox_elem1.checked ? true : false;
					    }
					}
					
					function plusInput(n) {
					    // 새로운 input 요소 추가
					    const container = document.getElementById('container' + n);
					    const length = container.querySelectorAll('.it-info').length;
					    
					    if(length < 5){
						    const newInputDiv = document.createElement('div');
						    newInputDiv.classList.add('it-info');
						    newInputDiv.innerHTML = `<input type="time" name=time` + n + `> 
						    						<input type="time"  name=time` + n + `>
						                             <input type="button" class="xxx" value="X" style="width:auto;" onclick=removeInput(` + n +`)>`;
						    container.appendChild(newInputDiv);
					    }else{
					    	alert("5개까지 입력 가능합니다.");
					    }
					}
				
					function removeInput(n) {
					    const container = document.getElementById('container'+n);
					    const inputDivs = container.getElementsByClassName('it-info');
					    // 마지막 input 요소를 삭제
					    if (inputDivs.length > 1) {
					        container.removeChild(inputDivs[inputDivs.length - 1]);
					    }
					}
					
				</script>
				
				<div class="mi-one">
					<div class="mi-name">운영 시간</div>
					<div class="input-one" >
						<textarea name="h_runtime"></textarea>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">주문 마감</div>
					<div class="input-one">
						<input type="time" name="h_lastorder">
					</div>
				</div>
			</div>
			<div class="foot">
				<div class="ft-submit">
					<input class="fts-one" disabled="disabled" type="submit" value="맛집 등록" id="submit"> 
					<span class="fts-two">⭧</span>
				</div>
			</div>
		</form>
	</div>
	<div><input type="button" value="목록보기" onclick="location.href='${cpath}/admin/list?cate=2'"></div>
</body>
</html>

