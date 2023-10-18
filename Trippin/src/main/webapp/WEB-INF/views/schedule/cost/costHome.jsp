<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
</script>
<style>
	
	body{
		margin: 0;
	}
	
	.top{
		width: 100%;
		border-bottom: 1px solid;
		height: 15vh;

	}
	
	.top1{
		margin-top: 1%;
		display: flex;
	}
	
	.titem{
		margin-left:0.5%;
		margin-right: 3%;
		cursor: pointer;
	}

	.titem1{
		margin-left: 3%;
		margin-right: 70%;
	}
	
	.top2{
		display: flex;
		margin-top: 1%;
		margin-left: 2%;
		height: 6vh;
		width : 30vw;
	}

	
	.t2item{
		cursor: pointer;
		border: 1px solid;
		margin-right: 2%; 
		width : 25%;
		text-align : center;
		line-height : 6vh;
	}
	
	.t2itemz{
		cursor: pointer;
		border: 1px solid;
		margin-right: 2%; 
		width : 25%;
		text-align : center;
		line-height : 6vh;
		background-color: silver;
	}
	
	.select{
		padding-left : 15%;
		padding-right : 15%;
		padding-top : 11%;
		padding-bottom : 9%;
		cursor: pointer;
		outline : none;
		border : 0;
		 
	}
	
	.mid{
		width: 100%;
	}
	
	.day{
		width: 70%;
		margin-top: 1%;
		margin-bottom: 1%;
		border-bottom: 1px solid;
	}
	
	.dayT{
		display: flex;	
	}
	
	.dayM{

		margin-top: 2%;
	}
	
	.dmitem{
		display: flex;	
		width: 100%;
		justify-content: space-between;
	}
	
	.dmf{
		cursor: pointer;
		text-align:left !important;
		width:50%;
		margin-left: 1%;
	}
	
	.dms{
		width: 40%;
		text-align:right !important;		
	}
	
	.dayB{
		margin-top: 1%;
	}
	
	.dbitem{
		border: 1px solid;
		height: 30px; 
		cursor: pointer;
		margin-bottom: 1%;
	}
	
	.delete{
		cursor: pointer;
		font-size: 20px;
		width: 30px;
	}
	
	.bot{
		border: 1px solid;
		padding-top : 2vh;
		padding-bottom : 2vh;
		position : fixed;
		bottom : 0;
		width : 100vw;
		background-color : white;
	}
	
	.bin{
		height: 10vh;
	}
	
	.bot2{
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

	function goItem(item) {
		
		const form = document.getElementById("costForm");

		switch(item){
		
		case 'back' :
			url = "schedule/plan/planHome";		
			document.getElementById("day_no").value = 1;
			break;
		case 'tot':
			url = "schedule/cost/totCost";
			break;
		case 'js':
			url = "schedule/cost/calculate";
			break;
		}
		
		form.action+= url;
		form.submit();
	}
	
	function addCost(i) {
		
		const form = document.getElementById("costForm");
		
		document.getElementById("day_no").value = i;
		
		form.action+="schedule/cost/addCost";
		form.submit();
	}
	
	function changeDay() {
		const form = document.getElementById("costForm");
		const day = document.getElementById("day").value;
		document.getElementById("day_no").value = day;
		
		form.action+= "schedule/cost/costHome";
		form.submit();
		
	}
	
	function aloneCost() {
		const form = document.getElementById("costForm");
		const aldv = document.getElementById("aldiv").className;
		console.log(aldv);
		if(aldv == 't2item'){
			document.getElementById("alone").value = 1;
		}else{
			document.getElementById("alone").value = 0;			
		}
		form.action+= "schedule/cost/costHome";
		form.submit();
	}
	
	function updateCost(i) {
		const form = document.getElementById("costForm");
		console.log(i);
		const input = createInput("hidden", "cost_seq", i);
		form.appendChild(input);
		form.action+= "schedule/cost/reCost";
		form.submit();
	}
	
	function deleteCost(i) {
		const check = window.confirm("이 비용을 삭제하시겠습니까 ?");
		if(check){
			const url = "${pageContext.request.contextPath}/schedule/cost/deleteCost";
			const param = "cost_seq="+i;
			
			sendRequest(url, param, resultFn, "POST");
		}
	}
	
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			if(data ==='비용 삭제 성공'){    			
			}           			
				alert(data);
				location.reload();			
		}else{
			console.log('ajax 오류');
		}
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/" method="post" id="costForm">
	<input type="hidden" name="s_seq" value="${s_seq }">
	<input type="hidden"  id="day_no" name="day_no" value="${day_no }">
	<input type="hidden"  id="alone" name="alone" value="${alone }">
