<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출 금액</title>
</head>
<style>

	body{
		background-color : #F2F2F2;
	}
	.main {
		margin-left : 30%;
		margin-right : 30%;
		padding-left : 2%;
		padding-right : 2%;
		background-color : white;
		height : 120vh;
	}
	.top1 {
		cursor : pointer;
		font-size : 40px;
	}
	.top{
		/* border: 1px solid; */
		padding-bottom : 5%;
		border-bottom : 2px dashed silver;
	}
	
	.top1{
		
	}
	
	.top2{
		font-weight : bold;
		font-size : 20px;
	}
	
	.top3{
		font-weight : bold;
		font-size : 20px;
	}
	
	.top4{
		font-weight : bold;
		font-size : 20px;
	}
	
	.mid{
		/* border: 1px solid;		 */
		padding-top : 3%;
		
	}
	
	.mid1{
			padding-bottom : 3%;
			border-bottom : 2px dashed silver;
			font-weight : bold;
	}
	
	.mid2{
		font-weight : bold;
		color : #368FFF;
		font-size : 20px;
		padding-top : 3%;
		padding-bottom : 3%;
		border-bottom : 2px dashed silver;
		cursor: pointer;
	}
	.mid2 span {
		color : black;
	}
	.bot{
		
	}

	.bot1{
		font-weight : bold;
		padding-top : 3%;
		padding-bottom : 3%;
		border-bottom : 2px dashed silver;		
	}
	
	.bitem{
		padding-top : 3%;
		padding-bottom : 1%;	
		display: flex;
		justify-content : space-between;
		cursor: pointer;
	}
	.max-percent {
		width : 60%;
		
		height : 5vh;
		text-align : right;
	}
	.percent {
		background-color : #368FFF;
		display : inline-block;
		height : 5vh;
		border-radius : 4px;
	}
	.percent-text {
		color :  #368FFF;
		font-weight : bold;
	}
	.kind {
		font-weight :bold;
	}
	.won {
		color : silver;
	}
	
</style>

<script>
	function goDetail(i) {
		console.log(i);
		const form = document.getElementById("totCostForm");
		const kind = document.getElementById("kind");
		kind.value = i;
		
		form.submit();
		
	}
	
	function goHome() {
		const form = document.getElementById("totCostForm");
		form.action = "${pageContext.request.contextPath}/schedule/cost/costHome";
		form.submit();
	}
</script>
<body>
<form action="${pageContext.request.contextPath }/schedule/cost/totDetail" id="totCostForm" method="post">
<input type="hidden" name="s_seq" value="${sInfo.S_SEQ }">
<input type="hidden" name="kind"  id="kind" value="">
<input type="hidden" name="day_no"  value="0">
<input type="hidden" name="alone"  value="0">
</form>
	<div class="main">
		<div class="top">
			<div class="top1" onclick="goHome()">×</div>
			<div class="top2">${sInfo.FIRSTDAY } - ${sInfo.LASTDAY }</div>
			<div class="top3">${sInfo.TITLE }</div>
			<div class="top4">지출 내역 입니다</div>
		</div>
		<div class="mid">
			<div class="mid1">총 지출 금액</div>
			<div class="mid2" onclick="goDetail(0)">
				${sumMon }<span>원</span>
			</div>
		</div>
		<div class="bot">
			<div class="bot1">${maxKind }에서 가장 많이 썼어요.</div>
			<!-- for -->
			<c:forEach var="map" items="${costList }">
				<div class="bitem" onclick="goDetail(${map.KIND})">
					<div>
						<div class="kind" >${map.KNAME }</div>
						<div class="won">${map.TM }원</div>
					</div>
					<div style="width : 50%; display : flex; justify-content : end;">
						<span class="percent-text">${map.PER }%</span>
						<div class="max-percent">
							<span class="percent" style="width : ${map.PER }%;"></span>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- for -->
		</div>
	</div>
</body>
</html>