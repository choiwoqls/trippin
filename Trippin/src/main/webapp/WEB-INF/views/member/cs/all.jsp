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
	blockquote, pre, abbr, address,  cite, code, del, dfn, em, img, ins, kbd,
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

.hide {
	display:none;
}
.hd-in {
                    display : flex;
                    
                    height : 10vh;
                    
                    width : 100%;
                 	gap : 5%;
                }
                
                .hd-left img {
                    width : 50px;
                    position : relative;
                    left: 1vw;
    				top: 1.5vh;
    				cursor : pointer;
                }
                .hd-left { 
                	width : 30%;
                	display : flex;
                }
                .hd-mid {
                	width : 90%;
                	line-height : 10vh;
                }
                .hd-right {
                    background : url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_search@2x.png);
                    background-repeat: no-repeat;
                    width : 50px;
                    border : 0px;
                    background-size: 35px 35px;
                    position : relative;
                    cursor : pointer;
                    right : 5.5vw;
                    top : 2.5vh;
                    filter:  brightness(0%)invert(3%) sepia(10%) saturate(1418%) hue-rotate(292deg) brightness(105%) contrast(104%);
                    
                }
                .hd-mid input{
                    outline : none;
                    border : 0;
                    line-height : 5vh;
                    box-sizing : border-box;
                    width : 100%;
                    font-size : 20px;
                   
                }
                .hd-mid input:focus {
                	border-bottom : 2px solid black;
                }
                input::placeholder {
                    
                    font-size : 20px;
                }
                body {
                    background-color: #F2F2F2;
                    height: auto;
                }
                .header {
                	background-color: white;
                	margin-left : 20%;
                    margin-right : 20%;
                    padding-bottom : 0.5%;
                    border-bottom : 1px solid silver;
                    height: 10vh;
                }
                .img-location {
                	width : 40%;
                }
                .select-location {
                	width : 60%;
                	line-height: 10vh;
                }
                .select-location select {
                	height : 5vh;
				    width: 100%;
				    border: 0;
				    border-bottom: 2px solid rgb(77,77,77);
				    font-weight: bold;
				    font-size: 16px;
				    outline : none;
                }
                .btn-hide {
                	background-color : transparent;
                	border :0;
                	
                }
                .main {
                	background-color : white;
                	margin-left : 20%;
                    margin-right : 20%;
                    
                }
                .categori-section, .subcate-section {
                	
                	padding-top : 1%;
                	padding-bottom : 1%;
                	flex-wrap : wrap;
                	display : flex;
                	padding-left : 1%;
                	padding-right : 1%;
                	gap : 0.5vw;
                	background-color : #E9EBF7;
                }
                .subcate-section {
                	background-color : #E9EBF7;
                }
              
                .categori-section input {
                	
                	background-color: white;
                    font-weight: bold;
                    text-align: center;
                    padding-left : 5%;
                    padding-right : 5%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    border-radius: 10px;
                    font-size: 14px;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
                    cursor: pointer;
                    margin-right : 1%;
                    border : 0;
                }
                
                 .categori-section input:hover {
                 	border: solid 2px;
                    border-color: #368FFF;
                 }
                 
                
                .subcate-section input {
                	background-color: silver;
                	color : white;
                    font-weight: bold;
                    text-align: center;
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    border-radius: 10px;
                    font-size: 12px;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
                    cursor: pointer;
                    margin-right : 0.5%;
                    border : 0;
                }
                
                .subcate-section input:hover{
                	background-color: #979696;
                }
                .sub-con {
                	padding : 2%;
                }
                .aaa {
                	padding-bottom : 3%;
                	padding-top : 1%;
                	font-size : 18px;
                	
                }
                .nnn {
                	padding-bottom : 3%;
                	border-bottom : 2px solid silver;
                	font-size : 14px;
                }
                .btn-section {
                	background-color: silver;
                	color : white;
                    font-weight: bold;
                    text-align: center;
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    border-radius: 5px;
                    font-size: 14px;
                    width : 7vw;
                    
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
                    cursor: pointer;
                    margin-right : 0.5%;
                    border : 0;
                }
                .btn-div {
                	padding-top : 2%;
                	padding-bottom : 2%;
                }
</style>
<script>


var last = 0;
/* var moreButton = document.getElementById("moreButton");
var hideButton = document.getElementById("hideButton"); */

/* var type = document.getElementById("type");
var word = document.getElementById("word"); */

