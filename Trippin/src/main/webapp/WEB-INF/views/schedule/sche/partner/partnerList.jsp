<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		margin: 0;
	}

	.top{
	 	
	 	width: 100%;
	 	height: 40vh;
        background-color: #34DBD3;
        padding-top : 1%;
	}

	.top1{
        display : flex;
        
        padding-left : 1.5%;
	}
	
	.top2{
		
		display: flex;
        text-align: center;
        color : white;
        font-weight: bold;
        padding-top : 8%;
        padding-left : 9%;
        gap : 5%;
	}
	
	.tBtn{
		cursor: pointer;
		font-size : 14px;
		
	}
	
	.bot{
		width: 80%;
		margin-top: 3%;
        margin-left : 10%;
        margin-right : 10%;
	}

	.bitem{
		cursor: pointer;
		border-bottom: 2px solid;
		margin-top: 1%;
		height: 7vh;
        line-height: 7vh;
	}
    .back {
        width : 10%;
    }
    .back-img {
        width : 30px;
        cursor: pointer;
    }
    .title-text {
        font-size : 35px;
        color : white;
        font-weight: bold;
        padding-top : 1%;
        font-family: Arial, Helvetica, sans-serif;
    }
    .kakao-img {
        width : 50px;
    }
    .email-img {
        
        width : 50px;
    }
    .copy-img {
        width : 50px;
    }
</style>
<script>
	function invite(item) {
		switch(item){
		case 'kakao':
			alert("업데이트 예정");
			break;
		case 'email':
			alert("업데이트 예정");
			break;			
		case 'copy':
			const url = document.getElementById("url").value;
			window.navigator.clipboard.writeText(url).then(() => {
				  alert("복사 완료!");
				});
			break;
		}
	}
	

</script>
<meta charset="UTF-8">
<title>여행 초대</title>
</head>
<body>
<input type="hidden" id="url" value="${url }"> 
<div class="top">
	<div class="top1">
        <div class="back">
            <img onclick="history.back()" class="back-img" src="https://cdn-icons-png.flaticon.com/512/959/959160.png">
        </div>
        <div class="title-text">
            <span>여행 초대</span>
        </div>
    </div>
	<div class="top2">
		<div class="tBtn" onclick="invite('kakao')">
            <img class="kakao-img" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/KakaoTalk_logo.svg/800px-KakaoTalk_logo.svg.png">
            <div>카카오톡 초대</div>
        </div>
		<div class="tBtn" onclick="invite('email')">
            <img class="email-img" src="https://cdn.icon-icons.com/icons2/2699/PNG/512/gmail_logo_icon_168165.png">
            <div>이메일로 초대</div>
        </div>
		<div class="tBtn" onclick="invite('copy')">
            <img class="copy-img" src="copy-img.png">
            <div>초대링크 복사</div>
        </div>
	</div>
</div>
<div class="bot">
<!-- for -->
<c:forEach var="vo" items="${mlist }">
<div class="bitem">${vo.m_name }</div>
</c:forEach>
<!-- for -->
</div>
</body>
</html>