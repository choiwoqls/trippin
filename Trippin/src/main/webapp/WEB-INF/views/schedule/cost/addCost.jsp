<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비용 추가</title>
<style>

	body{
		margin: 0;
	}
	
	.top{
		height: 22vh;
	}
	
	.top1{
		display:flex;
		border: 1px solid;
		height: 4vh;
	}
	
	.cost{
		background-color: silver;
		height :18vh;
		border: 1px solid;
	
	}
	
	.cin{
		margin-left : 10%;
		margin-top: 1.5%;
		height : 10vh;
		width: 80%;
	
	}
	
	.mid{
		margin-top: 1%;
		margin-bottom: 1%;
		margin-left: 10%;
		width:80%;
	
	}
	
	.mid1{
		display: flex;
		margin-bottom:1%;

	
	}
	
	.date{
		border-bottom: 1px solid;
		width: 60%;
		margin-right: 5%;
	}
	
	.pay{
		border-bottom: 1px solid;
		width: 40%;
	
	}
	
	.select{
		width: 10vh;
		height: 4vh;
		border: 0;
	}
	
	.mid2{
		margin-bottom: 1%;
		border-bottom: 1px solid;
	
	}
	
		
	.mid3{
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	
	.mid3f{
		display:  flex;
		margin-bottom: 0.5%;
		margin-left: 14%;
	}
	
	.mid3item{
		border: 1px solid;
		width: 5vw;
		height: 10vh;
		margin-right: 4%;
		cursor: pointer;
	}
	
	.mid3itemz{
		border: 1px solid;
		width: 5vw;
		height: 10vh;
		margin-right: 4%;
		cursor: pointer;
		background-color: silver;
	}
	
	.mid4{
		margin-bottom: 1%;
		border-bottom: 1px solid;
		
	}
	
	.mid4tf{
		display: flex;		
	}
	

	.mid4mf{
		display: flex;		
		margin-top: 1%;
		border-bottom: 1px solid;
	}
		.m41{
		width: 35%;
		margin-right: 50%;
	}
	
	.m42{
		text-align: center;
		width:5%;
		margin-right: 3%;
	
	}
	
	.m43{
		text-align: center;
		width: 5%;	
	}
	
	.mid5{
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	
	.mid6{
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	
	.mid6f{
		display: flex;		
	}
	
	.m61{
		width: 95%;
	}
	
	.m62{
		text-align: center;
	}
	
	.bot{
		border: 1px solid;
		width: 100%;
		height: 10vh;
	}

	.submit{
		text-align: center;
		border: 1px solid;
		height: 10vh;
		cursor: pointer;
	}	
	
</style>
<script>
	var pArr = new Array(); //pay checkbox
	var dArr = new Array(); //dutch checkbox

	function createInput(type, name, value) {
		const input = document.createElement("input");
		input.setAttribute("type", type);
		input.setAttribute("name", name);
		input.setAttribute("value", value);
		return input;
	}


	function chooseCate(i) {
		const cate = document.getElementById("cate"+i);
		const cateC = cate.className;
		
		var catet = document.querySelectorAll(".mid3itemz");
		for(var  k =0; k< catet.length; k++){
			catet[k].className = "mid3item";
		}
		
		if(cateC == 'mid3item'){
			document.getElementById("kind").value = i;
			cate.className = 'mid3itemz';			
		}else{
			document.getElementById("kind").value = 0;					
		}
		console.log(document.getElementById("kind").value);
	}
	
	function submitBtn(item) {
		console.log(item);
		
		const ck = document.getElementById("alonec");
		console.log(ck.checked);
		
		const form = document.getElementById("addCostForm");
		if(document.getElementById("tmon").value == 0){
			alert("금액을 입력하세요");
			return;
		}
		if(document.getElementById("kind").value == 0){
			alert("종류를 선택하세요");
			return;
		}
		if(document.getElementById("cont").value == ""){
			alert("내용을 입력하세요");
			return
		}
		
		if(item == 'people' && !ck.checked){
			if(pArr.length == 0){
				alert("결제 할 인원을 최소 1명 선택해주세요.");
				return;
			}
			if(dArr.length == 0){
				alert("함께 할 인원을 최소 1명 선택해주세요.");
				return;
			}
			const input1 = createInput("hidden", "pArr", JSON.stringify(pArr));
			const input2 = createInput("hidden", "dArr", JSON.stringify(dArr));
			form.appendChild(input1);
			form.appendChild(input2);
		}
		
		if(ck.checked){
			document.getElementById("alone").value = 1;
		}else{
			document.getElementById("alone").value = 0;
		}
		
		form.submit();
		
	}
	

	
	function pay(i) {
		var item = document.getElementById("pay"+i);
		var check = item.checked;
		if(check){
			console.log("배열추가");
			pArr.push(item.value);
			console.log(pArr);
		}else{
			console.log("배열삭제");			
			for(let j = 0; j < pArr.length; j++){
				if(pArr[j]==item.value){
					delete pArr[j];
					pArr = pArr.filter(item => item !== undefined && item !== null && item !== '');
				}
			}
			console.log(pArr);
		}
	}
	
	function dutch(i) {
		var item = document.getElementById("dutch"+i);
		var check = item.checked;
		if(check){
			console.log("배열추가");
			dArr.push(item.value);
			console.log(dArr);
		}else{
			console.log("배열삭제");			
			for(let j = 0; j < dArr.length; j++){
				if(dArr[j]==item.value){
					delete dArr[j];
					dArr = dArr.filter(item => item !== undefined && item !== null && item !== '');
				}
			}
			console.log(dArr);
		}
	}
	
	function aloneCB() {
		const alc = document.getElementById("alonec");
		const m4 = document.getElementById("mid4");
		if(alc.checked){
			m4.style.display = "none";
		}else{
			m4.style.display = "block";			
		}
	}

</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/schedule/cost/insertCost" method="post" id="addCostForm">
<input type="hidden" name="ack" value="${ack }">
<input type="hidden" name="s_seq" value="${s_seq }">
<input type="hidden" id="kind" name="kind" value="0">
<input type="hidden" id="alone" name="alone" value="0">

<div class="top">
	<div class="top1">
		<div style="margin-right: 3%; cursor: pointer;" onclick="history.back()">◁</div>
		<div>비용 추가</div>
	</div>
	<div class="cost">
		<div class="cin"><input id="tmon" style="text-align: center; border: 0; width: 78vw; height: 9.5vh; outline: none; background-color: silver; font-size: 50px;" type="number" name="tot_money"  step="1000" placeholder="금액 입력 " ></div>
	</div>
</div>
<div class="mid">
	<div class="mid1">
		<div class="date">
			<div >날짜 선택</div>
			<div>
				<select class="select" name="day_no">
				<c:forEach begin="1" end="${su }" step="1" varStatus="k">
				<c:choose>
					<c:when test="${k.count == day_no }">
						<option selected="selected" value="${k.count }">DAY-${k.count }</option>
					</c:when>
					<c:otherwise>
						<option value="${k.count }">DAY-${k.count }</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>			
			</select>
			</div>
		</div>
		<div class="pay">
			<div>결제 수단</div>
			<div>
				<select class="select" name="payment">
					<option value="0">현금</option>
					<option value="1">카드</option>
				</select>
			</div>
		</div>
	</div>
	<div class="mid2">
		<div>내용</div>
		<div><input autocomplete="off" id="cont" style="border: 0; width: 40vw; height: 6vh; font-size: 30px; outline: none;" type="text" name="content" placeholder="내용을 입력 해주세요" required="required"></div>
	</div>
	<div class="mid3">
		<div class="mid3f">
			<div id="cate1" class="mid3item" onclick="chooseCate(1)">숙소</div>
			<div id="cate2" class="mid3item" onclick="chooseCate(2)">교통</div>
			<div id="cate3" class="mid3item" onclick="chooseCate(3)">식비</div>
			<div id="cate4" class="mid3item" onclick="chooseCate(4)">쇼핑</div>
			<div id="cate5" class="mid3item" onclick="chooseCate(5)">관광</div>
			<div id="cate6" class="mid3item" onclick="chooseCate(6)">기타</div>
		</div>
	</div>
		<c:choose>
			<c:when test="${ack }">			
			</c:when>
			<c:otherwise>
				<div class="mid4" id="mid4">
					<div class="mid4tf">
						<div class="m41">함께한 사람</div>
						<div class="m42">결제</div>
						<div class="m43">함께</div>
					</div>
					<!-- for -->
					<c:forEach var="vo" items="${mlist }" varStatus="i">
						<div class="mid4mf">
							<div class="m41">${vo.m_name }</div>
							<div class="m42"><input id="pay${i.index }" value="${vo.m_seq }"  type="checkbox" onclick="pay(${i.index})"></div>
							<div class="m43"><input id="dutch${i.index }" value="${vo.m_seq }"  type="checkbox" onclick="dutch(${i.index})"></div>
						</div>
					</c:forEach>
					<!-- for -->
				</div>
			</c:otherwise>
		</c:choose>
	<div class="mid5">
		<div>장소선택</div>
		<div><input autocomplete="off" style="border: 0; width: 40vw; height: 6vh" type="text" name="place_name" value="" placeholder="장소이름을 입력해주세요"></div>
	</div>
	<c:choose>
		<c:when test="${ack }">
		</c:when>
		<c:otherwise>
			<div class="mid6">
				<div class="mid6f">
					<div class="m61">
						<div>이 비용 나만 보기</div>
						<div><font size="2px" color="silver">일행에게는 보이지않는 비용이며, 정산에서 제외됩니다.</font></div>
					</div>
					<div class="m62"><input  id="alonec" value="1" type="checkbox" onclick="aloneCB()"></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div class="bot">
	<c:choose>
		<c:when test="${ack }">
			<div class="submit" onclick="submitBtn('alone')">완료</div>
		</c:when>
		<c:otherwise>
			<div class="submit" onclick="submitBtn('people')">완료</div>
		</c:otherwise>
	</c:choose>
</div>

</form>
</body>
</html>