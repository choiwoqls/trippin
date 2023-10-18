<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/views/member/mypage/layout/header.jsp"%> --%>
			

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
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

                .header {
                    height : 5vh;
                    line-height: 5vh;
                    
                }
                .main-section {
                    display : flex;
                }
                .list-section {
                    flex-grow: 2;
                    box-shadow: 3px 0 5px -5px #333;
                    
                    background-color: #f3f3e6;
                    color : #3A3A3A;
                }
                .detail-section {
                    flex-grow : 7;
                    
                }
                .detail-top {
                    padding-bottom : 3%;
                    border-bottom: 10px solid rgb(239, 239, 239);
                    margin-right : 5%;
                }
                .member-info {
                    border : 1px solid;
                    display : flex;
                }
                .member-main {
                    flex-grow: 5.5;
                    
                    display : flex;
                    padding : 3%;
                    background-color: #3A3A3A;
                    color : white;
                    justify-content: space-between;
                }
                .member-reward {
                    flex-grow : 4.5;
                    background-color: #3A3A3A;
                    color : white;
                    padding : 3%;
                }
                .mem-btn {
                    border-right : 2px solid #454545;
                    width : 25%;
                    padding-right : 10%;
                    font-size : 16px;
                    
                }
                .mem-text {
                    
                    width : 60%;
                }
                .mem-user {
                    padding-bottom : 5%;
                    font-size : 20px;
                    
                    width : 100%;
                    padding-left : 10%;
                }
                .mem-user span {
                    font-weight: bold;
                    font-size : 24px;
                }
                .btn-info, .btn-amend {
                    border : 2px solid;
                    border-radius: 25px;
                    padding-top : 4%;
                    padding-bottom : 4%;
                    padding-left : 5%;
                    padding-right : 5%;
                    text-align: center;
                    font-weight: bold;
                    cursor: pointer;
                }
                .btn-info {
                    margin-top : 3%;
                    margin-bottom : 10%;
                }
                .mem-count {
                    display: flex;
                    width : 90%;
                }
                .mc-1, .mc-2 {
                    font-size : 13px;
                    font-weight: bold;
                    flex-grow: 1;
                    text-align: center;
                }
                .mc-1 span, .mc-2 span {
                    font-size : 15px;
                }
                .mc-1 {
                    border-right : 1px solid;
                }
                .use-reward {
                    display : flex;
                    justify-content: space-between;
                    padding-bottom : 3%;
                }
                .use-coupon {
                    display : flex;
                    justify-content: space-between;
                    padding-bottom : 3%;
                }
                .use-jjim {
                    display : flex;
                    justify-content: space-between;
                }
                .ur-title img, .uc-title img, .uj-title img {
                    filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(201deg) brightness(106%) contrast(106%);
                    width : 20px;
                    position: relative;
                    top : 0.5vh;
                    right : 0.5vw;
                }
                .ur-detail, .uc-detail, .uj-detail {
                    border-bottom : 1px solid;
                }
                .ur-detail span, .uc-detail span, .uj-detail span {
                    font-weight: bold;
                }
                .mem-img {
                    width : 80px;
                    height : 80px;    
                }
                .mem-img img {
                    object-fit: cover;
                    width : 55px;
                    height: 55px;
                    position: relative;
                    top : 1vh;
                    left : 1.5vw;
                    border-radius: 50%;
                    background-color: white;
                }
                .mem-main {
                    display: flex;
                }
                .detail-mid {
                    padding-left : 3%;
                }
                .my-self {
                    padding-top : 3%;
                    margin-right : 5%;
                }
                .title-section {
                    width : 30%;
                }
                .my-title {
                    display : flex;
                    justify-content: space-between;
                }
                .title-bold {
                    font-weight: bold;
                    font-size : 22px;
                    color : #676460;
                }
                .title-info {
                    color :#9C9B99;
                    font-weight: bold;
                    font-size: 14px;
                    padding-left : 2%;
                }
                .more-section {
                    line-height: 2;
                    padding-right : 0.5%;
                }
                .more-section span {
                    border-bottom: 2px solid;
                    color : #454545;
                    
                    font-family :Verdana, Geneva, Tahoma, sans-serif;
                    font-size: 13px;
                    
                }
                .my-text {
                    border : 2px solid #9C9B99;
                    display: flex;
                    
                    margin-top : 1%;
                }
                .my-name {
                    padding-bottom : 3%;
                    color : #3A3A3A;
                    font-size : 14px;
                    font-weight: bold;
                }
                .my-name2 {
                    padding-bottom : 2%;
                    color : #3A3A3A;
                    font-size : 14px;
                    font-weight: bold;
                }
                .my-msection {
                    width : 73%;
                    
                    display: flex;
                }
                .msection-list {
                    width : 25%;
                    text-align: center;
                    padding-top : 4%;
                    padding-bottom : 4%;
                }
                .msection-list2 {
                    text-align: center;
                    padding-top : 11%;
                    padding-bottom : 4%;
                }
                .my-ssection {
                    width : 27%;
                    
                }
                .my-num {
                    font-size : 20px;
                    color : #3A3A3A;
                    text-decoration: underline;
                    font-weight: bold;
                }
                .my-numtext {
                    font-size : 13px;
                    color : #3A3A3A;
                }
                .more-self {
                    padding-top : 4%;
                    margin-right : 5%;
                }
                .more-list {
                    
                    display : flex;
                    gap : 2%;
                    justify-content: space-around;
                }
                .more-1 {
                    width : 32%;
                    border : 2px solid #9C9B99;
                }
                .more-2 {
                    width : 32%;
                    border : 2px solid #9C9B99;
                }
                .more-3 {
                    width : 32%;
                    border : 2px solid #9C9B99;
                }
                .more-top {
                    display : flex;
                    border-bottom : 2px solid rgb(239, 239, 239);
                    padding : 4%;
                    justify-content: space-between;
                }
                .more-title {
                    font-weight: bold;
                    font-size: 18px;
                    color: #676460;
                }
                .more-more span {
                    border-bottom: 2px solid;
                    color : #454545;
                    font-family :Verdana, Geneva, Tahoma, sans-serif;
                    font-size: 13px;
                }
                .more-mid {
                    padding : 4%;
                    
                }
                .more-bot {
                    padding : 4%;
                    padding-top : 2%;
                    
                }
                .more-text {
                    display : flex;
                    justify-content: space-between;
                    line-height: 300%;
                    color : #676460;
                    font-size : 14px;
                }
                .more-name, .more-count {
                    width : 50%;
                }
                .more-count {
                    text-align: right;
                }
                .more-count span {
                    font-size : 18px;
                    font-weight: bold;
                    padding-right: 6%;
                    color: #3A3A3A;
                }
                .more-btn {
                    text-align: center;
                    border: 3px solid #EBEBEB;
                    padding-top : 3%;
                    padding-bottom : 3%;
                    border-radius: 2px;
                    font-weight: bold;
                    color: #676460;
                }
                .list-header {
                    padding-left: 10%;
                    padding-top : 5%;
                    padding-right : 5%;
                    
                    font-weight: bold;
                    color : #3A3A3A;
                    font-size: 20px;
                }
                .my-page {
                    width : 90%;
                    
                    padding-bottom : 5%;
                    border-bottom : 2px solid #C794A4;
                }
                .list-main {
                    padding-top : 20%;
                }
                .list-location {
                    position: relative;
                    padding-left : 10%;
                    padding-bottom : 25%;
                }
                .list-title::before {
                    content: "";
                    position: absolute;
                    width: 20%;
                    margin-left : 10%;
                    height: 2px; 
                    background-color: #9C9B99;
                    top: -7%;
                    transform: translateY(-50%);
                    
                    left: 0;
                }
                .list-title {
                    font-weight: bold;
                    font-size: 18px;
                    padding-bottom: 3%;
                }
                .list-detail {
                    padding-left : 10%;
                    line-height: 190%;
                    list-style : none;
                    list-style-position: outside;
                }
                .list-detail li::marker {
                    content : "-";
                    font-size : 15px;
                    color: black;
                }
                .list-detail li {
                    padding-left : 3%;
                }
                .head-title {
                    font-weight :bold;
                    padding-left: 2%;
                    font-size : 18px;
                }
                .head-title img {
                    width : 30px;
                    position : absolute;
                    left : 5.8vw;
                    top : -0.3vh;
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="head-title">
                        <span>TRIPPIN<img src="https://cdn-icons-png.flaticon.com/128/7291/7291011.png"></span>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-section">
                    <div class="list-section">
                        <div class="list-header">
                            <div class="my-page">마이페이지</div>
                        </div>
                        <div class="list-main">
                            <div class="list-location">
                                <div class="list-title">
                                    <span>내 저장</span>
                                </div>
                                <ul class="list-detail">
                                    <li>관광</li>
                                    <li>맛집</li>
                                    <li>숙소</li>
                                    <li>투어·티켓</li>
                                </ul>
                            </div>
                            <div class="list-location">
                                <div class="list-title">
                                    <span>내 예약</span>
                                </div>
                                <ul class="list-detail">
                                    <li>숙소</li>
                                    <li>투어·티켓</li>
                                </ul>
                            </div>
                            <div class="list-location">
                                <div class="list-title">
                                    <span>쿠폰함</span>
                                </div>
                                <ul class="list-detail">
                                    <li>사용 가능한 쿠폰</li>
                                    <li>사용된 쿠폰</li>
                                </ul>
                            </div>
                            <div class="list-location">
                                <div class="list-title">
                                    <span>친구 초대</span>
                                </div>
                                <ul class="list-detail">
                                    <li>친구에게 추천하기</li>
                                    <li>초대코드 입력</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="detail-section">
                        <div class="detail-top">
                            <div class="member-info">
                                <div class="member-main">
                                    <div class="mem-text">
                                        <div class="mem-main">
                                            <div class="mem-img">
                                                <img class="uimg" src="${cpath}/common/getImg?path=${mvo.m_profile }&file=${m_profileNM }">
                                            </div>
                                            <div class="mem-user">
                                                <div><span>${mvo.m_nickname } </span>님은</div>
                                                <div><span> Lv${mvo.m_level } </span>입니다.</div>
                                            </div>
                                        </div>
                                        <div class="mem-count">
                                            <div class="mc-1">트리핀 캐시 <span>70,000</span>원</div>
                                            <div class="mc-2">소멸 예정 캐시 <span>3,000</span>원</div>
                                        </div>
                                    </div>
                                    <div class="mem-btn">
                                        <div class="btn-info">
                                            <span>레벨혜택 안내</span>
                                        </div>
                                        <div class="btn-amend" onclick="document.location.href='${cpath}/member/editProfile?m_seq=${mvo.m_seq }'">
                                            <span>회원정보 수정</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="member-reward">
                                    <div class="use-reward">
                                        <div class="ur-title">
                                            <img src="https://cdn-icons-png.flaticon.com/128/4044/4044109.png">
                                            <span>사용 가능 포인트</span>
                                        </div>
                                        <div class="ur-detail">
                                            <span>1,000</span>포인트
                                        </div>
                                    </div>
                                    <div class="use-coupon">
                                        <div class="uc-title">
                                            <img src="https://cdn-icons-png.flaticon.com/128/6652/6652164.png">
                                            <span>보유중인 쿠폰</span>
                                        </div>
                                        <div class="uc-detail" onclick="myCoupon();" style="cursor: pointer;">
                                            <span>${cCNT }</span>건
                                        </div>
                                    </div>
                                    <div class="use-jjim">
                                        <div class="uj-title">
                                            <img src="https://cdn-icons-png.flaticon.com/128/7476/7476962.png">
                                            <span>찜리스트</span>
                                        </div>
                                        <div class="uj-detail">
                                            <span>1</span>건
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail-mid">
                            <div class="my-self">
                                <div class="my-title">
                                    <div class="title-section">
                                        <span class="title-bold">나의 현황</span>
                                        <span class="title-info">최근 6개월 기준</span>
                                    </div>
                                    <div class="more-section">
                                        <span>더보기</span>
                                    </div>
                                </div>
                                <div class="my-text">
                                    <div class="my-msection">
                                        <div class="msection-list">
                                            <div class="my-name">
                                                <span>내 여행기</span>
                                            </div>
                                            <div class="my-type">
                                                <span class="my-num">0</span>
                                                <span class="my-numtext">건</span>
                                            </div>
                                        </div>
                                        <div class="msection-list">
                                            <div class="my-name">
                                                <span>내 일정</span>
                                            </div>
                                            <div class="my-type">
                                                <span class="my-num">0</span>
                                                <span class="my-numtext">건</span>
                                            </div>
                                        </div>
                                        <div class="msection-list">
                                            <div class="my-name">
                                                <span>내 맛집</span>
                                            </div>
                                            <div class="my-type">
                                                <span class="my-num">0</span>
                                                <span class="my-numtext">건</span>
                                            </div>
                                        </div>
                                        <div class="msection-list">
                                            <div class="my-name" style="border-right : 2px solid rgb(239, 239, 239);">
                                                <span>티켓 예매</span>
                                            </div>
                                            <div class="my-type" style="border-right : 2px solid rgb(239, 239, 239);">
                                                <span class="my-num">0</span>
                                                <span class="my-numtext">건</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-ssection">
                                        <div class="msection-list2">
                                            <div class="my-name2">
                                                <span>취소/환불</span>
                                            </div>
                                            <div class="my-type">
                                                <span class="my-num">0</span>
                                                <span class="my-numtext">건</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="more-self">
                                <div class="more-list">
                                    <div class="more-1">
                                        <div class="more-top">
                                            <div class="more-title">
                                                <span>1:1문의</span>
                                            </div>
                                            <div class="more-more">
                                                <span>더보기</span>
                                            </div>
                                        </div>
                                        <div class="more-mid">
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>답변대기</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>답변완료</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                        </div>
                                        <div class="more-bot">
                                            <div class="more-btn">
                                                <span>1:1문의하기</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="more-2">
                                        <div class="more-top">
                                            <div class="more-title">
                                                <span>나의 여행기</span>
                                            </div>
                                            <div class="more-more">
                                                <span>더보기</span>
                                            </div>
                                        </div>
                                        <div class="more-mid">
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>작성 중</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>작성완료</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                        </div>
                                        <div class="more-bot">
                                            <div class="more-btn">
                                                <span>작성하러 가기</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="more-3">
                                        <div class="more-top">
                                            <div class="more-title">
                                                <span>내가 쓴 리뷰</span>
                                            </div>
                                            <div class="more-more">
                                                <span>더보기</span>
                                            </div>
                                        </div>
                                        <div class="more-mid">
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>이미지 리뷰</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                            <div class="more-text">
                                                <div class="more-name">
                                                    <span>일반 리뷰</span>
                                                </div>
                                                <div class="more-count">
                                                    <span>0</span>건
                                                </div>
                                            </div>
                                        </div>
                                        <div class="more-bot">
                                            <div class="more-btn">
                                                <span>리뷰 작성하기</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <script type="text/javascript">
            	function myCoupon(){
            		
            		var url = "${cpath}/member/myCoupon?m_seq=${mvo.m_seq}";
    		        var name = "myCoupon";
    		        var option = "width = 500, height = 600, top = 100, left = 400, location = no";
    		        window.open(url, name, option);
            		
            		
            	}
            
            
            </script>
            
            
            
        </body>
    </html>






<%-- <%@ include file="/WEB-INF/views/member/mypage/layout/footer.jsp"%> --%>