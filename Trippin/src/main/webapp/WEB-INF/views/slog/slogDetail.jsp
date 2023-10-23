<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행기</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
</script>
<style>

	body{
		margin: 0;
		background-color : #F2F2F2;
	}
	
	.major {
		margin-left : 15%;
		margin-right : 15%;
		padding-top: 1%;
		padding-left : 2%;
		padding-right : 2%;
		padding-bottom : 7%;
		background-color : white;
		height : auto;
	}
	
	.top{
		border-bottom: 1px solid silver;
		padding-bottom: 3px;
	}
	
	.topF{
		justify-content : space-between;
		display: flex;
	}
	
	.home{
		font-weight: bold; 
		cursor: pointer;
	}
	
	.another{
		font-weight: bold; 
		cursor: pointer;
	
	}
	
	.mid{
		padding-top: 15px;
		width: 38vw;
		padding-left: 230px;
	}
	
	.midT{
	
	}
	
	.editMenu{
	  	border: 1px solid;
	    border-radius: 5px;
	    position: absolute;
	    left: 69%;
	    background-color: white;
	    width: 3vw;
	    height: auto;
	    top: 11%;
	}
	
	.editSel{
	    /* border: 1px solid; */
   		cursor: pointer;
	}
	
	.editSel:hover {
    background-color: #368FFF;
    color: white;
    border-radius: 5px;
	}
	
	.midMain{
	
	}
	
	.main{
		width: 38vw;
		
		
	}
	
	.mainP{
		border: 1px solid;
		height: 45vh;
	}
	
	.mainT{
		font-size: 15pt;
		padding-top : 10px;
		font-weight: bold;
	}
	
	.mainC{
		padding-top : 10px;
		height: auto;
	}
	
	.mainF{
		justify-content: space-between;
		display: flex;
		/* border: 1px solid; */
		width: 38vw;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.Btn{
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		border: 1px solid silver;
		width: 18vw;
		text-align: center;
	}
	
	.dayBtn{
		-o-appearance: none;
	  	-webkit-appearance: none;
	  	-moz-appearance: none;
	  	appearance: none;
		outline:none;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		border: 0;
		width: 18vw;
		text-align: center;
		height: 2vh;
		font-size: 12pt;
	}
	
	.cosBtn{
		text-align: center;
		border-radius: 5px;
		cursor: pointer;
		border: 1px solid;
		width: 15vw;
	
	}
	
	.midDay{
	
	}
	
	.mdTop{
	
	}
	
	.mdtF{
		display: flex;
		padding-top: 10px;
		padding-bottom:  10px;
		font-size: 16pt;
	}
	
	.line {
		padding-top: 10px;
	    border-bottom: 10px solid #EFEFEF;
	    height: 1vh;
	}
	
	.day{
		font-weight: bold;
	}
	
	.partition{
		text-align: center;
		width: 1vw;
	}
	
	.date{
		font-weight: bold;
	
	}
	
	.dayC{
		padding : 10px;
		width: 37vw;
		height: auto;
	}
	
	.dayMap{
		width: 38vw;
		height: 20vh;	
	}
	
	.placeFor{
	
	}
	
	.placeF{
		padding : 10px;
		width: 38vw;
		display: flex;
	}
	
	.placeG{
	    border: 1px solid white;
	    color: white;
	    background-color: #975FFE;
	    border-radius: 45px;
	    text-align: center;
	    font-size: 14pt;
	    width: 1vw;
	    height: 2vh;
	    line-height: 2vh;
	    font-weight : bold;
	    display: inline-block;
	    padding: 3px;
	}
	.placeM{
	    border: 1px solid white;
	    color: white;
	    background-color: #FF6169;
	    border-radius: 45px;
	    text-align: center;
	    font-size: 14pt;
	    width: 1vw;
	    height: 2vh;
	    line-height: 2vh;
	    font-weight : bold;
	    display: inline-block;
	    padding: 3px;
	}
	.placeA{
	    border: 1px solid white;
	    color: white;
	    background-color: #26CEC2;
	    border-radius: 45px;
	    text-align: center;
	    font-size: 14pt;
	    width: 1vw;
	    height: 2vh;
	    line-height: 2vh;
	    font-weight : bold;
	    display: inline-block;
	    padding: 3px;
	}
	
	.placeI{
		padding-left: 20px;
	}
	
	.placeInfo{
		cursor: pointer;
	}
	
	.placeT{
		font-weight: bold;
	}
	
	.placeF2{
		display: flex;
		color: silver;
		font-size: 10pt;
	}
	
	.placeType{
	
	}
	
	.placeAddr2{

	
	}
	
	.placeS{
   		width: 25vw;
	}
	
	.stars{
		
	}
	
	.placeC{
		width: 32vw;
		height: auto
	}
	
	.placeP{
	
	}
	
	.bot{
		width: 38vw;
		padding-top: 15px;
		padding-left: 230px;
	}
	
	.botT{
	
	}
	
	.botF{
		width: 38vw;
		height: 5vh;
		line-height: 5.5vh;
	}
	
	.slogAdd{
		font-weight: bold;
		border: 1px solid;
		width: 38vw;
		background-color: #368FFF;
		color: white;
		border-radius: 8px;
		text-align: center;
		cursor: pointer;
		height: 5vh;
	}
	
	
	.slogAddSu{
		padding-top: 10px;
		padding-bottom: 10px;
		font-weight: bold;
		text-align: center;
		width: 38vw;
	}
	
	.cate{
		padding-top: 10px;
		padding-bottom: 20px;
		width: 38vw;
		color: grey;
	
	}
	
	.member{
		display: flex;
		border-bottom: 10px solid #EFEFEF;
		width: 38vw;
		padding-bottom: 30px;
	}
	
	.mP{
		text-align :center;
		line-height : 5vh;
		border-radius: 30px;
		width: 2.5vw;
		height: 5vh;
	}
	
	.mI{
		cursor: pointer;
		padding-top: 2px;
		padding-left: 15px;
	}
	
	.mN{
		font-weight: bold;
	}
	
	.mL{
		color: silver;
	}
	
	.menu{
		width: 38vw;
		padding-top: 2%;
	}
	
	.menuF{
		border-bottom: 1px solid silver;
		padding-bottom: 2%;
		display: flex;
		justify-content: space-between;
		color: silver;
		height: 2.5vh;
	}
	
	.menuF1{
		width : 10vw;
		justify-content: space-around;
		display: flex;
	}
	
	.likeS{
		cursor: pointer;
	}
	
	.img{
		position: relative;
	    width: 1vw;
	    top: 3px;
	    color: silver;
	}
	
	
	.cmtS{
	
	}
	
	.addS{
	
	}
	
	.menuF2{
		display: flex;
		justify-content: space-around;
		width: 5vw;
	}
	
	.when{
		font-size: 11pt;
	}
	
	.edit{
		cursor: pointer;
	}
	
	.cmt{
		height: auto;
			
	}
	
	.mCmt{
	    margin-top: 1%;
	    padding-top: 2%;
	    display: flex;
	    justify-content: space-between;
	    border-bottom: 1px solid silver;
	}
	
	.mcF{
		display: flex;
	}
	
	.mcP{
	
	}
	
	.mcM{
	    width: 29vw;
	    padding: 1%;
	    padding-left: 3%;
	}
	
	.mcN{
		font-weight: bold
	}
	
	.mcC{
	    padding-top: 1%;
	    padding-bottom: 1%;
	    width: 27vw;
	    height: auto;
	    font-weight: bold;
		font-size: 12pt;
	}
	
	.mcA{
		color: silver;
	    width: 9vw;
	    display: flex;
	    justify-content: space-around;
	}
	
	.mcL{
		cursor: pointer;	
	}
	
	.mcCmt{
		cursor: pointer;
	}
	
	.mcMenu{
		color: silver;
		display: flex;
	}
	
	.mcDate{
		font-size: 11pt;
	}
	
	.cmtF{
		border-top : 1px solid silver;
		color: silver;
		display: flex;
		justify-content: space-between;
		height: auto;
	}
	
	.cmtInput{
		font-weight: bold;
	    outline: none;
	    width: 33vw;
	    height: auto;
	    border: 0;
	    font-size: 12pt;
	    color: black;
	    padding: 2%;
	   	resize: none;
	}
	
	.cmtBtn{
	    padding: 2%;
		width : 3vw;
		cursor: pointer;
		color: #368FFF;
	}
	
	.profile{
		position: relative;
		width: 2.3vw;
	}
	
	scroll-behavior:smooth;
	
</style>
<script>

	function lgCheck() {
		const lgcheck = document.getElementById("lgcheck").value;
		if(lgcheck == "false"){
			alert("로그인이 필요한 서비스 입니다. ");
			return false;
		}else{
			return true;
		}
	}
	
	  function copyPlan(day, slog) {				
			if(this.lgCheck){
				const check = window.confirm("일정에 추가 하시겠습니까 ? ");
				if(check){
					var width = 600;
					var height = 650;
					
					var windowFeatures = 'width=' + width + ',height=' + height;
					
					var url = '${pageContext.request.contextPath}/slog/chooseSche?slog_seq='+slog+'&&day_slog_seq='+day;
					
					window.open(url, '_blank', windowFeatures);
				}
			}
		}
	  
	  function changeDay() {
		const day = document.getElementById("daySelect");
		
		const result = day.options[day.selectedIndex].value;
		console.log(result);
		
		const ddv = document.getElementById("day"+result);
		ddv.scrollIntoView({behavior: 'smooth'});
	}
	  
	  function slogCourse() {
		const form = document.getElementById("slogDetailForm");
		form.action = "${pageContext.request.contextPath}/slog/slogCourse";
		form.submit();
	}
	  
	  function addLike(i) {
		if(this.lgCheck){
			var url = "${pageContext.request.contextPath}/slog/slogLike";
			var param = "slog_seq="+i;
			
			sendRequest(url, param, resultFn, "POST");
			
		}
	}
	  
	  function addCmt(i) {
		  
		  if(this.lgCheck){
			  const cmt = document.getElementById("slogCmt").value;
			  if(cmt != ""){
				
				  var url = "${pageContext.request.contextPath}/slog/slogCmt";
				  var param = "slog_seq="+i+"&&content="+cmt;
				  
				  sendRequest(url, param, resultFn, "POST");
				  
			  }			  
		  }
	}
	  
	  
	  function slogCmtLike(i) {
		if(this.lgCheck){
			var url = "${pageContext.request.contextPath}/slog/slogCmtLike";
			var param = "slog_cmt_seq="+i;
			
			sendRequest(url, param, resultFn, "POST");
			
		}
	}
	  
	  function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data ==='성공'){
					location.reload();
				}        			
			}else{
				console.log('ajax 오류');
			}
		}
	  
	  function editMenu() {
			const editMenu = document.getElementById('editMenu');
			if(editMenu.style.display == "none"){
				editMenu.style.display = "block";
			}else{
				editMenu.style.display = "none";				
			}
		  
	}
	  
	  function edit(item) {
		  const form = document.getElementById("slogDetailForm");
		if(item == "del"){
			//삭제
			if(window.confirm("이 여행기를 삭제하시겠습니까 ?")){
				form.action = "${pageContext.request.contextPath}/slog/delSlog";				
			}
		}else{
			//수정
			if(window.confirm("여행기를 수정하시겠습니까 ?")){
				form.action = "${pageContext.request.contextPath}/slog/newSlog";
			}
		}
		form.submit();
	}
	
