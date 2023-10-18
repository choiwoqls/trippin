<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }"/>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>reservation room</title>

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


                ol,ul{list-style:none}
                li { list-style-type:none; }
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

                .hd-in {
                    display : flex;
                    
                    height: 10vh;
                    margin-left : 1%;
                    margin-right : 1%;
                    border-bottom : 3px solid #F2F2F2;
                }
                header {
                    background-color: white;
                    margin-left: 30%;
                    margin-right : 30%;
                    
                }
                .hd-left img {
                    width : 40px;
                    padding-top : 25%;
                }
                .hd-right {
                    height : 10vh;
                    line-height: 10vh;
                    font-weight: bold;
                    font-size : 20px;
                }
                .hd-left {
                    width : 10%;
                    padding-left : 3%;
                    height: 10vh;
                }
                body {
                    background-color: #F2F2F2;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                }
                .title {
                    padding-left : 4%;
                    padding-right : 4%;
                    padding-top : 3%;
                    padding-bottom : 5%;
                    border-bottom : 10px solid #F2F2F2;
                }
                .add-info, .per-info, .traffic-info {
                    padding-left : 4%;
                    padding-right : 4%;
                    padding-top : 7%;
                    padding-bottom : 5%;
                    border-bottom : 10px solid #F2F2F2;
                }
                .room-name {
                    font-weight: bold;
                    font-size : 24px;
                    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
                }
                .room-loca {
                    font-size : 16px;
                    color: rgba(58, 58, 58, 0.4);
                    font-weight: 550;
                    padding-top : 0.5%;
                }
                .top-title {
                    padding-bottom : 5%;
                    border-bottom : 3px solid #F2F2F2;
                }
                .check {
                    
                    margin-top : 3%;
                }
                .check-a {
                    display : flex;
                    justify-content: space-between;
                    color: #2987F0;
                    font-weight: bold;
                    padding-left : 1.5%;
                    padding-right : 1.5%;
                    padding-bottom : 0.5%;
                }
                .check-b {
                    display: flex;
                    width : 100%;
                }
                .check-c {
                    display : flex;
                    justify-content: space-between;
                    color : #CDCDCD;
                    font-weight : bold;
                    padding-left : 1.8%;
                    padding-right : 3.3%;
                    padding-top : 0.5%;
                }
                .before-date {
                    width : 33.3%;
                    font-size : 20px;
                    font-weight: bold;
                }
                .total-date {
                    width : 33.4%;
                    font-size : 16px;
                    font-weight: bold;
                    text-align: center;
                    
                }
                .after-date {
                    width : 33.3%;
                    font-size : 20px;
                    font-weight: bold;
                    text-align: right;
                }
                .blue-dot {
                    color : #3878C7;
                }
                .gray-dot {
                    color :#E8EAED;
                }
                .bot-title {
                    padding-top : 2%;
                }
                .room-cate {
                    display : flex;
                    
                    justify-content: space-between;
                }
                .cate-name {
                    font-weight: bold;
                    font-size : 20px;
                }
                .right-arrow {
                    width : 12px;
                    position: relative;
                    top : 0.5vh;
                }
                .room-num {
                    display: flex;
                    justify-content: space-between;
                    padding-top : 5%;
                }
                .number-title {
                    color : #CDCDCD;
                    font-weight: bold;
                }
                .number-text {
                    font-weight: bold;
                }
                .room-price {
                    display: flex;
                    justify-content: space-between;
                    padding-top : 3%;
                }
                .room-img {
                    padding-top : 4%;
                    width : 100%;
                    height : 20vh;
                }
                .room-img img {
                    width : 100%;
                    height : 20vh;
                    border-radius: 4px;
                    object-fit: cover;
                }
                .add-title, .per-title, .traffic-title {
                    font-weight: bold;
                    font-size : 24px;
                }
                .add-name, .traffic-name {
                    padding-top : 3%;
                    font-weight: bold;
                    
                }
                .name-input {
                    margin-top : 1%;
                    height : 2vh;
                    padding-left : 3%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    width : 96%;
                    border : 2px solid #E8EAED;
                    border-radius: 4px;
                    font-weight: bold;
                }
                .add-span {
                    font-size : 13px;
                    font-weight: bold;
                    color: #CDCDCD;
                }
                .per-stitle {
                    font-weight: bold;
                    font-size : 16px;
                    color : #2987F0;
                    padding-top : 3%;
                }
                .per-name, .per-detail {
                    display : flex;
                    width : 100%;
                    padding-top : 3%;
                }
                .first-name, .last-name {
                    width : 50%;
                    font-weight : bold;
                    font-size : 16px;
                }
                .front input, .back input {
                    width : 60%;
                    height : 6vh;
                    border : 2px solid #E8EAED;
                    border-radius: 4px;
                    font-weight: bold;
                }
                .name-tit {
                    padding-bottom : 3%;
                }
                .choice-one {
                    display : flex;
                    
                    width : 63%;
                  
                }
                .option1, .option2 {
                    width : 50%;
                    border : 2px solid;
                    text-align: center;
                    line-height: 5.5vh;
                    color : #E8EAED;
                    cursor: pointer;
                    background-color: white;
                    font-weight: bold;
                    padding-top : 2%;
                    padding-bottom : 2%;
                }
                .option1 {
                    border-right : 1px solid !important;
                }
                .option2 {
                    border-left : 1px solid !important;
                }
                .option1:focus,.option2:focus {
                    color :#2987F0;
                }
                .option1:focus {
                    border-right : 2px solid !important;
                }
                .option2:focus {
                    border-left : 2px solid !important;
                }
                .red-dot {
                    color : red;
                }
                .traffic-name {
                    color :#2987F0;
                }
                .tr-select {
                    width : 80%;
                    box-sizing: border-box;
                    margin-top : 2%;
                    height : 7vh;
                    padding-left : 2%;
                    font-size : 15px;
                    font-weight: bold;
                    outline: none;
                    border : 2px solid #F2F2F2;
                    border-radius: 4px;
                }
                .payment {
                    padding-top : 3%;
                    padding-left : 2%;
                    padding-right : 2%;
                }
                .pm-1 {
                    font-weight: bold;
                    font-size : 20px;
                    padding-bottom : 3%;
                }
                .pm-2 {
                    display : flex;
                    justify-content: space-between;
                    font-weight: bold;
                    color :#897E7F;
                    font-size : 15px;
                }
                .pm-3 {
                    display: flex;
                    justify-content: space-between;
                    
                    margin-top : 2%;
                }
                .pm3-name {
                    line-height: 5.5vh;
                    font-weight: bold;
                    color :#897E7F;
                }
                .pm3-text {
                    width : 60%;
                    text-align: right;
                }
                
                .pm3-img {
                    width : 24px;
                    position : relative;
                    bottom : 1.5vh;
                    cursor: pointer;
                }
                .pm3-text input {
                    border : 1px solid #F2F2F2;
                    width : 70%;
                    padding : 5%;
                    height : 0.5vh;
                }
                .total {
                    margin-top : 3%;
                    border-top : 1px solid rgb(239, 239, 239);
                    padding-bottom : 5%;
                    border-bottom : 10px solid rgb(239, 239, 239);
                }
                .total-1, .total-2 {
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 3%;
                    display: flex;
                    justify-content: space-between;
                    font-weight: bold;
                }
                .total-2 {
                    font-size : 14px;
                }
                .tot2-name {
                    color :#897E7F;
                }
                .tot2-text {
                    color :#4285F4;
                }
                .fast-img {
                    width : 16px;
                    height: 16px;
                    cursor: pointer;
                    position: relative;
                    top : 0.35vh;
                }
                .text-img img {
                    width : 10px;
                    height : 10px;
                    position: absolute;
                    top : 16px;
                    right : 17px;
                    cursor: pointer;
                }
                .sel-text {
                    width : 9vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    font-weight: 500;
                    padding: 15px 37px 15px 15px;
                    font-size : 12px;
                    position: relative;
                    left : 74%;
                    bottom : 1.2vh;
                    display: none;
                }
                .sel-textz {
                    width : 13vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    font-weight: 500;
                    padding: 15px 37px 15px 15px;
                    font-size : 12px;
                    position: relative;
                    left : 2%;
                    bottom : 0.5vh;
                    display: block;
                    word-break:break-all;
                }
                .sel-check {
                    appearance: none;
                    width : 22px;
                    height : 22px;
                    margin: 3px 8px 3px 4px;
                    border-radius: 25px;
                    position : relative;
                    top : 1vh;
                    cursor: pointer;
                    border : 1px solid rgba(58,58,58,0.2);
                    content: "";
                    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
                    background-size: 100% 100%;
                    background-color: gray;
                }
                .sel-check:checked {
                    background-color: #2987F0;
                    border: none;
                }
                .sel-check::after {
                    content: "";
                    display : block;
                    width : 100%;
                    height : 100%;
                    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
                    background-size: 100% 100%;
                }
                .agree {
                    padding-left : 2%;
                    padding-right : 2%;
                }
                .ag-1 {
                    padding-top : 5%;
                    padding-bottom : 3%;
                    font-size : 20px;
                    font-weight: bold;
                }
                .ag2-check {
                    border-bottom : 2px solid rgba(239,239,239,1);
                    padding-bottom : 2%;
                    font-weight: bold;
                }
                .ag-3,.ag-4 {
                    padding-top : 2%;
                    padding-bottom : 2%;
                }
                .ag-4 {
                    padding-bottom : 4%;
                    border-bottom : 2px solid rgba(239,239,239,1);
                }
                .ag-3 span{
                    font-weight: bold;
                    font-size : 14px;
                    border-bottom: 1px solid;
                }
                .ag-4 span {
                    font-weight: bold;
                    font-size : 14px;
                }
                
                .ag4-check2 {
                    padding-top : 2%;
                    padding-left : 2.5%;
                }
                .sel-check2 {
                    appearance: none;
                    width : 22px;
                    height : 22px;
                    margin: 3px 8px 3px 4px;
                    border-radius: 25px;
                    position : relative;
                    top : 1vh;
                    cursor: pointer;
                    content: "";
                    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
                    background-size: 100% 100%;
                    filter: invert(73%) sepia(0%) saturate(33%) hue-rotate(143deg) brightness(102%) contrast(93%);
                }
                .sel-check2:checked {
                    filter: invert(40%) sepia(87%) saturate(1642%) hue-rotate(194deg) brightness(96%) contrast(96%);
                    border: none;
                }
                .sel-check2::after {
                    content: "";
                    display : block;
                    width : 100%;
                    height : 100%;
                    background-image: url("https://assets.triple.guide/images/ico-check@3x.png");
                    background-size: 100% 100%;
                }
                .ag4-check2 span {
                    border-bottom : 1px solid;
                }
                .info-btn img {
                    width : 15px;
                    position: relative;
                    top : 0.3vh;
                    left : 0.4vw;
                    filter: invert(57%) sepia(7%) saturate(383%) hue-rotate(305deg) brightness(86%) contrast(85%);
                }
                .ag4-info {
                    background-color: rgba(239,239,239,1);
                    padding : 3%;
                    font-size : 10px;
                    margin-top : 2%;
                }
                .a4-text {
                    word-break: keep-all;
                    font-size : 13px !important;
                }
                .a4-gray {
                    color : #897E7F;
                }
                .a4-black {
                    color : #4285F4;
                }
                li::marker {
                    content: "•";
                }
                li {
                    padding-left : 1%;
                }
                ul {
                    line-height: 250%;
                }
                .info-btn {
                    border : 2px solid rgba(58,58,58,0.2);
                    border-radius: 4px;
                    padding : 1%;
                    padding-right : 2%;
                    padding-left : 2%;
                    display: inline-block;
                    margin-top : 2%;
                    background-color: white;
                    cursor: pointer;
                }
                .info-btn span {
                    font-size : 13px !important;
                    font-weight: bold;
                    color : rgba(58, 58, 58, 0.8);
                }
                .foot-btn {
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 3%;
                    padding-bottom : 3%;
                }
                .accept-btn {
                    color : white;
                    font-weight: bold;
                    font-size : 13px;
                    cursor: pointer;
                    height : 5vh;
                    line-height : 5vh;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    border-radius: 4px;
                    text-align: center;
                    background-color: rgb(54, 143, 255);
                    border:none;
                    width : 500px;
                }
                .info-title span{
                    color : #de2e5f;
                    font-size: 16px !important;
                }
                .info-title {
                    padding-bottom : 1%;
                }
                .seller-info {
                    padding-top : 2%;
                    padding-bottom : 4%;
                    color :rgba(58, 58, 58, 0.4);
                    font-size : 14px;
                    word-break: keep-all;
                    line-height: 150%;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU"></a>
                        </div>
                        <div class="hd-mid">
                            
                        </div>
                        <div class="hd-right">
                            예약하기
                        </div>
                    </div>
                </div>
            </header>
            <form action="${cpath }/member/accom/insert" method="post">
            	<input type="hidden" id="m_seq" name="m_seq" value="${m_seq }">
            <div class="main">
                <div class="title">   <!--제목 지역 예약정보 숙소정보 투숙인원 요금 객실혜택 나오는 영역-->
                    <div class="top-title"> <!--예약정보까지-->
                        <div class="room-name">
                            <span>${rvlist.NAME }</span> <!--숙소 이름-->
                        </div>
                        <div class="room-loca"><!--지역명-->
                            <span>${rvlist.ADDR1_NAME }</span>
                        </div>
                        <div class="room-img"><!--숙소 대표사진-->
                            <img src="https://yaimg.yanolja.com/v5/2023/08/28/12/1280/64ec902d12a196.49209318.jpg">
                        </div>
                        <div class="check">
                            <div class="check-a">
                                <div class="checkin">
                                    <span>체크인</span>
                                </div>
                                <div class="checkout">
                                    <span>체크아웃</span>
                                </div>
                            </div>
                            <div class="check-b">
                                <div class="before-date"><!--체크인 날짜-->
                                    <span>${startDate}</span>
                                </div>
                                <div class="total-date"><!--일 수-->
                                    <span class="gray-dot">·</span><span class="blue-dot">· </span><span>${fn:replace(duration, 'days', '일')}</span><span class="blue-dot"> ·</span><span class="gray-dot">·</span>
                                </div>
                                <div class="after-date"><!--체크아웃 날짜-->
                                    <span>${endDate}</span>
                                </div>
                            </div>
                            <div class="check-c">
                                <div class="in-time"><!--체크인 시간-->
                                    <span>${rvlist.CHECKIN }</span>
                                </div>
                                <div class="out-time"><!--체크아웃 시간-->
                                    <span>${rvlist.CHECKOUT }</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bot-title"><!--숙소정보 부터-->
                        <div class="room-cate">
                            <div class="cate-name"><!--숙소정보-->
                                <span>글램핑</span>
                            </div>
                            <div class="cate-btn">
                                <img class="right-arrow" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWrnSCnqAPbV4rzOaJotXyZhbccbclzdhpeTlO5Q0vkHb1N2XCEq-0v93mCMLdO2J2wAM&usqp=CAU">
                            </div>
                        </div>
                        <div class="room-num">
                            <div class="number-title"><!--인원 정보-->
                                <span>투숙인원</span>
                            </div>
                            <div class="number-text">
                                <span>성인 ${result}인,아동 ${totalCount}인</span><span>(${selectedButtons})</span>
                            </div>
                        </div>
                        <div class="room-price"><!--요금기준 인원 정보-->
                            <div class="number-title">
                                <span>요금 기준인원</span>
                            </div>
                            <div class="number-text">
                                <span>성인 ${rvlist.MAXPEOPLE }인</span>
                            </div>
                        </div>
                        <div class="room-price"><!--객실 혜택 정보-->
                            <div class="number-title">
                                <span>객실혜택</span>
                            </div>
                            <div class="number-text">
                                <span>원베드</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="add-info"> <!--예약자 이름 전화번호 이메일-->
                    <div class="add-title">
                        <span>예약자 정보</span>
                    </div>
                    <div class="add-name"> <!--예약자 이름-->
                        <div>한글명</div>
                        <input class="name-input" type="text" id="name" placeholder="실명, 한글로 입력" name="reservation_name" value="${rvmember.m_name }">
                    </div>
                    <div class="add-name"> <!--예약자 전화번호-->
                        <div>휴대전화번호</div>
                        <input class="name-input" type="text" id="tel" placeholder="-빼고 숫자만입력" name="reservation_tel" value="${rvmember.m_tel }">
                    </div>
                    <div class="add-name"> <!--예약자 이메일-->
                        <div>이메일</div>
                        <input class="name-input" type="text" id="mail" placeholder="ID@trippin.com" name="reservation_mail" value="${rvmember.m_email }">
                        <span class="add-span">위의 이메일로 예약확정 안내(바우처 등)가 전송됩니다.</span>
                    </div>
                </div>
                <div class="per-info"> <!--투숙자 정보-->
                    <div class="per-title">
                        <span>투숙자 정보</span>
                    </div>
                    <div class="per-stitle">
                        <span>대표 투숙자</span>
                    </div>
                    <div class="per-name">
                        <div class="first-name">
                            <div class="front">
                                <div class="name-tit">성</div>
                                <input type="text" id="lastName" placeholder="홍" name="stay_last_name" value="${rvlist.STAY_LAST_NAME }">
                            </div>
                        </div>
                        <div class="last-name">
                            <div class="back">
                                <div class="name-tit">이름</div>
                                <input type="text" id="firstName" placeholder="길동" name="stay_first_name"value="${rvlist.STAY_FIRST_NAME }">
                            </div>
                        </div>
                    </div>
                    <div class="per-detail">
                        <div class="first-name">
                            <div class="front">
                                <div class="name-tit">생년월일</div>
                                <input type="text" id="birth" placeholder="YYYYMMDD" name="stay_birth" value="${rvlist.STAY_BIRTH}">
                            </div>
                        </div>
                        <div class="last-name">
                            <div class="back">
                                <div class="name-tit">성별</div>
                                <div class="choice-one">
                                    <!-- <button class="option1">남자</button>
                                    <button class="option2">여자</button> -->
                                    <button type="button" class="option1" id="sex" name="stay_sex" value="0">남자</button>
                                    <button type="button" class="option2" id="sex" name="stay_sex" value="1">여자</button>
                                    <!-- <input class="option1" type="radio" id="sex" name="stay_sex" value="0" checked>남
                                    <input class="option2" type="radio" id="sex" name="stay_sex" value="1" checked>여 -->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="traffic-info">
                    <div class="traffic-title">
                        <span>교통편 정보</span>
                    </div>
                    <div class="traffic-name"> <!--숙소 이동 셀렉-->
                        <div>숙소 이동 방법<span class="red-dot"> *</span></div>
                        <select class="tr-select">
                                <option value="대중교통">대중교통 및 도보 이동</option>
    							<option value="자가">자가용 이동</option>
                        </select>
                    </div>
                </div>
                <div class="payment">
                    <div class="pm-1">
                        <div class="pm1-name">
                            <span>결제 내역 안내</span>
                        </div>
                    </div>
                    <div class="pm-2">
                        <div class="pm2-name">
                            <span>예약금액(세금포함)</span>
                        </div>
                        <div class="pm2-text">
                            <span>${rvlist.ROOM_PRICE }원</span>
                        </div>
                    </div>
                    <div class="pm-3">
                        <div class="pm3-name">
                            <span>쿠폰 할인</span>
                        </div>
                        <div class="pm3-text">
                            <span>-</span>
                            <input type="text">
                            <img class="pm3-img" src="https://img1.daumcdn.net/thumb/C500x500/?fname=http://t1.daumcdn.net/brunch/service/user/4aca/image/yon7WF20NQAoBIYOaNm6PHYX5A0.jpg">
                        </div>
                    </div>
                </div>
                <script>
                    function addTip() {
                    const tip_add = document.getElementById("tip-add");
                    tip_add.className = "sel-textz";
                }
                function XTip() {
                    const tip_add = document.getElementById("tip-add");
                    tip_add.className = "sel-text";
                }
                </script>
                <div class="total">
                    <div class="total-1">
                        <div class="tot1-name">
                            <span>총 결제 금액(세금 포함)</span>
                        </div>
                        <div class="tot1-text">
                            <span>97,000원</span>
                        </div>
                    </div>
                    <div class="total-2">
                        <div class="tot2-name">
                            <span>최대 적립 가능 트리플 캐시</span>
                            <img class="fast-img" onclick="addTip()" src="https://assets.triple.guide/images/ico_tooltip_info_black@4x.png">
                        </div>
                        <div class="tot2-text">
                            <span>1,020원</span>
                        </div>
                    </div>
                    <div class="sel-text" id="tip-add">
                        쿠폰 및 캐시 사용에 따라 변동될 수 있으며 최종 적립 예정 트리플 캐시는 결제 페이지에서 확인할 수 있습니다.
                        <div class="text-img">
                            <img onclick="XTip()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
                        </div>
                    </div>
                </div>
                <div class="agree">
                    <div class="ag-1">
                        <div class="ag1-name">
                            <span>상품 이용 동의</span>
                        </div>
                    </div>
                    <div class="ag-2">
                        <div class="ag2-check">
                            <input type="checkbox" class="sel-check">
                            <span>전체 동의</span>
                        </div>
                    </div>
                    <div class="ag-3">
                        <div class="ag3-check">
                            <input type="checkbox" class="sel-check">
                            <span>취소/이용 규정 동의</span>
                        </div>
                    </div>
                    <div class="ag-4">
                        <div class="ag4-check">
                            <input type="checkbox" class="sel-check">
                            <span>취소 정책 안내</span>
                        </div>
                        <div class="ag4-info">
                            <ul>
                                <li class="a4-black">
                                    <span class="a4-text">2023년 8월 13일 오후 6:00(서울시간)까지 무료 취소 가능</span>
                                </li>
                                <li class="a4-gray">
                                    <span class="a4-text">이후 예약을 취소할 경우 전액 취소 수수료가 부과될 수 있습니다.</span>
                                </li>
                            </ul>
                            <div class="info-btn">
                                <span>나중에 취소하면 어떻게 되나요?<img src="https://cdn.icon-icons.com/icons2/1904/PNG/512/rightarrow_121279.png"></span>
                            </div>
                        </div>
                        <div class="ag4-check">
                            <input type="checkbox" class="sel-check">
                            <span>개인 정보 수집과 이용 동의</span>
                        </div>
                        <div class="ag4-check2">
                            <input type="checkbox" class="sel-check2">
                            <span>개인 정보 수집 / 이용 방침</span>
                        </div>
                        <div class="ag4-check2">
                            <input type="checkbox" class="sel-check2">
                            <span>개인정보 제 3자 제공</span>
                        </div>
                        <div class="ag4-check" style="padding-top : 2%;">
                            <input type="checkbox" class="sel-check">
                            <span>추가요금 정보 확인 동의</span>
                        </div>
                        <div class="ag4-info">
                            <div class="info-title">
                                <span>추가 요금 안내</span>
                            </div>
                            <ul>
                                <li class="a4-gray">
                                    <span class="a4-text">기준 인원보다 많은 사람이 투숙하거나, 혜택에 포함되지 않은 부가 서비스를 이용할 경우 추가 요금을 지불할 수 있습니다.</span>
                                </li>
                            </ul>
                            <div class="info-btn">
                                <span>이용 안내 정보를 확인해주세요<img src="https://cdn.icon-icons.com/icons2/1904/PNG/512/rightarrow_121279.png"></span>
                            </div>
                        </div>
                    </div>
                    <div class="seller-info">
                        <span>(주)인턴파크트리핀은 통신판매중개자로서, 통신판매의 당사자가 아닙니다. 본 예약의 정보, 거래에 관한 의무와 책임은 공급사에게 있습니다.</span>
                    </div>
                </div>
                <div class="foot-btn">
                    <div class="accept-btn">
                        <span><input type="submit" class="accept-btn" value="예약하기"></span>
                    </div>
                    
                </div>
            </div>
            </form>
        </body>
    </html>