<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    height: 18vh;
                    
                }
                
                .hd-in {
                    margin-left: 2%;
                    height : 9vh;
                    
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
                    margin-top : 2%;
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
                    padding-left : 5%;
                    padding-bottom: 2%;
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
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                }
                .main-user {
                    display: flex;
                    padding-top : 5%;
                    padding-bottom : 2%;
                }
                .uimg {
                    width : 36px;
                    height : 36px;
                    border-radius: 19px;
                    object-fit: cover;
                }
                .user-img {
                    padding-left : 3%;
                }
                .user-info {
                    padding-left : 3%;
                }
                .user-name {
                    font-weight: bold;
                }
                .user-level {
                    color : rgba(58, 58, 58, 0.4);
                    font-size : 12px;
                    font-weight: bold;
                }
                .mt-star1 {
                    width : 30%;
                    padding-left : 3%;
                }
                .mt-star2 {
                    width : fit-content;
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
                    padding-left : 3%;
                    padding-right : 3%;
                    padding-top : 1%;
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
                    padding-top : 3%;
                    padding-left : 5%;
                    padding-right : 2%;
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
                    margin-right :4%; 
                    width : 40px;
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
                    padding-bottom: 1.8%;
                    margin-left : 5%;
                    margin-right : 5%;
                    display : flex;
                }
                .mf-bot-s {
                    border-top : 2px solid #F2F2F2;
                    padding-top : 3%;
                    padding-bottom: 1.3%;
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
				    top: 0.1vh;
				    /* left: -0.3vw; */
				    cursor: pointer;
                }
                .mbd-detail {
                    font-weight: bold;
                    font-size : 14px;
                    color : rgba(58, 58, 58, 0.4);
				    display: flex;
                }
                .mf-remark {
                    margin-top : 5%;
                    display: flex;
                    border-top : 2px solid #F2F2F2;
                    border-bottom : 2px solid #F2F2F2;
                }
                .tagbox_area{
               		/* width : 20%; */
               		 padding-top : 2%;
                    resize: none;
                    outline: none;
                    border : 0;
                    flex-grow : 1;
                   /*  padding-left : 3%; */
                    font-size : 14px;
                    font-weight: bold;
                }
                .mf_area {
                   	width : 90%;
                    padding-top : 2%;
                    resize: none;
                    outline: none;
                    border : 0;
                    min-width: 20vw;
                    padding-left : 3%;
                    font-size : 14px;
                    font-weight: bold;
                    flex-grow : 10;
                }
                .cmt_area{
                	width: 90%;
                	display: flex;
                	justify-content: space-between;
                }
                .remark {
                    width : 10%;
                    padding-top : 1.9%;
                    text-align: center;
                    font-weight: bold;
                    color : #26CEC2;
                    cursor: pointer;
                }
                .mf_area::placeholder {
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
                .rw-date {
                    margin-top : 1%;
                    margin-bottom: 1%;
                    padding-left: 3%;
                }
                .date-img {
                    width : 16px;
                    height : 16px;
                    position: relative;
                    top : 0.25vh;
                }
                .date-text1 {
                    color : #2987F0;
                    font-weight: bold;
                    font-size : 14px;
                    
                }
                .date-text2 {
                    color : rgba(58, 58, 58, 0.7);
                    font-weight: 550;
                    font-size : 13px;
                }
                
                
                
                
                .highlight {
				  color: blue; /* 스타일을 원하는 대로 수정 */
				  font-weight: bold;
				}
				
				.nickname{
					text-decoration: none;
					color: #000;
				}
				.report{
					height: 17px;
    				margin-top: 2%;
    				font-size: 12px;
    				color: rgba(58, 58, 58, 0.4);
				}
				.share a, .update a, .delete a{
					cursor: pointer;
				}
            </style>
        </head>
        <body>
        	<input type="hidden" id="lgcheck" value="${lgcheck }">
        	<input type="hidden" id="f_seq" value="${rv.F_SEQ }"> 
            <header class="header">
                <div class="inner">
                    <div class="inner-fix">
                        <div class="hd-in">
                            <a onclick="history.back();" style="cursor: pointer;">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                            </a>
                            <span>${rv.M_NICKNAME }의 리뷰</span>
                        </div>
                        <div class="inner-subject">
                            <div class="subject-info">
                            	<c:if test="${rv.CATE_SEQ == 1 }">
	                                <div class="subject-image">
	                                    <a href="${cpath}/member/tour/selectTour?f_seq=${rv.F_SEQ }" target="_blank"><img src="${cpath}/common/getImg?path=${rv.MAIN_IMG }&file=${main_imgNM }"></a>
	                                </div>
                                </c:if>
                            	<c:if test="${rv.CATE_SEQ == 2 }">
	                                <div class="subject-image">
	                                    <a href="${cpath}/member/hotple/selectHotple?f_seq=${rv.F_SEQ }" target="_blank"><img src="${cpath}/common/getImg?path=${rv.MAIN_IMG }&file=${main_imgNM }"></a>
	                                </div>
                                </c:if>
                            	<c:if test="${rv.CATE_SEQ == 3 }">
	                                <div class="subject-image">
	                                    <a href="#}" target="_blank"><img src="${cpath}/common/getImg?path=${rv.MAIN_IMG }&file=${main_imgNM }"></a>
	                                </div>
                                </c:if>
                                <div class="subject-name">
                                	<c:if test="${rv.CATE_SEQ == 1 }">
	                                    <div class="subject-title">
	                                        <a href="${cpath}/member/tour/selectTour?f_seq=${rv.F_SEQ }" target="_blank" style="text-decoration: none; color: #000;">${rv.NAME }</a>
	                                    </div>
                                    </c:if>
                                	<c:if test="${rv.CATE_SEQ == 2 }">
	                                    <div class="subject-title">
	                                        <a href="${cpath}/member/hotple/selectHotple?f_seq=${rv.F_SEQ }" target="_blank" style="text-decoration: none; color: #000;">${rv.NAME }</a>
	                                    </div>
                                    </c:if>
                                	<c:if test="${rv.CATE_SEQ == 3 }">
	                                    <div class="subject-title">
	                                        <a href="#" target="_blank" style="text-decoration: none; color: #000;">${rv.NAME }</a>
	                                    </div>
                                    </c:if>
                                    <div class="subject-stitle">
                                        ${rv.KIND_NAME } · ${rv.ADDR1_NAME }(${rv.ADDR2_NAME })
                                    </div>
                                </div>
                                <c:choose>
                               	<c:when test="${!check}">
		                            <div class="subject-heart">
		                                <a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; margin-left : 2%;">
		                                    <img class="mb-img" id="jjimimg" src="https://assets.triple.guide/images/btn-end-save-off@4x.png">
		                                </a>
		                            </div>
                                </c:when>
								<c:otherwise>
		                            <div class="subject-heart">
										<a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; position : relative; top : 0.6vh; left : 0.4vw;">
		                                    <img id="jjimimg" style= "width : 32px;"src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=">
		                                </a>
	                                </div>
	                            </c:otherwise>
							</c:choose>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-top">
                    <div class="main-user">
                        <div class="user-img" onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${rv.M_SEQ }'" style="cursor: pointer;">
                            <img class="uimg" src="${cpath}/common/getImg?path=${rv.M_PROFILE }&file=${m_profileNM }">
                        </div>
                        <div class="user-info" onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${rv.M_SEQ }'" style="cursor: pointer;">
                            <div class="user-name">
                                <span>${rv.M_NICKNAME }</span>
                            </div>
                            <div class="user-level">
                                <span>LEVEL${rv.M_LEVEL } /</span>
                                <span>${rv.MRV_CNT }개의 리뷰</span>
                            </div>
                        </div>
                    </div>
                    <div class="mt-star1">
                        <div class="mt-star2">
                            <div>
								<c:forEach begin="1" end="${rv.STARS }" step="1">
                                	<img src="https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg"/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <c:if test="${!empty date }">
	                    <div class="rw-date">
		                    <div class="fast-date">
		                        
		                        <c:if test="${now_y == year && (now_m - month) <= 6}">
		                         <img class="date-img" src="https://assets.triple.guide/images/ico_recently_badge@4x.png"> 
		                         <span class="date-text1">최근 여행</span>
		                        </c:if>
		                        <c:if test="${now_y != year && (now_m - month) < 0}">
		                        	<c:if test="${((12 - month) + now_m) <= 6 }">
		                          <img class="date-img" src="https://assets.triple.guide/images/ico_recently_badge@4x.png"> 
		                          <span class="date-text1">최근 여행</span>
		                         </c:if>
		                        </c:if>
		                        
		                        <span class="date-text2"> ${year }년 ${month }월 여행</span>
		                    </div>
		                </div>
	                </c:if>
                </div>
                <div class="main-detail">
                    <div class="main-text">
                        <span>${rv.CONTENT }</span>
                    </div>
                    <c:if test="${!empty path }">
	                    <div class="main-imgs">
							<c:forEach var="ri" items="${rv_img }" varStatus="i">
	                    		<img src="${cpath}/common/getImg?path=${rv.RV_IMG }&file=${ri }">
	                    	
	                        </c:forEach>
                    	</div>
					</c:if>
                    <div class="main-foot">
                        <div class="mf-top">
                            <div class="f-detail">
                                <div class="f-good">
                                    <c:choose>
	                            		<c:when test="${!checkRVL }">
			                                <div class="f-good" onclick="addlike(${rv.RV_SEQ})" style="cursor: pointer;">
			                                    <img id="likebtn${rv.RV_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
			                                    <span id="rlcnt">${rv.RL_CNT }</span>
			                                </div>
		                                </c:when>
		                                <c:otherwise>
			                                <div class="f-good" onclick="addlike(${rv.RV_SEQ})" style="cursor: pointer;">
			                                    <img id="likebtn${rv.RV_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
			                                    <span id="rlcnt">${rv.RL_CNT }</span>
			                                </div>
		                                </c:otherwise>
	                                </c:choose>
                                </div>
                                <span>·</span>
                                <div class="f-comment">
                                    <img src="https://assets.triple.guide/images/btn-lounge-comment-off@3x.png">
                                    <span>${rv.RC_CNT }</span>
                                </div>
                            </div>
                            <div class="f-date">
                                <div class="ft-date">
                                    <span>${rv.YMD }</span>
                                </div>
                                <div class="ft-more">
                                    <img class="more-img" onclick="addTool()" src="https://assets.triple.guide/images/btn-review-more@4x.png">
                                </div>
                            </div>
                        </div>
                        
                        <c:choose>
                        	<c:when test="${isMyRV == true }">
                        		<div class="rsub-last" id="tool-add">
		                            <div class="share">
		                                <a onclick="share(${rv.RV_SEQ });"><span>공유하기</span></a>
		                            </div>
		                            <div class="update">
		                                <a href="${cpath }/member/review/updateRV?rv_seq=${rv.RV_SEQ}"><span>수정하기</span></a>
		                            </div>
		                            <div class="delete">
		                                <a onclick="deleteRV(${rv.RV_SEQ})"><span>삭제하기</span></a>
		                            </div>
		                            <img onclick="XTool()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
		                        </div>
                        	</c:when>
                        	<c:otherwise>
		                        <div class="rsub-last" id="tool-add">
		                            <div class="share">
		                                <a onclick="share(${rv.RV_SEQ });"><span>공유하기</span></a>
		                            </div>
		                            <div class="report">
		                                <a style="cursor: pointer;" onclick="window.open('${cpath}/member/report/review?kind=0&rv_seq=${rv.RV_SEQ }','신고하기','width = 800px, height=600px, top=80px, left=300px, scrollbars=yes')"><span>신고하기</span></a>
		                            </div>
		                            <img onclick="XTool()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
		                        </div>
                        	</c:otherwise>
                        </c:choose>
                        
                        <c:if test="${!empty rvl_mlist }">
	                        <div class="mf-mid">
	                            <div class="mm-imgs" onclick="document.location.href='${cpath}/member/review/rvl_mlist?rv_seq=${rv.RV_SEQ }'" style="cursor: pointer;">
	                            	<c:if test="${rvl_mlist.size() == 1}">
		                                <img src="${cpath}/common/getImg?path=${rvl_mlist.get(0).get('M_PROFILE') }&file=${rvl_mlist.get(0).get('rvl_mlistNM') }">
		                                <img class="mimgs2" src="https://w7.pngwing.com/pngs/886/3/png-transparent-white-and-blue-like-icon-facebook-like-button-computer-icons-thumb-signal-thumbs-up-blue-text-hand.png">
	                            	</c:if>
	                            	<c:if test="${rvl_mlist.size() == 2}">
		                                <img src="${cpath}/common/getImg?path=${rvl_mlist.get(0).get('M_PROFILE') }&file=${rvl_mlist.get(0).get('rvl_mlistNM') }">
		                                <img class="mimgs1" src="${cpath}/common/getImg?path=${rvl_mlist.get(1).get('M_PROFILE') }&file=${rvl_mlist.get(1).get('rvl_mlistNM') }">
		                                <img class="mimgs2" src="https://w7.pngwing.com/pngs/886/3/png-transparent-white-and-blue-like-icon-facebook-like-button-computer-icons-thumb-signal-thumbs-up-blue-text-hand.png">
	                            	</c:if>
	                            	<c:if test="${rvl_mlist.size() >= 3}">
		                                <img src="${cpath}/common/getImg?path=${rvl_mlist.get(0).get('M_PROFILE') }&file=${rvl_mlist.get(0).get('rvl_mlistNM') }">
		                                <img class="mimgs1" src="${cpath}/common/getImg?path=${rvl_mlist.get(1).get('M_PROFILE') }&file=${rvl_mlist.get(1).get('rvl_mlistNM') }">
		                                <img class="mimgs2" src="${cpath}/common/getImg?path=${rvl_mlist.get(2).get('M_PROFILE') }&file=${rvl_mlist.get(2).get('rvl_mlistNM') }">
		                                <img class="mimgs3" src="https://w7.pngwing.com/pngs/886/3/png-transparent-white-and-blue-like-icon-facebook-like-button-computer-icons-thumb-signal-thumbs-up-blue-text-hand.png">
	                            	</c:if>
	                            </div>
	                            <c:choose>
	                            	<c:when test="${rvl_mlist.size() == 1}">
			                            <div class="mm-names" onclick="document.location.href='${cpath}/member/review/rvl_mlist?rv_seq=${rv.RV_SEQ }'">
			                                <span>${rvl_mlist.get(0).get('M_NICKNAME') }님</span>
			                                <img src="https://icons.veryicon.com/png/o/miscellaneous/commonly-used-icon-1/angle-brackets.png">
			                            </div>
	                            	</c:when>
	                            	<c:otherwise>
			                            <div class="mm-names" onclick="document.location.href='${cpath}/member/review/rvl_mlist?rv_seq=${rv.RV_SEQ }'">
			                                <span>${rvl_mlist.get(0).get('M_NICKNAME') }님 외 </span><span class="mm-span2">${rv.RL_CNT - 1}명</span>
			                                <img src="https://icons.veryicon.com/png/o/miscellaneous/commonly-used-icon-1/angle-brackets.png">
			                            </div>
	                            	</c:otherwise>
	                            </c:choose>
	                        </div>
                        </c:if>
                        
                        
                        <c:forEach var="rc" items="${rclist }">
                        	<c:if test="${rc.DEPTH == 0 }">
                        	<input type="hidden" id="rc_seq" value="${rc.RV_CMT_SEQ }">
		                        <div class="mf-bot">
		                            <div class="mb-user" onclick="document.location.href='${cpath }/member/memberinfo?m_seq=${rc.M_SEQ}'" style="cursor: pointer;">
		                                <img src="${cpath}/common/getImg?path=${rc.M_PROFILE }&file=${rc.rc_mlistNM }">
		                            </div>
		                            <div class="mb-detail">
		                            
		                            <c:if test="${rc.REPORT_STATUS == 0}">
			                            <div class="normal">
			                                <div class="mbd-top">
			                                    <div class="mbd-name">
			                                        <span><a class="nickname" href="${cpath }/member/memberinfo?m_seq=${rc.M_SEQ}">${rc.M_NICKNAME }</a></span>
			                                    </div>
			                                    <div class="mbd-date">
			                                        <div class="mbd-dater">
			                                            <span>${rc.YMD }</span>
			                                        </div>
			                                        <div class="mbd-more">
			                                            <img class="mbd-img" onclick="addTip(${rc.RV_CMT_SEQ})" src="https://assets.triple.guide/images/btn-review-more@4x.png">
			                                        </div>
			                                    </div>
			                                </div>
			                                <c:choose>
				                                <c:when test="${rc.isMyCmt == true }">
					                                <div class="rsub-last" id="tip-add${rc.RV_CMT_SEQ}">
					                                    <div class="report">
					                                        <a style="cursor: pointer;" onclick="updateCMT(${rc.RV_CMT_SEQ})"><span>수정하기</span></a>
					                                    </div>
					                                    <div class="report">
					                                        <a style="cursor: pointer;" href="${cpath }/member/review/deleteCMT?rv_cmt_seq=${rc.RV_CMT_SEQ}&rv_seq=${rv.RV_SEQ }"><span>삭제하기</span></a>
					                                    </div>
					                                    <img onclick="XTip(${rc.RV_CMT_SEQ})" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
					                                </div>
				                                </c:when>
				                                <c:otherwise>
				                                	<div class="rsub-last" id="tip-add${rc.RV_CMT_SEQ}">
					                                    <div class="report">
					                                        <a style="cursor: pointer;" onclick="window.open('${cpath}/member/report/review?kind=1&rv_seq=${rc.RV_CMT_SEQ }','신고하기','width = 550px, height=550px, top=300px, left=300px, scrollbars=yes')"><span>신고하기</span></a>
					                                    </div>
					                                    <img onclick="XTip(${rc.RV_CMT_SEQ})" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
					                                </div>
				                                </c:otherwise>
			                                </c:choose>
			                                <div class="mbd-mid">
			                                    <div class="mmbd-text" id="content${rc.RV_CMT_SEQ }">
			                                        ${rc.CONTENT }
			                                    </div>
			                                </div>
			                                <div class="mbd-bot">
			                                    <div class="mbd-detail">
				                                    <c:choose>
					                            		<c:when test="${!rc.checkRCL }">
						                                    <c:choose>
						                                    	<c:when test="${rc.RCL_CNT == 0 }">
						                                    		<div class="rclimg" onclick="addrcl(${rc.RV_CMT_SEQ})" style="cursor: pointer;">
								                                    	<img id="rclbtn${rc.RV_CMT_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
								                                    </div>
							                                        <span class="remark-on" onclick="reply(${rc.M_SEQ}, '${rc.M_NICKNAME }', ${rc.RV_CMT_SEQ })">&nbsp;· 답글달기</span>
						                                    	</c:when>
						                                    	<c:otherwise>
						                                    		<div class="rclimg" onclick="addrcl(${rc.RV_CMT_SEQ})" style="cursor: pointer;">
								                                    	<img id="rclbtn${rc.RV_CMT_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
								                                    </div>
						                                    		<span id="rclcnt" onclick="document.location.href='${cpath}/member/review/rcl_mlist?rv_cmt_seq=${rc.RV_CMT_SEQ }'" style="cursor: pointer;">&nbsp;· 좋아요 ${rc.RCL_CNT } ·&nbsp;</span>
							                                        <span class="remark-on" onclick="reply(${rc.M_SEQ}, '${rc.M_NICKNAME }', ${rc.RV_CMT_SEQ })">답글달기</span>
						                                    	</c:otherwise>
						                                    </c:choose>
						                                </c:when>
						                                <c:otherwise>
						                                	<c:choose>
						                                		<c:when test="${rc.RCL_CNT == 0 }">
						                                			<div class="rclimg" onclick="addrcl(${rc.RV_CMT_SEQ})" style="cursor: pointer;">
								                                    	<img id="rclbtn${rc.RV_CMT_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
								                                    </div>
								                                    <span class="remark-on" onclick="reply(${rc.M_SEQ}, '${rc.M_NICKNAME }', ${rc.RV_CMT_SEQ })">&nbsp;· 답글달기</span>
						                                		</c:when>
						                                		<c:otherwise>
						                                			<div class="rclimg" onclick="addrcl(${rc.RV_CMT_SEQ})" style="cursor: pointer;">
								                                    	<img id="rclbtn${rc.RV_CMT_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
								                                    </div>
								                                    <span id="rclcnt" onclick="document.location.href='${cpath}/member/review/rcl_mlist?rv_cmt_seq=${rc.RV_CMT_SEQ }'" style="cursor: pointer;">&nbsp;· 좋아요 ${rc.RCL_CNT } ·&nbsp;</span>
								                                    <span class="remark-on" onclick="reply(${rc.M_SEQ}, '${rc.M_NICKNAME }', ${rc.RV_CMT_SEQ })">답글달기</span>
						                                		</c:otherwise>
						                                	</c:choose>
						                                </c:otherwise>
					                                </c:choose>
			                                    </div>
			                                </div>
			                            </div>
		                            </c:if>
		                            <c:if test="${rc.REPORT_STATUS == 1 }">
		                            	<div class="report">
		                            		숨겨진 댓글 입니다.
		                            	</div>
		                            </c:if>
		                            <c:if test="${rc.REPORT_STATUS == 2 }">
		                            	<div class="report">
		                            		삭제된 댓글 입니다.
		                            	</div>
		                            </c:if>
		                            
		                                <c:forEach var="rc1" items="${rclist }">
			                                <c:if test="${rc1.DEPTH == 1 }">
			                                	<c:if test="${rc1.CMT_NO == rc.RV_CMT_SEQ }">
				                                	<div class="mf-bot-s">
							                            <div class="mb-user" onclick="document.location.href='${cpath }/member/memberinfo?m_seq=${rc1.M_SEQ}'" style="cursor: pointer;">
							                                <img src="${cpath}/common/getImg?path=${rc1.M_PROFILE }&file=${rc1.rc_mlistNM }">
							                            </div>
							                            <c:if test="${rc1.REPORT_STATUS == 0 }">
								                            <div class="mb-detail">
								                                <div class="mbd-top">
								                                    <div class="mbd-name">
								                                        <span><a class="nickname" href="${cpath }/member/memberinfo?m_seq=${rc1.M_SEQ}">${rc1.M_NICKNAME }</a></span>
								                                    </div>
								                                    <div class="mbd-date">
								                                        <div class="mbd-dater">
								                                            <span>${rc1.YMD }</span>
								                                        </div>
								                                        <div class="mbd-more">
								                                            <img class="mbd-img" onclick="addTip(${rc1.RV_CMT_SEQ})" src="https://assets.triple.guide/images/btn-review-more@4x.png">
								                                        </div>
								                                    </div>
								                                </div>
								                                <c:choose>
									                                <c:when test="${rc1.isMyCmt == true }">
										                                <div class="rsub-last" id="tip-add${rc1.RV_CMT_SEQ}">
										                                    <div class="report">
										                                        <a style="cursor: pointer;" onclick="updateCMT(${rc1.RV_CMT_SEQ})"><span>수정하기</span></a>
										                                    </div>
										                                    <div class="report">
										                                        <a style="cursor: pointer;" href="${cpath }/member/review/deleteCMT?rv_cmt_seq=${rc1.RV_CMT_SEQ}&rv_seq=${rv.RV_SEQ }"><span>삭제하기</span></a>
										                                    </div>
										                                    <img onclick="XTip(${rc1.RV_CMT_SEQ})" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
										                                </div>
									                                </c:when>
									                                <c:otherwise>
									                                	<div class="rsub-last" id="tip-add${rc1.RV_CMT_SEQ}">
										                                    <div class="report">
										                                        <a style="cursor: pointer;" onclick="window.open('${cpath}/member/report/review?kind=1&rv_seq=${rc1.RV_CMT_SEQ }','신고하기','width = 550px, height=550px, top=300px, left=300px, scrollbars=yes')"><span>신고하기</span></a>
										                                    </div>
										                                    <img onclick="XTip(${rc1.RV_CMT_SEQ})" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
										                                </div>
									                                </c:otherwise>
								                                </c:choose>
								                                <div class="mbd-mid">
								                                    <div class="mmbd-text" id="content${rc1.RV_CMT_SEQ }">
								                                        ${rc1.CONTENT }
								                                    </div>
								                                </div>
								                                
								                                <div class="mbd-bot">
								                                    <div class="mbd-detail">
									                                    <c:choose>
										                            		<c:when test="${!rc1.checkRCL }">
											                                    <c:choose>
											                                    	<c:when test="${rc1.RCL_CNT == 0 }">
											                                    		<div class="rclimg" onclick="addrcl(${rc1.RV_CMT_SEQ})" style="cursor: pointer;">
														                                    <img id="rclbtn${rc1.RV_CMT_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
											                                    		</div>
												                                        <span class="remark-on" onclick="reply(${rc1.M_SEQ}, '${rc1.M_NICKNAME }', ${rc.RV_CMT_SEQ })">&nbsp;· 답글달기</span>
											                                    	</c:when>
											                                    	<c:otherwise>
											                                    		<div class="rclimg" onclick="addrcl(${rc1.RV_CMT_SEQ})" style="cursor: pointer;">
													                                    	<img id="rclbtn${rc1.RV_CMT_SEQ }" src="https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png">
													                                    </div>
											                                    		<span id="rclcnt" onclick="document.location.href='${cpath}/member/review/rcl_mlist?rv_cmt_seq=${rc1.RV_CMT_SEQ }'" style="cursor: pointer;">&nbsp;· 좋아요 ${rc1.RCL_CNT } ·&nbsp;</span>
												                                        <span class="remark-on" onclick="reply(${rc1.M_SEQ}, '${rc1.M_NICKNAME }', ${rc.RV_CMT_SEQ })">답글달기</span>
											                                    	</c:otherwise>
											                                    </c:choose>
											                                </c:when>
											                                <c:otherwise>
											                                	<c:choose>
											                                		<c:when test="${rc1.RCL_CNT == 0 }">
											                                			<div class="rclimg" onclick="addrcl(${rc1.RV_CMT_SEQ})" style="cursor: pointer;">
													                                    	<img id="rclbtn${rc1.RV_CMT_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
													                                    </div>
													                                    <span class="remark-on" onclick="reply(${rc1.M_SEQ}, '${rc1.M_NICKNAME }', ${rc.RV_CMT_SEQ })">&nbsp;· 답글달기</span>
											                                		</c:when>
											                                		<c:otherwise>
											                                			<div class="rclimg" onclick="addrcl(${rc1.RV_CMT_SEQ})" style="cursor: pointer;">
													                                    	<img id="rclbtn${rc1.RV_CMT_SEQ }" src="${pageContext.request.contextPath }/resources/like/like.jpg">
													                                    </div>
													                                    <span id="rclcnt" onclick="document.location.href='${cpath}/member/review/rcl_mlist?rv_cmt_seq=${rc1.RV_CMT_SEQ }'" style="cursor: pointer;">&nbsp;· 좋아요 ${rc1.RCL_CNT } ·&nbsp;</span>
													                                    <span class="remark-on" onclick="reply(${rc1.M_SEQ}, '${rc1.M_NICKNAME }', ${rc.RV_CMT_SEQ })">답글달기</span>
											                                		</c:otherwise>
											                                	</c:choose>
											                                </c:otherwise>
										                                </c:choose>
								                                    </div>
								                                </div>
								                            </div>
							                            </c:if>
								                        <c:if test="${rc1.REPORT_STATUS == 1 }">
								                        	<div class="report">
								                        		숨겨진 답글 입니다.
								                        	</div>
								                        </c:if>
								                        <c:if test="${rc1.REPORT_STATUS == 2 }">
								                        	<div class="report">
								                        		삭제된 답글 입니다.
								                        	</div>
								                        </c:if>
							                        </div>
						                        </c:if>
						                        
						                        
			                                </c:if>
		                                </c:forEach>
		                            </div>
		                        </div>
	                        </c:if>
                        </c:forEach>
                        <form method="post">
                        	<input type="hidden" id="cmt_no" name="cmt_no" value="0">
                        	<input type="hidden" id="m_seq2" name="m_seq2" value="0">
                        	<input type="hidden" id="depth" name="depth" value="0">
                        	<input type="hidden" id="tag" name="tag" value="0">
                        	<input type="hidden" name="rv_seq" value="${rv.RV_SEQ }">
	                        <div class="mf-remark">
	                        	<div class="cmt_area">
		                        	<div class="tagbox_area">
		                        		<span id="tagbox" style="color: #2987F0; padding-left: 10%"></span>
		                        	</div>
		                            <textarea class="mf_area" id="content" name="content" placeholder="댓글을 입력하세요."></textarea>
	                            </div>
	                            <div class="remark">
	                                <input type="button" value="등록" onclick="insertCMT(this.form, ${rv.RV_SEQ});">
	                            </div>
	                        </div>
                        </form>
                    </div>
                    
                    <script>
                        function addTip(v) {
                        const tip_add = document.getElementById("tip-add"+v);
                        tip_add.className = "rsub-lastz";
                        }
                        function XTip(v) {
                            const tip_add = document.getElementById("tip-add"+v);
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
                        
                        
                        
                        
                        
                        function addlike(v){
                        	const lgcheck = document.getElementById("lgcheck").value;
        					console.log(lgcheck);
        					if(lgcheck == "false"){
        						alert("로그인이 필요한 서비스 입니다. ");
        						return;
        					}
                        	var likebtn = document.getElementById("likebtn"+v);
        					console.log(likebtn.src);
                        	
        					if(likebtn.src === "https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png"){
        						url = "${cpath}/member/dolike";			
        					}else{
        						url = "${cpath}/member/nolike";
        					}
                        	
        					
        					var rv_seq = v;
        					console.log(rv_seq);
        					var param = "rv_seq=" + rv_seq;
        					
        					sendRequest(url, param, function(){
        						
        						if(xhr.readyState === 4 && xhr.status === 200){
        							var data = xhr.responseText;
        							console.log(likebtn.src);
        							if(data == '좋아요' && likebtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
        								likebtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
        							}else if(data != '좋아요' && likebtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
        								likebtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
        							}else if(data == '좋아요' && likebtn.src == '${pageContext.request.contextPath }/resources/like/like.jpg'){
        								likebtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
        							}else{
        								likebtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
        							}
        							
        							var rv_seq = v;
        							var param = "rv_seq=" + rv_seq;
        							var url = "${pageContext.request.contextPath}/member/countRVL";
        							
        							sendRequest(url, param, function(){
        								if(xhr.readyState === 4 && xhr.status === 200){
        									var data = xhr.responseText;
        									var rlcnt = document.getElementById("rlcnt");
        									
        									rlcnt.innerText = data;
        								}
        							}, "POST");
        						}
        					}, "POST");
        					location.reload();
                        }
                        
                        function myjjim(){
        				 	const lgcheck = document.getElementById("lgcheck").value;
        					console.log(lgcheck);
        					if(lgcheck == "false"){
        						alert("로그인이 필요한 서비스 입니다. ");
        						return;
        					}
        					var jjimbtn = document.getElementById("jjimbtn");
        					var url = null;
        					var jjimimg = document.getElementById("jjimimg");
        					
        					if(jjimimg.src === "https://assets.triple.guide/images/btn-end-save-off@4x.png"){
        						url = "${cpath}/member/dojjim";			
        					}else{
        						url = "${cpath}/member/nojjim";
        					}
        							
        					console.log(jjimimg.src)
        							
        					var f_seq = document.getElementById("f_seq").value;
        					var param = "f_seq=" + f_seq;
        					
        					sendRequest(url, param, function() {
        						console.log(xhr.readyState)
        						console.log(xhr.status)
        						
        						if(xhr.readyState === 4 && xhr.status === 200){
        							var data = xhr.responseText;
        							var jjimsrc = jjimimg.src;
        							jjimimg.src = '';
        							
        							if(data == '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
        								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
        							}else if(data != '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
        								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
        							}else if(data == '찜!' && jjimsrc == 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4='){
        								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
        							}else{
        								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
        							}
        							console.log(jjimsrc)
        							
        							var f_seq = document.getElementById("f_seq").value;
        							var param = "f_seq" + f_seq;
        							var url = "${cpath}/member/jjimcnt";
        							
        							sendRequest(url, param, function(){
        								if(xhr.readyState === 4 && xhr.status === 200){
        									var data = xhr.responseText;
        									var jjimcnt = document.getElementById("jjimcnt");
        									
        									jjimcnt.innerText = data;
        								}
        							}, "POST");
        						}
        					}, "POST");
        					location.reload();
        				} 
                        
                        
                       
                        
                        
                        function reply(s, n, rc){
                        	//답글달기시 받아오는 값
                        	var m_seq = s;
                        	var m_nickname = n;
                        	var rc_seq = rc;
                        	
                        	
                        	//답글달기로 보낼 값
                        	var tagbox_area = document.querySelector(".tagbox_area");
                        	var mf_area = document.querySelector(".mf_area");
                        	/* tagbox_area.style.padding-left= "3%"; */
                        	tagbox_area.style.width="auto";
                        	mf_area.style.width="auto";
                        	
                        	var tagbox = document.getElementById("tagbox");
                        	tagbox.innerHTML = "@" + m_nickname + '&nbsp' + "<input type='button' value='X' onclick='cancel();'>";
                        	
                        	
                        	const content = document.getElementById("content");
                        	var m_seq2 = document.getElementById("m_seq2");
                        	var depth = document.getElementById("depth");
                        	var cmt_no = document.getElementById("cmt_no");
                        	var tag = document.getElementById("tag");
                        	
                        	/* tag.value = "@" + m_nickname + '&nbsp';
                        	content.innerHTML = tag.value; */
                        	tag.value = tagbox.innerText;
                        	
                        	m_seq2.value = m_seq;
                        	depth.value = 1;
                        	cmt_no.value = rc_seq;
                        	
                        	
                        	content.focus();
                        	
                        	console.log(m_seq2);
                        	console.log(depth);
                        	console.log(cmt_no);
                        	console.log(tag);
                        	
                        	
                  
                        	
                        }
                        
                        
                        function cancel(){
                        	var tagbox_area = document.querySelector(".tagbox_area");
                        	var mf_area = document.querySelector(".mf_area");
                        	/* tagbox_area.style.padding-left= "3%"; */
                        	tagbox_area.style.width= 0;
                        	mf_area.style.width="90%";
                        	
                        	var tagbox = document.getElementById("tagbox");
                        	tagbox.innerHTML = "";
                        	
                        	const content = document.getElementById("content");
                        	var m_seq2 = document.getElementById("m_seq2");
                        	var depth = document.getElementById("depth");
                        	var cmt_no = document.getElementById("cmt_no");
                        	var tag = document.getElementById("tag");
                        	
                        	/* tag.value = "@" + m_nickname + '&nbsp';
                        	content.innerHTML = tag.value; */
                        	tag.value = tagbox.innerHTML;
                        	
                        	m_seq2.value = 0;
                        	depth.value = 0;
                        	cmt_no.value = 0;
                        	tag.value = '0';
                        	
                        	console.log(m_seq2);
                        	console.log(depth);
                        	console.log(cmt_no);
                        	console.log(tag);
                        	
                        }
                        
                        
                        function addrcl(v){
                        	const lgcheck = document.getElementById("lgcheck").value;
        					console.log(lgcheck);
        					if(lgcheck == "false"){
        						alert("로그인이 필요한 서비스 입니다. ");
        						return;
        					}
                        	var rclbtn = document.getElementById("rclbtn"+v);
        					console.log(rclbtn.src);
                        	
        					if(rclbtn.src === "https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png"){
        						url = "${cpath}/member/dorclike";			
        					}else{
        						url = "${cpath}/member/norclike";
        					}
                        	
        					
        					var rv_cmt_seq = v;
        					console.log(rv_cmt_seq);
        					var param = "rv_cmt_seq=" + rv_cmt_seq;
        					
        					sendRequest(url, param, function(){
        						
        						if(xhr.readyState === 4 && xhr.status === 200){
        							var data = xhr.responseText;
        							console.log(rclbtn.src);
        							if(data == '댓글 좋아요' && rclbtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
        								rclbtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
        							}else if(data != '댓글 좋아요' && rclbtn.src == 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png'){
        								rclbtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
        							}else if(data == '댓글 좋아요' && rclbtn.src == '${pageContext.request.contextPath }/resources/like/like.jpg'){
        								rclbtn.src = 'https://assets.triple.guide/images/btn-lounge-thanks-off@3x.png';
        							}else{
        								rclbtn.src = '${pageContext.request.contextPath }/resources/like/like.jpg';
        							}
        							
        							var rv_cmt_seq = v;
        							var param = "rv_cmt_seq=" + rv_cmt_seq;
        							var url = "${pageContext.request.contextPath}/member/countRCL";
        							
        							sendRequest(url, param, function(){
        								if(xhr.readyState === 4 && xhr.status === 200){
        									var data = xhr.responseText;
        									var rclcnt = document.getElementById("rclcnt");
        									
        									rclcnt.innerText = data;
        								}
        							}, "POST");
        						}
        					}, "POST");
        					location.reload();
                        }
                        
                        
                        /* function clip(){
                        	var url = '';
                        	var textarea = document.createElement("textarea");
                        	document.body.appendChild(textarea);
                        	url = window.document.location.href;
                        	textarea.value = url;
                        	textarea.select();
                        	document.execCommand("copy");
                        	document.body.removeChild(textarea);
                        	alert("URL이 복사되었습니다.");
                        	
                        } */
                        
                        function share(v){
                        	var url = '';
                        	var textarea = document.createElement("textarea");
                        	document.body.appendChild(textarea);
                        	url = "http://localhost:8080${cpath}/member/review/selectRV?rv_seq="+v;
                        	textarea.value = url;
                        	textarea.select();
                        	document.execCommand("copy");
                        	document.body.removeChild(textarea);
                        	alert("URL이 복사되었습니다.");
                        }
                        
                        
                        function deleteRV(v){
                        	
                        	var c = confirm("삭제하시겠습니까? 삭제하면 적립된 리뷰 포인트도 함께 사라집니다.");
                        	if(c){
                        		window.location.href = "${cpath }/member/rievew/deleteRV?rv_seq="+v;
                        	}
                        }
                        
                        function updateCMT(v){
                        	var content = document.getElementById("content"+v).innerText;
                        	console.log(content);
                        	var textInput = document.getElementById("content");
                        	
                        	textInput.value = content;
                        	textInput.focus();
                        	
                        	var remark = document.querySelector(".remark");
                        	var inputBtn = remark.querySelector('input[type="button"]');
                        	inputBtn.value = "수정";
                        	inputBtn.onclick = function(){
                        		insertCMT(this.form, v);
                        	};
                        }
                        
                        function insertCMT(f, v){
                        	var content = f.content.value;
                        	console.log(content);
                        	console.log("v?: "+v);
                        	var remark = document.querySelector(".remark");
                        	var inputBtn = remark.querySelector('input[type="button"]');
                        	
                        	if(content == ''){
                        		alert("댓글을 입력하세요.");
                        		f.content.focus();
                        		return;
                        	}else{
                        		if(inputBtn.value == '등록'){
		                        	f.action = "${cpath}/member/review/insertCMT?rv_seq="+v;
                        		}else{
		                        	f.action = "${cpath}/member/review/updateCMT?rv_cmt_seq="+v;
                        		}
	                        	f.submit();
                        	}
                        }
                        
                        
                       /*  function updateCheck(v){
                        	var textInput = document.getElementById("content").value;
                        	console.log(textInput);
                        	
                        	if(content == ''){
                        		alert("댓글을 입력하세요.");
                        		f.content.focus();
                        		return;
                        	}else{
	                        	f.action = "${cpath}/member/review/updateCMT?rv_cmt_seq="+v;
	                        	f.submit();
                        	}
                        } */
                        
                        
                    </script>
                </div>
            </div>
        </body>
    </html>