</script>
</head>
<body>
<form id="slogDetailForm" method="post"> 
<input type="hidden" name="lgcheck" id="lgcheck" value="${lgcheck }">
<input type="hidden" name="slog_seq" id="slog_seq" value="${slog.SLOG_SEQ }">
<input type="hidden" name="s_seq" id="s_seq" value="${slog.S_SEQ }">
</form>
<div class="major">
	<div class="top">
		<div class="topF">
			<div class="home" onclick="location.href = '${pageContext.request.contextPath}/'">TRIPPIN</div>
			<div class="another" onclick="location.href = '${pageContext.request.contextPath}/slog/slogList'">다른 여행기</div>
		</div>
	</div>
	<div class="mid" >
		<div class="midT">
		<c:choose>
			<c:when test="${slog.M_SEQ == m_seq }">
				<div class="edit"><img class="img" src="https://assets.triple.guide/images/btn-review-more@4x.png" style="padding-left: 95%; width : 2vw;" onclick="editMenu()"></div>
				<div class="editMenu" style="display: none;" id="editMenu">
					<div class="editSel" onclick="edit('del')">삭제</div>
					<div class="editSel" onclick="edit('upd')">수정</div>
				</div>			
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="midMain">
			<div class="main" >
				<div class="mainP">사진</div>
				<div class="mainT">${slog.TITLE }</div>
				<div class="mainC">${slog.INTRO }</div>
				<div class="mainF">
					<div class="Btn">
						<select class="dayBtn" id="daySelect" onchange="changeDay()">
							<option value="0">Day 보기</option>
							<c:forEach begin="0" end="${slog.NIGHT }" step="1" varStatus="k">
							<option value="${k.count }">DAY - ${k.count }</option>
							</c:forEach>
						</select>
					</div>
					<div class="Btn" onclick="slogCourse()">여행 코스 보기</div>
				</div>
			</div>
		</div>
		<!-- for1 -->
		<c:forEach var="day" items="${slog.SLOG_DAY }" varStatus="i">	
		<div class="line"></div>
		<div class="midDay"  id="day${i.count }">   
			<div class="mdTop">
				<div class="mdtF">
					<div class="day" id="day${day.DAY_NO }">Day ${day.DAY_NO } </div>
					<div class="partition">|</div>
					<div class="date">${day.YDATE }</div>
				</div>
				<div class="dayC">
					${day.CONTENT }
				</div>
				<c:choose>
					<c:when test="${day.CHECK }">
					<input type="hidden" id="name"  value="${day.NLIST }">
					<input type="hidden" id="wi"  value="${day.WLIST }">
					<input type="hidden" id="kyung"  value="${day.KLIST }">
					<div class="dayMap" id="map${i.index }">
						지도 영역
					</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>				
			</div>
			<div class="placeFor">
				<!-- for2 -->
				<c:forEach var="place" items="${day.SLOG_PLACE }" varStatus="j">
				<div class="placeF">
				<c:choose>
					<c:when test="${place.CATE_SEQ == 1 }">
						<div class="placeG">
					</c:when>
					<c:when test="${place.CATE_SEQ == 2 }">
						<div class="placeM">
					</c:when>
					<c:otherwise>
						<div class="placeA">					
					</c:otherwise>
				</c:choose>
					${j.count }
					</div>
					<div class="placeI">
						<div class="placeInfo">
							<div class="placeT" id="pName">${place.NAME }</div>
							<div class="placeF2">
								<div class="placeType">${place.CATE_NAME }</div>
								<div class="partition">-</div>
								<div class="placeAddr2">${place.ADDR2_NAME }</div>
							</div>
						</div>
						<div class="placeS">
							<c:choose>
								<c:when test="${place.STARS == 0 }">
								</c:when>
								<c:otherwise>
									<c:forEach begin="1" end="5" step="1" varStatus="star">
										<c:choose>
											<c:when test="${place.STARS  >= star.count }">
												<img class="stars" src="${pageContext.request.contextPath }/resources/star/yellowstar.jpg" style="width:3%;">									
											</c:when>
											<c:otherwise>
												<img class="stars" src="${pageContext.request.contextPath }/resources/star/graystar.jpg" style="width:3%;">
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="placeC">${place.CONTENT }</div>
						<div class="placeP"></div>
					</div>
				</div>
			</c:forEach>
				<!-- for2end -->
			</div>
			<c:choose>
				<c:when test="${day.CHECK }">
					<div class="botF">
						<div class="slogAdd" onclick="copyPlan(${day.DAY_SLOG_SEQ},${day.SLOG_SEQ })"><img class="img" src="https://assets.triple.guide/images/ico_lounge_download_white@4x.png"> 내 일정으로 담기</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
			<!-- for1 -->
	</c:forEach>
	</div>
	<div class="bot">
		<div class="botT">
			<div class="slogAddSu"><span style="color: #368FFF;">${slog.ADDSU }명</span>이 이 일정을 담았습니다.</div>
		</div>
		<div class="cate">
			${slog.CATE }
		</div>
		<div class="member">
			<div class="mP"><img class="profile" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/800px-Noto_Emoji_KitKat_263a.svg.png"></div>
			<div class="mI">
				<div class="mN">${slog.M_NICKNAME }</div>
				<div class="mL">LEVEL ${slog.M_LEVEL } / ${slog.REVIEWSU }개의 리뷰</div>
			</div>
		</div>
		<div class="menu">
			<div class="menuF">
				<div class="menuF1">
					<div class="likeS" onclick="addLike(${slog.SLOG_SEQ})"><img class="img" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">${slog.LIKESU }</div>
					<div class="partiton"> - </div>
					<div class="cmtS"><img class="img" src="https://assets.triple.guide/images/btn-lounge-comment-off@3x.png">${slog.CMTSU }</div>
					<div class="partiton"> - </div>
					<div class="addS"><img class="img" src="https://assets.triple.guide/images/ico_lounge_download_gray@3x.png">${slog.ADDSU }</div>
				</div>
				<div class="menuF2">
					<div class="when">${slog.DTIME }</div>
					<div class="edit"><img class="img" src="https://assets.triple.guide/images/btn-review-more@4x.png"> </div>
				</div>
			</div>
			<div class="cmt">
				<!-- for -->
				<c:forEach var="cmt" items="${slog.CMT_LIST }">
					<div class="mCmt"> 
						<div class="mcF">
							<div class="mP"><img class="profile" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/800px-Noto_Emoji_KitKat_263a.svg.png"></div>
							<div class="mcM">
								<div class="mcN">${cmt.M_NICKNAME }</div>
								<div class="mcC">${cmt.CONTENT }</div>
								<div class="mcA">
									<div class="mcL" onclick="slogCmtLike(${cmt.SLOG_CMT_SEQ})"><img class="img" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">${cmt.CMTLIKESU }</div>
									<div class="partiton"> - </div>
									<div class="mcCmt">답글 달기</div>
								</div>
							</div>
						</div>
						<div class="mcMenu">
							<div class="mcDate">${cmt.DT }</div>
							<div class="edit"><img class="img" src="https://assets.triple.guide/images/btn-review-more@4x.png"> </div>
						</div>
					</div>
				
				</c:forEach>
				<!-- for -->
			</div>
			<div class="cmtF">
				<div class="cmtI">
					<textarea class="cmtInput" maxlength="100" placeholder="댓글을 입력하세요" id="slogCmt"></textarea>
				</div>
				<div class="cmtBtn" onclick="addCmt(${slog.SLOG_SEQ})">등록</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54edfe10e632867778f01053322746d0"></script>
<script>

	var nArr = document.querySelectorAll("#name");
	var wArr = document.querySelectorAll("#wi");
	var kArr = document.querySelectorAll("#kyung");
	
	console.log(wArr);
	console.log(wArr);
	
	console.log(nArr);
	
	for(let l = 0 ; l < nArr.length ; l++){
		var wv = wArr[l].value.split(",");
		var kv = kArr[l].value.split(",");
		var nv = nArr[l].value.split(",");
		
		var mapContainer = document.getElementById('map'+l), // 지도를 표시할 div  
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
		
	}
	

</script>
</body>
</html>