<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>


<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video,
	fieldset {
	margin: 0;
	padding: 0;
}

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

ol, ul {
	list-style: none
}

li {
	list-style-type: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

img {
	max-width: 100%;
	height: auto;
}

mark {
	background: none
}

select {
	max-width: 100%;
}

caption, legend {
	display: none;
}

hr {
	display: none;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
}

address, strong {
	font-style: normal;
	font-weight: normal;
}

table {
	border-collapse: collapse;
}

input, select {
	outline: none;
	font-family: inherit
}

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
                   
                    text-align: center;
    				line-height: 9vh;
                }
                
             
                .hd-in span {
                    
                    font-size : 21px;
                    font-weight: 550;
                }




.main-mid {
	margin-left: 26%;
	margin-right: 26%;
	margin-top: 3%;
	width: 50%;
}

.footer {
	margin-top: 2%;
	padding-top: 1%;
	background-color: rgb(250, 250, 250);
}

.foot-top {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.kakaot {
	font-weight: bold;
	margin-bottom: 2%;
}

.kakaot span, .telk span {
	color: #368FFF;
	margin-left: 1%;
}

.telk {
	font-weight: bold;
	margin-bottom: 1%;
}

.telf {
	font-weight: bold;
	margin-bottom: 2%;
}

.ft-info {
	font-weight: bold;
	color: #9A9A9A;
	line-height: 2.1;
	margin-bottom: 5%;
	padding-bottom: 3%;
	border-bottom: 1px solid #EFEFEF;
}

.foot-foot {
	margin-left: 26.74%;
	margin-right: 24.82%;
}

.ff {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
}

.ff2 {
	font-weight: 500;
	font-size: 11px;
	color: rgba(58, 58, 58, 0.5);
	margin-top: 2%;
	margin-bottom: 7%;
}

strong {
	font-weight: bold;
}
.main-top {
	border-bottom : 2px solid rgb(230, 230, 230);
	padding-top : 2%;
	padding-bottom : 2%;
}
.root {
	font-size : 12px;
	font-weight : bold;
	color : rgb(145, 145, 145);
	padding-bottom : 1%;
}
.main-title {
	font-size : 18px;
	font-weight : bold;
	
}
.main-text {
	padding-top : 3%;
	padding-bottom : 3%;
	padding-left : 1%;
	padding-right : 1%;
	color : rgb(97, 97, 97);
	word-break : keep-all;
}
.btn-area {
	text-align : center;
}
.btn-area input {
	background-color : white;
	color : rgb(77,77,77);
	border : 2px solid rgb(77,77,77);
	width : 20%;
	height : 5vh;
	border-radius : 10px;
	font-weight : bold;
}
.btn-area input:hover {
	background-color : rgb(77,77,77);
	color : white;
}
</style>
<script>
function closePopup() {
	window.close();
}
 function gotoEditForm() {
	 var cs_seq = document.getElementById("cs_seq").value;
	 const editFormUrl = "${cpath}/admin/cs/update?cs_seq="+cs_seq; // 수정 폼의 URL
	  const editFormName = "EditForm"; // 새 창의 이름
	  const editFormFeatures = "width=800,height=600"; // 새 창의 속성 (크기 등)

	  // 새 창으로 수정 폼을 열기
	  window.open(editFormUrl, editFormName, editFormFeatures);

	  // 팝업 창 닫기
	  window.close();
	 
	
}
</script>

</head>
<body>
	<header class="header">
		<div class="inner">
	        <div class="hd-in">
	            <span>공지사항</span>
	        </div>
        </div>
	</header>
	<input type="hidden" id="cs_seq" value="${csvo.CS_SEQ}">
<!-- cate>subcate -->
	<div class="main">
		<div class="main-top">
			<div class="root">
				<span>${csvo.CS_CATE_NAME} > ${csvo.CS_SUBCATE_NAME}</span>
			</div>
			<div class="main-title">
				<span>${csvo.TITLE}</span>
			</div>
		</div>
		<div class="main-text">
			<div class="text-location">
				${csvo.CONTENT }
			</div>
		</div>
	
			
	
		<div class="btn-area">	
			<input type="button" value="확인" onclick="closePopup();">
			<c:if test="${admin != null }">
			<input type="button" value="수정" onclick="gotoEditForm();">
			</c:if>
		</div>
	</div>

		
</body>
</html>