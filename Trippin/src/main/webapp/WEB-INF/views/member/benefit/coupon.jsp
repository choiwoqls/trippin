<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>
</head>
<body style=" margin-left : 20%; margin-right : 20%; ">
	<div align="center" style="display : flex; flex-wrap : wrap; width : 80vw;">
		<input type="button" value="닫기" onclick="window.close()">
		<c:forEach var="l" items="${list }" varStatus="i">
			<table cellspacing="5px" style="border:0;width:35%;height:70px; border-bottom : 1px solid #EBEBEB; margin-right : 6%;" ondblclick="selectOneAndOpenDetail(${l.F_SEQ})">
				<tr width="400px">
					<td width="63%"><b>${l.NAME }</b></td>
					<td rowspan="4" valign="top" width="29%" height="70px">
						<img src="${cpath}/common/getImg?path=${l.MAIN_IMG }&file=${l.FILE }" style="width:130px; height : 130px;"/>
					</td>
				</tr>
				<tr>
					<td>${l.INTRO }</td>
				</tr>
				<tr>
					<td><font color="#F0DA49">★</font>${l.SAVG }<span style="color : #BABABA;">(${l.RV })</span>·<font color="red">♥</font>${l.JJ }</td>
				</tr>
				<tr>
					<td style="color : #BABABA;">${l.KIND_NAME }·${l.ADDR2_NAME }</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<script>
		  function selectOneAndOpenDetail(f_seq) {
			console.log(f_seq);
			window.location.href = '${cpath}/member/hotple/selectHotple?f_seq=' + f_seq;
		  }
	</script>
</body>
</html> --%>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

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
    margin-left : 20%;
    margin-right : 20%;
    background-color: white;
    height: 10vh;
    border-bottom : 1px solid #F2F2F2;
}
.main {
    margin-left : 20%;
    margin-right : 20%;
    padding-right : 2%;
    padding-left : 2%;
    background-color: white;
    font-family: Arial, Helvetica, sans-serif;
}
.hd-in {
    height: 9vh;
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
.hd-in span {
    position: relative;
    bottom : 0.7vh;
    left : 3vw;
    font-size : 21px;
    font-weight: 550;
}
.place-count {
    padding-top : 4%;
    padding-bottom : 1%;
    font-weight: bold;
    color : #2987F0;
    font-size : 14px;
}
.mltsc-1 {
    display: flex;
    height : 2.5vh;
}
.ml-sect {
    width : 27.15%;
}
.mlstar {
    margin-top : 5%;
    width : 70%;
    height : 100%;
    background-image : url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
    background-repeat: repeat-x;
}
.pl-1 {
    display : flex;
    width : 100%;
    border-bottom : 1px solid rgba(239,239,239,1);
    justify-content: space-between;
    padding-bottom : 4%;
    padding-top : 4%;
    cursor: pointer;
}
.pl-text {
    width : 70%;
}
.pl-img {
    width : 20%;
    position: relative;
}
.main-img {
    width : 100%;
    height : 100%;
    object-fit: cover;
    border-radius: 5px;
}
.jjim-img1 {
    position: absolute;
    top: 1px;
    right: 1px;
    width: 36px;
    height: 36px;
    cursor: pointer;
}
.jjim-img2 {
    position: absolute;
    top: 3px;
    right: 4px;
    width: 27px;
    height: 28px;
    cursor: pointer;
}
.title {
    font-weight: bold;
    font-size : 17px;
}
.detail {
    font-weight: bold;
    font-size : 14px;
    color : rgba(58, 58, 58, 0.8);
    word-break: keep-all;
}
.mltsc-1 {
    color : #897E7F;
    font-weight: bold;
    font-size : 13px;
    font-family: none;
    
}
.roca {
    padding-top : 2%;
    color : #897E7F;
    font-weight: bold;
    font-size : 13px;
}
</style>
</head>
     <body>
         <header class="header">
             <div class="inner">
                 <div class="hd-in">
                     <a onclick="window.close();">
                         <img src="https://cdn.icon-icons.com/icons2/1462/PNG/512/134leftarrow_100014.png">
                     </a>
                     <span id="main-hot"></span>
                 </div>
             </div>
         </header>
         <div class="main">
             <div class="place-count">
                 <span>다른 지점 ${list.size() }개</span>
             </div>
             <div class="place-list">
				<c:forEach var="l" items="${list }" varStatus="i">
                  <div class="pl-1" onclick="hotpleDetail(${l.F_SEQ})">
                      <div class="pl-text">
                          <div class="title">
                              <span id="${i.count }">${l.NAME }</span>
                          </div>
                          <div class="detail">
                              <span>${l.INTRO }</span>
                          </div>
                          <div class="mltsc-1">
                              <div class="ml-sect">
                                  <div class="mlstar">
                                      
                                  </div>
                              </div>
                              <span style="padding-right : 2%; margin-left : -8%;">(${l.RV })</span>·
                              <span style="padding-left : 2%;">저장 ${l.SAVG }개</span>
                          </div>
                          <div class="roca">
                              <span style="padding-right : 2%;">${l.H_CATE_NAME }</span>·<span style="padding-left : 2%;">${l.ADDR2_NAME }</span>
                          </div>
                      </div>
                      <div class="pl-img">
                          <img class="main-img" src="${cpath}/common/getImg?path=${l.MAIN_IMG }&file=${l.FILE }">
                          <img class="jjim-img2" src="https://www.freepnglogos.com/uploads/heart/list-emoji-one-symbol-emojis-for-use-facebook-20.png">
                      </div>
                  </div>
				</c:forEach>
              	<script>
              		$(function(){
              			var main = document.getElementById("1");
              			document.getElementById("main-hot").innerText = main.innerText;
              		})
              	
			 function hotpleDetail(f_seq) {
				window.opener.location.href = '${cpath}/member/hotple/selectHotple?f_seq=' + f_seq;
              	window.close();
			 }
		</script>
             </div>
         </div>
     </body>
 </html>