<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

a{
text-decoration: none;
}
            
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
            .inner {
                padding-left : 35%;
                padding-top : 10%;
                padding-right : 35%;
            }
            .hd-in {
                
                text-align: center;
                font-weight: bold;
                font-size : 20px;
                padding-bottom : 4%;
                border-bottom : 2px solid #2987F0;
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
                padding-left : 5%;
                padding-right : 5%;
                padding-top : 3%;
            }
            .make-plan {
                display : flex;
                
                padding : 5%;
                cursor: pointer;
                background-color : #FFF5E3; 
            }
            .make-img img {
                width : 50px;
            }
            .make-img {
                width : 15%;
                
            }
            .make-text {
                
            }
            .text-title {
                font-weight : bold;
                padding-bottom : 4%;
                padding-top : 1%;
            }
            .text-stitle {
                font-weight : bold;
                font-size : 14px;
                color : rgba(58,58,58,0.6);
                
            }
            .trip-mtitle {
                font-weight : bold;
                padding : 3%;
                font-size : 17px;
            }
            .trip-mtitle2 {
                font-weight : bold;
                padding : 3%;
                font-size : 17px;
                padding-top : 5%;
            }
            .come-trip, .last-trip {
                display : flex;
                padding : 3%;
                background-color: #fff;
                border-radius: 2px;
                cursor: pointer;
                
                box-shadow: inset 0 2px 5px -5px #333;
                transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                box-sizing: border-box;
            }
            .come-trip:hover, .last-trip:hover {
                box-shadow: 0 1px 2px rgba(0,0,0,0.25), 0 1px 5px rgba(0,0,0,0.22);
            }
            .trip-img {
                width : 20%;
            }
            .trip-img img {
                width : 80px;
                height : 80px;
                border-radius: 50%;
                object-fit: cover;
            }
            .trip-text {
                width : 80%;
                padding-top : 1.5%;
                line-height: 135%;
            }
            .trip-loca {
                font-weight: bold;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .trip-date {
                font-size : 15px;
                color: rgba(58, 58, 58, 0.8);
                font-weight: bold;
            }
            .trip-count {
                font-size : 14px;
                color: #919191;
                font-weight: bold;
            }
            .trip-list1 {
                padding-bottom : 5%;
            }
            .line-img {
                margin-bottom: 16px;
                padding: 8.5px 0px;
                background-image: url("https://triple.guide/auth-web/images/or_hr@3x.png");
                background-repeat: no-repeat;
                background-size: 265px;
                background-position: center center;
                
            }
        </style>
<script type="text/javascript">
	function scheHome(i) {
		document.getElementById("s_seq").value = i;
		document.getElementById("homeForm").submit();
	}


</script>
    </head>
    <body>
    <form action="${pageContext.request.contextPath }/schedule/sche/scheHome" method="post" id="homeForm">
				<input type="hidden" name="s_seq" id="s_seq" value="">
				<input type="hidden" name ="addr1_seq1" value="-1">
			</form>
        <header class="header">
            <div class="inner">
                <div class="hd-in">
                    <span>내 여행</span>
                </div>
            </div>
        </header>
        <div class="main">
            <div class="main-top">
                <div class="make-plan" onclick="location.href='${pageContext.request.contextPath }/schedule/sche/logincheck'">
                    <div class="make-img">
                        <img src="https://cdn-icons-png.flaticon.com/128/4436/4436415.png">
                    </div>
                    <div class="make-text">
                        <div class="text-title">
                            <span>일정 만들기</span>
                        </div>
                        <div class="text-stitle">
                            <span>새로운 여행을 떠나보세요.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-mid">
                <div class="trip-mtitle">
                    <span>다가오는 여행</span>
                </div>
                <div class="trip-list1">
                <c:forEach var="map" items="${list }" varStatus="i">
                    <div class="come-trip"  onclick="scheHome(${map.S_SEQ})"> <!--여기부터 돌리면-->
                        <div class="trip-img">
                            <img src="https://blog.allstay.com/wp-content/uploads/2018/08/sum-4.jpg">
                        </div>
                        <div class="trip-text">
                            <div class="trip-loca">
                                <span>${map.TITLE }</span>
                            </div>
                            <div class="trip-date">
                                <span>
									<c:choose>
										<c:when test="${map.FIRSTDAY == map.LASTDAY }">
										${map.FIRSTDAY },
											당일치기
										</c:when>
										<c:otherwise>
											${map.FIRSTDAY } - ${map.LASTDAY }
										</c:otherwise>
									</c:choose>
								</span>
                                <span>5명과 함께</span>
                            </div>
                            <div class="trip-count">
                                <span>${map.SU }개의 도시</span>
                            </div>
                        </div>
                    </div> <!--여기 까지-->
                    </c:forEach>
                </div>
                <div class="line-img">
                </div>
                <div class="trip-mtitle2">
                    <span>지난 여행</span>
                </div>
                <div class="trip-list2">
                	<c:forEach var="map" items="${llist }" varStatus="j">
                    <div class="last-trip"  onclick="scheHome(${map.S_SEQ})"> <!--얘도 여기부터 돌리면-->
                        <div class="trip-img">
                            <img src="https://content.skyscnr.com/m/2d50496321577470/original/hamburg-germany-pixabay.jpg?crop=1224px:647px&quality=100&position=attention">
                        </div>
                        <div class="trip-text">
                            <div class="trip-loca">
                                <span>${map.TITLE }</span>
                            </div>
                            <div class="trip-date">
                                <span>
	                                <c:choose>
									<c:when test="${map.FIRSTDAY == map.LASTDAY }">
									${map.FIRSTDAY },
										당일치기
									</c:when>
									<c:otherwise>
										${map.FIRSTDAY } - ${map.LASTDAY }
									</c:otherwise>
								</c:choose>
								</span>
                                <span>40명과 함께</span>
                            </div>
                            <div class="trip-count">
                                <span>${map.SU }개의 도시</span>
                            </div>
                        </div>
                    </div> <!-- 여기까지 -->
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>