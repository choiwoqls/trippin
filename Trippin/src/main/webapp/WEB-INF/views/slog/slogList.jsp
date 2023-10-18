<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행기 리스트</title>
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
	
	}
	
	.topF{
		display: flex;
		justify-content: space-between;
		font-weight: bold;
		border-bottom: 1px solid silver;
		padding-bottom: 0.25%;
	}
	
	.home{
		cursor: pointer;
	}
	
	.sche{
		cursor: pointer;	
	}
	
	.menu{
	
	}
	
	.menuF{
		display: flex;
	    justify-content: space-between;
	    width: 65vw;
	    padding: 10px;
	    border-bottom: 1px solid silver;
        height: auto;
	}
	
	.addrI{
		cursor: pointer;
	}
	
	.addrF{
		display: flex;
	    width: 35vw;
	    height: auto;
	    justify-content: space-around;
	}
	
	.addr{
	    text-align: center;
	    width: 2.5vw;
	    border: 1px solid ;
	    padding: 1%;
	    border-radius: 25px;
	    height: 5vh;
	    line-height: 4vh;
	}
	
	.addrC{
	    text-align: center;
	    width: 2.5vw;
	    border: 1px solid #26CEC2;
	    padding: 1%;
	    border-radius: 25px;
	    height: 5vh;
	    line-height: 4vh;
	}
	
	.addrN{
		text-align: center;
		font-weight: bold;
		font-size : 11pt;
		color: silver;
	}

	.addrNC{
		text-align: center;
		font-weight: bold;
		font-size : 11pt;
	}
	
	.start{
		cursor: pointer;
		border: 1px solid;
    	width: 25vw;
	}
	
	.mid{
	    padding-left: 1%;
   	 	width: 130vh;
	}
	
	.mid1{
	
	}
	
	.mid1T{
		font-weight: bold;
	    font-size: 15pt;
	    padding-top: 2%;
	    padding-bottom: 1%;
	}
	
	.mid1C{
		color: silver;
	    padding-bottom: 1%;
	}
	
	.mid2{
	
	}
	
	.midF{
		display: flex;
	    flex-wrap: wrap;
	    /* justify-content: space-between; */
	    width: auto;
	    padding: 4%;
	}
	
	.slog{
		box-shadow: 0px 0px 12px 0px silver;
	    cursor: pointer;
	    width: 18vw;
	    /* height: auto; */
	    margin: 1%;
	    position: relative;
	    border-radius: 9px;
	}
	
	.slog:hover{
		border: 2px solid #26CEC2;
	}
	
	.slogP{
	    border-bottom: 1px solid;
    	height: 21vh;
	}
	
	.slogI{
		position: relative;
	    top: -12px;
	    left: 20px;
	    width: 16vw;
	}
	
	.mP{
		z-index: 1;
	    width: 3vw;
	    height: 6vh;
	    border: 1px solid;
	    border-radius: 33px;
	    line-height: 6vh;
	    text-align: center;
	    position: relative;
	    top: -26px;
	    left: 20px;
	    background-color: silver;
	}
	
	.slogM{
		color: silver;
		font-size: 
	}
	
	.slogT{
	    padding-top: 3px;
	    padding-bottom: 3px;
	    font-weight: bold;
	}
	
	.slogC{
		color: grey;
	}
	
	.bot{
		padding-left: 1%;
  	 	width: auto;
  	 	height: auto;
	}
		
	.botB{
		border: 1px solid;
	    width: auto;
	    padding: 7px;
	    text-align: center;
	    border-radius: 5px;
	    cursor: pointer;
	    background-color: #26CEC2;
	    color: white;
	    font-weight: bold;
	    height: 3vh;
	    line-height: 3vh;
	    font-size: 12pt;
	}
	
	.upSec{
	    padding-top: 4%;
   		padding-right: 3%;
	}
	
	.up{
		cursor: pointer;
		border: 1px solid;
	    width: 2vw;
	    text-align: center;
	    height: 4vh;
	    line-height: 4vh;
	    border-radius: 45px;
	    font-size: 18pt;
	    font-weight: bold;
	}
	
	.img{
		width: 1vw;
  		transform: rotate(90deg);
	}
	
</style>
<script>
	




</script>
</head>
<body>
<div class="major">
	<div class="top">
		<div class="topF">
			<div class="home" onclick="location.href='${pageContext.request.contextPath}/'">TRIPPIN</div>
			<div class="sche">내 일정보기</div>
		</div>
	</div>
	<div class="menu">
		<!-- <div class="menuF">
			<div class="addrF">
				for
				<div class="addrI">
					<div class="addrC"></div>
					<div class="addrNC">국내</div>				
				</div>
				<div  class="addrI">
					<div class="addr"></div>
					<div class="addrN">서울</div>				
				</div>
				<div class="addrI">
					<div class="addr"></div>
					<div class="addrN">부산</div>				
				</div>
				<div class="addrI">
					<div class="addr"></div>
					<div class="addrN">제주</div>				
				</div>
				for
			</div>
			<div class="start">출발 월</div>
		</div> -->
	</div>
	<div class="mid">
		<div class="mid1">
			<div class="mid1T">국내 실시간 여행기🧭</div>
			<div class="mid1C">직접 다녀온 추천 일정과 여행 꿀팁 확인하기</div>
		</div>
		<div class="mid2">
			<div class="midF">
				<!-- for -->
				<c:forEach var="slog" items="${slogList }">
					<div class="slog" style="height: auto;" onclick="location.href='${pageContext.request.contextPath}/slog/slogDetail?slog_seq=${slog.SLOG_SEQ }'">
						<div class="slogP"></div>
						<div class="mP"></div>
						<div class="slogI">
							<div class="slogM">${slog.M_NICKNAME }님의 일정 - ${slog.ND }</div>
							<div class="slogT">${slog.TITLE }</div>
							<div class="slogC" >${slog.CATE }</div>
						</div>
					</div>
				</c:forEach>				
				<!-- for -->
			</div>	
		</div>	
	</div>
	<div class="bot">
		<div class="botB" onclick="location.href='${pageContext.request.contextPath}/'">
			트리플 홈으로 가기
		</div>
		<div class="upSec" align="right">
			<div class="up"><img class="img" src="https://cdn.icon-icons.com/icons2/1462/PNG/512/134leftarrow_100014.png"> </div>
		</div>
	</div>
</div>
</body>
</html>