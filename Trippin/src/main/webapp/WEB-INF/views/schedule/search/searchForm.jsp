<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

body{
	margin: 0;
}

	.top{
		border: 1px solid;
		width: 100%;
		height: 70px;
	}
	
	.reg{
		border: 1px solid;	
		margin-left: 0.5%;
		
	}
	
	.top1{
		border: 1px solid;	
		width: 70%;
		margin-left: 8%;
		margin-bottom: 0.5%;
	}
	
	.top2{
		display: flex;
		margin-left: 27%;
	}

	.filt{
		border: 1px solid;
		margin-right: 2%;		
	}
	
	.mid{
		border: 1px solid;		
	}
	
	.mid1{
		margin-top:2%;
		border: 1px solid;		
		
	}
	
	.content{
		margin-top:0.5%;
		margin-bottom:0.5%;
		display: flex;	
	}
	
	.list{
		border: 1px solid;		
		margin-left : 3%;
		margin-right : 3%;
		width: 85%;		
	}

	.btn{
		border: 1px solid;		
	}	

	.bot{
		border: 1px solid;
	}
	
	.goBtn{
		margin-top: 2%;
		margin-left : 16%;
		margin-bottom: 2%;
		width: 70%;
		height: 30px;
		border: 1px solid;
	}
	
	
</style>
<meta charset="UTF-8">
<title>일정 장소 추가</title>
</head>
<body>
<div class="top">
<div style="display: flex; margin-top: 0.5%;">
		<div class="reg">지역 선택</div>
		<div class="top1">
			<div>검색</div>
		</div>
</div>
	<div class="top2">
	
		<div class="filt">모든 지역</div>
		<div class="filt">추천순</div>
		<div class="filt">장소 종류</div>
		<div class="filt">장소 종류</div>
		<div class="filt">장소 종류</div>
		
	</div>
</div>
<div class="mid">
	<div class="mid1">
	<div>관광지</div>
	
		<div class="content">
			<div class="list">
			관광지 리스트
			</div>
			<div class="btn">버튼</div>
		</div>
		
	</div>
	<div class="mid1">
	<div>맛집</div>
	
		<div class="content">
			<div class="list">
			맛집 리스트
			</div>
			<div class="btn">버튼</div>
		</div>
		
	</div>
	<div class="mid1">
		<div>티켓/투어</div>
		
		<div class="content">
			<div class="list">
			투어 리스트
			</div>
			<div class="btn">버튼</div>
		</div>
		
	</div>
	<div class="mid1">
		<div>숙소</div>
	<!-- for -->
		<div class="content">
			<div class="list">
			숙소 리스트
			</div>
			<div class="btn">버튼</div>
		</div>
	<!-- for -->

		<div class="content">
			<div class="list">
			숙소 리스트
			</div>
			<div class="btn">버튼</div>
		</div>
			
	</div>
</div>
<div class="bot">
	<div class="goBtn">선택 완료 버튼</div>
</div>

</body>
</html>