<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500,700|Google+Sans+Text:400&amp;lang=ko">
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Google+Sans+Text:400&amp;text=%E2%86%90%E2%86%92%E2%86%91%E2%86%93&amp;lang=ko">
<style>
html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,
blockquote,pre,abbr,address,cite,code,del,dfn,em,img,
ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,
fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
article,aside,canvas,details,figcaption,figure,footer,header,hgroup,
menu,nav,section,summary,time,mark,audio,video,fieldset {margin:0; padding:0; }


table{border-collapse:collapse;border-spacing:0;}
img{max-width:100%;height:auto;}
mark{background:none}
select{max-width:100%;}
caption, legend {display:none;}
hr{display:none;}
h1,h2,h3,h4,h5,h6 { font-size:100%; }
address,strong{font-style:normal; font-weight:normal;}
table {border-collapse:collapse; }
input, select{outline: none;font-family:inherit}

body {
    background-color: #F2F2F2;
    height: auto;
}
.header {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    
    border-bottom : 1px solid #F2F2F2;
}
.hd-in {
    padding-left : 10%;
    padding-top : 2%;
}
.hd-in a {
    text-decoration: none;
}
.hd-in a img {
    width : 25px;
    margin-top : 2%;
}
.hd-bot {
    padding-top : 5%;
    padding-bottom : 5%;
    padding-left : 10%;
    font-weight: bold;
    font-size : 22px;
}
.main {
    margin-left : 30%;
    margin-right : 30%;
    background-color: white;
    font-family: Arial, Helvetica, sans-serif;
}
.main-top {
    padding : 5%;
    margin-left : 10%;
    margin-right : 10%;
    border-bottom : 1px solid #F2F2F2;
}
.main-text {
    margin-left : 10%;
    margin-right : 10%;
    color: #919191;
    height : 50vh; 
}
.main-list {
    list-style-position: inside;
    font-weight: bold;
}
.text-list {
    list-style-position: inside;
    font-weight: bold;
    word-break: keep-all;
    padding-top : 3%;
    line-height: 200%;
    list-style: none;
    font-size : 14px;
}
.text-list li::marker {
    content : "·";
    font-size : 16px;
    color: black;
}
.text-list li {
    padding-left : 2%;
}
.text-list li span {
    text-decoration: underline 1.5px;
    color: rgba(58, 58, 58, 0.8);
    cursor: pointer;
}
.blue-li {
    color :#2987F0;
}
.red-li {
    color: #de2e5f;
}
.line {
    border-left : 1px solid #CBCBCB;
    margin-left : 0.41%;
    padding-left : 4%;
    padding-bottom : 5%;
    padding-top : 0.5%;
    color: #919191;
    font-size : 14px;
    word-break: keep-all;
    line-height: 200%;
}
</style>
    </head>
    <body>
        <header class="header">
            <div class="inner">
                <div class="hd-in">
                    <a onclick="window.close()">
                        <img src="https://cdn-icons-png.flaticon.com/512/109/109602.png">
                    </a>
                </div>
                <div class="hd-bot">
                    <span>취소 및 환불 정책</span>
                </div>
            </div>
        </header>
        <div class="main">
            <div class="main-top">
                <ul class="main-list">
                	<c:forEach var="map" items="${list }">
                		<c:if test="${map.percent == 100}">
                			<li class="blue-li">전액 환불</li>
                		</c:if>
                		<c:if test="${map.percent != 100 }">
                			<li class="red-li">부분 환불&nbsp;(${100-map.percent }%&nbsp;공제)</li>
                		</c:if>
                		<div class="line">${map.date }&nbsp;(오후 5:00까지)</div>
                 	</c:forEach>
                 	<li class="red-li">이후 환불 불가</li>
                </ul>
            </div>
            <div class="main-text">
                <ul class="text-list">
                    <li>서울 시간 기준</li>
                    <li>취소 및 환불 처리는 영업일/영업시간 내 이루어집니다.</li>
                    <li>영업시간 후 취소 요청된 예약은 다음 영업일자 접수로 처리됩니다.</li>
                    <li>예약 취소 및 환불에 대해 궁금한 사항이 있는 경우 카카오톡 <span>@트리핀투어</span> 혹은 <span>+82-1-1111-1234</span>으로 문의주세요.</li>
                </ul>
            </div>
        </div>
    </body>
</html>