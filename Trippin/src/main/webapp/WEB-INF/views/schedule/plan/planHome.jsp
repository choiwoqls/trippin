<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>
<style>

	button{
		border : 0;
		cursor: pointer; 
        padding-top : 0.6%;
		padding-bottom : 0.6%;
		padding-left : 1.2%;
		padding-right : 1.2%;
		border-radius: 5px;
		margin-right : 0.5%;
		font-weight : bold;
		background-color : #04CFD4;
		color : white;
	}
	
	body {
		margin : 0;
	}
	
	.top_sec{
		background-color : #04CFD4;
        color : white;
        font-weight: bold;
		height: 25vh;
		width: 100%;
		border : 1px solid;
		font-size: 15pt; 	
	}
	

	.top_1{
		/* background-color: maroon; */
		margin-top : 1.5%;
		margin-left : 2%;
		display: flex;
	}
	
	.title{
		/* background-color: orange; */
		font-size : 20pt;
	}
	.edit{
		/* background-color: red; */
		margin-left : 5%;
	}
	
	.top_2{
		/* background-color: blue; */
		margin-top : 3%;
		margin-left : 2%;
		display: flex;
	
	}
	
	.top_3{
/* 		background-color: fuchsia; */
		margin-top : 1%;
		margin-left : 2%;
		display: flex;
	}
	
	.top_3a{
		padding-left:1%;
		padding-right:1%;
        padding-top : 0.2%;
        padding-bottom : 0.2%;
		border-radius: 15px;
		cursor: pointer;
		margin-right: 1%;
		border: 2px solid;
        font-weight: 500 !important;
        font-size : 18px;
		
	}
    .top_3a:hover {
        color : #04CFD4;
        background-color: white; 
    }
	
	.bot_sec{
/* 		background-color: gray; */
		width : 100%;
	}
	
	.bot_1{
/* 		background-color: green; */
		
		display: flex;
		height: 6vh;
        line-height: 6vh;
	}
	
	.mvBtn{
		width: 30px; 
		
		cursor: pointer;
	}
	
	.bot_2{
	
/* 		background-color: lime; */
	
	}
	
	.map{
        padding-top : 1%;
/* 		background-color: yellow; */
		height: 300px;
		width: 100%;
	}
	
	.flist{
/* 		background-color: purple; */
		border: 1px solid;
		margin-top : 0.3%;
		margin-bottom : 0.3%;
		height: 63px;
		width : 100%;
		cursor: pointer;
	}
	
	.fnum{
		height: 63px;
		border: 1px solid;
		margin-top : 0.3%;
		margin-left: 1%;
		margin-right: 3%;
		width: 40px;
		align-content: center;
	}
	
	.fAdd{
/* 		border: 1px solid; */
		margin-left: 8%;
		margin-bottom: 0.3%;
	}
	
	.fdel{
		margin-top : 1.5%;
		border: 1px solid; 
		width: 50px; 
		height: 50px; 
		margin-left: 82%;
		cursor: pointer;
	}
	
	.add{
		margin-bottom: 3%;
		cursor: pointer;
	 	align-content: center;
	 	background-color: silver;
		width : 80px;
		/* border: 1px solid; */
	}
	
	.nodis{
		display: none;
	}
    .b1-img1 {
        width : 25px;
        padding-top : 1.2vh;
    }
    .b1-img2 {
        width : 25px;
        transform: rotate(180deg);
        padding-bottom : 1.2vh;
        
    }
</style>

