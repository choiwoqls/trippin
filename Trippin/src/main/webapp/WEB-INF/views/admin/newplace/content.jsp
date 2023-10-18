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
}

.inner {
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
}

.hd-in {
	display: flex;
	height: 70px;
}

.hd-in img {
	width: 22px;
	height: 22px;
	margin-top: 5%;
	margin-left: 4%;
}

.hd-in h2 {
	margin-top: 4%;
	margin-left: 7%;
	font-weight: bold;
	font-size: 26px;
}

.hi-in {
	background-color: #F2F2F2;
	height: 60px;
	line-height: 60px;
	text-align: center;
	color: rgba(58, 58, 58, 0.7);
	font-weight: bold;
}

.main-top {
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
}

.mt-1, .mt-2, .mt-5, .mt-6, .mt-8 {
	padding-top: 4%;
}

.mt1-name, .mt2-name, .mt3-title, .mt5-title, .mt6-title, .mt8-name {
	font-size: 20px;
	font-weight: bold;
	margin-left: 10%;
}

.mi-name {
	margin-top: 10%;
	font-size: 17px;
	font-weight: bold;
}

.mi-imginput {
	margin-top: 10%;
}

.mi-sname {
	font-size: 13px;
	color: rgba(58, 58, 58, 0.7);
	margin-top: 1%;
}

.mt4-title {
	display: flex;
	flex-wrap: wrap;
	margin-left: 10%;
	margin-right: 10%;
}

.mt4t {
	font-size: 20px;
	font-weight: bold;
	width: 80%;
}

.mt3-stitle {
	font-size: 15px;
	color: rgba(58, 58, 58, 0.7);
	margin-top: 1%;
	margin-left: 10%;
}

.all-span {
	color: #4396FF;
	font-weight: bold;
	font-size: 16px;
	position: relative;
	bottom: 5px;
	left: 2px;
}

.mt-input, .mt2-area {
	margin-top: 1%;
	margin-left: 10%;
}

.mtit {
	height: 40px;
	font-weight: 500;
	padding-left: 2%;
	font-size: 18px;
	width: 85%;
	border: 1px solid #EEEEEE;
}

.mt2-area textarea {
	height: 80px;
	padding-left: 2%;
	padding-top: 2%;
	width: 85%;
	font-size: 18px;
	font-weight: bolder;
	border: 1px solid #EEEEEE;
	outline: none;
	resize: none;
}

.mt2-mapapi {
	margin-left: 10%;
	height: 450px;
}

.mt2-mapapi img {
	width: 87.5%;
	height: 400px;
}

.mt2-mapapi span {
	font-size: 26px;
	position: relative;
	bottom: 70px;
	color: red;
	font-weight: bold;
}

.mt3-area {
	height: 180px;
	padding-left: 2%;
	padding-top: 2%;
	width: 85%;
	font-size: 14px;
	font-weight: bolder;
	border: 1px solid #EEEEEE;
	outline: none;
	resize: none;
	margin-bottom: 15%;
}

textarea::placeholder {
	color: #EEEEEE;
	font-size: 20px;
	font-weight: bold;
}

.sarrow {
	position: absolute;
	top: 0;
	right: 0;
	z-index: 1;
	width: 35px;
	height: inherit;
	display: flex;
	justify-content: center;
	align-items: center;
}

.popimg {
	width: 50px;
	transition: 0.5s;
	background-color: white;
	margin-top: -15%;
}

.popimgz {
	width: 50px;
	background-color: white;
	transition: 0.5s;
	margin-top: -15%;
	transform: rotate(180deg);
}

#menus {
	display: none;
}

#popup1:checked+#menus {
	display: block;
}

#popup:unchecked+#menus {
	display: none;
}

#popup1 {
	display: none;
}

