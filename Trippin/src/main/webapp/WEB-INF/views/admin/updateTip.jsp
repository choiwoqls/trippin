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
<body style="overflow-x: hidden">
	<div>
		<select name="key" onchange="javascript:tipChange(this)">
		<option value="0">선택하세요.</option>
		<c:forEach var="key" items="${tip_key }" >
			<option value="${key }">${key }</option>
		</c:forEach>
		</select>
	</div>
	<div>
		<select onchange="pickTip(this)" id="container" class="container">
			<option value="0">선택하세요</option>
		</select>
	</div>
	<div>
		<input type="button" value="전체 삭제" onclick="allDelete()">
	</div>
	<hr>
	<div>
		<input type="text" name="tip" id="tip">
		<input type="button" value="추가" onclick="javascript:insertTip()">
	</div>
	<hr>
	<form method="post">
		<div id="pickList">
			<c:forEach var="t" items="${tlist }">
				<div id="tip${t.TIPS_SEQ }">
					<input type="hidden"  name="tips_seq" id="tips_seq" value="${t.TIPS_SEQ }">
					<span>${t.TIP }</span>
					<input type="button" value="설명 추가" onclick="plusText(${t.TIPS_SEQ})">
					<input type="button" value="X" onclick="minusText(${t.TIPS_SEQ})">
					<div id="subDetail${t.TIPS_SEQ }" style="display:${t.F_TIP != null ? 'block' : 'none' }">
						<textarea name="f_tip" id="f_tip${t.TIPS_SEQ }" >${t.F_TIP }</textarea>
						<input type="button" value="X" onclick="minusTarea(${t.TIPS_SEQ})">
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="button" value="등록하기" onclick="finishTip(this.form)">
		</div>
	</form>
</body>
<script type="text/javascript">
	var space = document.getElementById("pickList");
	
	// 전체 삭제
	function allDelete(){
		space.innerHTML = '';
	}
	
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
			
			var inp1 = document.createElement("input");
			inp1.type="hidden";
			inp1.name="tips_seq";
			inp1.id="tips_seq";
			inp1.value=num;
			
			var span = document.createElement("span");
			span.innerText = text;
			
			var but1 = document.createElement("input");
			but1.type="button";
			but1.value="설명 추가";
			but1.onclick = () => plusText(num);
			
			var but2 = document.createElement("input");
			but2.type="button";
			but2.value="X";
			but2.onclick = () => minusText(num);
			
			div.appendChild(inp1);
			div.appendChild(span);
			div.appendChild(but1);
			div.appendChild(but2);
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
			f.action = "${cpath }/admin/tip/updateTip?f_seq="+${param.f_seq};
            f.submit();
		}else{
			return;
		}
	}
	
/* 	// plusInput 버튼을 누를 때 실행되는 함수
	function plusInput() {
	    var newInput = document.createElement("input");
	    newInput.type = "text";

	    // inp2라는 id를 가진 input 요소 바로 뒤에 빈칸 input 요소를 추가합니다.
	    var inp2 = document.getElementById("inp2");
	    inp2.parentNode.insertBefore(newInput, inp2.nextSibling);
	    inp2.parentNode.insertBefore(document.createElement("br"), inp2.nextSibling);
	}

	// minusInput 버튼을 누를 때 실행되는 함수
	function minusInput() {
	    var inputs = document.querySelectorAll("#pickList input[type='text']");

	    // 모든 input 요소를 반복하면서 삭제합니다.
	    for (var i = 0; i < inputs.length; i++) {
	        inputs[i].remove();
	    }
	} */

</script>
</html>
