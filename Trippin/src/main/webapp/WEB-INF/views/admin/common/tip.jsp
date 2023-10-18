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

	<hr>
	<div>
		<input type="text" name="tip" id="tip">
		<input type="button" value="추가" onclick="javascript:insertTip()">
	</div>
	<hr>
	<form>
		<div id="pickList">
		</div>
		<div>
			<input type="button" value="등록하기" onclick="javascript:addTip()">
		</div>
	</form>
</body>
</html>

<script type="text/javascript">
	function insertTip(){
		var tip = document.getElementById("tip").value;
		
		var param = "tip=" + tip;
		var url = "${pageContext.request.contextPath}/admin/common/addTip";
		
		sendRequest(url, param, function(){
			if(xhr.readyState === 4 && xhr.status === 200){
				var data = xhr.responseText;
				
				if(data != 0){
					var space = document.getElementById("pickList");
					
					var inp1 = document.createElement("input");
					inp1.type="hidden";
					inp1.name="tips_seq";
					inp1.id="tips_seq";
					inp1.value=data;
					
					var inp2 = document.createElement("input");
					inp2.type="text";
					inp2.disabled=true;
					inp2.value=tip;
					
					var but1 = document.createElement("input");
					but1.type="button";
					but1.value="설명 추가";
					but1.onclick = "plusText()";
					
					var but2 = document.createElement("input");
					but2.type="button";
					but2.value="X";
					but2.onclick = "minusText()";
					
					space.appendChild(inp1);
					space.appendChild(inp2);
					space.appendChild(but1);
					space.appendChild(but2);
					space.appendChild(document.createElement("br"));
				}
			}
		}, "POST");
	}

	function tipChange(key){
		var target = document.getElementById("container");
		var param = "key=" + key.value;
		var url = "${pageContext.request.contextPath}/admin/common/findTip";
		
		sendRequest(url, param, function(){
			if(xhr.readyState === 4 && xhr.status === 200){
				var data = xhr.responseText;
				if(data != ''){
					const tips = JSON.parse(data);
					
					target.options.length = 0;
						var opt = document.createElement("option");
						opt.value = "0";
						opt.innerHTML = "선택하세요.";
						target.appendChild(opt);
					
					for (var i=0; i<tips.length; i++){
						var opt = document.createElement("option");
						opt.value = tips[i]["tips_seq"];
						opt.innerHTML = tips[i]["tip"]; 
						target.appendChild(opt);
					}
				}
			}
		}, "POST");
	}
	
	function pickTip(tip){
		var space = document.getElementById("pickList");
		
		for(var i=0; i<tip.length; i++){
			
			if(tip.value == tip[i].value){
				
				var inp1 = document.createElement("input");
				inp1.type="hidden";
				inp1.name="tips_seq";
				inp1.id="tips_seq";
				inp1.value=tip[i].value;
				
				var inp2 = document.createElement("input");
				inp2.type="text";
				inp2.disabled=true;
				inp2.value=tip[i].innerHTML;
				
				var but1 = document.createElement("input");
				but1.type="button";
				but1.value="설명 추가";
				but1.onclick = "plusText()";
				
				var but2 = document.createElement("input");
				but2.type="button";
				but2.value="X";
				but2.onclick = "minusText()";
				
				space.appendChild(inp1);
				space.appendChild(inp2);
				space.appendChild(but1);
				space.appendChild(but2);
				space.appendChild(document.createElement("br"));
			}
		}
		
	}
	
	function plusText(){
		
	}
	
	function minusText(){
		
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