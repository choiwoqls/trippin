<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리핀</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

            <style>
                html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,
                blockquote,pre,abbr,address,cite,code,del,dfn,em,img,
                ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,
                fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
                article,aside,canvas,details,figcaption,figure,footer,header,hgroup,
                menu,nav,section,summary,time,mark,audio,video,fieldset {margin:0; padding:0; }


                ol,ul{list-style:none}
                
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

                .inner {
                    background-color: #F4F4F4;
                    height : 42px;
                    
                }
                .ir-text {
                    line-height : 42px;
                    display: flex;
                    margin-left : 70%;
                    
                    
                }
                .ir-text a {
                    text-decoration: none;
                    margin-left : 2%;
                    margin-right : 2%;
                    font-size : 12px;
                    color : #818181;
                    font-weight: bold;
                }
                .inner-right div {
                    height : 100%;
                    padding-left : 2%;
                    padding-right : 2%; 
                    
                    
                }
                .ir-img {
                    height : 5px;
                    
                }
                input#search-tool {
                    background : url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_search@2x.png);
                    background-repeat: no-repeat;
                    width : 50px;
                    border : 0px;
                    background-size : 20px 20px; 
                    position : relative;
                    left : 517px;
                    bottom : 34px;
                    cursor: pointer;
                }
                .u-inner {
                    display : flex;
                    justify-content: space-around;
                    height : 100px;
                    margin-top : 5%;
                }
                .title {
                    font-family: 'Jua', sans-serif;
                    font-size : 30px;
                    font-weight: bold;
                    position : relative;
                    z-index: 5;
                    left : 80px;
                    top : 17px;
                    width : 100px;
                }
                .ui-left a {
                    text-decoration: none;
                    color : black;
                }
                .ui-left {
                   
                }
                .ui-left img {
                    height : 120px;
                    width : 180px;
                    bottom : 65px;
                    right : 50px;
                    z-index : 1;
                    position: relative;
                    filter: brightness(100%) invert(19%) sepia(96%) saturate(1779%) hue-rotate(94deg) brightness(96%) contrast(106%);
                }
                .ui-middle {
                    
                    border-radius: var(--borderWidth);
                    width : 550px;
                    height : 53px;
                    margin-left : -17.5%;
                    margin-top : 0.8%;
                    --borderWidth: 3px;
                    background : white;
                     position: relative;
                    
                }
                .ui-middle:after {
                    content: '';
                    position: absolute;
                    top: calc(-1 * var(--borderWidth));
                    left: calc(-1 * var(--borderWidth));
                    height: calc(100% + var(--borderWidth) * 2);
                    width: calc(100% + var(--borderWidth) * 2);
                    background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
                    border-radius: calc(2 * var(--borderWidth));
                    z-index: -1;
                    animation: animatedgradient 3s ease alternate infinite;
                    background-size: 300% 300%;
                }
                @keyframes animatedgradient {
                    0% {
                        background-position: 0% 50%;
                    }
                    50% {
                        background-position: 100% 50%;
                    }
                    100% {
                        background-position: 0% 50%;
                    }
                }
                .input1 {
                    height : 48px;
                    width : 480px;
                    margin-left : 4%;
                    border: 0px;
                }
                .ui-right {
                    display: flex;
                }
                .ur-one {
                    position: relative;
                    height : 32px;
                    left : -35px;
                    top : 24.45px;
                }
                .ur-sec  {
                    position : relative;
                    height : 50px;
                    width : 55px;
                    top : 16px;
                    left : -5px;
                    border-radius: 50%;
                    
                    box-shadow: 0 4px 4px -3px #3BCED2;
                }
                input::placeholder {
                    font-weight: bold;
                    
                }
                .mi-cate a{
                    text-decoration: none;
                    color : black;
                    font-weight: 550;
                }
                ul.mi-cate {
                    
                    display : flex;
                    list-style-position: outside;
                    margin-left : 2%;
                    margin-top : 0.5%;
                    font-size : 16px;
                }
                .mi-left {
                    display : flex;
                    flex-shrink: 1;
                    flex-basis: 100%;
                }
                .mi-img {
                    height : 50px;
                    width : 50px;
                    
                }
                .mic-one a{
                    display : flex;
                    color : #50E3C2;
                }
                .mi-cate li {
                    list-style : none;
                    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADgCAMAAAAt85rTAAAAA1BMVEUAAACnej3aAAAASElEQVR4nO3BMQEAAADCoPVPbQo/oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAICXAcTgAAG6EJuyAAAAAElFTkSuQmCC);
                    background-position-x: left; 
                    background-position-y: 40%;
                    background-repeat: no-repeat;
                    
                    background-size : 3px;
                    padding-left : 2%;
                    padding-top : 1.5%;
                    width : 110px;
                    
                }
                .m-inner {
                    flex-basis: 100%;
                    display : flex;
                    flex-shrink: 1;
                    padding-bottom : 1%;
                    border-bottom : 2px solid #50E3C2;
                }
                .mi-title {
                    margin-left : 11%;
                }
                .mi-title button {
                    border : 0px;
                    background-color: white;
                }
                .main-img {
                    margin-top : 1%;
                    width : 100%;
                }
                .mi-src {
                    width : 100%;
                }
                .mr-fir a {
                    text-decoration: none;
                    font-size : 14px;
                    color : #897E7F;
                    font-weight: bold;
                    width : 60px;
                }
                .mr-fir {
                    display : flex;
                    
                }
                .mf-squ {
                    color : #897E7F;
                    margin-top : -2%;
                }
                .ms-img {
                    height : 50px;
                    width : 50px;
                }
                .mr-sec { 
                    
                }
                .mi-right {
                    display : flex;
                    position : relative;
                    right : 130px;
                }
                .mf-one {
                    width : 120px;
                    margin-top : 32%;
                    
                }
                .mf-squ {
                    margin-right : 7%;
                    margin-left : 7%;
                    margin-top : 12%;
                }
                .mf-two {
                    margin-top : 42%;
                }
                .mr-sec {
                    display : flex;
                    position: relative;
                    left : 20px;
                }
                .ms-info {
                    width : 200px;

                }
                .ms-info {
                    font-weight : bold;
                    font-size : 13px;
                }
                /* slider */
                .slider__wrap {
                    width: 100%;
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
                /* 이미지 보이는 부분 */
                .slider__img {
                    position: relative;
                    width: 1200px;
                    height: 700px;
                    overflow: hidden;
                }
                /* 이미지 감싸고 있는 부모 : 움직이는 부분 */
                .slider__inner {
                    display: flex;
                    flex-wrap: wrap;
                    /* 총 이미지 6개 */
                    width: 7200px;
                    height: 700px;
                }
                /* 개별적인 이미지 */
                .slider {
                    position: relative;
                    width: 1200px;
                    height: 700px;
                }
                .slider img{
                    width: 100%;
                }
                .slider::before {
                    position: absolute;
                    left: 5px;
                    top: 5px;
                    background: rgba(0, 0, 0, 0.4);
                    color: #fff;
                    padding: 5px 10px;
                }
                

                @media (max-width: 1200px) {
                    .slider__img {
                        width: 1200px;
                        height: 300px;
                    }
                }
                .main-top {
                    background-image: url(https://triple.guide/intro/images/img-01-bg.png);
                    background-repeat: no-repeat;
                    background-size: 100% 100%;
                    width : 100%;
                    height : 860px;
                }
                .mt-img {
                    
                }
                .mt-img img{
                    width : 330px;
                    height : 650px;
                    border-top-right-radius: 55px;
                    border-top-left-radius: 55px;
                    position: relative;
                    bottom : 98.5px;
                    left : 950px;
                }
                .mt-title {
                    color : white;
                    font-weight: bolder;
                    font-size : 90px;
                    position : relative;
                    top : 220px;
                    left : 220px;
                }
                .mt-stitle {
                    color : white;
                    font-size: 30px;
                    position: relative;
                    top : 230px;
                    left : 230px;
                }
                .mt-btn  button{
                    position : relative;
                    top : 290px;
                    border : 1px solid white;
                    background-color: #85CECF;
                    color : white;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    padding-left : 3.5%;
                    padding-right : 3.5%;
                    border-radius: 45px;
                    font-weight: bolder;
                    font-size : 15px;
                    left : 230px;
                }
                .mt-btn button:hover {
                    background-color: white;
                    color : black;
                }
                .mtimg-cover {
                    font-weight: bolder;
                    position: relative;
                    bottom : 705px;
                    left : 976px;
                    width : 60px;
                    background-color: white;
                }
                .menu-table{
                	position : relative;
                	display: table;
                	width:55%;
                }
                .menu-tr{
                	display: table-row;
                }
                .menu-td{
                	display: table-cell;
                	padding: 0px 10px;
                	vertical-align: middle;
                }
                .menu-items-main{
                	font-size : 18px;
                	color : #50E3C2;
                	display : flex;
                	font-weight: bold;
                }
                .menu-items-main a{
                    display : flex;
                    color : #50E3C2;
                    text-decoration: none;
                    font-weight: bold;
                    
                }
                .menu-items{
                	font-size : 18px;
                	font-weight: bold;
                }
                .menu-items a{
                	display : flex;
                	text-decoration: none;
                	font-weight: bold;
                	color: #000;
                }
                .menu-div{
                	align: center;
                	font-size : 20px;
                }
                .mi-dot {
                    height : 4px;
                    width : 4px;
                    border-radius: 50%;
                    background-color : #50E3C2;
                    
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="inner-right">
                        <div class="ir-text">
                            <c:if test="${login == null}">
	                            <a href="${cpath }/join/joinForm">
	                                회원가입
	                            </a>
                            </c:if>
                            <p style="font-size : 8px; line-height : 42px; color : #E1E1E1;">
                            |
                            </p>
                            <c:if test="${login == null }">
	                            <a href="${pageContext.request.contextPath }/login/loginForm">
	                                로그인
	                            </a>
                            </c:if>
                            <c:if test="${login != null }">
                           		<a href="${pageContext.request.contextPath }/login/logout">
	                                로그아웃
	                            </a>
                            </c:if>
                            <p style="font-size : 8px; line-height : 42px; color : #E1E1E1;">
                                |
                            </p>
                            <a href="#">
                                회원혜택
                            </a>
                            <p style="font-size : 8px; line-height : 42px; color : #E1E1E1;">
                                |
                            </p>
                            <a href="#">
                                고객센터
                            </a>
                        </div>
                    </div>
                </div>
                <div class="u-inner">
                    <div class="ui-left">
                        <div class="title"><a href="${cpath }"><p>Trippin'</p></a></div>
                        <img src="${pageContext.request.contextPath }/resources/login/tlogo.png">
                    </div>
                    <div class="ui-middle">
                        <form>
                            <input class="input1" type="text" placeholder="어디로 떠나시나요?"/>
                            <input id="search-tool" type="submit" name="submit" value=""/>
                        </form>
                    </div>
                    <div class="ui-right">
                        <a href="#"><img class= "ur-one" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_cart@2x.png"></a>
                        
                        <c:choose>
                        	<c:when test="${login == null }">
		                        <a href="${pageContext.request.contextPath }/login/loginForm"><img class="ur-sec" src="${pageContext.request.contextPath }/resources/login/userimg.png"></a>
                        	</c:when>
                        	<c:otherwise>
		                        <a href="${pageContext.request.contextPath }/member/mypage"><img class="ur-sec" src="${pageContext.request.contextPath }/resources/login/userimg.png"></a>
                        	</c:otherwise>
                        </c:choose>
                                                 
                    </div>
                </div>
                <div class="m-inner">
                    <div class="mi-left">
                        <div class="mi-title">
                            <button>
                                <img class="mi-img" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_anb_open@2x.png">
                            </button>
                        </div>
                       <%--  <ul class="mi-cate">
                            <li class="mic-one" style="background-image: none; margin-right : -6%;"><a href="${cpath }/member/selectList?cate_seq=1">관광지&nbsp;<div class="mi-dot"></div></a></li>
                            <li class="mic-one" style="padding-left : 4%; margin-right : -7%;"><a href="${cpath }/member/selectList?cate_seq=2">맛집&nbsp;<div class="mi-dot"></div></a></li>
                            <li style="padding-left : 4%; margin-right : -5.5%;"><a href="#">숙소&nbsp;</a></li>
                            <li style="padding-left : 4%; margin-right : -11%;"><a href="#">투어·티켓</a></li>		 				    
		 				    <li style="padding-left : 4%;"><a href="${pageContext.request.contextPath }/schedule/sche/listLogin">일정</a></li>
                            <li style="padding-left : 4%;"><a href="#">여행기</a></li>
                            
                        </ul> --%>
                        <div class="menu-table">
	                        <div class="menu-tr">
	                        	<div class="menu-td">
	                        		<p class="menu-items-main">
	                        			<a href="${cpath }/member/selectList?cate_seq=1">관광지<div class="mi-dot"></div></a>
                        			</p>
                        		</div>
	                        	<div class="menu-td"><p class="menu-div">•</p></div>
	                        	<div class="menu-td">
	                        		<p class="menu-items-main">
	                        			<a href="${cpath }/member/selectList?cate_seq=2">맛집<div class="mi-dot"></div></a>
	                        		</p>
	                        	</div>
	                        	<div class="menu-td"><p class="menu-div">•</p></div>
	                        	<div class="menu-td">
	                        		<p class="menu-items-main">
	                        			<a href="#">숙소<div class="mi-dot"></div></a>
	                        		</p>
	                        	</div>
	                        	<div class="menu-td"><p class="menu-div">•</p></div>
	                        	<div class="menu-td">
	                        		<p class="menu-items">
	                        			<a href="#">투어·티켓</a>
	                        		</p>
	                        	</div>
	                        	<div class="menu-td"><p class="menu-div">•</p></div>
	                        	<div class="menu-td">
	                        		<p class="menu-items">
	                        			<a href="${cpath }/schedule/sche/listLogin">일정</a>
	                        		</p>
	                        	</div>
	                        	<div class="menu-td"><p class="menu-div">•</p></div>
	                        	<div class="menu-td">
	                        		<p class="menu-items">
	                        			<a href="#">여행기</a>
	                        		</p>
	                        	</div>
	                        </div>
                        </div>
                        
                    </div>
                    <div class="mi-right">
                        <div class="mr-fir">
                            <a href="#">
                                <div class="mf-one">
                                    추천 일정
                                </div>
                            </a>
                            <span class="mf-squ">▪</span>
                            <a href="#">
                                <div class="mf-two">
                                    HOT
                                </div>
                            </a>
                        </div>
                        <span style="color : #897E7F; font-size : 13px; margin-top : 5%;">/</span>
                        <div class="mr-sec">
                            <img class="ms-img" src="https://image6.yanolja.com/leisure/UqJ7kgep4Ypsrqv0">
                            <span class="ms-info"><p style=" color : #897E7F; font-weight: bold; font-size : 14px; margin-left : 5%;margin-top : 6%;">아르떼 뮤지엄,</p><h2 style="margin-top : 2%; margin-left : 15%; color : #9A74F5;">예술을 기술로</h2></span>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-top">
                    <div class="mt-title">
                        나를 아는 여행앱<h3>트리핀</h3>
                    </div>
                    <div class="mt-stitle">
                        예약부터 일정까지 여행이 더 쉬워집니다.
                    </div>
                    <div class="mt-btn">
                        <button>앱 설치하기</button>
                    </div>
                    <div class="mt-img">
                        <img src="https://triple.guide/intro/images/img_01_screen_3_520@3x.png">
                    </div>
                    <div class="mtimg-cover">
                        TRIPPIN
                    </div>
                </div>
                <div class="main-img">
                    <section id="sliderType01">
                        <div class="slider__wrap">
                            <div class="slider__img">
                                <div class="slider__inner">
                                    <div class="slider"><img src="https://ditoday.com/wp-content/uploads/2019/09/1909-digital-insight-review-app-triple-thumbnail.jpg" alt="이미지1"></div>
                                    <div class="slider"><img src="https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202102/11/mk/20210211203917095xecy.jpg" alt="이미지2"></div>
                                    <div class="slider"><img src="https://cdn.traveltimes.co.kr/news/photo/202204/401275_21679_3524.png" alt="이미지3"></div>
                                    <div class="slider"><img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/4da4c823-4994-4e70-8e00-7ace88fec0e7.jpeg" alt="이미지4"></div>
                                    <div class="slider"><img src="https://blog.kakaocdn.net/dn/kIpr6/btqBeyUQvgq/M4OFsHJxoP0wOHWIIR33GK/img.jpg" alt="이미지5"></div>
                                </div>
                            </div>
                        </div>
                        <script>const sliderWrap = document.querySelector(".slider__wrap");
                                const sliderImg = document.querySelector(".slider__img");       // 보여지는 영역
                                const sliderInner = document.querySelector(".slider__inner");   // 움직이는 영역
                                const slider = document.querySelectorAll(".slider");            // 각각의 이미지
                                
                                let currentIndex = 0;                                               // 현재 보이는 이미지
                                let sliderCount = slider.length;                                    // 이미지 갯수
                                let sliderWidth = sliderImg.offsetWidth;                            // 이미지 가로값
                                let sliderClone = sliderInner.firstElementChild.cloneNode(true);    // 첫번째 이미지 복사
                                sliderInner.appendChild(sliderClone);                               // 첫번째 이미지를 마지막에 넣어줌

                                function sliderEffect() {
                                    currentIndex++;
                                    sliderInner.style.transition = "all 0.6s";

                                    sliderInner.style.transform = "translateX(-"+ sliderWidth * currentIndex +"px)";

                                    // sliderInner.style.transform = "translateX(-600px)";      600*1
                                    // sliderInner.style.transform = "translateX(-1200px)";     600*2
                                    // sliderInner.style.transform = "translateX(-1800px)";     600*3
                                    // sliderInner.style.transform = "translateX(-2400px)";     600*4
                                    // sliderInner.style.transform = "translateX(-3000px)";     600*5
                                    // sliderInner.style.transform = "translateX(-3600px)";     600*1

                                    // 마지막 사진에 위치했을 때 
                                    if(currentIndex == sliderCount){
                                        setTimeout(()=>{
                                            sliderInner.style.transition = "0s";
                                            sliderInner.style.transform = "translateX(0px)";
                                        }, 700);
                                        
                                        currentIndex = 0;
                                    }


                                }
                                setInterval(sliderEffect, 2000);</script>
                    </section>
                   
                </div>
            </div>
        </body>
    </html>