function showSubcate(i,cate) {

	var word = document.getElementById("word").value;
	var type = document.getElementById("type").value;

	if(cate ==='all'){
	
		if(i=='moreButton'){
	
		 last +=5;
		}else if(i=='hideButton'){
			 last -=5;
			 
			 if(last <5){
				 last +=5;
				 alert('숨길 목록이 없습니다!');
		 
			 }
		}else{
			 last +=5;
		}
		 //console.log(last);
		 var param = "what=" + cate+"&last="+last;
		 var url = "${pageContext.request.contextPath}/member/csContents";
	
		
	}else if(cate==='search'){
			
		if(type === ''){
			alert("검색할 유형을 선택하세요!");
			return false;
		}else if(word===''){
			alert("검색할 단어를 입력하세요!");
			return false;
		}else{
			
		
		 var param = "what=" + cate+"&word="+word+"&type="+type;
		 var url = "${pageContext.request.contextPath}/member/csContents";
		 
		}
		 
		 
	}else{

    var param = "what=" + cate;
    var url = "${pageContext.request.contextPath}/member/csContents";
    

	}
	//subContent
	
	 var target = document.getElementById("subcate");
	 var target1 = document.getElementById("subContent");
	
    target.innerHTML = '';
    target1.innerHTML = '';

    sendRequest(url, param, function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var data = xhr.responseText; //subcateList 가져옴
            if (data != '') {
                const result = JSON.parse(data);
                var br=document.createElement("br");
                
                if (cate === '공통' || cate === '공지사항') {
                
                	
                    for (var i = 0; i < result.length; i++) {
                    	var div = document.createElement("div");
                    	div.className ="nnn";
                        var subaTag = document.createElement("a");
                        subaTag.classList.add("post"); //클래스명 추가
                        subaTag.href = "javascript:void(0);";
                        var titleText = result[i]["title"];
                        subaTag.innerHTML = '<h4>' + titleText + '</h4>';
                        subaTag.style.color = "black";
                        subaTag.style.textDecoration = "none";
                        
                        div.appendChild(subaTag);
                        
                           
                        (function(cs_seq){
                        	subaTag.addEventListener("click", function () {
								var popUrl = "${pageContext.request.contextPath}/member/cs/content/" + cs_seq;
								window.open(popUrl,"_blank","width=800, height=600");
							});
                        })(result[i]["cs_seq"]);

                        target1.appendChild(div);
                    }
                    
             
                }else if(cate ==='all'){
                	for(var i =0; i<result.length; i++){
                		
                		
                		var div = document.createElement("div");
                		div.className="aaa";
                		var subCateTitleTag = document.createElement("h4");
                    	var title = result[i]["cs_subcate_name"];
                    	subCateTitleTag.innerText = title;
                    	subCateTitleTag.style.color="grey";
                        div.appendChild(subCateTitleTag);
                        target1.appendChild(div);
                		
                        var div1 = document.createElement("div");
                		div1.className="nnn";
                		var subaTag = document.createElement("a");
                		subaTag.classList.add("post");
                        subaTag.href = "javascript:void(0);";
                        var titleText = result[i]["title"];
                        subaTag.innerHTML = '<h4>' + titleText + '</h4>';
                        subaTag.style.color = "black";
                        subaTag.style.textDecoration = "none";
                        div1.appendChild(subaTag);
                        
                        (function(cs_seq){
                        	subaTag.addEventListener("click", function () {
								var popUrl = "${pageContext.request.contextPath}/member/cs/content/" + cs_seq;
								window.open(popUrl,"_blank","width=800, height=600");
							});
                        })(result[i]["cs_seq"]);
                        target1.appendChild(div1);
                	}
                	
                }else if(cate ==='search'){
                	for(var i =0; i<result.length; i++){
                		
                		
                		var div = document.createElement("div");
                		div.className="aaa";
                		var subCateTitleTag = document.createElement("h4");
                    	var title = result[i]["cs_subcate_name"];
                    	subCateTitleTag.innerText = title;
                    	subCateTitleTag.style.color="grey";
                        div.appendChild(subCateTitleTag);
                        target1.appendChild(div);
                		
                        var div1 = document.createElement("div");
                		div1.className="nnn";
                		var subaTag = document.createElement("a");
                		subaTag.classList.add("post");
                        subaTag.href = "javascript:void(0);";
                        var titleText = result[i]["title"];
                        subaTag.innerHTML = '<h4>' + titleText + '</h4>';
                        subaTag.style.color = "black";
                        subaTag.style.textDecoration = "none";
                        div1.appendChild(subaTag);
                        
                        (function(cs_seq){
                        	subaTag.addEventListener("click", function () {
								var popUrl = "${pageContext.request.contextPath}/member/cs/content/" + cs_seq;
								window.open(popUrl,"_blank","width=800, height=600");
							});
                        })(result[i]["cs_seq"]);
                        target1.appendChild(div1);
                	}
                	
                } else {
                    for (var i = 0; i < result.length; i++) {
                        var subInput = document.createElement("input");
                        subInput.name = "subCateBtn";
                        subInput.type = "button";
                        subInput.value = result[i]["cs_subcate_name"];

                        subInput.addEventListener("click", SubInputClickHandler(result[i], cate));

                        target.appendChild(subInput);
                    }
                }
            }
        }
    }, "POST");
    

}

