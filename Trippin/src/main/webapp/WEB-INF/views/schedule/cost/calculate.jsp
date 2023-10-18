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
	
	.midf{
		display: flex;
		justify-content : space-between;
		border-bottom : 2px dashed silver;
	}
	.midf2{
		display: flex;
		justify-content : space-between;
		font-weight : bold;
		padding-top : 4%;
		padding-bottom : 4%;
		width : 100%;
	}
	
	.mid1{
			padding-bottom : 3%;
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
		border-top : 2px dashed silver;		
	}
	
	.bitem{
		padding-top : 3%;
		padding-bottom : 1%;	
		display: flex;
		justify-content : space-between;
		cursor: pointer;
	}
	
	.botf{
		display: flex;
		justify-content : space-between;
		
		height : 8vh;
		font-size : 17px;	
		width : 100%;	
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
	
	.mnamez{
		color : silver;
	}
	.blue-num {
		color : #368FFF;
		padding-right : 2%;
	}
	.right-ar {
		width : 15px;
		position : relative;
		top : 0.2vh;
	}
	.midf2-list {
		width : 60%;
	}
	
	.tot_money{
		color : #368FFF;
		font-size: 20px;
	}
	
	.bot2 {
		
		padding-top : 3%;
		font-weight  : bold;
	}
	.money {
		text-align : right;
		font-size : 17px;
		padding-top : 3%;
	}
	.pay {
		font-size : 13px;
		color : silver;
	}
	.mnamez img, .mname img {
		width : 30px;
		border-radius : 50%;
		position : relative;
		top  : 1vh;
	}
	.mnamez img {
		filter:  grayscale(80%);
	}
	.mnamez, .mname {
		width : 60%;
		height : 8vh;
		line-height : 8vh;
	}
	.mnamez span, .mname span {
		padding-left : 3%;
	}
</style>

<script>

	
	function goHome() {
		const form = document.getElementById("totCostForm");
		form.action = "${pageContext.request.contextPath}/schedule/cost/costHome";
		form.submit();
	}
</script>
<body>
<form action="${pageContext.request.contextPath }/schedule/cost/totDetail" id="totCostForm" method="post">
<input type="hidden" name="s_seq" value="${sInfo.S_SEQ }">
<input type="hidden" name="day_no"  value="0">
<input type="hidden" name="alone"  value="0">
</form>
	<div class="main">
		<div class="top">
			<div class="top1" onclick="goHome()">×</div>
			<div class="top2">${sInfo.FIRSTDAY } - ${sInfo.LASTDAY }</div>
			<div class="top3">${sInfo.TITLE }</div>
			<div class="top4">정산 내역 입니다</div>
		</div>
		<div class="mid">
			<div class="midf">
				<div class="mid1">누가 누구에게</div>
				<div class="mid1">얼마를</div>
			</div>
			<div>
				<!-- for -->
				<c:forEach var="member" items="${list }" varStatus="i">
					<div class="midf2">
						<div class="midf2-list"><span class="blue-num">${i.count }.</span>${member.sender }<img class="right-ar" src="https://cdn.icon-icons.com/icons2/930/PNG/512/arrow-right_icon-icons.com_72375.png">${member.receiver }</div>
						<div class="tot_money"><span id="komma">${member.mon }</span>원</div>
					</div>
				</c:forEach>
				<!-- for -->
			</div>
		</div>
		<div class="bot">
			<div class="bot1">개인별 지출금액</div>
			<div class="bot2">
			<!-- for -->
			<c:forEach var="map" items="${calList }">
				<div class="botf">
				<c:choose>
					<c:when test="${map.INVITE_SEQ == null }">
						<div class="mnamez">
							<img src="https://blog.kakaocdn.net/dn/bezjux/btqCX8fuOPX/6uq138en4osoKRq9rtbEG0/img.jpg"><span>${map.M_NAME }</span>
						</div>
					</c:when>
					<c:otherwise>					
						<div class="mname">
							<img src="https://blog.kakaocdn.net/dn/bezjux/btqCX8fuOPX/6uq138en4osoKRq9rtbEG0/img.jpg"><span>${map.M_NAME }</span>
						</div>
					</c:otherwise>
				</c:choose>
					<div class="money">
						<div class="dutch" >${map.DM }원</div>
						<div class="pay" id="pay">결제 ${map.PM }원</div>
					</div>
				</div>
			</c:forEach>
			<!-- for -->
			</div>
		</div>
	</div>
</body>
<script>

</script>
</html>