input[type=file]::file-selector-button {
	display: none;
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

.mi-imginput {
	display: flex;
}

.mi-one textarea {
	height: 100px;
	padding-left: 2%;
	padding-top: 2%;
	width: 95%;
	margin-top: 2%;
	font-size: 14px;
	font-weight: bolder;
	border: 1px solid #EEEEEE;
	outline: none;
	resize: none;
}

.popimg-co {
	position: absolute;
	top: 10;
	right: 35%;
}

.mt4t-stitle {
	margin-top: 5%;
	font-size: 13px;
	color: rgba(58, 58, 58, 0.7);
	font-weight: 500;
	line-height: 150%;
}

.mt5-stitle {
	margin-left: 10%;
	font-size: 13px;
	color: rgba(58, 58, 58, 0.7);
	margin-top: 1%;
}

.mt6-stitle {
	margin-left: 10%;
	font-size: 13px;
	color: rgba(58, 58, 58, 0.7);
	margin-top: 1%;
	width: 55%;
	display: flex;
}

.mt-input input {
	margin-top: 2%;
	height: 40px;
	font-weight: 500;
	padding-left: 2%;
	font-size: 18px;
	width: 85%;
	border: 1px solid #EEEEEE;
}

.mt6sy {
	position: relative;
	left: 20%;
	width: 15%;
	border-radius: 50%;
	appearance: none;
	border: 0px;
	background-color: #EEEEEE;
	display: none;
}

.mt6sy+label {
	width: 15%;
	left: 20%;
	border-radius: 50%;
	position: relative;
	background-color: #EEEEEE;
}

.mt6sy:checked+label {
	background-color: #4396FF;
}

.mt6sy:checked+label::after {
	content: '✔';
	font-size: 25px;
	width: 15%;
	text-align: center;
	color: white;
	margin-left: 20%;
}

.mt7s {
	margin-top: 8%;
	margin-left: 10%;
	margin-bottom: 5%;
	padding-top: 2%;
	padding-bottom: 2%;
	padding-left: 20%;
	padding-right: 20%;
	width: 80%;
	border: 0;
	cursor: pointer;
	color: white;
	background-color: #4396FF;
	font-weight: bold;
}
.mt7s2 {
    margin-top: 8%;
	border : 0;
    border-radius: 4px;
	margin-bottom: 5%;
	padding-top: 2%;
	padding-bottom: 2%;
	width : 39%;
	cursor: pointer;
	color: white;
	background-color: #4396FF;
	font-weight: bold;
}
.mti-sel {
	width: 88%;
	height: 50px;
	border: 1px solid #EEEEEE;
	font-size: 20px;
}

.mti-sel option {
	font-size: 20px;
}
.flexbtn-section {
    display : flex;
    justify-content: center;
    gap : 2%;
}
</style>
<script type="text/javascript">
function check(f) {
	var status = document.getElementById("status").value;
	
	
	if(status === ''){
		alert("승인여부를 선택해주세요!");
		return false;
	}
	
	f.submit();
}


function ChangeStatus(){
	var submitBtn = document.getElementById("submitBtn");
	
	submitBtn.disabled=false;
	
}

</script>
</head>
<body>
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<img
					src="data:image/png;base64,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">
				<h2>새로운 장소 등록</h2>

			</div>

		</div>
	</header>


	<div class="main">
		<form  action="${cpath}/admin/newplace/update" target="_parents" method="post" onsubmit="return check(this);">
		<input type="hidden" name="newplace_seq" value=${npvo.newplace_seq }>
		<input type="hidden" name="m_seq" value=${npvo.m_seq }>
			<div class="main-top">
				<div class="mt-1">
					<div class="mt1-name">
						장소명<span class="all-span">*</span>
					</div>
					<div class="mt-input">
						<input class="mtit" type="text" name="name" value="${npvo.name }"
							readonly="readonly">
					</div>
				</div>
				<div class="mt-2">
					<div class="mt2-name">
						주소<span class="all-span">*</span>
					</div>
					<div class="mt2-area">
						<textarea name="addr" readonly="readonly">${npvo.addr }</textarea>
					</div>

					<br>
					<div id="map" style="width: 80%; height: 350px; margin-left: 10%;"></div>

				</div>
				<div class="mt-8">
					<div class="mt8-name">
						카테고리<span class="all-span">*</span>
					</div>
					<div class="mt-input">
						<select class="mti-sel" name="kind" id="kind">
							<option value="1" ${npvo.kind=="1"?'selected':''}>관광지</option>
							<option value="2" ${npvo.kind=="2"?'selected':''}>맛집</option>
						</select>
					</div>
				</div>
				<div class="mt-3" style="margin-top: 3%;">
					<div class="mt3-title">
						이 장소는 어떤 곳인가요?<span class="all-span">*</span>
					</div>
					<div class="mt3-stitle">
						이 장소의 특징 또는 추천하는 이유를 간략히 설명해주세요.
						<textarea class="mt3-area" placeholder="특징 또는 추천 이유를 입력해주세요."
							name="reason" readonly="readonly">${npvo.reason}</textarea>
					</div>
				</div>
				<div class="mt-4">
					<div class="mt4-title">
						<div class="mt4t">사진 및 추가 정보를 입력해보세요.</div>
						<div class="mt4t-stitle">
							메뉴 및 이용료, 외관/내관 사진 등 장소를 확인할 수 있는 추가정보를 알려주세요.<br>사진은 직접 촬영한
							사진 또는 공식 홈페이지 사진만 사용할 수 있습니다.
						</div>
						<label class="popimg-co" for="popup1"><img id="pimg"
							class="popimg"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU"
							alt=""></label> <input type="checkbox" id="popup1"
							onclick="updown(this)">

						<div id="menus">
							<div class="menu">
								<div class="mi-one">
									<div class="mi-name">외관/내관 사진</div>
									<div>
										<c:forEach var="img" items="${img}">
											<a
												href="${cpath }/admin/download?file=${img}&path=${npvo.img}"
												download>${img }</a>
											<br>
										</c:forEach>
									</div>

								</div>
								<script>
									function updown(t) {
										const btn = document
												.getElementById("pimg");
										btnclass = btn.getAttribute('class');
										console.log(btnclass);
										if (btnclass === 'popimg') {
											btn.className = 'popimgz';
										} else {
											btn.className = 'popimg';
										}

									}
								</script>
								<div class="mi-one">

									<div class="mi-name">메뉴 및 이용료</div>
									<div class="mi-sname">맛집은 메뉴판/대표 메뉴 가격을, 관광지는 서비스 이용료를
										알려주세요.</div>
									<textarea placeholder="내용을 입력해주세요." name="info">${npvo.info}</textarea>
									<div class="mi-name">메뉴 및 이용료 사진</div>
									<div>
										<c:forEach var="info_img" items="${info_img}">
											<a
												href="${cpath }/admin/download?file=${info_img}&path=${npvo.info_img}"
												download>${info_img}</a>
											<br>
										</c:forEach>
									</div>
								</div>
								<div class="mi-one">
									<div class="mi-name">제공 서비스</div>
									<div class="mi-sname">예약 가능 여부, 한국어 가능 직원 여부, 해피아워 등 제공되는
										서비스의 자세한 내용을 알려주세요.</div>
									<textarea placeholder="내용을 입력해주세요." name="services">${npvo.services}</textarea>

								</div>
								<div class="mi-one">
									<div class="mi-name">기타 내용</div>
									<div class="mi-sname">홈페이지, 구글 장소 url 등 장소에 대한 기타 내용을
										알려주세요.</div>
									<textarea placeholder="내용을 입력해주세요." name="extra"
										readonly="readonly">${npvo.extra}</textarea>

								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="mt-5">
					<div class="mt5-title">이메일</div>
					<div class="mt5-stitle">입력해주신 이메일로 등록 검토 결과를 알려드립니다.</div>
					<div class="mt-input">
						<input type="email" placeholder="이메일 주소를 입력해주세요." name="email"
							readonly="readonly" value="${npvo.email }" />
					</div>

				</div>
				<div class="mt-6">
					<div class="mt6-title">이메일 수집 동의</div>
					<div class="mt6-stitle">
						<div class="mt6sz">장소 등록 검토 결과 안내를 위해 이메일을 수집하며, 1년간 보관후
							파기됩니다.</div>
						<input class="mt6sy" type="checkbox" />
						<c:if test="${npvo.email_status==1 }">
							<input type="checkbox" id="check1" checked="checked" />
						</c:if>
						<c:if test="${npvo.email_status==0 }">
							<input type="checkbox" id="check1" />
						</c:if>
						<label for="check1"></label>
					</div>
				</div>
				
				<div class="mi-name" align="center">
				<label for = status>승인 여부를 선택하세요</label>
				<br>
				<select id="status" name="status">
				<option value="">선택하세요</option>
				<option value="1"${npvo.status=='1'? 'selected' : '' }>승인</option>
				<option value="2" ${npvo.status=='2'? 'selected' : '' }>부적격</option>
			
				</select>
				<br>
				<label for ="memo">관리자 메모</label><br>
				<textarea class="mt3-area" id="memo" placeholder="승인/부적격 사유를 입력해주세요."
							name="memo" >${npvo.memo}</textarea>
				
				</div>
				

				<div class="mt-7">
					<div class="mt7-submit">
                        <c:if test="${npvo.status!=0 }">
                            <div class="flexbtn-section">
                                <input class="mt7s2" type="submit" value="처리완료" id="submitBtn" disabled="disabled">
                                <input class="mt7s2" type="button" value="상태수정하기" onclick="ChangeStatus();">
                            </div>
                        </c:if>
					<c:if test="${npvo.status==0 }">
						<input class="mt7s" type="submit" value="처리완료">
					</c:if>
					</div>
				</div>
			</div>

		</form>
	</div>




	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50a663b98a69e54c2f47df28be00018a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${npvo.addr}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>





</body>
</html>