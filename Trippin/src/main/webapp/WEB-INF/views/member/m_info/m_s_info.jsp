<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${cpath }/resources/js/httpRequest.js"></script>
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
            
            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
		  
		    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		  
		    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

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

                body {
                    background-color: #F2F2F2;
                    height: auto;
                }
                .header {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                    
                    box-shadow: 0px 2px 0px 0px #BAC0C4;
                    
                }
                .content{
                
                }
                
                .sticky-element {
					position: relative; /* 요소의 기본 위치 설정 */
					display: table-row;
					height : 5vh;
                    line-height: 5vh;
                    font-weight: bold;
					color :rgba(58, 58, 58, 0.4);
				}
				
				.sticky-element.sticky {
			  		position: fixed; /* 스크롤되다가 상단에 닿으면 고정되도록 설정 */
			 		top: 0; /* 상단에 고정될 위치 */
			 		z-index: 100; /* 필요한 경우 다른 요소 위로 보이게 설정 */
			 		background-color: white;
                    margin-right : 30%;
                    height : 6vh;
                    line-height: 6vh;
                    font-weight: bold;
                    box-shadow: 0px 1px 0px 0px #BAC0C4;
                    color :rgba(58, 58, 58, 0.4);
				}
                
                .sticky-element-item{
                	display: table-cell;
				    text-align: center;
				    width: 5%;
                    
                    }
                .sticky-element-itemz {
                    display: table-cell;
				    text-align: center;
				    width: 5%;
                    border-bottom : 3px solid #2987F0;
                    box-shadow: none;
                    color : black;
                }
                
                
                .hd-in {
                    display: flex;
                    height : 9vh;
                    justify-content : space-between;
                    width : 100%;
                }
                .inner-fix {
                    position: fixed;
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    background-color: white;
                    z-index : 300;
                    width : 40%;
                    border-bottom-left-radius: 5px;
                    border-bottom-right-radius: 5px;
                    padding-bottom : 1%;
                }
                .hd-in a {
                    text-decoration: none;
                }
                .hd-in a img {
                    width : 40px;
                    cursor: pointer;
                }
                .hd-in span {
                    position: relative;
                    bottom : 1.5vh;
                    left : 1vw;
                    font-size : 18px;
                    font-weight: 500;
                }
                .subject-info {
                    display : flex;
                    padding-left : 2%;
                }
                .subject-image {
                    width : 48px;
                    height : 48px;
                    margin-right : 2%;     
                }
                .subject-image img {
                    border-radius: 4px;
                    width : 48px;
                    height : 48px;
                }
                .subject-name {
                    width : 70%;
                }
                .subject-title {
                    font-weight: bold;
                    font-size: 17px;
                }
                .subject-stitle {
                    font-weight : bold;
                    font-size : 14px;
                    margin-top : 2%;
                    color : #CDCDCD;
                }
                .subject-heart {
                    width : 40px;
                    cursor: pointer;
                }
                .categori {
                    padding-top : 1%;
                    padding-bottom : 1%;
                    margin-left : 30%;
                    margin-right : 30%;
                    flex-wrap: wrap;
                    display: flex;
                    padding-left : 1%;
                    padding-right : 1%;
                    gap : 0.5vw;
                    background-color: #E9EBF7;
                }
                .cate-list {
                    background-color: white;
                    font-weight: bold;
                    text-align: center;
                    padding-left : 3%;
                    padding-right : 3%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    border-radius: 25px;
                    font-size: 14px;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
                    cursor: pointer;
                    margin-right : 1%;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                }
                .main-user {
                    padding-top: 2%;
				    padding-bottom: 5%;
				    text-align: -webkit-center;
                }
                .uimg {
                    width : 80px;
                    height : 80px;
                    border-radius: 40px;
                    object-fit: cover;
                }
                .main_img {
                    width : 50px;
                    height : 50px;
                    border-radius: 3px;
                    object-fit: cover;
                }
                .user-name {
                    font-weight: bold;
                    font-size: 20px;
                    margin-top: 1%;
                }
                .user-level {
                    color : rgba(58, 58, 58, 0.4);
                    font-size : 12px;
                    font-weight: bold;
                    margin-top: 1%;
                }
                .mt-star1 {
                    width : 30%;
                    padding-left : 5%;
                }
                .mt-star2 {
                    width : 47%;
                    height : 2vh;
                    
                }
                .mt-star3 {
                    margin-top : 4%;
                    width : 63%;
                    height : 100%;
                    background-image: url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
                    background-repeat: repeat-x;
                }
                .main-text {
                    padding-left : 5%;
                    padding-right : 5%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                }
                .main-imgs img{
                    width : 608px;
                    height : auto;
                    object-fit:cover;
                    
                }
                .main-foot {
                    
                    border-top : 10px solid #F2F2F2;
                }
                .mf-top {
                    display : flex;
                    justify-content: space-between;
                    padding-top: 4%;
                }
                .mf-top2{
	                display: flex;
				    justify-content: space-between;
				    padding-top: 4%;
				    padding-left: 5%;
				    padding-right: 5%;
				    padding-bottom: 2%;
                }
                .f-detail {
                    display: flex;
                    font-size : 16px;
                    font-weight: bold;
                    color : rgba(58, 58, 58, 0.4);
                    width : 30%;
                }
                .f-detail img {
                    width : 18px;
                    height : 18px;
                    position: relative;
                    top : 0.4vh;
                    left : 0.2vw;
                }
                .f-good {
                    margin-right :7%; 
                }
                .f-comment {
                    margin-left : 4%;
                }
                .f-date {
                    display: flex;
                    font-weight: bold;
                    font-size : 12px;
                    color : rgba(58, 58, 58, 0.4);
                    
                    width : 30%;
                    justify-content: end;
                }
                .ft-date {
                    line-height : 235%;
                    margin-right : 5%;
                }
                .more-img {
                    width : 30px;
                    height : 30px;
                    cursor: pointer;
                }
                .mf-mid {
                    padding-top : 3%;
                    padding-left : 5%;
                }
                .mm-imgs img {
                    width: 36px;
                    height: 36px;
                    border-radius: 19px;
                    object-fit: cover;
                    border : 1px solid white;
                }
                .mimgs1 {
                    position: relative;
                    left : -8%;
                }
                .mimgs2 {
                    position: relative;
                    left : -16%;
                }
                .mimgs3 {
                    position: relative;
                    left : -24%;
                }
                .mf-mid {
                    display : flex;
                    justify-content: space-between;
                    padding-bottom : 3%;
                }
                .mm-names img{
                    width : 20px;
                    position: relative;
                    top : 0.6vh;
                }
                .mm-names {
                    position: relative;
                    top : 1vh;
                    font-weight: bold;
                    padding-right : 3%;
                    cursor : pointer;
                }
                .mm-span2 {
                    color : #2987F0;
                }
                .mf-bot {
                    border-top : 2px solid #F2F2F2;
                    padding-top : 3%;
                    margin-left : 5%;
                    margin-right : 5%;
                    display : flex;
                }
                .mb-user {
                    width : 10%;
                }
                .mb-detail {
                    width : 90%;
                }
                .mb-user img {
                    width: 36px;
                    height: 36px;
                    border-radius: 19px;
                    object-fit: cover;
                    border : 1px solid white;
                }
                .mbd-date {
                    display: flex;
                    font-weight: bold;
                    font-size : 12px;
                    color : rgba(58, 58, 58, 0.4);
                    
                    width : 30%;
                    justify-content: end;
                }
                .mbd-dater {
                    line-height : 235%;
                    margin-right : 5%;
                }
                .mbd-img {
                    width : 30px;
                    height : 30px;
                    cursor: pointer;
                }
                .mbd-top {
                    display: flex;
                    justify-content: space-between;
                }
                .mbd-name {
                    font-weight: bold;
                }
                .mmbd-text {
                    font-size : 14px;
                    font-weight: 500;
                }
                .mbd-bot {
                    margin-top : 3%;
                    padding-bottom : 3%;
                }
                .mbd-detail img{
                    width: 18px;
                    height: 18px;
                    position: relative;
                    top: 0.4vh;
                    left: 0.2vw;
                    cursor: pointer;
                }
                .mbd-detail {
                    font-weight: bold;
                    font-size : 14px;
                    color : rgba(58, 58, 58, 0.4);
                }
                .mf-remark {
                    margin-top : 5%;
                    display: flex;
                    border-top : 2px solid #F2F2F2;
                    border-bottom : 2px solid #F2F2F2;
                }
                .mf-area {
                    width : 90%;
                    padding-top : 2%;
                    resize: none;
                    outline: none;
                    border : 0;
                    
                    padding-left : 3%;
                    font-size : 14px;
                    font-weight: bold;
                }
                .remark {
                    width : 10%;
                    padding-top : 1.9%;
                    text-align: center;
                    font-weight: bold;
                    color : #26CEC2;
                    cursor: pointer;
                }
                .mf-area::placeholder {
                    font-weight: bolder;
                    color :#CDCDCD;
                    font-size : 15px;
                }
                .remark-on {
                    cursor: pointer;
                }
                .rsub-last {
                    display : none;
                }
                .rsub-lastz {
                    width: 4vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    padding: 15px 37px 15px 15px;
                    font-size: 12px;
                    position: relative;
                    left: 81%;
                    bottom: 1.2vh;
                    display: block;
                    line-height: 150%;
                }
                .rsub-lastz img {
                    width : 10px;
                    height : 10px;
                    position: absolute;
                    top : 18px;
                    right : 13px;
                    cursor: pointer;
                }
                .rsub-lastz a {
                    color: rgba(58, 58, 58, 0.8);
                    text-decoration: none;
                    font-weight: 550;
                }
                .main-detail{
                	background-color: #f1f1f1;
                }
                .main-detail > div{
                	background-color: white;
                	margin-bottom: 2%;
                }
                .placeInfo{
                	display: flex;
                	padding-left : 3%;
                    padding-right : 3%;
                    padding-top : 4%;
                    padding-bottom : 2%;
                }
                .place_info{
                	display: flex;
				    padding-left: 5%;
				    padding-bottom: 2%;
				    padding-top: 4%;
                }
                .place_name{
                	width: 85%;
                }
                .place_title{
                	font-weight: bold;
    				font-size: 17px;
                }
                .place_cate{
                	font-weight: bold;
				    font-size: 14px;
				    margin-top: 2%;
				    color: rgba(58, 58, 58, 0.4);
                }
                .place_img{
                	width: 48px;
				    height: 48px;
                }
                .date-img {
				    width: 16px;
				    height: 16px;
				    position: relative;
				    top: 0.25vh;
				}
				.date-text1 {
				    color: #2987F0;
				    font-weight: bold;
				    font-size: 14px;
				}
				.date-text2 {
				    color: rgba(58, 58, 58, 0.7);
				    font-weight: 550;
				    font-size: 13px;
				}
				.fast-date{
					padding-left: 5%;
    				padding-top: 1%;
				}
				.rw-img {
                    margin-top : 2%;
                }
                .rw-img img {
                    border-radius: 4px;
                }
                .rwi-list {
                    display: flex;
                    align-items: flex-start;
                }
                .rwi-1 {
                    flex: 2;
                    margin-right: 10px;
                    overflow: hidden;
                    
                }
                .rwi-1 img {
                    width: 100%;
                    height: 46.5vh;
                    display: block;
                    object-fit: cover;
                }
                .rwi-2 {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                }
                .rwi-2 img {
                    width: 100%;
                    height : 100% auto;
                    max-height: 15vh;
                    margin-bottom: 5px;
                    object-fit: cover;
                }
                .rvImg img{
                	border-radius: 4px;
                }
                .tiin_info{
				    padding-left: 5%;
				    padding-bottom: 2%;
				    padding-top: 4%;
                }
                .sl_title{
                	font-weight: bold;
    				font-size: 17px;
                }
                .sl_intro{
                	padding-top: 2%;
                }
                .sl_preview_noImg{
                	padding-left: 5%;
				    padding-right: 5%;
				    padding-bottom: 2%;
                }
                .sl_preview{
                	padding-left: 5%;
				    padding-right: 5%;
				    padding-bottom: 2%;
                }
                .slider {
				    border-radius: 15px;
				}
				.slider img {
                    width : 100%;
                    height : 40vh;
                    border-top-right-radius: 8px;
                    border-top-left-radius : 8px;
                }
                .counter {
                	position: relative;
				    padding-left: 4%;
				    padding-right: 4%;
				    padding-top: 0.5%;
				    padding-bottom: 1%;
				    border-radius: 50px;
				    background-color: rgba(0, 0, 0, 0.2);
				    font-size: 20px;
				    color: white;
				    bottom: 41.5vh;
    				left: 14.3vw;
                }
                .slider-controls {
                    height: 0px;
                    
                    text-align: center;
                }
                .slider-controls button {
                    background-color : transparent;
                    color : white;
                    border : 0;
                    font-weight: bold;
                    border-radius: 6px;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    padding-left : 2%;
                    padding-right : 2%;
                    cursor: pointer;
                }
                .sl_hash{
               	    display: flex;
				    padding-left: 5%;
				    padding-right: 5%;
				    height: 75px;
				    padding-top: 3%;
    				padding-bottom: 3%;
    				border-radius: 5px;
    				box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
    				cursor: pointer;
                }
                .sl_img{
                	cursor: pointer;
                }
                .sl_hashz{
               	    display: flex;
				    padding-left: 5%;
				    padding-right: 5%;
				    height: 75px;
				    padding-top: 3%;
    				padding-bottom: 3%;
    				border-bottom-left-radius : 5px;
    				border-bottom-right-radius : 5px;
    				box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
    				cursor: pointer;
                }
                .hashtag{
                	font-size: 15px;
				    font-weight: bold;
				    width: 80%;
				    align-self: center;
                	
                }
                .placeCNT_area{
            	    width: 20%;
				    text-align: -webkit-right;
				    align-self: center;
				    line-height: 5vh;
                }
                .placeCNT{
                	width: 65px;
				    height: 65px;
				    border-radius: 50%;
				    background-color: #F9F9F9;
				    text-align: -webkit-center;
                }
                .placeImg img{
                	width: 60%;
                	margin-top: 15%;
                }
                .cnt{
                	margin-top: -29%;
                	font-size: 13px;
                	font-weight: bold;
                }
                .hidden{
                	display: none;
                }
                .back-btn {
                	position : relative;
                	top : 1vh;
                	left : 1vw;
                }
                .prev-button {
                	position : relative;
                	bottom : 25vh;
                	right : 10.5vw;
                }
                .next-button {
                	position: relative;
				    bottom: 25vh;
				    left: 10.5vw;
                }
                .real-btn1 {
                	width : 45px;
                	transform: rotate(180deg);
                	
                }
                .real-btn2 {
                	width : 45px;
                	
                } 
                .span_area{
                	cursor: pointer;
                }
                .edit a{
                	text-decoration: none;
                	color: #000;
                	font-size: small;
                }
                .edit {
                	width : 30%;
                	font-weight : bold;
                	font-size : 14px;
                	text-align : right;
                	padding-right : 4%;
                	line-height : 9vh;
                }
                .nothing{
                    text-align: center;
				    padding-top: 6%;
				    padding-bottom: 6%;
				    color: rgb(77,77,77);
                }
            </style>
            

		<script>
			document.addEventListener("DOMContentLoaded", function() {
				var stickyElement = document.querySelector('.sticky-element');
				var stickyOffset = stickyElement.offsetTop;
				var isSticky = false;
				
				function updateStickyState() {
					var rect = stickyElement.getBoundingClientRect();
				
				    if (!isSticky && rect.top <= 0) {
				      isSticky = true;
				      stickyElement.classList.add('sticky');
				    } else if (isSticky && window.scrollY <= stickyOffset) {
				      isSticky = false;
				      stickyElement.classList.remove('sticky');
				    }
				}
				
				window.addEventListener('scroll', function() {
				updateStickyState();
				});
			});
		</script>

        </head>
        <body>
            <header class="header">
                <div class="inner">
                	<input type="hidden" id="lgcheck" value="${lgcheck }">
                    <div class="content">
                    	<c:choose>
                    		<c:when test="${isMyInfo == true }">
		                    	<div class="hd-in">
			                    	<div class="historyBack">
				                        <a onclick="history.back();">
				                        	<img class="back-btn" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
				                        </a>
				                    </div>
				                    <div class="edit">
		                        	<a href="${cpath }/member/editProfile?m_seq=${m_seq}">프로필 편집</a>
		                        	</div>	
			                    </div>
                    		</c:when>
                    		<c:otherwise>
		                    	<div class="hd-in">
			                    	<div class="historyBack">
				                        <a onclick="history.back();">
				                        	<img class="back-btn" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
				                        </a>
			                   		</div>
			                    </div>
                    		</c:otherwise>
                    	</c:choose>
					    <div class="main-user">
	                        <div class="user-img">
								<img class="uimg" src="${cpath}/common/getImg?path=${map.M_PROFILE }&file=${m_profileNM }">
	                        </div>
	                        <div class="user-info">
	                            <div class="user-name">
	                                <span>${map.M_NICKNAME }</span>
	                            </div>
	                            <div class="user-level">
	                                <span>LEVEL${map.M_LEVEL }</span>
	                            </div>
	                        </div>
	                    </div>
					</div>
					<c:choose>
                   		<c:when test="${isMyInfo == true }">
                   			<div class="sticky-element">
			                   	<div id="stDiv3" class="sticky-element-item" onclick="toggleClasses2('stDiv3', 'stDiv1', 'stDiv2');" style="cursor: pointer;">
				                    내 여행
				                </div>
							    <div id="stDiv1" class="sticky-element-item" onclick="toggleClasses2('stDiv1', 'stDiv2', 'stDiv3');" style="cursor: pointer;">
							    	리뷰${map.rvCnt }
							    </div>
							    <div id="stDiv2" class="sticky-element-itemz" onclick="toggleClasses2('stDiv2', 'stDiv1', 'stDiv3');" style="cursor: pointer;">
							    	여행기${map.slogCnt }
							    </div>
							</div>
                   		</c:when>
                   		<c:otherwise>
							<div class="sticky-element">
							    <div id="stDiv1" class="sticky-element-item" onclick="toggleClasses('stDiv1', 'stDiv2');" style="cursor: pointer;">
							    	리뷰${map.rvCnt }
							    </div>
							    <div id="stDiv2" class="sticky-element-itemz" onclick="toggleClasses('stDiv2', 'stDiv1');" style="cursor: pointer;">
							    	여행기${map.slogCnt }
							    </div>
							</div>
                   		</c:otherwise>
                   	</c:choose>
                    <script>
                        function toggleClasses(divIdToToggle, divIdToReset) {
                            var divToToggle = document.getElementById(divIdToToggle);
                            var divToReset = document.getElementById(divIdToReset);

                            
                            if (divToToggle.classList.contains("sticky-element-item")) {
                                divToToggle.classList.remove("sticky-element-item");
                                divToToggle.classList.add("sticky-element-itemz");
                            } else {
                                divToToggle.classList.remove("sticky-element-itemz");
                                divToToggle.classList.add("sticky-element-item");
                            }

                            
                            divToReset.classList.remove("sticky-element-itemz");
                            divToReset.classList.add("sticky-element-item");
                            
                            
                            if(divIdToToggle === 'stDiv1'){
                            	window.location.href="${cpath}/member/memberinfo?m_seq=${m_seq}";
                            }
                            
                        }
                        function toggleClasses2(divIdToToggle, divIdToReset, divIdToReset2) {
                            var divToToggle = document.getElementById(divIdToToggle);
                            var divToReset = document.getElementById(divIdToReset);
                            var divToReset2 = document.getElementById(divIdToReset2);

                            
                            if (divToToggle.classList.contains("sticky-element-item")) {
                                divToToggle.classList.remove("sticky-element-item");
                                divToToggle.classList.add("sticky-element-itemz");
                            } else {
                                divToToggle.classList.remove("sticky-element-itemz");
                                divToToggle.classList.add("sticky-element-item");
                            }

                            
                            divToReset.classList.remove("sticky-element-itemz");
                            divToReset.classList.add("sticky-element-item");
                            
                            divToReset2.classList.remove("sticky-element-itemz");
                            divToReset2.classList.add("sticky-element-item");
                            
                            if(divIdToToggle === 'stDiv1'){
                            	window.location.href="${cpath}/member/memberinfo?m_seq=${m_seq}";
                            }
                            if(divIdToToggle === 'stDiv2'){
                            	window.location.href="${cpath}/member/m_s_info?m_seq=${m_seq}";
                            }
                            if(divIdToToggle === 'stDiv3'){
                            	window.location.href="${cpath}/member/mScheList";
                            }
                        }
                       	
                        
                    </script>
                    
                </div>
            </header>
            <div class="content">
	            <div id="slog_area">
   			        <div class="categori">
   			        	<c:forEach var="a" items="${slog_a1list }">
			                <div class="cate-list" onclick="slogAddrFilter(${a.addr1_seq});">
			                    <span>${a.addr1_name }</span>
			                </div>
		            	</c:forEach>
		            </div>
		            <div class="main">
		            	<c:if test="${empty m_SlogList}">
		            		<div class="nothing">
		            			작성된 여행기가 없습니다.
		            		</div>
	            		</c:if>
						<div class="main-detail">
							<c:forEach var="sl" items="${m_SlogList }" varStatus="i">
								<div class="${sl.ADDRLIST }" id="slogAddr1ID${i.count }">
									<div class="tiin_area">
										<div class="tiin_info">
											<div class="sl_title">
												<span class="span_area" onclick="document.location.href='#'">${sl.TITLE }</span>
											</div>
											<c:if test="${!empty sl.newIntro }">
												<div class="sl_intro">
													<span class="span_area" onclick="document.location.href='#'">${sl.newIntro }</span>
												</div>
											</c:if>
										</div>
									</div>
									
									<c:choose>
										<c:when test="${empty sl.imgNM}">
											<div class="sl_preview_noImg">
												<div class="sl_hash" onclick="document.location.href='#'">
													<div class="hashtag">
														<c:forEach var="a" items="${sl.addr1name_list }">
															${a }
														</c:forEach>
														${sl.month }${sl.period }
														<c:forEach var="st" items="${sl.stylelist }">
															${st }
														</c:forEach>
														<c:forEach var="nu" items="${sl.nugulist }">
															${nu }
														</c:forEach>
													</div>
													<div class="placeCNT_area">
														<div class="placeCNT">
															<div class="placeImg">
																<img src="${cpath }/resources/location/위치 아이콘 누끼.png">
															</div>
															<div class="cnt">
																${sl.LOCA_CNT }
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="sl_preview">
												<div class="sl_img" onclick="document.location.href='#'">
													<div class="m1-mid">
								                        <div class="slider">
								                        	<c:forEach var="si" items="${sl.imgNM }" varStatus="i">
								                        		<div><img src="${cpath}/common/getImg?path=${sl.IMG }&file=${si }" alt="Image ${i.count }"></div>
								                        	</c:forEach>
								                        </div>
								                         <div class="slider-controls">
								                            <button class="prev-button">
								                            	<img class="real-btn1" src="https://www.vodafone.co.uk/cs/groups/public/documents/webcontent/img_800x800_chevronrightshadow.png">
								                            </button>
								                            <span class="counter"><span class="current-slide">1</span>/<span class="total-slides">${fn:length(sl.imgNM) }</span></span>
								                            <button class="next-button">
								                            	<img class="real-btn2" src="https://www.vodafone.co.uk/cs/groups/public/documents/webcontent/img_800x800_chevronrightshadow.png">
								                            </button> 
								                        </div> 
								                    </div>
												</div>
												<div class="sl_hashz" onclick="document.location.href='#'">
													<div class="hashtag">
														<c:forEach var="a" items="${sl.addr1name_list }">
															${a }
														</c:forEach>
														${sl.month }${sl.period }
														<c:forEach var="st" items="${sl.stylelist }">
															${st }
														</c:forEach>
														<c:forEach var="nu" items="${sl.nugulist }">
															${nu }
														</c:forEach>
													</div>
													<div class="placeCNT_area">
														<div class="placeCNT">
															<div class="placeImg">
																<img src="${cpath }/resources/location/위치 아이콘 누끼.png">
															</div>
															<div class="cnt">
																${sl.LOCA_CNT }
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									
									
									
									
									
									<div class="mf-top2">
					                    <div class="f-detail">
					                        <c:choose>
					                    		<c:when test="${!sl.checkSLike }">
					                          		<div class="f-good" onclick="sloglike(${sl.SLOG_SEQ})" style="cursor: pointer;">
					                             		<img id="likebtn${sl.SLOG_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
					                              		<span id="slcnt">${sl.SL_CNT }</span>
					                          		</div>
					                        	</c:when>
												<c:otherwise>
													<div class="f-good" onclick="sloglike(${sl.SLOG_SEQ})" style="cursor: pointer;">
														<img id="likebtn${sl.SLOG_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
														<span id="slcnt">${sl.SL_CNT }</span>
													</div>
												</c:otherwise>
					                        </c:choose>
					                        <span>·</span>
					                        <div class="f-comment">
					                            <img src="https://assets.triple.guide/images/btn-lounge-comment-off@3x.png">
					                            <span>${sl.SC_CNT }</span>
					                        </div>
					                    </div>
					                    <div class="f-date">
					                        <div class="ft-date">
					                            <span>${sl.YMD }</span>
					                        </div>
					                        <div class="ft-more">
					                            <img class="more-img" onclick="addTool()" src="https://assets.triple.guide/images/btn-review-more@4x.png">
					                        </div>
					                    </div>
					                    <div class="rsub-last" id="tool-add">
					                        <div class="report">
					                            <a href="#"><span>신고하기</span></a>
					                        </div>
					                        <div class="share">
					                            <a href="#"><span>공유하기</span></a>
					                        </div>
					                        <img onclick="XTool()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
					                    </div>
					                </div>
								</div>
							</c:forEach>
						</div>
					</div>
		        </div>
                <script>
                    function addTip() {
	                    const tip_add = document.getElementById("tip-add");
	                    tip_add.className = "rsub-lastz";
                    }
                    function XTip() {
                        const tip_add = document.getElementById("tip-add");
                        tip_add.className = "rsub-last";
                    }

                    function addTool() {
                        const tool_add = document.getElementById("tool-add");
                        tool_add.className = "rsub-lastz";
                    }
                    function XTool() {
                        const tool_add = document.getElementById("tool-add");
                        tool_add.className = "rsub-last";
                    }
                    
                    
                    
                    
                    function sloglike(v){
                    	const lgcheck = document.getElementById("lgcheck").value;
    					console.log(lgcheck);
    					if(lgcheck == "false"){
    						alert("로그인이 필요한 서비스 입니다. ");
    						return;
    					}
                    	var likebtn = document.getElementById("likebtn"+v);
    					console.log(likebtn.src);
                    	
    					if(likebtn.src === "https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png"){
    						url = "${cpath}/member/doSlogLike";			
    					}else{
    						url = "${cpath}/member/noSlogLike";
    					}
                    	
    					var slog_seq = v;
    					console.log(slog_seq);
    					var param = "slog_seq=" + slog_seq;
    					
    					sendRequest(url, param, function(){
    						
    						if(xhr.readyState === 4 && xhr.status === 200){
    							var data = xhr.responseText;
    							console.log(likebtn.src);
    							if(data == '여행기 좋아요' && likebtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
    								likebtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
    							}else if(data != '여행기 좋아요' && likebtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
    								likebtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
    							}else if(data == '여행기 좋아요' && likebtn.src == '${pageContext.request.contextPath }/resources/like/like.jpg'){
    								likebtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
    							}else{
    								likebtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
    							}
    							
    							var slog_seq = v;
    							var param = "slog_seq=" + slog_seq;
    							var url = "${pageContext.request.contextPath}/member/countSLike";
    							
    							sendRequest(url, param, function(){
    								if(xhr.readyState === 4 && xhr.status === 200){
    									var data = xhr.responseText;
    									var slcnt = document.getElementById("slcnt");
    									
    									slcnt.innerText = data;
    								}
    							}, "POST");
    						}
    					}, "POST");
    					location.reload();
                    }
                    
                    
                    
                    function slogAddrFilter(v){
                    	console.log(v);
                    	for (var i = 0; i < ${m_SlogList.size()}; i++) {
						var slogAddr1ID = document.getElementById("slogAddr1ID" + (i+1));
						var addr1list = slogAddr1ID.className;
						
							if(addr1list.includes(v)){
								slogAddr1ID.style.display = '';
							}else{
								slogAddr1ID.style.display = 'none';
							}
						}
		            }
                    
                    
                    /* $(function(){
                      var $slider = $('.slider');
                      var $counter = $('.counter');
  
                      $slider.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
                          var i = (currentSlide ? currentSlide : 0) + 1;
                          var total = slick.slideCount;
                          $counter.find('.current-slide').text(i);
                          $counter.find('.total-slides').text(total);
                      });
  
                      $slider.slick({
                          autoplay: false,
                          dots: false,
                          infinite: true,
                          speed: 400,
                          slidesToShow: 1,
                          slidesToScroll: 1,
                          prevArrow: $('.prev-button'), 
                          nextArrow: $('.next-button'), 
                          easing: 'easeInOutExpo' 
                    	  });
                      }); */
                      
                      $(function(){
                    	  $('.sl_img').each(function(index){
                    		  
                    		var $post = $(this);
                    	    var $slider = $('.slider');
                    	    var $counter = $('.counter');
                    	    var $nextButton = $('.next-button');
                    	    var $prevButton = $('.prev-button');

                    	    $slider.slick({
                    	        autoplay: false,
                    	        dots: false,
                    	        infinite: true,
                    	        speed: 400,
                    	        slidesToShow: 1,
                    	        slidesToScroll: 1,
                    	        prevArrow: $prevButton, 
                    	        nextArrow: $nextButton, 
                    	        easing: 'easeInOutExpo' 
                    	    });

                    	    // next-button 클릭 이벤트 처리
                    	    $nextButton.on('click', function(e) {
                    	    	e.stopPropagation(); // 링크의 기본 동작(새로고침)을 막습니다.
                    	        $slider.slick('slickNext'); // 사진 슬라이드를 다음으로 이동합니다.
                    	    });

                    	    // prev-button 클릭 이벤트 처리
                    	    $prevButton.on('click', function(e) {
                    	    	e.stopPropagation(); // 링크의 기본 동작(새로고침)을 막습니다.
                    	        $slider.slick('slickPrev'); // 사진 슬라이드를 이전으로 이동합니다.
                    	    });

                    	    $slider.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
                    	        var i = (currentSlide ? currentSlide : 0) + 1;
                    	        var total = slick.slideCount;
                    	        $counter.find('.current-slide').text(i);
                    	        $counter.find('.total-slides').text(total);
                    	    });
                    	});
                   	});
                    
                </script>
            </div>
        </body>
    </html>