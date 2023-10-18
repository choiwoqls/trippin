<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<link rel="shorcut icon"
	href="https://triple.guide/icons/favicon-152x152.png">
<title>나를 아는 여행 앱, 트리플</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap"
	rel="stylesheet">

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

.hd-in {
	display: flex;
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
	height: 70px;
}

header {
	background-color: white;
}

.hd-left img {
	width: 40px;
	margin-top: 40%;
}

.hd-right {
	margin-left: 80%;
	margin-top: 3.5%;
}

.hd-right a {
	text-decoration: none;
	color: #3666FF;
	font-size: 20px;
}

.hd-mid input {
	width: 200%;
	height: 60px;
	margin-top: 2%;
	margin-left: 10%;
	border: 0px;
	font-size: 20px;
}

input::placeholder {
	font-size: 20px;
}

.main-header {
	border-bottom: 10px solid #F2F2F2;
	height: 20vh;
}

.mh-title {
	height: 20vh;
	padding-top: 5%;
	font-weight: bold;
	margin-left: 5%;
}

.mht-1 {
	color: #ABABAB;
	margin-bottom: 1%;
}

.mht-2 {
	font-size: 28px;
}

.mt-1 img {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	margin-left: 20%;
}

.me-top1 {
	display: flex;
}

.mt-2 {
	margin-left: 5%;
	width: 50%;
}

.mt2-title {
	font-weight: bold;
	font-size: 20px;
	margin-top: 4%;
}

.mt2-subtitle {
	font-size: 14px;
	font-weight: 500;
	color: #818181;
	margin-top: 4%;
}

.mt-3 {
	margin-left: 10%;
	margin-top: 3%;
}

.mt-3 button {
	width: 80px;
	padding-top: 15%;
	padding-bottom: 15%;
	padding-left: 20%;
	padding-right: 20%;
	border-radius: 35px;
	cursor: pointer;
	border: 0px;
	font-weight: bold;
	font-size: 16px;
}

.mtbtn-1 {
	display: block;
}

.mtbtn-2 {
	display: none;
	border: 2px solid #3666FF !important;
	color: #3666FF;
	background-color: white;
}

.mb-title {
	width: 100%;
	cursor: pointer;
	margin-top: 33.8%;
	height: 50px;
	margin-bottom: 0.2%;
	border: 1px solid;
	line-height: 50px;
	text-align: center;
	font-size: 20px;
	background-color: #2987F0;
	color: white;
	border-radius: 5px;
	font-weight: bold;
}

body {
	background-color: #F2F2F2;
}

.main-header, .main-ex {
	margin-left: 30%;
	margin-right: 30%;
	background-color: white;
}

.hd-in:focus-within {
	border-bottom: 3px solid;
	transition: 0.1s
}

.popimg-co {
	top: 32.5%;
	right: 35%;
}

.popimgz {
	width: 50px;
	cursor: pointer;
	background-color: white;
	transition: 0.5s;
	transform: rotate(180deg);
}

#popup1:checked+#menus {
	display: block;
}

#popup:unchecked+#menus {
	display: none;
}

#popup1 {
	display: none;
}

.popimg {
	width: 50px;
	transition: 0.5s;
	background-color: white;
	cursor: pointer;
}

.main-mid {
	margin-left: 30%;
	margin-right: 30%;
	padding-bottom :3%;
	background-color: white;
}

.mm-one {
	width: 300px;
	height: 10vh;
	line-height: 10vh;
	
	font-weight: bold;
	padding-left: 3%;
}

.mi-one {
	display: flex;
	padding: 2.5%;
	height: 10vh;
}

#wrapper {
	padding-left: 5%;
	display: flex;
	width: 20%;
}

#wrapper1 {
	padding-left: 5%;
	width: 20%;
}

.wrp1 {
	border: 2px dashed #3666FF;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin-top: 15%;
}

#label {
	display: flex;
	align-items: center;
	cursor: pointer;
}

#hiddenCheckbox {
	display: none;
}

