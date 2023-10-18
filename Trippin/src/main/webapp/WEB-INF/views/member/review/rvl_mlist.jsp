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
                    height: 10vh;
                    border-bottom : 1px solid #F2F2F2;
                }
                .hd-in a {
                    text-decoration: none;
                }
                .hd-in a img {
                    width : 40px;
                    margin-top : 2%;
                }
                .hd-in img {
                    width : 40px;
                    margin-top : 3%;
                    border-radius: 50%;
                    margin-left : 3%;
                }
                .hd-sp {
                    position: relative;
                    bottom : 1.5vh;
                    left : 0.5vw;
                    font-size :20px;
                    font-weight: bold;
                }
                .user-info {
                    display: flex;
                }
                .user-img img {
                    width: 36px;
                    height: 36px;
                    border-radius: 19px;
                    object-fit: cover;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                    padding-top : 1%;
                    padding-left : 2%;
                }
                .user-info {
                    
                    padding-top : 2%;
                    padding-bottom : 2%;
                }
                .user-name {
                    padding-top : 1%;
                    padding-left : 2%;
                    font-size : 15px;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <a onclick="history.back();" style="cursor: pointer;">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                        </a> 
                        <img src="https://w7.pngwing.com/pngs/886/3/png-transparent-white-and-blue-like-icon-facebook-like-button-computer-icons-thumb-signal-thumbs-up-blue-text-hand.png">
                        <span class="hd-sp">${countRVL }</span>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="users">
                	<c:forEach var="li" items="${rvl_mlist }">
	                    <div class="user-info">
	                        <div class="user-img">
	                            <img onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${li.M_SEQ }'" src="${cpath}/common/getImg?path=${li.M_PROFILE }&file=${li.rvl_mlistNM }" style="cursor: pointer;">
	                        </div>
	                        <div class="user-name">
	                            <span onclick="document.location.href='${cpath}/member/memberinfo?m_seq=${li.M_SEQ }'" style="cursor: pointer;">${li.M_NICKNAME }</span>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>