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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="utf-8">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

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

#menus {
	display: none;
	border: 2px solid black;
	border-radius: 4px;
	margin-top: 3%;
}

#menus2, #menus3, #menus4, #menus5 {
	display: none;
	border: 0px;
	margin-top: 3%;
}

.menu {
	padding: 2px 5px;
	cursor: context-menu;
}

#popup1:checked+#menus, #popup2:checked+#menus2, #popup3:checked+#menus3,
	#popup4:checked+#menus4, #popup5:checked+#menus5 {
	display: block;
}

#popup1:unchecked+#menus, #popup2:unchecked+#menus2, #popup3:unchecked+#menus3,
	#popup4:unchecked+#menus4, #popup5:unchecked+#menus5 {
	display: none;
}

#popup1, #popup2, #popup3, #popup4, #popup5 {
	display: none;
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
	width : auto !important;
	height : auto !important;
	cursor : pointer;
	padding-top : 12%;
	padding-bottom : 12%;
	padding-left : 18%;
	padding-right : 18%;
	position : relative;
	top : -4.3vh;
	right : 6vw;
	background-color : white;
	border-radius : 5px;
}
.input3-chbox {
	position : relative;
	right : 8vw;
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
	
	if (kind == "0"){
		alert("카테고리를 선택해주세요.");
		return false;
	}
	if (name.value == ""){
		alert("매장명을 입력해주세요.");
		name.focus();
		return false;
	}
	if (addr1 == "0" || addr2 == "0"){
		alert("지역을 선택해주세요.");
		return false;
	}
	if (intro.value == ""){
		alert("한 줄 소개를 작성해주세요.");
		intro.focus();
		return false;
	}
	if (addr.value == ""){
		alert("주소를 검색하여 확인해주세요.");
		addr.focus();
		return false;
	}
	
	var inputTime = f.getElementsByClassName("input-time2");
	console.log(inputTime.length);
    for(var j = 0; j<inputTime.length ; j++){
    	console.log("여기??");
		var inputs = inputTime[j].getElementsByTagName("input");
		var inputElements = Array.from(inputs).filter(input => input.type ==="time");
		console.log("길이 : " + inputElements.length);
		var rest = document.getElementById("tcheck_" + (j+1)).checked;

		for(var i = 0; i<inputElements.length ; i++){
			if(inputElements[i].value == "" && rest == false){
				alert("영업시간을 올바르게 입력해주세요.");
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
						onclick="document.location.href='${cpath}/admin/main'"> > 관리자 > 관광지등록 > 신규 관광지 등록
				</div>
			</div>
		</div>
		<div class="title">
			<div class="title-img">
				<img src="https://play-lh.googleusercontent.com/G3tedZ7VBJZlDs3BRuY9lyy5YGjR_m-l0yaVsir2zhu-76o6tqLuDVhHa4OW5Ys80Ic">
			</div>
			<div class="mtitle">신규 관광지 등록</div>
			<div class="stitle">
				나를 아는 여행앱 &nbsp;
				<p class="stitle-p">Trippin'</p>
			</div>
		</div>
	</header>
	<div class="main">
		<form action="${cpath }/admin/tour/insert" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
			<input type="hidden" name="cate_seq" value="1">
			<input type="hidden" id="f_seq" name="f_seq" value="${f_seq }">
			<div class="minfo">
				<div class="mi-one">
					<div class="mi-name">카테고리</div>
					<div class="input-one" style="margin-left: 25%;">
						<div class="sbox">
							<select name="kind" class="scity" id="citykindz">
								<option value="0">선택하세요</option>
								<c:forEach var="cate" items="${tcatelist }">
									<option value="${cate.t_cate_seq }">${cate.t_cate_name }</option>
								</c:forEach>
							</select>
							<span class="sarrow">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU" alt="">
							</span>
						</div>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">상호명</div>
					<div class="input-one" style="margin-left: 26.2%;">
						<input type="text" name="name" id="mapname">
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">지역</div>
					<div class="input-one" style="margin-left: 27.3%; display: flex;">
						<div class="sbox">
							<select class="scity" name="addr1_seq" id="citykindz" onchange="citykindchange(this)">
								<option value="0">선택하세요</option>
								<c:forEach var="a1" items="${addr1list }">
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
								url:"${pageContext.request.contextPath}/admin/area",
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
					<div class="mi-name">메인 사진
						<br>
						<font size="2px" color="#BABABA">메인 사진은 목록에 보이는 대표 사진이됩니다.</font>
					</div>
					<div class="" style="margin-left: 10.5%; margin-top: 1.5%;">
						<input type="file" name="photo" id="file"/>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">한줄 소개</div>
					<div class="input-one" style="margin-left: 24.19%;">
						<textarea name="intro"></textarea>
					</div>
				</div>
				
				
				<div class="mi-one" style="display : block; ">
					<div class="mi-name">상세 정보
						<br>
						<font size="2px" color="#BABABA">관광지를 홍보하는 글을 작성해주세요.</font>
					</div>
					<div class="input-one" style="width : 80%; margin-left : 10%;">
						<textarea id="summernote" name="info" rows="150" cols="100"></textarea>
					</div>
				</div>
				
				<div class="mi-one">
					<div class="mi-name">추가 사진
						<br>
						<font size="2px" color="#BABABA">추가 사진은 상세페이지에서 확인가능합니다.</font>
					</div>
					<div class="" style="margin-left: 2.09%; margin-top: 1.5%;">
						<input type="file" name="files" id="file" multiple="multiple" />
					</div>
				</div>

				<div class="mi-one">
					<div class="mi-name">주소</div>
					<input class="input-one" style="margin-left: 19.01%; display:flex;" name="addr" id="addressii" type="text" placeholder="검색할 주소">
					<input id="addrCheck" type="button" value="주소검색" onclick="searchAddress(); return false;">
					<input type="hidden" id="wi" name="wi">
					<input type="hidden" id="kyung" name="kyung">
				</div>
				<!-- <div id="map" style="width:500px;height:500px;"></div> -->
				
				
				<!-- 	<form onsubmit="searchAddress(); return false;">
				    <input type="text" id="addressInput" placeholder="주소를 입력하세요">
				    <input type="submit" value="주소 검색">
				</form> -->
				
				<div id="map" style="width:50%;height:350px; margin-left:26%;"></div>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50a663b98a69e54c2f47df28be00018a&libraries=services"></script>
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
							var mapname = document.getElementById('mapname').value;
							
				            if (marker) {
				                // 기존 마커가 있으면 삭제
				                marker.setMap(null);
				            }
				
				            marker = new kakao.maps.Marker({
				                position: coords,
				                draggable: true, // 마커를 드래그 가능하도록 설정
				                map: map
				            });
							var latlng = marker.getPosition();
							
				            console.log("검색 위도: " + latlng.getLat() + ", 검색 경도: " + latlng.getLng());
				            document.getElementById('wi').value = latlng.getLat();
				            document.getElementById('kyung').value = latlng.getLng();
							console.log("보낼위도:"+document.getElementById('wi').value+",보낼경도:"+kyung);
							console.log(document.getElementById('wi').value);
				
				            // 마커 드래그 이벤트 처리
				            kakao.maps.event.addListener(marker, 'dragend', function() {
				                latlng = marker.getPosition();
				                console.log("마커 이동 후 위도: " + latlng.getLat() + ", 경도: " + latlng.getLng());
								wi = latlng.getLat();
								kyung = latlng.getLng();
				            });
				
				            // 인포윈도우로 장소에 대한 설명을 표시합니다
				            var infowindow = new kakao.maps.InfoWindow({
				                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+mapname+'</div>'
				            });
				            infowindow.open(map, marker);
				
				            map.setCenter(coords);
				        } else {
				            alert("주소 검색에 실패하였습니다.");
				        }
				    });
				}
				</script>
								
				
				
				
				<!-- <div class="mi-one">
					<input type="text" id="addr" name="addr" readonly="readonly">
					<input type="hidden" id="wi" name="wi">
					<input type="hidden" id="kyung" name="kyung">
				</div> -->
				<div class="mi-one">
					<div class="mi-name">상세 주소</div>
						<input type="text" name="addr_detail" placeholder="상세 주소" class="input-one" style="margin-left: 16.51%; display:flex;">
				</div>
				
				<div class="mi-one">
					<div class="mi-name">전화번호</div>
					<div class="input-one" style="margin-left: 16.37%;">
						<input type="text" name="tel">
					</div>
				</div>

				<div class="mi-thr">
					<div class="licens">홈페이지</div>
					<div class="input-thr" style="margin-left: 16.37%;">
						<input type="text" name="website">
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">찾아가는 법</div>

					<div class="input-one" style="margin-left: 14.57%;">
						<textarea name="way" placeholder="예)지하철 3호선 안국역에서 도보 12분&#13;&#10;협재 해수욕장에서 차로 5분"></textarea>
					</div>
				</div>
				<div class="mi-one" style="display: block;">
					<div class="mi-name">이용 시간</div>
					<div class="it-title1">오픈</div>
					<div class="it-title2">마감</div>
					<div class="it-title3">휴무 여부</div>
					
					<c:forEach var="d" items="${daylist }">
						<div class="input-time1" style="margin-top:-1%">
						<div class="it-day">${d.day_name }</div>
						<div class="input-time2" id="container${d.day_seq }">
							<div class="it-info">
								<input type="time" name="time${d.day_seq }"> <input type="time" name="time${d.day_seq }">
							</div>
						</div>

						<div class="input-time3">
							<input type="checkbox"
								style="width: 30px;" class="input3-chbox"
								id="tcheck_${d.day_seq }" onclick="toggleTextbox(this, ${d.day_seq})" name="hours_cate_seq_${d.day_seq }" value="3">
							<input type="button" value="+" class="itt3-btn" onclick="plusInput(${d.day_seq})">
						</div>
					</div>
					</c:forEach>
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
						                             <input type="button" value="X" style="width:auto;" onclick=removeInput(` + n +`)>`;
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
					<div class="mi-name">영업 추가 정보</div>
					<div class="input-one" style="margin-left: 16.15%;">
						<textarea name="run_info"></textarea>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">이용료</div>
					<div class="input-one" style="margin-left: 20.85%;">
						<textarea name="use_fee" placeholder="예)성인(만 25세 이상) 1,000원&#13;&#10;만 24세 이하, 만 65세 이상 무료"></textarea>
					</div>
				</div>
				<div class="mi-one">
					<div class="mi-name">기간별 운영시간</div>
					<div class="input-one" style="margin-left: 15.85%;">
						<textarea style="height : 15vh;" name="term_hours"></textarea>
					</div>
				</div>
				
			
				
				
				
				
				
				
			</div>
			<div class="foot">
				<div class="ft-submit">
					<input class="fts-one" type="submit" value="다음으로"> 
					<span class="fts-two">⭧</span>
				</div>
			</div>
		</form>
	</div>
	
	
	<script type="text/javascript">
		//summernote 부분 
		function textEdit(){
		   jsonArray = [];
		   
		   $('#summernote').summernote({
		         height: 500,                 // 에디터 높이
		         minHeight: null,             // 최소 높이
		         maxHeight: null,             // 최대 높이
		         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		         lang: "ko-KR",					// 한글 설정
		        toolbar: [
		           // [groupName, [list of button]]
		           ['fontname', ['fontname']],
		           ['fontsize', ['fontsize']],
		           ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		           ['color', ['forecolor','color']],
		           ['table', ['table']],
		           ['para', ['ul', 'ol', 'paragraph']],
		           ['height', ['height']],
		           ['insert',['picture','link','video']],
		           ['view', ['fullscreen', 'help']]
		         ],
		       fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		       fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		       callbacks: {
		         onImageUpload : function(files){
		        	   console.log("onImageUpload", JSON.stringify(files));
		               // 파일 업로드(다중업로드를 위해 반복문 사용)
		               for (var i = files.length - 1; i >= 0; i--) {
		                   uploadSummernoteImageFile(files[i], this);
		               }
		          }
		    } 
		 });
		
		   $('#summernote').summernote('fontSize', '24');
		
		   function uploadSummernoteImageFile(file, el) {
		       var data = new FormData();	
		       var f_seq = document.getElementById("f_seq").value;
		       data.append("file",file);
		           $.ajax({
		             url: '${ pageContext.request.contextPath }/summer_image?f_seq='+f_seq,
		             type: "POST",
		             enctype: 'multipart/form-data',
		             data: data,
		             cache: false,
		             contentType : false,
		             processData : false,
		             success : function(data) {
		                       var json = JSON.parse(data);
		                       console.log(json);
		                       $(el).summernote('editor.insertImage',json["url"]);
		                           jsonArray.push(json["url"]);
		                           jsonFn(jsonArray);
		                   },
		                   error : function(e) {
		                       console.log(e);
		                   }
		               });
		           }
		
		}
		
		function jsonFn(jsonArray){
			console.log(jsonArray);
		}
		
		$(document).ready(textEdit());	
		
		</script>
	
	
</body>
</html>