#hiddenCheckbox:checked+.showCheckbox {
	background:
		url("https://t4.ftcdn.net/jpg/02/72/43/07/360_F_272430728_bKEJcWjHLNRpSwDFEZjpAu2DnvYQDluf.jpg")
		no-repeat;
	background-size: contain;
	border: 2px solid white;
}

.showCheckbox {
	width: 30px;
	height: 30px;
	border: 2px solid #F2F2F2;
	border-radius: 50%;
	background-color: white;
}

.mi-name {
	font-weight: bold;
}

.miii {
	padding-top: 3%;
}

.mi-sname {
	color: #ABABAB;
	margin-top: 3%;
}

.mi-two {
	
	display: block;
	border-radius: 15px;
}

.mi-twoz {
	
	display: block;
	border-radius: 15px;
}

.mith-img {
	width: 1.5vw;
	position: relative;
	top: 5%;
	left: 6%;
	cursor: pointer;
}

.ct-img {
	width: 1.5vw;
	position: relative;
	top: 5%;
	left: 6%;
	cursor: pointer;
}

.mit-head {
	height: 10vh;
	line-height: 10vh;
	border-bottom: 2px solid #F2F2F2;
}

.ct-head {
	height: 10vh;
	line-height: 10vh;
	border-bottom: 2px solid #F2F2F2;
}

.ct-head span {
	font-weight: bold;
	font-size: 17px;
	margin-left: 10%;
}

.mit-head span {
	font-weight: bold;
	font-size: 17px;
	margin-left: 10%;
}

.mm-z {
	height: 8vh;
	line-height: 8vh;
	padding-left: 4%;
	font-weight: bold;
	color: #2987F0;
	cursor: pointer;
	border-bottom: 1px solid #F2F2F2;
}

.ct-z {
	height: 8vh;
	line-height: 8vh;
	padding-left: 4%;
	font-weight: bold;
	color: #2987F0;
	cursor: pointer;
	border-bottom: 1px solid #F2F2F2;
}

.mm-y {
	height: 8vh;
	line-height: 8vh;
	padding-left: 4%;
	font-weight: bold;
	color: black;
	border-bottom: 1px solid #F2F2F2;
}

.cc-y {
	height: 8vh;
	line-height: 8vh;
	padding-left: 4%;
	font-weight: bold;
	color: black;
	border-bottom: 1px solid #F2F2F2;
}

.mmz-z {
	border: 1px solid;
	margin-left: 10%;
	margin-right: 10%;
	border-radius: 5px;
	height: 70vh;
	display: none;
}

.ctz-z {
	border: 1px solid;
	margin-left: 10%;
	margin-right: 10%;
	border-radius: 5px;
	height: 70vh;
	display: none;
}

.ctz-zz {
	
	margin-left: 10%;
	margin-right: 10%;
	border-radius: 5px;
	height: 70vh;
	position : relative;
	display: block;
}

.mmz-zz {
	position : relative;
	margin-left: 10%;
	margin-right: 10%;
	border-radius: 5px;
	
	display: block;
}

.m2z2, .ctz2 {
	height: 10vh;
	font-weight: bold;
	font-size: 19px;
	line-height: 10vh;
	padding-left: 5%;
}

.mztextarea, .cttextarea {
	width: 80%;
	margin-left: 9%;
	height: 50vh;
	resize: none;
	font-size: 20px;
	border: 0;
	outline: none;
	font-family: Arial, Helvetica, sans-serif;
}

.m2z2-foot, .ctz2-foot {
	border-top: 2px solid #F2F2F2;
	height: 8.7vh;
	display: flex;
	line-height: 10vh;
	text-align: center;
	font-weight: bold;
	font-size: 15px;
}

.m2z2-can, .ctz2-can {
	border-right: 2px solid #F2F2F2;
	width: 50%;
	color: #ABABAB;
	cursor: pointer;
}

.m2z2-agr, .ctz2-agr {
	width: 50%;
	color: #2987F0;
	cursor: pointer;
}

.mm-y, .cc-y {
	width: 100%;
}