<script>

	function createInput(type, name, value) {
		const input = document.createElement("input");
		input.setAttribute("type", type);
		input.setAttribute("name", name);
		input.setAttribute("value", value);
		return input;
	}

	function moveDay(i) {
		const lday = document.getElementById("lday").value;
		console.log(lday);
		
		if(i>0 && i<=lday	){
			const form = document.getElementById("planHomeForm");
			form.action += "schedule/plan/planHome";
			var input = createInput("hidden","day_no",i);
			form.appendChild(input);
			form.submit();
		}else{
			return;			
		}
	}
	
	function goHome() {
	
			const form1 = document.getElementById("planHomeForm");
			form1.action += "schedule/sche/scheHome";
			var input1 = createInput("hidden", "addr1_seq1",-1);
			form1.appendChild(input1);
			form1.submit();

	}
	
	function showAdd(i) {
		const fa = document.getElementById("fa"+i);
		const fd = document.getElementById("fd"+i);
		const fadc = document.querySelectorAll(".fAdd");
		const fddc = document.querySelectorAll(".fdel");
		const faC = fa.className;
		console.log(faC);

		if(faC !='nodis'){
			fa.className = "nodis";
			fd.className = "nodis";
		}else{
			fa.className = "fAdd";
			fd.className = "fdel";
		}
		
		if(fadc.length != 0){
			for(var i=0; i<fadc.length; i++){
				fadc[i].className = "nodis";
				fddc[i].className = "nodis";
			}			
		}	
	}
	
	function goNext(item) {
		const form = document.getElementById("planHomeForm");
		const s_seq = document.getElementById("s_seq").value;
		var ty = false;
		var url = "";
		
		switch(item){
		case 'invite':
			url = "schedule/sche/partner/partnerList";
			break;
		case 'acc':
			url = "";			
			break;
		case 'check' :
			url = "schedule/checklist/insertForm";
			break;
		case 'cost':
			url = "schedule/cost/costHome";
			var input1 = createInput("hidden", "day_no",0);
			form.appendChild(input1);
			var input2 = createInput("hidden", "alone",0);
			form.appendChild(input2);
			break;
		case 'place' :
			ty = true;
			url = "${pageContext.request.contextPath}/schedule/search/rec?cate_seq=-1&&addr1_seq=-1&&s_seq="+s_seq+"&&day_no=";
			var width = 1000;
			var height = 700;
			break;
		case 'memo' :
			ty = true;
			url  = "${pageContext.request.contextPath}/schedule/plan/dayMemo?s_seq="+s_seq+"&&day_no=";			
			var width = 600;
			var height = 500;
			break
		case 'slog':
			url = "slog/saveCheck";
			const planCnt = Number(document.getElementById("planCnt").value);
			console.log(planCnt);
			if(planCnt < 12){
				alert("12개 이상 장소가 포함된 일정만 여행기로 만들 수 있습니다.");
				return;
			}else{
				if(!window.confirm("여행기를 작성하시겠습니까 ?")){
					return;
				}
			}
		}	
		if(ty){
			var dn = document.getElementById("day_no").value;
			url += dn;
			
			var windowFeatures = 'width=' + width + ',height=' + height;
			
			window.open(url, '_blank', windowFeatures);
			
		}else{
			form.action+=url;
			form.submit();				
		}
		
	}
	
	
	function addPs(item, i) {
		console.log(item, i);
		var method = "";
		var url = "";
		var check = false;
		
		switch(item){
		case 'time':
			method = "new";
			url = "${pageContext.request.contextPath}/schedule/plan/addForm?plan_seq="+i+"&&check="+check;
			break;
		case 'memo':
			check = true;
			method = "new";
			url = "${pageContext.request.contextPath}/schedule/plan/addForm?plan_seq="+i+"&&check="+check;
			break;	
		case 'cost':
			method = "form";			
			url = "schedule/cost/addCost";
			break
		case 'del' :
			const qus = window.confirm("이 일정을 삭제 하시겠습니까 ?")
			if(!qus){
				return;
				break;
			}
			method = "ajax";
			url = "${pageContext.request.contextPath}/schedule/plan/del";
			break;
			
		}
		if(method == "form"){
			//form 넘기기
			const form = document.getElementById("planHomeForm");
			form.action+=url;
			var input2 = createInput("hidden","plan_seq", i);
			var input = createInput("hidden","day_no", document.getElementById("day_no").value);
			form.appendChild(input2);
			form.appendChild(input);
			form.submit();
		}else if(method == "new"){
			//새창 띄우기
			var width = 600;
			var height = 550;
			
			var windowFeatures = 'width=' + width + ',height=' + height;
			
			window.open(url, '_blank', windowFeatures);
			
		}else{
			//ajax
			const param = "plan_seq="+i;
			
			sendRequest(url, param, resultFn, "POST");
		}
		
	}
		function resultFn() {
    		if(xhr.readyState == 4 && xhr.status == 200){
    			var data = xhr.responseText;
    			if(data ==='일정 삭제 성공'){    			
    			}else{
    			}           			
    				alert(data);
    				location.reload();			
    		}else{
    			console.log('ajax 오류');
    		}
		}
</script>

<meta charset="UTF-8">
<title>나만의 일정짜기</title>
</head>
<body>
<input type="hidden" id="planCnt" value=" ${planCnt}">
<input type="hidden" id="day_no" value=" ${info.day_no }">
<input type="hidden" id="lday" value="${info.DAY }">
<form action="${pageContext.request.contextPath }/" method="post" id="planHomeForm">	
	<input type="hidden" id="s_seq"  name="s_seq" value="${info.S_SEQ }">
</form>
<div class="top_sec">
	<div class="top_1">
		<div class="title">${info.TITLE }</div>
		<div class="edit">편집</div>
		<div style="margin-left: 55%; width: 60px; cursor: pointer;" align="center" onclick="goNext('slog')"> 여행기</div>
		<div style="margin-left: 5%; width: 60px; cursor: pointer;" align="center" onclick="goHome()"> HOME </div>
	</div>
	<div class="top_2">
		<div class="cate">카테고리</div>
	</div>
	<div class="top_3">
		<div class="top_3a" onclick="goNext('invite')">일행초대</div>
		<div class="top_3a" onclick="goNext('acc')">숙소 + </div>
		<div class="top_3a" onclick="goNext('check')">체크리스트</div>
		<div class="top_3a" onclick="goNext('cost')">가계부</div>
	</div>
