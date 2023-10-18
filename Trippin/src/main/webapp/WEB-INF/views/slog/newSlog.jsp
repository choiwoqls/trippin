<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행기 작성</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
</script>
<style>
	body{
		background-color : #F2F2F2;
	}
	.main {
		margin-left : 15%;
		margin-right : 15%;
		padding-top: 1%;
		padding-left : 2%;
		padding-right : 2%;
		background-color : white;
		height : auto;
	}
	
	.top{
		border-bottom: 5px solid silver;
	}
	
	.top1{
	
	}
	
	.top1f{
		justify-content: space-between;
		display: flex;
	}
	.top1f2{
	
		display: flex;
	}
	
	.back{
		position: relative;
		bottom: 1.5vh;
		padding-top: 0;
		cursor : pointer;
		font-size : 40px;
	}

	.name{
		padding-left: 2vw;
		font-size: 20px;
		font-weight: bold;
	}
	
	.goNext{
		color: #368FFF;
		cursor : pointer;
	}
	
	.top2{
	
	}
	
	.top2item{
	
	}
	input[type=file]::file-selector-button {
        
        display : none;
    }
	
	.Img1{
		padding-top: 5px;
	    padding-bottom: 5px;
	}
	
	.iu-custom {
         background-color: #F2F2F2;
         width : 100px;
         height : 100px;
         border : 0;
         cursor : pointer;
     }
     
     .iu-custom img {
        width : 40px;
        height : 40px;
        margin-left : 29%;
        margin-top : 29%;
        filter: invert(70%) sepia(4%) saturate(32%) hue-rotate(352deg) brightness(93%) contrast(89%);
    }
	
	.file{
		
	}
	
	.title{
	
	}
	
	.tInput{
		border : 0;
		border-bottom: 2px solid silver;
		font-weight : bold;
		resize: none;
		outline: none;	
	}
		
	.tInput:focus{
		border-bottom: 2px solid black;
	}
	
	.psInput{
		    border: 0;
		    width: 50vw;
		    font-weight: bold;
		    height: 5vh;
		    font-size: 13pt;
		    resize: none;
			outline: none;
	}
	
	.psInput:focus{
		border-bottom: 2px solid black;
	}
	
	.ps{
		color : silver;
	}
	
	.mid{
	
	}
	
	.mid1{
	
	}
	
	.reSlog{
		cursor: pointer;
	    height: 4vh;
	    color: #368FFF;
	    width: 11vw;
	    text-align: center;
	    padding-top: 10px;
	}
	
	.daySelect{
	
	}
	
	.dayf{
		display: flex;	
		flex-wrap: wrap;
	}
	
	.day{
		cursor : pointer;
		border: 1px solid silver;
		border-radius: 40px;	
		padding: 0.25%;
		text-align: center;
		width: 6vw;
		height: 6vh;
		margin-right: 1%;
		color: grey;
	}
	
	.dayz{
		cursor : pointer;
		border: 1px solid;
		border-radius: 40px;	
		padding: 0.25%;
		text-align: center;
		width: 6vw;
		height: 6vh;
		margin-right: 1%;
		background-color: #368FFF;
		color: white;
	}

	.for{
	
	}
	
	.forz{
		display: none;
	}
	
	.mid2{
	
	}
	
	
	.dayInfo{
	
	}
	
	.dif{
		display: flex;
		justify-content : space-between;
	}
	
	.diday{
		display: flex;	
	}
	
	.disu{
		font-weight : bold;
	}
	
	.partition{
	 	color: silver;
	}
	
	.did{
		font-weight : bold;
	}
	
	.update{
		color: #368FFF;
		cursor : pointer;
	}
	
	.dit{
		border-radius: 4px;
		background-color: silver;
		padding: 15px;
	}
	
	.dcInput{
		width: 64.5vw;
	    font-weight: bold;
	    height: 9vh;
	    font-size: 13pt;
	    resize: none;
	}
	
	.diUpdate{
		
	}
	
	.diUpdatez{
		display: none;
	}
	
	.mid3{
	
	}
	
	.hide{
	
	}
	
	.hideT{
	
	}
	
	.hideF{
		display: flex;
		justify-content : space-between;
		border-radius: 4px;
		background-color: silver;
		padding: 15px;
	}
	
	.hideI{
	
	}
	
	.hideCk{
	
	}
	
	.mid4{
	
	}
	
	.placeI{
	
	}
	
	.placeF{
		display: flex;
		justify-content: space-between;
		padding-top: 5px;
	}
	
	.placeF2{
		display: flex;	
	}
	
	.num{
		width: 3vw;
	}
	
	.nums{
		border: 1px solid white;
	    color: white;
	    background-color: #368FFF;
	    border-radius: 45px;
	    text-align: center;
	    font-size: 18pt;
	    width: 1.5vw;
	    height: 3vh;
	    display: inline-block;
	    padding: 3px;
	}
	
	.place{
		
	}
	
	.placeN{
		font-weight: bold;
	}
	
	.placeA{
	
	}
	
	.bfRev{
		
	}
	
	.bfRevz{
		display: none;
	}
	
	.placeS{
	
	}
	
	.placeC{
	
	}
	
	.placeImg{
	
	}
	
	.review{
		cursor : pointer;
	}
	
	.reviewImg{
		width : 30px;
		position : relative;
		top : 0.2vh;
		color: silver;
	}
	
	.placeRev{
		padding: 10px;
		background-color: #FAFAFA;
	}

	.placeRevz{
		
		display: none;
	}
	
	.pcInput{
		width: 63.5vw;
	    font-weight: bold;
	    height: 9vh;
	    font-size: 13pt;
	    resize: none;
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
	
	function reSlog() {
		
		const form = document.getElementById("slogForm");
		form.action += "slog/reSlog";
		
		const check = window.confirm("일정을 다시 불러오시겠습니까 ? 이미 작성된 여행기는 삭제 됩니다.");
		if(check){
			form.submit();
		}
	}


	function daySelect(i) {
		document.querySelector(".dayz").className = "day";
		document.getElementById("day"+i).className = "dayz";
		
		document.querySelector(".for").className = "forz";
		document.getElementById("for"+i).className = "for";
	}
	
	function updateDayContent(i) {
		
		const scd = document.getElementById("slog_Content"+i);
		const scdc = scd.className;
		console.log(scdc);
		if(scdc == "diUpdate"){
			scd.className = "diUpdatez";			
		}else{
			if(document.querySelector(".diUpdate")!=null){
				document.querySelector(".diUpdate").className = "diUpdatez";						
			}
			scd.className = "diUpdate";
			document.getElementById("dcInput"+i).focus();
		}
	}
	
	function updatePlaceContent(i) {
		
		const scd = document.getElementById("placeRev"+i);
		const bfr = document.getElementById("bfRev"+i);
		const scdc = scd.className;

		if(scdc == "placeRev"){
			scd.className = "placeRevz";			
			bfr.className = "bfRev";
		}else{
			if(document.querySelector(".placeRev")!=null){
				document.querySelector(".placeRev").className = "placeRevz";						
			}
			bfr.className = "bfRevz";
			scd.className = "placeRev";
			document.getElementById("pcInput"+i).focus();
		}
	}
	
	function update(type, i) {
		
		var param =  "type="+type+"&&seq="+i;
		var url = "${pageContext.request.contextPath}/slog/update"
		
		switch(type){
		case 's_title':
			var item = document.getElementById("tInput").value;
			break;
			
		case 's_intro':
			var item = document.getElementById("psInput").value;
			break;
			
		case 'd_content':
			var item = document.getElementById("dcInput"+i).value;
			break;

		}
		param +="&&item="+item;
		sendRequest(url, param, resultFn, "POST");
	}
	
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			if(data ==='성공'){
				location.reload();
			}else{
				location.reload();			
			}           			
		}else{
			console.log('ajax 오류');
		}
	}
		
	function checkstars(v,i){
		
		var stars = document.getElementById("stars"+i);

		for(let k = 1; k<=5 ; k++){
			if(k <= v){
				document.getElementById("star"+k+""+i).src ="${pageContext.request.contextPath}/resources/star/yellowstar.jpg";
			}else{
				document.getElementById("star"+k+""+i).src ="${pageContext.request.contextPath}/resources/star/graystar.jpg";				
			}
		}
		stars.value = v;
	}
	
	function updatePlace(i) {

		const form = document.getElementById("placeForm"+i);
		
		form.submit();

	}

	function goHome() {
		const form = document.getElementById("slogForm");
		form.action += "schedule/plan/planHome";
		form.submit();

	}
	
	function checkThis() {
		const tv = document.getElementById("tInput");
		const psv = document.getElementById("psInput");
		
		if(tv.value == ""){
			alert("여행기 제목을 적어주세요");
			tv.focus();
			return;
		}
		if(psv.value == ""){
			alert("여행기 한줄평을 적어주세요");
			psv.focus();
			return;
		}
		const form = document.getElementById("slogForm");
		if(window.confirm("여행기를 작성완료 하시겠습니까?")){
			form.method = 'get';
			form.action += "slog/postSlog";
			form.submit();
		}
	}
	
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/" method="post" id="slogForm">
<input type="hidden" name="slog_seq" id="slog_seq" value="${slog.SLOG_SEQ }">
<input type="hidden" name="s_seq" id="s_seq" value="${slog.S_SEQ }">
<input type="hidden" name="day_no" id="s_seq" value="-1">
<input type="hidden" name="m_seq" id="m_seq" value="${slog.M_SEQ }">
</form>
<div class="main">
	<div class="top">
		<div class="top1">
			<div class="top1f">
				<div class="top1f2">
					<div class="back" onclick="goHome()">×</div>
					<div class="name">여행기 공유</div>
				</div>
				<div class="goNext" onclick ="checkThis()">다음</div>
			</div>
		</div>
		<div class="top2">
			<div class="top2item">
				<div class="Img1">
					<label for="file">
                        <div class="iu-custom">
                            <img src="${pageContext.request.contextPath }/resources/img/imgupload.png">
                        </div>
                    </label>
                    <form action="${pageContext.request.contextPath }/slog/slogImg" method="post" id="slogImgForm" enctype="multipart/form-data" onchange="submit()"> 
						<input type="hidden" name="slog_seq" value="${slog.SLOG_SEQ }">
						<input type="hidden" name="s_seq" value="${slog.S_SEQ }">
						<input class="file" name="files" type="file" multiple="multiple" max="10"  accept="image/*">
                    </form>
				</div>
				<div class="title"><textarea class="tInput"  id="tInput" placeholder="여행기 제목(필수)" >${slog.TITLE }</textarea></div>
				<div class="ps"><textarea class="psInput" id="psInput"   placeholder="이번 여행은 어떤 여행이였나요? 여행에 대한 한 줄 요약 또는 여행 꿀팁을 남겨보세요">${slog.INTRO }</textarea></div>
			</div>
		</div>
	</div>
	<div class="mid">
		<div class="mid1">
			<div class="reSlog" onclick="reSlog(${slog.SLOG_SEQ})">일정 다시 가져오기</div>
			<div class="daySelect">
				<div class="dayf">
					<!-- day for -->
					<c:forEach var="date" items="${slog.day_slog }" varStatus="d">
						<c:choose>
							<c:when test="${d.count == 1 }">
								<div class="dayz" id="day${d.count }" onclick="daySelect(${d.count})">			
							</c:when>
							<c:otherwise>
								<div class="day" id="day${d.count }" onclick="daySelect(${d.count})">		
							</c:otherwise>
						</c:choose>
						<div>
							day${d.count}
						</div>
						<div>
							${date.SDATE }
						</div>
						</div>		
					</c:forEach>
					<!-- day for -->
				</div>
			</div>
		</div>
		<!-- for1 시작 -->
		<c:forEach var="slog" items="${slog.day_slog }" varStatus="l">
		<c:choose>
			<c:when test="${l.count ==1  }">
				<div class="for" id="for${l.count }">
			</c:when>
			<c:otherwise>
				<div class="forz" id="for${l.count }">
			</c:otherwise>
		</c:choose>
			<div class="mid2">
				<div class="dayInfo">
					<div class="dif">
						<div class="diday">
							<div class="disu">Day${l.count }</div>
							<div class="partition">┃</div>
							<div class="did">${slog.YDATE }</div>
						</div>
						<div class="update"><img onclick="updateDayContent(${slog.DAY_SLOG_SEQ})" class="reviewImg" src="https://cdn.icon-icons.com/icons2/2098/PNG/512/edit_icon_128874.png"></div>
					</div>
					<c:choose>
						<c:when test="${empty slog.CONTENT }">
						</c:when>
						<c:otherwise>
							<div class="dit">
								${slog.CONTENT}
							</div>						
						</c:otherwise>
					</c:choose>
				</div>
				<div class="diUpdatez" id="slog_Content${slog.DAY_SLOG_SEQ }">
					<textarea class="dcInput" id="dcInput${slog.DAY_SLOG_SEQ  }" placeholder="day${l.count }의 한줄 여행기를 남겨주세요." maxlength="300">${slog.CONTENT }</textarea>
					<div align="right"><input type="button" value="입력" onclick="update('d_content',${slog.DAY_SLOG_SEQ})"></div>
				</div>
			</div>
			<div class="mid4">
				<!-- for2 시작-->
				<c:forEach var="place" items="${slog.place_slog }" varStatus="p">
					<div class="placeI">
						<div class="placeF">
							<div class="placeF2">
								<div class="num"><span class="nums">${p.count } </span></div>
								<div class="place">
									<div class="bfRev" id="bfRev${place.PLACE_SLOG_SEQ }">
										<div class="placeN">${place.NAME }</div>
										<div class="placeA">${place.CATE_NAME } - ${place.ADDR2_NAME }</div>
										<div class="placeS">
											<c:forEach begin="1" end="5" step="1" varStatus="star">
												<c:choose>
													<c:when test="${place.STARS >= star.count }">
														<img src="${pageContext.request.contextPath }/resources/star/yellowstar.jpg" style="width:3%;">									
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath }/resources/star/graystar.jpg" style="width:3%;">
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
										<div class="placeC">${place.CONTENT }</div>
										<div class="placeImg"><img src="${place.IMG }"></div>
									</div>
								</div>
							</div>
							<div class="review"><img onclick="updatePlaceContent(${place.PLACE_SLOG_SEQ })" class="reviewImg" src="https://cdn.icon-icons.com/icons2/2098/PNG/512/edit_icon_128874.png"> </div>
						</div>	
					</div>
					<div class="placeRevz" id="placeRev${place.PLACE_SLOG_SEQ }">
						<div style="font-weight: bold;">${place.NAME }에 솔직한 리뷰를 남겨 보세요</div>
						<div class="star">
							<c:forEach begin="1" end="5" step="1" varStatus="star">
								<c:choose>
									<c:when test="${place.STARS >= star.count }">
										<img id="star${star.count }${place.PLACE_SLOG_SEQ }" src="${pageContext.request.contextPath }/resources/star/yellowstar.jpg" style="width:3%;" onclick="checkstars(${star.count },${place.PLACE_SLOG_SEQ });">									
									</c:when>
									<c:otherwise>
										<img id="star${star.count }${place.PLACE_SLOG_SEQ }" src="${pageContext.request.contextPath }/resources/star/graystar.jpg" style="width:3%;" onclick="checkstars(${star.count },${place.PLACE_SLOG_SEQ });">
									</c:otherwise>
								</c:choose>
							</c:forEach>							
					<form action="${pageContext.request.contextPath }/slog/updatePlace" method="post" id="placeForm${place.PLACE_SLOG_SEQ }" enctype="multipart/form-data">
							<input type="hidden" name="stars" id="stars${place.PLACE_SLOG_SEQ  }" value="${place.STARS }">
							<input type="hidden"  name="place_slog_seq" value="${place.PLACE_SLOG_SEQ }">
							<input type="hidden"  name="day_slog_seq" value="${place.DAY_SLOG_SEQ }">					
							<input type="hidden"  name="slog_seq" value="${place.SLOG_SEQ }">					
					</div>
						<div>	<textarea name="content" id="pcInput${place.PLACE_SLOG_SEQ }" class="pcInput" placeholder="${place.NAME }에 대한 리뷰를 남겨주세요.">${place.CONTENT }</textarea></div>
						<div style="display: flex; justify-content: space-between;">
							<div>
								<label for="file">
			                        <div class="iu-custom" >
			                            <img src="${pageContext.request.contextPath }/resources/img/imgupload.png">
			                        </div>
			                    </label>
								<input id="placeImg${place.PLACE_SLOG_SEQ }" type="file" name="files" max="10" multiple="multiple" accept="image/*">
							</div>
								<div style="padding-top:100px;"><input type="button" value="입력" onclick="updatePlace(${place.PLACE_SLOG_SEQ})"></div>
							</form>
						</div>
					</div>

				</c:forEach>
				<!-- for2 끝 -->
			</div>
		</div>
		</c:forEach>
		<!-- for1  끝-->
	</div>
</div>
</body>
<script>
	
	const slog_seq = document.getElementById("slog_seq").value;
	
	const tbefore = document.getElementById("tInput").value;
	const psbefore = document.getElementById("psInput").value;

	let tInput = document.getElementById("tInput");
	let psInput = document.getElementById("psInput");

	tInput.addEventListener('focusout', e => {
		if(tbefore!=tInput.value){
			this.update('s_title',slog_seq);
		}
	})
	
	psInput.addEventListener('focusout', e => {
		if(psbefore != psInput.value){
			this.update('s_intro',slog_seq);			
		}
	})

</script>
</html>