.mmy-2, .ccy-2 {
	color: #2987F0;
	font-weight: bold;
	position: absolute;
	left: 65%;
}

.adc-tit {
	width: 100%;
	text-align: center;
	height: 10vh;
	line-height: 10vh;
}

.adc-titCheck {
	width: 100%;
	text-align: center;
	height: 10vh;
	line-height: 10vh;
}

.adc {
	background-color: #2987F0;
	color: white;
	border: 0;
	border-radius: 25px;
	padding-bottom: 1.5%;
	padding-top: 1.5%;
	padding-left: 2%;
	padding-right: 2%;
	cursor: pointer;
}

.adcCheck {
	background-color: #2987F0;
	color: white;
	border: 0;
	border-radius: 25px;
	padding-bottom: 1.5%;
	padding-top: 1.5%;
	padding-left: 2%;
	padding-right: 2%;
	cursor: pointer;
}

.cata-tit {
	border: 2px solid;
	display: none;
	border-radius: 15px;
}

.cata-titz {
	border: 2px solid;
	display: block;
	border-radius: 15px;
}

.ff-inner {
	display: flex;
	font-size: 10px;
	z-index: 3;
}

.ff-one {
	display: flex;
	background-color: white;
	width: 50%;
	padding-top: 0.5%;
	padding-bottom: 0.5%;
	border-top-right-radius: 60px;
	box-sizing: border-box;
	box-shadow: 0 0 0.4rem 0 rgba(0, 0, 0, .16);
}

.ff-two {
	display: flex;
	width: 50%;
	background-color: white;
	padding-top: 0.5%;
	padding-bottom: 0.5%;
	border-top-left-radius: 60px;
	box-sizing: border-box;
	box-shadow: 0 0 0.4rem 0 rgba(0, 0, 0, .16);
}

.fo-loca {
	margin-left: 59%;
	width: 10%;
}

.fo-loca a:hover, .fo-search a:hover, .ft-like a:hover, .ft-my a:hover {
	filter: invert(59%) sepia(36%) saturate(2243%) hue-rotate(137deg)
		brightness(101%) contrast(97%);
	font-weight: bolder;
}

.fo-search {
	margin-left: 12.5%;
	width: 10%;
}

.ft-like {
	margin-left: 15.5%;
	width: 10%;
}

.ft-my {
	margin-left: 12.5%;
	width: 10%;
}

.loca-name {
	margin-left: -8%;
}

.search-name {
	margin-left: 1%;
}

.like-name {
	margin-left: 3%;
}

.my-name {
	margin-left: -11%;
}

.most-logo {
	width: 60px;
	position: absolute;
	bottom: -2%;
	left: 48%;
}

.ff-inner {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
}

.ff-inner a {
	text-decoration: none;
	color: black;
}

.add-cata {
	margin-bottom: 3%;
}
.more-img {
                    width : 30px;
                    height : 30px;
                    cursor: pointer;
                    position: relative;
                    left : 21vw;
                    bottom : 1vh;
                }
.foot-lastz {
                    width: 4vw;
                    background-color: white;
                    border: 1px solid rgba(239,239,239,1);
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 15px;
                    border-radius: 8px;
                    color: rgba(58, 58, 58, 0.8);
                    padding: 15px 37px 15px 15px;
                    font-size: 12px;
                    position: absolute;
                    left: 75%;
                    top : 5vh;
                    display: block;
                    line-height: 150%;
 }
 .foot-lastz a {
 	text-decoration : none;
 	color : rgba(58, 58, 58, 0.8);
 }
.m2z2,.foot-textarea, .mztextarea {
                    background-color: #FFF2AB;
                }
 .ctz2, .cttextarea {
                    background-color: #FFF2AB;
                }
.m2z2, .ctz2 {
                    border-top-left-radius: 5px;
                    border-top-right-radius: 5px;
                    
                }
.m2z2-foot, .ctz2-foot {
                    box-shadow: 0 3px 3px rgba(0,0,0,0.2);
                    border-bottom-left-radius: 5px;
                    border-bottom-right-radius: 5px;
                }
