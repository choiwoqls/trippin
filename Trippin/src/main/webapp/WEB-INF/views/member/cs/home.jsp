<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리플</title>

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

                @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');


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

                .inner {
                    position : relative;
                    width : 100%;
                    height : 90px;
                }
                .hd-in {
                    width : 100%;
                    display: flex;
                    justify-content: space-between;
                    position : fixed;
                    background-color: white;
                    border-bottom : 1px solid #E8E8E8;
                    height : 80px;
                    line-height: 80px;
                    box-shadow: 0px 2px 0px 0px #F2F2F2;
                }
                .hd-left {
                    font-weight: bold;
                    font-size : 24px;
                    margin-left : 4%;
                    font-family: 'Jua', sans-serif;
                }
                .hd-left a{
                    text-decoration: none;
                    color : black;
                }
                .hd-right a {
                    text-decoration: none;
                    color : #797979;
                }
                .hd-right {
                    font-weight: bold;
                    font-size : 20px;
                    margin-right : 6%;
                }
                .main-top {
                    margin-left : 26%;
                    height : 60px;
                }
                .main-title {
                    font-size : 25px;
                    font-weight: bold;
                    color : #3A3A3A;
                    line-height: 60px;
                    margin-left : 1.5%;
                }
                .main-mid {
                    margin-left : 26%;
                    margin-right : 26%;
                    margin-top : 3%;
                    width : 50%;
                }
                .mm-one {
                    display: flex;
                    justify-content: space-around;
                }
                .mm-one a {
                    text-decoration: none;
                    font-weight: bold;
                    text-align: center;
                    border-radius: 5px;
                    background-color: #3A3A3A;
                    color : white;
                    width :30%;
                    padding-top : 1.5%;
                    padding-bottom : 1.5%;
                    font-size : 13px;
                }
                /* .mm-one a:hover {
                    box-shadow: 0px 2px 0px 0px silver;
                } */
                
                .mm-two a {
                    display : block;
                    text-decoration: none;
                    font-weight : bold;
                    text-align: center;
                    border-radius: 5px;
                    background-color: #368FFF;
                    color : white;
                    margin-top : 1%;
                    margin-left : 1.5%;
                    margin-right : 1.5%;
                    padding-top : 1.5%;
                    padding-bottom : 1.5%;
                }
                .mm2-title {
                    display : flex;
                    
                    margin-left : 26.74%;
                    margin-top : 2%;
                    justify-content: space-between;
                    margin-right : 24.82%;
                    height : 60px;
                }
                .mm2t {
                    font-weight: 550;
                    font-size : 18px;
                    line-height: 60px;
                }
                .mm2t-list a{
                    display: flex;
                    text-decoration: none;
                    color : black;
                    font-size : 14px;
                    line-height: 60px;
                }
                .m2t-img {
                    width : 30px !important;
                    height : 30px !important;
                    margin-top : 17%;
                }
                .main-mid3 {
                    margin-left : 26.74%;
                    margin-right : 24.82%;
                    
                    
                }
                .mm3-list1 {
                    width : 100%;
                    
                    
                    display: flex;
                    flex-wrap : wrap;
                    justify-content: space-around;
                }
                .mml-1,.mml-2,.mml-3 {
                    width : 32%;
                    height : 80px;
                }
                .mml-1 {
                    margin-left : -1%;
                    font-weight: bold;
                }
                .mml-3 {
                    margin-right : -1%;
                }
                .mml-1 img,.mml-2 img, .mml-3 img {
                    width : 30px;
                    height : 30px;
                    
                }
                .mm3-list2 {
                    width : 100%;
                    
                    
                    display: flex;
                    justify-content: space-around;
                }
                .mml-4,.mml-5, .mml-6 {
                    width : 32%;
                    height : 80px;
                    margin-top : 2%;
                }
                .mml-4 {
                    margin-left : -1%;
                }
                .mml-6 {
                    margin-right : -1%;
                }
                .mml-1:hover, .mml-2:hover, .mml-3:hover,.mml-4:hover, .mml-5:hover, .mml-6:hover{
                    border: solid 2px;
                    border-color: #368FFF;
                }
                .active {
                	border: solid 2px;
                    border-color: #368FFF;
                
                }
                .mml-4 img, .mml-5 img {
                    width : 30px;
                    height : 30px;
                }
                .mml-6 img {
                    margin-top : -2%;
                    width : 40px;
                    height : 40px;
                }
                .mml-6 span {
                    position : relative;
                    bottom : -1px;
                }
                .mml-1,.mml-2,.mml-3,.mml-4,.mml-5, .mml-6 {
                    background-color: white;
                    border-radius : 5px;
                    border : 1px solid #DADADA;
                    color : #585858;
                }
                .mm4-list1 a{
                    display: flex;
                    color : black;
                    text-decoration: none;
                    margin-top : 3%;
                    margin-left :26.74%; 
                    margin-right : 24.82%;
                    padding-bottom : 1.5%;
                }
                .mm4-list1 a span {
                    font-size : 16px;
                    
                    color : #B8C0D1;
                }
                .mm4-list1 a h3 {
                    margin-left : 1%;
                    font-weight: 400;
                }
                
                .footer {
                    margin-top : 2%;
                    padding-top : 1%;
                    background-color: rgb(250, 250, 250);
                }
                .foot-top {
                    margin-left :26.74%; 
                    margin-right : 24.82%;
                }
                .kakaot {
                    font-weight: bold;
                    margin-bottom : 2%;
                }
                .kakaot span,.telk span {
                    color: #368FFF; 
                    margin-left : 1%;
                    
                }
                .telk {
                    font-weight: bold;
                    margin-bottom : 1%;
                }
                .telf {
                    font-weight: bold;
                    margin-bottom : 2%;
                }
                .ft-info {
                    font-weight: bold;
                    color : #9A9A9A;
                    line-height: 2.1;
                    margin-bottom : 5%;
                    padding-bottom : 3%;
                    border-bottom : 1px solid#EFEFEF;
                }
                .foot-foot {
                    margin-left :26.74%; 
                    margin-right : 24.82%;
                }
                .ff {
                    font-weight : 500;
                    font-size : 11px;
                    color : rgba(58, 58, 58, 0.5);
                }
                .ff2 {
                    font-weight : 500;
                    font-size : 11px;
                    color : rgba(58, 58, 58, 0.5);
                    margin-top : 2%;
                    margin-bottom : 7%;
                }
                .mml-6 img {
                    filter: invert(45%) sepia(78%) saturate(1141%) hue-rotate(195deg) brightness(104%) contrast(101%);
                }
                .mml-1 {
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_best_default_black@3x.png');
                    background-repeat: no-repeat;
                    background-size: 33px 33px;
                    background-position: 100px 17px;
                }
                .mml-2 {
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_rooms_default_black@3x.png');
                    background-repeat: no-repeat;
                    background-size: 33px 33px;
                    background-position: 100px 17px;
                }
                .mml-3 {
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_ticket_default_black@3x.png');
                    background-repeat: no-repeat;
                    background-size: 33px 33px;
                    background-position: 100px 17px;
                }
                .mml-4 {
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_service_default_black@3x.png');
                    background-repeat: no-repeat;
                    background-size: 33px 33px;
                    background-position: 100px 17px;
                }
                .mml-5 {
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_etc_default_black@3x.png');
                    background-repeat: no-repeat;
                    background-size: 33px 33px;
                    background-position: 100px 17px;
                }
                .mml-6 {
                    background-image: url('tinfo.png');
                    background-repeat: no-repeat;
                    background-size: 50px 50px;
                    background-position: 92px 7px;
                }
                .mml-1active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 35px 33px;
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_best_activation_blue@3x.png');
                }
                
                .mml-2active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 35px 33px;
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_rooms_activation_blue@3x.png');
                }
                .mml-3active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 35px 33px;
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_ticket_activation_blue@3x.png');
                }
                .mml-4active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 35px 33px;
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_service_activation_blue@3x.png');
                }
            
                .mml-5active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 35px 33px;
                    background-image: url('https://triple.guide/cs-bridge/static/images/ico_etc_activation_blue@3x.png');
                }
                .mml-6active {
                    border : 1px solid #4396FF;
                    color : #4396FF;
                    background-size : 50px 35px;
                    background-position: 92px 13px;
                    background-image: url('titleimg2.png');
                }
                #contentList {
                	margin-left: 26.74%;
    				margin-right: 24.82%;
    				padding-top : 1.4%;
                }
            </style>
