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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">

</head>

<style>
.main{
	display:flex;
	padding : 2%;
}
.sel-div{
	display:flex;
	padding : 2%;
}

.sel-div select{
	width : 200px;
    height: 35px;
    padding: 5px 30px 5px 10px;
    margin-top:2%;
}

input[type=button]{
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 5px;
	cursor: pointer;
	font-weight : bold;
}

input[type=button]:hover{
	background: rgb(77, 77, 77);
	color: #fff;
}

.add-tip{
	margin-bottom : 2%;
	padding-bottom: 2%;
    margin-left: 19%;
    padding-left: 2%;
    padding-right: 2%;
}

input[type=text]{
	border: 2px solid #E8E8E8;
    height: 35px;
    width : 250px;
    font-size: 16px;
    color: #9B9D9B;
    font-weight: bold;
    margin-right : 2%;
}

span{
	font-size: 13px;
	color :  #778277;
}

.regi-btn{
	text-align : right;
}
.main-form {
	margin-left : 20%;
	margin-right : 20%;
}
.add-input {
	padding-top: 1%;
    padding-bottom: 1%;
    padding-left: 2.5%;
    padding-right: 2.5%;
}
.tip-title {
	padding-bottom: 1%;
    border-bottom: 3px solid;
    margin-right: 3%;
    font-size : 18px;
    font-weight : bold;
}
.tip-x {
	border : 0 !important;
	font-size: 18px;
    position: relative;
    right: 1vw;
    top: 0.1vh;
}
.tip-pl {
	padding-top: 1%;
    padding-bottom: 1%;
    padding-left: 1%;
    position: relative;
    top: 0.1vh;
}
textarea {
	resize: none;
    margin-top: 5%;
    margin-left: 4%;
    width: 40vw;
    height: 15vh;
    outline : none;
    border : 2px solid;
    font-size : 16px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
.sub-x {
	border: 0 !important;
    position: relative;
    bottom: 12.5vh;
    right: 3vw;
    font-size: 20px;
    background: transparent !important;
}
.tip-box {
	padding-bottom: 5%;
}
</style>

<body style="overflow-x: hidden">
	<div class="main">
		<div>
			<span>* 기존의 이용팁을 키워드로 찾아보세요.</span>
			<div class="sel-div">
				<div>
					<select name="key" onchange="javascript:tipChange(this)">
						<option value="0">선택하세요.</option>
						<option value="">전체</option>
						<c:forEach var="key" items="${tip_key }" >
							<option value="${key }">${key }</option>
						</c:forEach>
					</select>
				</div>
				<div style="margin-left : 2%;">
					<select onchange="pickTip(this)" id="container" class="container">
						<option value="0">선택하세요</option>
					</select>
				</div>
			</div>
		</div>
		<div class="add-tip">
			<span>* 찾는 이용팁이 없다면 등록해보세요.</span>
			<div style="display: flex; padding-top: 2%;">
				<input type="text" name="tip" id="tip">
				<input type="button" value="추가" onclick="javascript:insertTip()">
			</div>
		</div>
	</div>
	<hr>
	<form method="post" class="main-form">
		<div class="regi-btn">
			<input class="add-input" type="button" value="등록하기" onclick="finishTip(this.form)">
		</div>
		<div id="pickList">
		</div>
	</form>
</body>
<script type="text/javascript">
	var space = document.getElementById("pickList");
	
	// 직접 입력한 이용팁 추가
	function insertTip(){
		var tip = document.getElementById("tip").value;
		$.ajax({
			url : "${cpath}/admin/tip/addTip",
			type : "post",
			data : {tip:tip},
			success : function show(data){
				if(data != 0){
					listIn(data, tip);
				}else{
					alert("이미 존재하거나 등록 불가한 영업팁입니다.");
				}
			}
		})
	}

	// 메인 키워드 선택 시
	function tipChange(key){
		let target = document.querySelector("#container");
		var tip = key.value;
		$.ajax({
			url : "${cpath}/admin/tip/findTip",
			type : "post",
			data : {tip : tip},
			success: function show(data){
				target.innerHTML = '<option value="0">선택하세요.</option>';
						
				data.forEach(d =>{
					let newOp  = document.createElement("option");
					newOp.value = d.tips_seq;
					newOp.innerText = d.tip;
					target.appendChild(newOp)
				}) 
			}
		})
	}
	
	// 하위 이용팁 선택 시 등록
	function pickTip(tip){
		for(var i=0; i<tip.length; i++){
			if(tip.value == tip[i].value){
				listIn(tip[i].value, tip[i].innerHTML);
			}
		}
	}
	
	// 선택 시 리스트 넣기(공통)
	function listIn(num, text){
		if(num != 0 && sameTip(num)=="false"){
			var div = document.createElement("div");
			div.id = "tip" + num;
			div.className = "tip-box";
			
			var inp1 = document.createElement("input");
			inp1.type="hidden";
			inp1.name="tips_seq";
			inp1.id="tips_seq";
			inp1.value=num;
			
			var but2 = document.createElement("input");
			but2.type="button";
			but2.value="X";
			but2.className="tip-x";
			but2.onclick = () => minusText(num);
			
			var span = document.createElement("span");
			span.className = 'tip-title';
			span.innerText = text;
			
			var but1 = document.createElement("input");
			but1.type="button";
			but1.value="설명 추가";
			but1.className = "tip-pl";
			but1.onclick = () => plusText(num);
			
			
			div.appendChild(inp1);
			div.appendChild(but2);
			div.appendChild(span);
			div.appendChild(but1);
			space.appendChild(div);
			
			// textarea 만들어서 hidden으로 넣기
			var subdiv = document.createElement("div");
			subdiv.id = "subDetail"+num;
			subdiv.style.display = "none";
			
			var tarea = document.createElement("textarea");
			tarea.name = "f_tip";
			tarea.id = "f_tip"+num;
			
			//이용팁 추가 설명 삭제 처리
			var input = document.createElement("input");
			input.type="button";
			input.value="X";
			input.className="sub-x";
			input.onclick = () => minusTarea(num);
			
			subdiv.appendChild(tarea);
			subdiv.appendChild(input);
			div.appendChild(subdiv);
		}else if(num != 0 && sameTip(num) == "true"){
			alert("이미 선택하셨습니다.");
		}
	}
	
	// 이미 선택한 리스트인지 여부
	function sameTip(num){
		var check = "false";
		var divs = document.querySelectorAll("div[id^=tip]");
		for(var i = 0; i<divs.length; i++){
			if(divs[i].id == "tip"+num){
				check = "true";
			}
		}
		return check;
	}
	
	// textarea 추가하기
	function plusText(num){
		var subDetail = document.getElementById("subDetail"+num);
		console.log(subDetail.style.display == "none");
		if(subDetail.style.display == "none"){
			subDetail.style.display = "block";
		}else{
			alert("설명 추가는 1회만 가능합니다.");
		}
	}
	
	// 추가한 설명 없애기
	function minusTarea(num){
		var subDetail = document.getElementById("subDetail"+num);
		var tarea = document.getElementById("f_tip"+num);
		tarea.value = '';
		subDetail.style.display = "none";
	}
	
	// 리스트에 넣은 이용팁 삭제 시
	function minusText(num){
		var divs = document.querySelectorAll("div[id^=tip]");
		for(var i = 0; i<divs.length; i++){
			if(divs[i].id == "tip"+num){
				divs[i].remove();
			}
		}
	}
	
	// 폼 이동
	function finishTip(f){
		var check = true;
		var subDetails = document.querySelectorAll("div[id^=subDetail]");
		var areas = document.querySelectorAll("textarea[id^=f_tip]");
		for(var i =0; i<areas.length; i++){
			if(subDetails[i].style.display == "block" && areas[i].value == ''){
				check=false;
			}
		}
		
		if(check == true){
			f.action = "${cpath }/admin/tip/insertTip?f_seq="+${param.f_seq};
            f.submit();
		}else{
			return;
		}
	}

</script>
</html>