.foot-lastz span {
                    border-bottom : 1px solid;
                }
                .report {
                    padding-bottom : 0.5vh;
                    
                }
                .footfix {
                    margin-top : 2%;
                }
.foot-last {
	display : none;
}
.foot-lastz img {
                    width : 10px;
                    height : 10px;
                    position: absolute;
                    top : 18px;
                    right : 13px;
                    cursor: pointer;
                }
</style>
<script>
   function updown(i) {
	const btn = document.getElementById("pimg"+i);
	const mns = document.getElementById("menus"+i);
	btnclass = btn.getAttribute('class'); 
                                        console.log(btnclass);
                                        if(btnclass==='popimg'){
                                              btn.className='popimgz';
                                              mns.style.display = "block";
                                        }else{
                                            btn.className='popimg';
                                            mns.style.display = "none";
                                        }
                                        
                                    }
                                    function addItem(i) {
                                    	
                                    	//console.log(document.getElementById("itemText").value);
                                        const modiv = document.getElementById("mio"+i);
                                        const moC = modiv.className;
                                        const mtdiv = document.getElementById("mit"+i);
                                        const mtC = mtdiv.className;
                                        console.log(moC);
                                        if(moC == "mi-one"){
                                            mtdiv.className = "mi-twoz";
                                                            
                                            
                                        }
                                    }

                                    function closemit(i){
                                        const mtdiv = document.getElementById("mit"+i);
                                        mtdiv.className = "mi-two";

                                    }

                                    function insertCate(i){
                                        const mz = document.getElementById("mmz-z"+i);
                                        mz.className = "mmz-zz";
                                    }

                                    function cancel(i){
                                        const mz = document.getElementById("mmz-z"+i);
                                        mz.className = "mmz-z";
                                    }
                                    function addCate(){
                                        const cate_add = document.getElementById("cate-add");
                                        cate_add.className = "cata-titz";
                                    }
                                    function xCate(){
                                        const cate_add = document.getElementById("cate-add");
                                        cate_add.className = "cata-tit";
                                    }
                                    function addText(){
                                        const ctz_z = document.getElementById("ctz-z");
                                        ctz_z.className = "ctz-zz";
                                    }
                                    function xText(){
                                        const ctz_z = document.getElementById("ctz-z");
                                        ctz_z.className = "ctz-z";
                                    }
                                    
                                    function showlist1(i) {
                                        const mtdiv = document.getElementById("mmz-z"+i);
                                        const mtC = mtdiv.className;
                                        
                                      
                                        if(mtC == "mmz-z"){                                       
                                            mtdiv.className = "mmz-zz";
                                            
                                        }else{
                                        	console.log("saddsaasd");
                                        	mtdiv.className = "mmz-z";
                                        }
                                            console.log(mtdiv.className);
                                    }
                                    function addCatebtn() {
                                   	 
                                   	 var memo = document.getElementById("addCateText").value;
                                   	 var login = document.getElementById("login").value;
                                    	 var s_seq = document.getElementById("s_seq").value;
                                    	// var clist_memo_seq = document.getElementById("clist_memo_seq").value;
                                    	 var clist_cate_seq = 0;

                                    	var param = "m_seq="+login+"&clist_cate_seq="+clist_cate_seq+"&s_seq="+s_seq+"&memo="+memo;
                                    	
                                    	var url="${pageContext.request.contextPath}/member/sche/addMemoAll";
                                   	
                                   	sendRequest(url, param, function () {
                                   	
                                   		if(xhr.readyState === 4 && xhr.status === 200){
                                   			
                                   			var data = xhr.responseText;
                                   			if(data != 0){
                                   				
                                   				//alert("메모 추가 되었습니다.");
                                   				location.reload();
                                   		
                                   			}else{
                                   				alert("메모 추가 실패!");
                                   			}
                                   				
                                   		}
                                   		
                                   	},
                                   		"POST");
                                   	
                                   	 

                                   	 

                                   } 

                                   function addCheck(j) {


                                   	var login = document.getElementById("login").value;
                                   	var s_seq = document.getElementById("s_seq").value;
                                   	var clist_items_name = document.getElementById("clist_items_name"+j).value;
                                   	
                                   	var param = "s_seq="+s_seq+"&m_seq="+login+"&clist_items_seq="+j+"&clist_items_name="+clist_items_name;
                                   	
                                   	var url="${pageContext.request.contextPath}/member/sche/myclistInsert";
                                   	
                                   	sendRequest(url,param,function(){
                                   		
                                   		if(xhr.readyState===4 && xhr.status===200){
                                   			var data=xhr.responseText;
                                   			
                                   			if(data!=0){
                                   				
                                   				var ischecked = data === "true";
                                   				var checkbox = document.getElementById("hiddenCheckbox"+j);
                                   				checkbox.checked = ischecked;
                                   			}else{
                                   				
                                   			}
                                   		}
                                   		
                                   		
                                   	},
                                   			"POST");
                                   		

                                   }
                                   
                                   function itemsMemo(i) {
                                		

                                   	var memo = document.getElementById("myTextarea"+i).value;
                                   	var login = document.getElementById("login").value;
                                   	var s_seq = document.getElementById("s_seq").value;
                                   	//var memo_seq = document.getElementById("memo_seq").value;
                                   	
                                   	//console.log(memo_seq);

                                   
                                   	var param = "m_seq="+login+"&clist_cate_seq="+i+"&s_seq="+s_seq+"&memo="+memo;
                                   	
                         
                                   	var url="${pageContext.request.contextPath}/member/sche/addMemo";
                                   	
                                   	sendRequest(url, param, function () {
                                   		if(xhr.readyState === 4 && xhr.status === 200){
                                   			var data = xhr.responseText;
                                   			if(data != 0){
                                   				//alert("메모 추가 되었습니다.");
                                   				location.reload();
                                   		
                                   			}else{
                                   				alert("메모 추가 실패!");
                                   			}
                                   				
                                   		}
                       					
                       				},
                       					"POST");
                                   	
                       			} 
                                   
                                   function deleteMemo(i) {
                                   	
                                   	var param ="clist_memo_seq="+i;
                                   	
                                   	var url="${pageContext.request.contextPath}/member/sche/MemoDelete";
                                   	
                                   	sendRequest(url, param, function () {
                                   		if(xhr.readyState === 4 && xhr.status === 200){
                                   			var data = xhr.responseText;
                                   			if(data != 0){
                                   				//alert("메모 추가 되었습니다.");
                                   				location.reload();
                                   		
                                   			}else{
                                   				alert("메모 삭제 실패!");
                                   			}
                                   				
                                   		}
                       					
                       				},
                       					"POST");
                                   	
                                   	
                                   	
                       			}
                                   
                                   function deleteCateMemo(i) {
                                   	
                       				var param ="clist_memo_seq="+i;
                                   	
                                   	var url="${pageContext.request.contextPath}/member/sche/MemoDelete";
                                   	
                                   	sendRequest(url, param, function () {
                                   		if(xhr.readyState === 4 && xhr.status === 200){
                                   			var data = xhr.responseText;
                                   			if(data != 0){
                                   				//alert("메모 추가 되었습니다.");
                                   				location.reload();
                                   		
                                   			}else{
                                   				alert("메모 삭제 실패!");
                                   			}
                                   				
                                   		}
                       					
                       				},
                       					"POST");
                                   	
                       				
                       			}