<script>
function showContent(f){
	var target = document.getElementById("contentList");
	var what = f.id;
	
	var param = "what="+f.id;
  
	var url="${pageContext.request.contextPath}/member/cs/getCSContent";


	sendRequest(url, param, function () {
		if(xhr.readyState === 4 && xhr.status === 200){
			var data = xhr.responseText;
			if(data != ''){ //int형일때는 data!=0이 아닐때!
				const titles = JSON.parse(data); //list일때는 JSON(parse)로 변환해야함
				
			
				target.innerHTML='';
				
			for(var i=0; i<titles.length; i++){
				var aTag = document.createElement("a");
				aTag.href = "javascript:void(0);";
				var questionText = titles[i]["title"].startsWith("Q.") ? titles[i]["title"] : "Q. " + titles[i]["title"];
				aTag.innerHTML = '<h3>' + questionText + '</h3>';
				aTag.style.color ="black";
				aTag.style.textDecoration="none";
				
				
				 (function(cs_seq) {
				        aTag.addEventListener("click", function() {
				            var popupUrl = "${pageContext.request.contextPath}/member/cs/content/" + cs_seq;
				            window.open(popupUrl, "_blank", "width=800,height=600");
				        });
				    })(titles[i]["cs_seq"]);
                    
                    target.appendChild(aTag);
				
			
				
					
				}
				
				
			}
		}
		
	},
		"POST");
	
	
}


