<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜별 지출 금액</title>
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
	
	.top{
		padding-bottom : 5%;
		border-bottom : 2px dashed silver;
	}
	
	.top1 img{
		cursor : pointer;
		width : 30px;
		padding-top : 3%;
	}
	
	.top2{
		padding-top : 3%;
	}
	.top2 select {
		height : 3vh;
		font-size : 20px;
		font-weight : bold;
		border : 0;
		outline : none;
	}
	
	.top3{
		font-weight : bold;
		font-size : 20px;
		padding-left : 2%;
		padding-top : 2%;
	}
	.top3 span {
		color :  #368FFF;
	}
	.mid{
	
	}
	
	.mid1{
		font-weight : bold;
		padding-top : 3%;
		padding-bottom : 3%;
		border-bottom : 2px dashed silver;
	}
	
	.midf{
		display: flex;
		font-weight : bold;
		justify-content : space-between;
		padding-top : 2%;
		padding-bottom : 2%;
		padding-left : 2%;
	}
	.list-board {
		border-bottom : 2px dashed silver;
	}
	.kind{
	
	}
	
	.won{
	
	}
</style>
<script>
	
	function changeKind() {
		const form = document.getElementById("totDetailForm");
		var kind = document.getElementById("kd");
		console.log(form);
		
		const kdv = kind.options[kind.selectedIndex].value;
		console.log(kdv);
		
		const kd = document.getElementById("kind");
		kd.value = kdv;
		
		form.submit();
	}
	
	function goHome() {
		const form = document.getElementById("totDetailForm");
		form.action = "${pageContext.request.contextPath }/schedule/cost/totCost";
		form.submit();
	}
	
</script>
<body>
<form action="${pageContext.request.contextPath }/schedule/cost/totDetail" id="totDetailForm" method="post">
	<input type="hidden" id="kind" name="kind" value="${kind }">
	<input type="hidden" name="s_seq" value="${s_seq }">
</form>
<div class="main">
	<div class="top">
		<div class="top1" onclick="goHome()">
			<img src="https://cdn-icons-png.flaticon.com/512/2089/2089649.png">
		</div>
		<div class="top2">
			<select onchange ="changeKind()" id="kd">
				<option value="0">전체</option>
				<c:forEach var="k" items="${klist }">
				<c:choose>
					<c:when test="${kind == k.kind }">
						<option value="${k.kind }" selected="selected">${k.kname }</option>					
					</c:when>
					<c:otherwise>
						<option value="${k.kind }" >${k.kname }</option>					
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
		</div>
		<div class="top3"><span>${tm }</span>원을 쓰셨어요</div>
	</div>
	<!-- for -->
	<c:forEach var="map" items="${dlist }">
	<div class="mid">
		<div class="mid1">day${map.dno }</div>
		<!-- for -->
			<div class=list-board>
				<c:forEach var="clist" items="${map.clist }">
					<div class="midf">
						<div class="kind">${clist.CONTENT } <font color="silver">(${clist.kname })</font></div>
						<div class="won">￦ ${clist.TM }</div>
					</div>		
				</c:forEach>
			</div>
		<!-- for -->
	</div>
	</c:forEach>
	<!-- for -->
</div>
</body>
</html>