/* 	function XTool(i) {
		const mtdiv = document.getElementById("mit"+i);
		mtdiv.className = "mi-twoz";
	} */
	
	 function addTool(i) {
         const tool_add = document.getElementById("tool-add"+i);
         tool_add.className = "foot-lastz";
     }
     function XTool(i) {
         const tool_add = document.getElementById("tool-add"+i);
         tool_add.className = "foot-last";
     }
     function addTool2() {
         const tool_add = document.getElementById("tool-addd");
         tool_add.className = "foot-lastz";
         console.log(tool_add.className);
     }
     function XTool2() {
         const tool_add = document.getElementById("tool-add2");
         tool_add.className = "foot-last";
     }                                      
</script>
</head>
<body>
	<header class="header">
		<div class="inner">
			<div class="hd-in">
				<div class="hd-left">
					<a href="javascript:history.back();"><img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU"></a>
				</div>
				<div class="hd-mid"></div>
				<div class="hd-right">
					<a href="#">편집</a>
				</div>
			</div>
		</div>
	</header>
	<div class="main">
		<div class="main-header">
			<div class="mh-title">
				<div class="mht-1">${scvo.title }&nbsp;·&nbsp;
				<c:choose>
				<c:when test="${nights==1 }">
				당일치기
				</c:when>
				<c:otherwise>
				${days }박&nbsp;${nights }일
				</c:otherwise>
				</c:choose>
				</div>
				
				<div class="mht-2">
					여행 준비<br>체크리스트
				</div>
			</div>
		</div>
		<div class="main-mid">
			<div class="mm-tit">
				<!-- 카테고리 리스트 -->
				<c:forEach var="map" items="${list }" varStatus="i">
					<div style="display: flex; border-bottom: 2px solid #F2F2F2;">
						<div class="mm-one">${map.vo.clist_cate_name }</div>
		


						<div style="margin-left: 35%; margin-top: 1.5%;">
							<img onclick="updown(${i.index})" id="pimg${i.index }"
								class="popimg"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-ywUVHBNam3DS8gXfLDGYf7lpS98npeAhw&usqp=CAU"
								alt="">
						</div>
						
					</div>
					<div style="display: none" id="menus${i.index}">
						<div class="menu">
							<!-- for문 -->
							<!-- 카테고리 별 아이템 리스트 -->
							<c:forEach var="vo" items="${map.ilist}" varStatus="j">

								<div class="mi-one">


									<div id="wrapper">
										<label id="label">
										<c:choose>
										 <c:when test="${vo.MSEQ == login && vo.SSEQ ==s_seq }"> <!-- 회원이 해당 일정에서 체크 했을때 -->
											 <input id="hiddenCheckbox" type="checkbox" checked="checked" /> <!-- 체크박스 -->
										 </c:when>
										 <c:otherwise>
											 <input id="hiddenCheckbox" type="checkbox" /> <!-- 체크박스 -->
										 </c:otherwise>
										</c:choose>
											<div class="showCheckbox" id="showCheckbox${vo.CLIST_ITEMS_SEQ }" onclick="addCheck(${vo.CLIST_ITEMS_SEQ })">
											<input type="hidden" name="item" id="clist_items_name${vo.CLIST_ITEMS_SEQ }" value="${vo.ITEM }">
											</div> 
										</label>

									</div>
									<div class="miii">
										<div class="mi-name">
											${vo.ITEM } <input type="hidden" class="clist_items_seq"
												id="clistItemsSeq${vo.CLIST_ITEMS_SEQ }"
												value="${vo.CLIST_ITEMS_SEQ }"> ${vo.M_SEQ}


										</div>
										<div class="mi-sname">${vo.DETAIL}</div>
										<!-- 메모 작성 영역 -->
									
									</div>
									

									<!-- 추가한 아이템 -->
									<!-- <div id="addItems"></div> -->
									

								</div>
							</c:forEach>
							

							<!-- for문  end -->
							
							<div class="mi-one" style="cursor: pointer;" id="mio${i.index }"
								onclick="showlist1(${i.index})">
								
								<div id="wrapper1">
									<div class="wrp1"></div>
								</div>
								<div class="mi-sname">${map.cmvo.memo}</div>
								<br>
								
								<c:if test="${map.cmvo ==null }">
								<div class="miii">
									<div class="mi-name" style="color: #3666FF;" >메모 추가</div>
									<div class="mi-sname"></div>
								</div>
								</c:if>
						
									</div>
							<div class="mi-two" id="mit${i.index }">
						
								<div class="mit-mid">
									
									<div id="mmz-z${i.index}" class="mmz-z">
										 <div class="m2z2">
											<span>메모입력</span>
											<img class="more-img" onclick="addTool(${i.index})" src="https://assets.triple.guide/images/btn-review-more@4x.png">
										</div> 
										 <div class="foot-last" id="tool-add${i.index}">
                                   
                                            <div class="share" >
                                                <span   style="cursor: pointer;"   onclick="deleteMemo(${map.cmvo.clist_memo_seq})">메모삭제</span>
                                            </div> 
                                            <img onclick="XTool(${i.index})" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
                                        </div>
                                        <div class="foot-textarea"> 
											<textarea id="myTextarea${map.vo.clist_cate_seq}" class="mztextarea"
											placeholder="최대 30글자로&#13;&#10;메모를 입력하세요">${map.cmvo.memo}</textarea>
										</div>	
										<div class="m2z2-foot">
											<div onclick="showlist1(${i.index})" class="m2z2-can">취소</div>
											<div class="m2z2-agr" onclick="itemsMemo(${map.vo.clist_cate_seq});">
												<input type="hidden" id="clistcateseq${i.index}"
													value="${map.vo.clist_cate_seq}"> 
													<input type="hidden" id="login" value="${login }">

													 <input type="hidden" id="s_seq" value="${s_seq}"> 확인
											</div>

										</div>
									</div>
								
								</div>
							</div>

						</div>
						
					</div>
				</c:forEach>
				<!--전체메모내용영역  -->
					
				<div style="cursor: pointer;" onclick="addText()" class="mi-sname">${cmvoAll.memo}</div>
	
			</div>
			
		
			<!--전체 메모 추가  -->
			<div class="add-cata">
					<c:if test="${cmvoAll ==null }">
						<div class="adc-tit">
							<button class="adc" onclick="addText()">메모추가</button>
						</div>
					</c:if>

		
		
						<div id="ctz-z" class="ctz-z">
		                            <div class="ctz2">
		                                <span>메모입력</span>
		                                <img class="more-img" onclick="addTool2()" src="https://assets.triple.guide/images/btn-review-more@4x.png">
		                            </div>
		                            <div class="foot-last" id="tool-addd">
		                             
		                                <div class="share">
		                                   <span style="cursor: pointer;" onclick="deleteCateMemo(${cmvoAll.clist_memo_seq})">메모삭제</span>
		                                </div>
		                                <img onclick="XTool2()" src="https://assets.triple.guide/images/ico_tooltip_delete.png">
		                            </div>
		                            <div class="foot-textarea">
		                                <textarea class="cttextarea" id="addCateText" placeholder="최대 30글자로&#13;&#10;카테고리/아이템 직접 입력하기">${cmvoAll.memo}</textarea>
		                            </div>
		                            <div class="ctz2-foot">
			                                <div onclick="xText()" class="ctz2-can">
			                                    취소
			                                </div>
			                                <div onclick="addCatebtn();" class="ctz2-agr">
			                                    확인
			                                </div>
		                            </div>
		                  </div>
					
		
			</div>
		</div>
	</div>
	<div class="footfix">
		<div class="ff-inner">
			<div class="ff-one">
				<div class="fo-loca">
					<a href="#"> <img
						src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-location-empty.svg">
						<div class="loca-name">여행 홈</div>
					</a>
				</div>
				<div class="fo-search">
					<a href="#"> <img
						src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-nearme-empty.svg">
						<div class="search-name">일정</div>
					</a>
				</div>
			</div>
			<div class="ff-two">
				<div class="ft-like">
					<a href="#"> <img
						src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-favorite-empty.svg">
						<div class="like-name">저장</div>
					</a>
				</div>
				<div class="ft-my">
					<a href="#"> <img
						src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg">
						<div class="my-name">여행 도구</div>
					</a>
				</div>
			</div>
			<div class="ya-logo">
				<div class="most-logo">
					<a href="#"> <img
						src="https://triple.guide/icons/favicon-152x152.png">
					</a>
				</div>
			</div>
		</div>
	</div>
</body>