</script>

        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="${cpath }/">Trippin'</a>
                        </div>
                        <div class="hd-right">
                            <a href="#">내 예약</a>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-top">
                    <div class="main-title">
                        트리핀 고객센터
                    </div>
                </div>
                <div class="main-mid">
                    <div class="mm-one">
                       <a href="${cpath }/member/cs/accomInquiry" >
                            <div class="rask">
                                숙소 예약 문의
                            </div>
                       </a>
                       <a href ="${cpath }/member/cs/ticketInquiry">
                            <div class="task">
                                투어・티켓 문의
                            </div>
                       </a>
                       <a href="${cpath }/member/cs/serviceInquiry">
                            <div class="sask">
                                서비스 일반 문의
                            </div>
                       </a>
                    </div>
                    <div class="mm-two">
                        <div class="mask">
                           
                            <a href="${cpath}/member/cs/Iqcontent?login=${login}">내 문의내역</a>
                        </div>
                    </div>
                </div>
                <div class="main-mid2">
                    <div class="mm2-title">
                        <div class="mm2t">
                            자주 묻는 질문
                        </div>
                        <div class="mm2t-list">
                            <a href="${cpath }/member/cs/all"><h1>전체보기</h1> <img class="m2t-img" src="https://triple.guide/cs-bridge/static/images/ico_arrow@3x.png"></a>
                        </div>
                        
                    </div>
                </div>
                <div class="main-mid3">
                    <div class="mm3-list1">
                        <button class="mml-1" id="best"  onclick="showContent(this);">
                            <br><br><br>BEST
                        </button>
                    
                        <button class="mml-2" id="숙소" onclick="showContent(this);">
                            <br><br><br>숙소
                        </button>
                       
                         
                        <button class="mml-3" id="투어" onclick="showContent(this);">
                            <br><br><br>투어,티켓
                        </button>
                    
                        <button class="mml-4" id="서비스" onclick="showContent(this);">
                            <br><br><br>서비스 일반
                        </button>
                        <button class="mml-5" id="공통" onclick="showContent(this);">
                            <br><br><br>공통
                        </button>
                        <button class="mml-6" id="공지사항" onclick="showContent(this);">
                            <br><br><br>공지사항
                        </button>
                    </div>
                   
                   
                </div>
                <div id="contentList" align="left">
                <!-- 해당 타이틀 들어갈 자리  -->
                </div>
                
                
            </div>
            <div class="footer">
                <div class="foot-top">
                    <div class="kakaot">
                        카카오톡<span>@트리핀재비빙</span>
                    </div>
                    <div class="telk">
                        국내 <span>1588-1111</span>
                    </div>
                    <div class="telf">
                        해외에서&nbsp;(+82)1-1588-1111
                    </div>
                    <div class="ft-info">
                        오전 9시 - 오후 6시 (한국 시간 기준, 연중 무휴)
                        <br><span>단, 항공문의는 주말/공휴일 제외</span>
                    </div>
                </div>
                <div class="foot-foot">
                    <div class="ff">
                        (주)인턴파크 트리핀 | 대표 구현지 부대표 정희락 기술고문 박건태
                        <br>사업자 등록번호 202-30-209
                        <br>서울특별시 강남구 테헤란로 146 현익빌딩 4층
                    </div>
                    <div class="ff2">
                        ㈜인턴파크트리핀은 통신판매중개로서 통신판매의 당사자가 아니며 상품 거래정보 및 거래등에 대해 책임을 지지 않습니다.
                    </div>
                </div>
            </div>
        </body>
    </html>