</form>
<div class="top">
	<div class="top1">
		<div class="titem" onclick="goItem('back')">◁</div>
		<div class="titem1">
			<div>가계부</div>
			<div><font color="silver" size="2px">여행 이름</font></div>
		</div>
		<div class="titem" onclick="goItem('tot')">지출금액</div>
		<div class="titem" onclick="goItem('js')">정산</div>
	</div>
	<div class="top2">
		<div class="t2item">
			<select id="day" class="select" onchange="changeDay()">
				<option value="0">기간 전체</option>
				<c:forEach begin="1" end="${su }" step="1" varStatus="k">
					<c:choose>
						<c:when test="${day_no == k.count }">
							<option selected="selected" value="${k.count }">DAY-${k.count }</option>
						</c:when>
						<c:otherwise>
							<option value="${k.count }">DAY-${k.count }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
		<c:choose>
			<c:when test="${alone == 0 }">
				<div class="t2item" onclick="aloneCost()" id="aldiv">내 비용만 보기</div>			
			</c:when>
			<c:otherwise>
				<div class="t2itemz" onclick="aloneCost()"id="aldiv">내 비용만 보기</div>			
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="mid" align="center">
<!-- for1 -->
<c:forEach var="map" items="${dlist }" varStatus="i">
		<div class=" day">
			<div class="dayT">
				<div>day ${map.day_no } </div>
				<div style="margin-left: 1%;"><font color="gray">${map.dmmap.DAY}-${map.dmmap.DY }</font></div>
			</div>
			<!-- for2 -->
			<c:forEach var="cost" items="${map.clist }">
				<div class="dayM" >
					<div class="dmitem">
						<div class="dmf" onclick="updateCost(${cost.COST_SEQ})">
							<div>${cost.CONTENT }</div>
							<div>
								<font color="silver">
									<c:choose>
										<c:when test="${cost.KIND == 1 }">숙소</c:when>
										<c:when test="${cost.KIND == 2 }">교통</c:when>
										<c:when test="${cost.KIND == 3 }">식비</c:when>
										<c:when test="${cost.KIND== 4 }">쇼핑</c:when>
										<c:when test="${cost.KIND == 5 }">관광</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose>
								</font>
							</div>
							<div>
								<font color="gray">${cost.PLACE_NAME }</font>
							</div>
						</div>
						<div class="dms">
							<div>￦${cost.MN }</div>
							<div>
								<font color="silver">
								<c:choose>
									<c:when test="${cost.SU > 0 }">
										${cost.M_NAME }외 ${cost.SU }명
									</c:when>
									<c:otherwise>
										${cost.M_NAME }
									</c:otherwise>
								</c:choose>
								</font>	
							</div>
						</div>
						<div class="delete" onclick="deleteCost(${cost.COST_SEQ})">
						  ×
						</div>
					</div>
				</div>				
			</c:forEach>
				<!-- end2 -->
			<div class="dayB" >
				<div class="dbitem" onclick="addCost(${i.count})">비용추가</div>
			</div>
		</div>
</c:forEach>
	<!-- end1 -->
	</div>
	<div class="bin">
		<div class="bot" align="center">
			<div class="bot2">
			<c:choose>
				<c:when test="${tot_money != null }">
					${tot_money }원 지출
				</c:when>
				<c:otherwise>
					0 원 지출
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</body>
</html>