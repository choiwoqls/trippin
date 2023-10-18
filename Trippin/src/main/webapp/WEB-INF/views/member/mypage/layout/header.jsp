<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<title>Insert title here</title>

<style>

	#top{
		width: 100%;
		height: 3em;
		background-color: #F2F2F2;
	}
	#header{
		 align: center;
		 width: 64em;  
		 height: 7em;
		 background-color:#FFCC99;
	}
	#bar{
		align:center;
		width: 100%; 
		background-color:#CCE5FF; 
		margin-top: 1%; 
		padding-top: 0.5%; 
		padding-bottom: 0.5%;
	}
	#bar_menu{
		 align:left;
		 width:64em; 
		 background-color:#99CCFF;
		 display: flex;
	}
	.bar_items{
		align:left;
		background-color:#FFFFCC; 
		cursor: pointer;
		display: flex;
		margin-right: 1em;
	}
	#back{
		align: center;
		display: flex;
		width: 64em;
	}
	#left_menu{
		/* align: left; */
		left : 0;
		width: 13em;
		height:80em;
		/* display: flex; */
		position: relative;
		background-color: #CCCCFF;
		margin-top: 1%;
	}
	.profile{
		/* align:left; 
		width: 90.5%; */ 
		height:20em;
		background-color:#FFCC99; 
		position: relative;
		padding: 10px;
		margin-bottom: 5%;
		
	}
	.m_point{
		align:center;
		width:85%;
		height:7em;
		background-color: #FFF5E9;
		position: relative; 
		margin-top: 10%;
		text-align: left;
	}
	.left_menu_bar{
		/* align:left; */ 
		/* width: 91%;  */
		/* height:40em; */
		background-color:#FFFFCC; 
		position:relative;
		padding: 10px;
	}
	.left_menu_items{
		 /* align: left; */
		 padding-left: 5%;
		 position:relative;
		 background-color:#FFCCCC; 
	}
	#content{
		 align:center;
		 right:0%;
		 width:51em; 
		 height:80em;
		 background-color: #FFCCCC; 
		 margin-top: 1%;
		 /* display: flex; */
		 position: relative;
		 margin-left: 1%;
	}
	#m_menu{
		/* left:1em; */
		width: 51em;
		height:2em;
		background-color: #CCFFE5;
		position: relative;
		display : flex;
	}
	.m_menu_items{
		align: left;
		valign:bottom;
		background-color: #E5CCFF;
		padding-top: 0.5em;
		padding-left: 1em;
		padding-right: 1em;
		margin-right: 1em;
	}
	.textContent{
		right: 0%;
		width: 100%-2em;
		height: 90em;
		background-color: white;
		position: relative;
		padding: 2em;
		/* margin-top: 4% */
		
	}
	.uimg {
        width : 60px;
        height : 60px;
        border-radius: 30px;
        object-fit: cover;
    }
    .nickname{
    	font-size: large;
    	margin-top: 2%;
    }
    .lmi_title{
    	font-weight: bold;
    	font-size: large;
    }
    .lmi_content{
    
    }
    .list{
    	padding-inline-start: 15px;
    }
    div ul li{
    	cursor: pointer;
    }
</style>

</head>
<body>

<div align="center">
	<div id="top">
		메인화면 제일 위에 있는 로그인, 회원혜택, 고객센터 적혀있는 그거 여기에도 넣기
	</div>
	
	<div id="header"><!-- header 영역 시작 -->
		<div align="left">
			Trippin'	<!-- 트리핀 로고 자리 -->
		</div>
		<div>
			검색창 영역
		</div>
	</div><!-- header 영역 끝 -->
	
	<div id="bar"><!-- 메뉴 바 영역 시작 -->
		<div id="bar_menu">
			<a class="bar_items" href="#">관광지</a>
			<a class="bar_items" href="#">맛집</a>
			<a class="bar_items" href="#">투어·티켓</a>
			<a class="bar_items" href="#">여행기</a>
		</div>
	</div><!-- 메뉴 바 영역 끝 -->
	
	<div id="back">
		<div id="left_menu"><!-- 왼쪽 메뉴 시작 -->
			<div class="profile"><!-- 회원 정보 영역 시작 -->
				<div><!-- 회원 프로필 사진 영역 -->
					<img class="uimg" src="${cpath}/common/getImg?path=${mvo.m_profile }&file=${m_profileNM }">
				</div>
				<div align="center">
					<div class="nickname">
						<b>${mvo.m_nickname }</b>
					</div>
					<div class="level">
						LEVEL <b>${mvo.m_level }</b>
					</div>
					<div class="profBtn">
						<input type="button" value="LEVEL별 혜택" onclick="document.location.href='${cpath}/member/level'">
					</div>
					<div class="profBtn">
						<input type="button" value="회원 정보 수정" onclick="document.location.href='${cpath }/member/updateM?m_seq=${mvo.m_seq }'">
					</div>
					
					<div class="m_point"><!-- 프로필 내 포인트 관련 영역 시작 -->
						<div>
							My 포인트
						</div>
						<div>
							트리플 캐시
						</div>
					</div><!-- 프로필 내 포인트 관련 영역 끝 -->
				</div>
			</div><!-- 회원 정보 영역 끝 -->	
			
			<div class="left_menu_bar">
				<div class="left_menu_items" align="left">
					<div class="lmi_title">
						내 저장
					</div>
					<div class="lmi_content">
						<ul class="list">
							<li>관광</li>
							<li>맛집</li>
							<li>숙소</li>
							<li>투어·티켓</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="left_menu_bar">
				<div class="left_menu_items" align="left">
					<div class="lmi_title">
						내 예약
					</div>
					<div class="lmi_content">
						<ul class="list">
							<li>숙소</li>
							<li>투어·티켓</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="left_menu_bar">
				<div class="left_menu_items" align="left">
					<div class="lmi_title">
						쿠폰함
					</div>
					<div class="lmi_content">
						<ul class="list">
							<li>사용 가능한 쿠폰</li>
							<li>사용된 쿠폰</li>
							<li>만료된 쿠폰</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="left_menu_bar">
				<div class="left_menu_items" align="left">
					<div class="lmi_title">
						친구초대
					</div>
					<div class="lmi_content">
						<ul class="list">
							<li onclick="document.location.href='${cpath}/member/mypage/mycode?m_seq=${mvo.m_seq }'">친구에게 추천하기</li>
							<li onclick="document.location.href='${cpath}/member/mypage/recom_code?m_seq=${mvo.m_seq }'">초대코드 입력</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!-- 왼쪽 메뉴 끝 -->
		
		<div id="content"><!-- 본문 정보 영역 시작 -->
			<div id="m_menu"><!-- 회원 상단 메뉴 고르기 영역 시작 -->
				<span class="m_menu_items">
					내 여행
				</span>
				<span class="m_menu_items">
					리뷰
				</span>
				<span class="m_menu_items">
					여행기
				</span>
			</div><!-- 회원 상단 메뉴 고르기 영역 끝 -->
			
			<div class="textContent"><!-- body 시작 -->