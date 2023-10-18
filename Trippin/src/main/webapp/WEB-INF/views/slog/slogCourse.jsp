<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행기</title>
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
		width: 36vw;
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
		z-index: 0;
	    position: relative;
	    width: 38vw;
	    height: 20vh;
	}
	
	.boxS{
		z-index: 1;
	    position: relative;
	    top: -10px;
	    background-color: white;
	}
	
	.placeFor{
	    padding: 3%;
	    top: -1vh;
	    position: relative;
	    width: 33.5vw;
	    border-radius: 5px;
	    box-shadow: 0px 0px 15px 0px silver;
	    left: 1vw;
	    background-color: white;
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
	
	.heightLine{
		border-right: 2px solid silver;
	    height: 2vh;
	    width: 13px;
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
	    height: 8vh;
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
		border: 1px solid;
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
		height: 21vh;
		color: silver;	
	}
	
	.cmtF{
		border-top : 1px solid silver;
		color: silver;
		display: flex;
		justify-content: space-between;
		height: auto;
	}
	
	.cmtInput{
	
	}
	
	.cmtBtn{
		width : 3vw;
		cursor: pointer;
		color: #368FFF;
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
	  

	
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/" >
<input type="hidden" name="lgcheck" id="lgcheck" value="${lgcheck }">
</form>
<div class="major">
	<div class="top">
		<div class="topF">
			<div class="home" onclick="location.href = '${pageContext.request.contextPath}/'">TRIPPIN</div>
			<div class="another" onclick="location.href = '${pageContext.request.contextPath}/slog/slogList'">다른 여행기</div>
		</div>
	</div>
	<div class="mid" >
		<!-- for1 -->
		<c:forEach var="day" items="${slog.SLOG_DAY }" varStatus="i">	
		<div class="midDay"  id="day${i.count }">   
			<div class="mdTop">
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
			<div class="boxS">
				<div class="placeFor">
					<div class="mdtF">
						<div class="day" id="day${day.DAY_NO }"  align="center">Day ${day.DAY_NO } </div>
					</div>
					<!-- for2 -->
					<c:forEach var="place" items="${day.SLOG_PLACE }" varStatus="j">
					<div class="placeF">
					<div>
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
							<div class="heightLine">
							
							</div>
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
						</div>
					</div>
				</c:forEach>
					<!-- for2end -->
				</div>
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