</div>
<div class="bot_sec">
	<div class="bot_1">
	<div style="display: flex; margin-left: 39%;" align="center">
		<div class="mvBtn" id="mvB${info.day_no +1 }" onclick="moveDay(${info.day_no -1})"><img class="b1-img1" src="https://cdn-icons-png.flaticon.com/512/959/959160.png"></div>
		<div style="width: 300px;">DAY ${info.day_no }</div>
		<div class="mvBtn" id="mvB${info.day_no +1 }" onclick="moveDay(${info.day_no +1})"><img class="b1-img2" src="https://cdn-icons-png.flaticon.com/512/959/959160.png"></div>
	</div>
	</div>
	<div class="bot_2">
		<c:choose>
			<c:when test="${name == '' }">
			</c:when>
			<c:otherwise>
				<div id="map" class="map">지도 영역</div>			
			</c:otherwise>
		</c:choose>
		<div>
		<!-- for -->
		<c:forEach var="map" items="${plist }" varStatus="i">
		<c:choose>
			<c:when test="${map.KIND == '메모' }">
			<div style="display: flex; border: 1px solid; margin-top : 0.5%; margin-bottom : 0.5%;">
				<div class="fnum" align="center" >${i.index+1}<br>
					<font size="2px;" color="gray">${map.TIME }</font>
				</div>
				<div class="flist"  id="fl${i.index }" onclick="showAdd(${i.index})">			
				 ${map.MEMO }<br><br>
				 ${map.KIND } 
				</div>
			</div>
			<div class="nodis"  style="display: flex;">
			<div class="nodis" id="fa${i.index }" >
					
				</div>
				<div class="nodis" id="fd${i.index }" align="center" onclick="addPs('del',${map.PLAN_SEQ})"> 
					삭제
				</div>			
			</div>
			</c:when>
			<c:otherwise>
			<div style="display: flex; border: 1px solid;">
				<div class="fnum" align="center" >${i.index+1}<br>
					<font size="2px;" color="gray">${map.TIME }</font>
				</div>
				<div class="flist"  id="fl${i.index }" onclick="showAdd(${i.index})">			
				 ${map.NAME }<br>
				 ${map.KIND } - ${map.ADDR2_SEQ } <br>
				<font size="2px;" color="gray">${map.MEMO	 }</font>
				</div>
			</div>
			<div class="nodis"  style="display: flex;">
				<div class="nodis" id="fa${i.index }" >
					<div class="add" onclick="document.location.href='${pageContext.request.contextPath }/member/${map.url }'" >바로 가기</div>
					<div class="add" onclick="addPs('time',${map.PLAN_SEQ})">시간 입력</div>
					<div class="add" onclick="addPs('memo',${map.PLAN_SEQ})">메모 입력</div>
					<div class="add" onclick="addPs('cost',${map.PLAN_SEQ})">비용 추가</div>
				</div>
				<div class="nodis" id="fd${i.index }" align="center" onclick="addPs('del',${map.PLAN_SEQ})"> 
					삭제
				</div>			
			</div>
			</c:otherwise>
		</c:choose>
		</c:forEach>
			<input style="display: none;" type="hidden" id="name" value="${name }">
			<input style="display: none;" type="hidden" id="wi" value="${wi }">
			<input style="display: none;" type="hidden" id="kyung" value="${kyung }">
		<!-- end -->			
			<div style="margin-left: 45%; padding-top : 2%; padding-bottom : 1%;">
				<button onclick="goNext('place')">장소추가</button>
				<button onclick="goNext('memo')">메모추가</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54edfe10e632867778f01053322746d0"></script>
<script>
	var nv = document.getElementById("name").value.split("/");
	var wv = document.getElementById("wi").value.split("/");
	var kv = document.getElementById("kyung").value.split("/");
	
	console.log(wv);
	console.log(kv);
	
	console.log(nv.length);

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(wv[0], kv[0]), // 지도의 중심좌표
	    level: 6 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [];
	
	for (var j = 0; j < nv.length; j++) {
	    positions.push({
	        content: '<div>' + '('+(j+1)+')'+ nv[j] + '</div>',
	        latlng: new kakao.maps.LatLng(wv[j], kv[j])
	    });
	}

	
	for (var i = 0; i < positions.length; i ++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng // 마커의 위치
	});
	
	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	return function() {
	    infowindow.open(map, marker);
	};
	}
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	return function() {
	    infowindow.close();
	};
	}

</script>
</body>
</html>