function SubInputClickHandler(subInputData, cate) {
    return function() {
    	
    	var target = document.getElementById("subContent");
        var cs_cate_seq = subInputData["cs_cate_seq"];
        var cs_subcate_seq = subInputData["cs_subcate_seq"];
        var param = "what="+cate+"&cs_cate_seq=" + cs_cate_seq + "&cs_subcate_seq=" + cs_subcate_seq;

        var url = "${pageContext.request.contextPath}/member/csContentsTitle";
       
        target.innerHTML = '';
        console.log(target.innerHTML);

        sendRequest(url, param, function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var data = xhr.responseText;
                if (data != '') {
           
                	
                    const result = JSON.parse(data);
                    
                    for(var i=0;i<result.length;i++){
                    	
                   	var div = document.createElement("div");
               		div.className="aaa";	
                   	var subCateTitleTag = document.createElement("h4");
                   	var title = result[i]["cs_subcate_name"];
                   	subCateTitleTag.innerText = title;
                   	subCateTitleTag.style.color="grey";
                    div.appendChild(subCateTitleTag);
                    target.appendChild(div);
                    	
                    	
                 	var div1 = document.createElement("div");
               		div1.className="nnn";
                    var tAtag = document.createElement("a");
                    tAtag.href="javascript:void(0);";
                    tAtag.classList.add("post");
                    var text = result[i]["title"];
                    tAtag.innerHTML='<h4>'+text+'</h4>';
                    tAtag.style.color="black";
                    tAtag.style.textDecoration ="none";
                    div1.appendChild(tAtag);
                   
                    (function(cs_seq){
                    	tAtag.addEventListener("click", function () {
							var popUrl = "${pageContext.request.contextPath}/member/cs/content/" + cs_seq;
							window.open(popUrl,"_blank","width=800, height=600");
						});
                    })(result[i]["cs_seq"]);
                    
                    
					target.appendChild(div1);
                  
                }
                }
            }
        },
        	"POST");
    };
}

function AllBtn() {
    var allBtn = document.getElementById("all");
    if (allBtn) {
 	showSubcate('i','all');
    }
}


window.onload = AllBtn;

</script>
</head>
<body>
	<header class="header">
		<div class="inner">
	        <div class="hd-in">
	            <div class="hd-left">
	                <div class="img-location">
	                	<img onclick="history.back();" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
	                </div>
	                <div class="select-location">
		                <select name="type" id="type">
							<option value="">선택하세요</option>
							<option value="cs_cate_name"${param.type =='cs_cate_name'? 'selected':''}>카테고리</option>
							<option value="cs_subcate_name"${param.type =='cs_subcate_name'? 'selected':''}>유형</option>
							<option value="title" ${param.type =='title'? 'selected':''}>제목</option>
						</select>
	            	</div>
	            </div>
	            <div class="hd-mid">
	                <input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off" id="word">
	            </div>
	            <div class="hd-right" onclick="showSubcate(this.id,'search');">
					<input class="btn-hide" type="button" onclick="showSubcate(this.id,'search');" value="" >
	            </div>
	        </div>
        </div>
	</header>
	<div class="main">
	
		<div class="categori-section">
			<input type="button" value="전체" id="all" onclick="showSubcate(this.id,'all');">
			<c:forEach var="ca" items="${csCateList }">
			<input type="button" id="csCateName" value="${ca.cs_cate_name }" onclick="showSubcate(this.id,'${ca.cs_cate_name}');">
		</c:forEach>
		</div>
		<div class="subcate-section" id="subcate" >
		<!-- 하위 카테 -->
		</div>
		<div class="sub-con" id="subContent">
		<!-- 하위 카테의 컨탠츠 -->
		</div>
		<div class="btn-div" align="center">
			<button class="btn-section" id="moreButton"  onclick="showSubcate(this.id,'all');">더보기</button>
			<button class="btn-section" id="hideButton"  onclick="showSubcate(this.id,'all');">숨기기</button>
		</div>
	</div>
</body>	


