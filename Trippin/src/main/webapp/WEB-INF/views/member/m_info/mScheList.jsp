<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            
            .hd-top{
            
            }
            
            .ht-f{
            	display: flex;
            	justify-content: space-between;
            	padding-left : 1%;
     			padding-right : 1%;
            }
            
            .edit a{
            	text-decoration: none;
            	color: #000;
            	font-size: small;
            }
            .back-btn {
            	position : relative;
            	top : 1vh;
            	left : 1vw;
            }
            .edit {
            	width : 30%;
            	font-weight : bold;
            	font-size : 14px;
            	text-align : right;
            	padding-right : 4%;
            	line-height : 9vh;
            }
            .hd-mid{
            	    padding-top: 1%;
				    padding-left: 1%;
				    padding-right: 1%;
				    width: 98%;
				    height: 24vh;
            }
            
            .member{
           	   text-align: -webkit-center;
            }
            
            .m-p{

            }
            
            .m-photo{
           	    width: 90px;
			    border: 1px solid;
			    height: 90px;
			    border-radius: 45px;
            
            }
            
            .m-n{
           	    width: 13vh;
			    text-align: center;
			    /* border: 1px solid; */
			    font-size: 16pt;
			    font-weight: bold;
			    padding-top: 1%;
            }
            
            .m-l{
            	width: 13vh;
			    text-align: center;
			    /* border: 1px solid; */
			    font-size: 11pt;
			    font-weight: bold;
			    padding-top: 1%;
			    color: #368FFF;
            }
            
            .hd-f{
           	    height: 5vh;
			    display: flex;
			    width: 100%;
			    justify-content: space-around;
            }
            
            .backImg{
            	width: 2vw;
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
            <input type="hidden" id="lgcheck" value="${lgcheck }">
                <div class="content">
           			<div class="hd-in">
                  		<div class="historyBack">
                        <a onclick="history.back();">
                        	<img class="back-btn" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                        </a>
                        </div>
						<div class="edit">
							<a href="${cpath }/member/editProfile?m_seq=${map.M_SEQ }">프로필 편집</a>
						</div>
                   </div>
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
        	<div class="sticky-element">
                <div id="stDiv3" class="sticky-element-itemz" onclick="toggleClasses2('stDiv3', 'stDiv1', 'stDiv2');" style="cursor: pointer;">
                    내 여행
                </div>
			    <div id="stDiv1" class="sticky-element-item" onclick="toggleClasses2('stDiv1', 'stDiv2', 'stDiv3');" style="cursor: pointer;">
			    	리뷰${map.rvCnt }
			    </div>
			    <div id="stDiv2" class="sticky-element-item" onclick="toggleClasses2('stDiv2', 'stDiv1', 'stDiv3');" style="cursor: pointer;">
			    	여행기${map.slogCnt }
			    </div>
			</div>
                <script>
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
                        	window.location.href="${cpath}/member/memberinfo?m_seq=${map.M_SEQ}";
                        }
                        if(divIdToToggle === 'stDiv2'){
                        	window.location.href="${cpath}/member/m_s_info?m_seq=${map.M_SEQ}";
                        }
                        if(divIdToToggle === 'stDiv3'){
                        	window.location.href="${cpath}/member/mScheList";
                        }
                        
                    }
                </script>
                
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
                                <c:choose>
									<c:when test="${map.CSU <= 1 }">
									</c:when>
									<c:otherwise>
		                                <span>${map.CSU }명과 함께</span>
									</c:otherwise>
								</c:choose>
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
								<c:choose>
									<c:when test="${map.CSU <= 1 }">
									</c:when>
									<c:otherwise>
		                                <span>${map.CSU }명과 함께</span>
									</c:otherwise>
								</c:choose>                                
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