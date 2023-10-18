<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리핀</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">
			<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>

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
                    width : 100vw;
                    height : 300vh;
                    
                }
                .inner {
                    height : 350px;
                    background-color :#04CFD4;
                }
                .hd-in {
                    display : flex;
                    justify-content: space-between;
                }
                .hd-left {
                    margin-left : 3%;
                    margin-top : 1%;
                    width : 50%;
                }
                .hd-left a img {
                    filter: invert(100%) sepia(100%) saturate(1%) hue-rotate(20deg) brightness(103%) contrast(101%);
                    width : 50px;
                    
                }
                .hd-right {
                    margin-left : 75%;
                    margin-top : 1%;
                    width : 50%;
                }
                .hdr1 {
                    filter: invert(100%) sepia(100%) saturate(1%) hue-rotate(20deg) brightness(200%) contrast(101%);
                    width : 50px;
                    
                }
                .hdr2 {
                    margin-bottom : 0.5%;
                    filter: invert(100%) sepia(100%) saturate(1%) hue-rotate(20deg) brightness(200%) contrast(101%);
                    width : 50px;
                }
                .hdr-z {
                    margin-right : 6%;
                }
                .hd-travel {
                    margin-left : 5%;
                    margin-top : 1%;
                }
                .hdt-title {
                    color: white;
                    font-weight: bold;
                    font-size : 39px;
                }
                .hdt-date {
                    margin-top : 0.5%;
                    color : white;
                    font-weight : bold;
                    font-size : 38px;
                }
                .hdt-sub {
                    margin-top : 1%;
                    display : flex;
                    width : 70%;
                    
                    justify-content: left;
                    
                }
                .sub-date a{
                    color : white;
                    text-decoration: underline;
                    font-weight: bold;
                    
                    display : inline-block;
                    }
                .sub-date span {
                    color :#A9F5F2;
                    
                    
                }
                .sub-num {
                    color : white;
                    font-weight: bold;
                   
                }
                .sub-re {
                    color : #A9F5F2;
                    font-weight: bold;
                }
                .sub-date span {
                    position: relative;
                    left : 7%;
                    top : 5%;
                }
                .sub-num span{
                    position: relative;
                    left : 27%;
                    top : 4%;
                    
                }
                .sub-re span {
                    position: relative;
                    left : 140%;
                    top : 4%;
                }
                .city-list {
                    margin-top : 1%;
                    margin-left : 5%;
                }
                .clbtn {
                    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    margin-right : 0.5%;
                    font-weight : bold;
                    background-color : white;
                    color : #04CFD4;
                }
                .clbtnz {
                    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    margin-right : 0.5%;
                    font-weight : bold;
                    background-color : #04CFD4;
                    filter : brightness(80%);
                    color : white;
                }
                .clbtny {
                    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    margin-right : 0.5%;
                    font-weight : bold;
                    background-color : #03A6AA;
                    
                    color : white;
                }
                .ot-list {
                    display : flex;
                    justify-content: space-around;
                    height : 10vh;
                    line-height: 10vh;
                    
                }
                .ot-list a {
                    text-decoration: none;
                    color : black;
                    font-weight: bold;
                }
                .slider-container {
                    width: 250px;
                    height: auto;
                    overflow: hidden;
                    position: relative;
                    }

                    .slider, .sliderz, .slidery, .sliderx {
                    width: 100%;
                    display: flex;
                    transition: transform 0.5s ease-in-out;
                    }

                    .slide, .slidez, .slidey, .slidex {
                    width: 250px;
                    flex-shrink: 0;
                    transition: opacity 0.5s ease-in-out;
                    }

                    .slide img, .slidez img, .slidey img, .slidex img {
                    width: 250px;
                    height: 250px;
                    border-radius: 15px;
                    }

                    .controls {
                    margin-top: 10px;
                    
                    }

                    .prev-button,
                    .next-button, .prev-buttonz, .next-buttonz,
                    .prev-buttony, .next-buttony, .prev-buttonx, .next-buttonx{
                    background-color: #fff;
                    border-radius: 15px;
                    font-weight: bold;
                    color: black;
                    border: 1px solid salmon;
                    padding: 5px 10px;
                    margin: 0 5px;
                    cursor: pointer;
                    position : relative;
                    
                    }
                    .prev-button, .prev-buttonz, .prev-buttony, .prev-buttonx {
                        bottom : 27vh;
                    }
                    .next-button, .next-buttonz, .next-buttony, .next-buttonx {
                        bottom : 27vh;
                        left : 10vw;
                    }
                    .jjim {
                        position : relative;
                        width : 40px !important;
                        height : 40px !important;
                        bottom : 33vh;
                        left : 27vh;
                    }
                    .all-list {
                        margin-top : 3%;
                        margin-left : 17%;
                    }
                    .list-title {
                        font-weight: bold;
                        font-size : 22px;
                        margin-bottom : 1%;
                    }
                    .list-stitle {
                        font-weight: bold;
                        font-size : 16px;
                        margin-bottom : 2%;
                        color : #929292;
                    }
                    .tit-infoz {
                        margin-top : -15%;
                        color : black;
                    }
                    .tit-infoy {
                        color : #929292;
                        font-weight: bold;
                    }
                    .all-list {
                        display : flex;
                        flex-wrap: wrap;
                        
                    }
                    .outer {
                        box-shadow: 0px 2px 0px 0px #F2F2F2;
                    }
                    .f-road {
                        margin-left : 17%;
                        margin-top : 5%;
                    }
                    .fr-head span{
                        color : #368FFF;
                        font-weight: bold;
                        
                    }
                    .fr-head h2 {
                        margin-top : 1%;
                        font-size : 20px;
                    }
                    .fr-select {
                        margin-top : 3%;
                    }
                    .frs {
                        width : 70%;
                        height : 10vh;
                        font-size : 25px;
                        border : 0px;
                        border-bottom : 2px solid #929292;
                    }
                    .fr-input {
                        margin-top : 2%;
                    }
                    .fri {
                        width : 69.5%;
                        height : 10vh;
                        font-size : 25px;
                        border : 0px;
                        border-bottom : 2px solid #929292;
                    }
                    .fr-btn {
                        margin-top : 2%;
                    }
                    .frb {
                        padding-left : 2%;
                        padding-right : 2%;
                        padding-top : 1%;
                        padding-bottom : 1%;
                        border-radius: 25px;
                        border : 0px;
                        cursor: pointer;
                        background-color :#368FFF;
                        color : #fff;
                        font-weight: bold;
                        font-size : 15px;
                        margin-left : 62.5%;
                    }
                    .footer {
                        margin-left : 17%;
                        margin-top : 10%;
                    }
                    .ft-top span {
                        font-weight: bold;
                        font-size : 24px;
                    }
                    .ft-code {
                        margin-top : 6%;
                        font-weight: bold;
                        font-size : 16px;
                        color : #929292;
                    }
                    .ft-code span {
                        margin-left : 0.5%;
                        position : relative;
                        bottom : 0.5vh;
                    }
                    .ft-site {
                        position : relative;
                        left : 15vw;
                        bottom : 3.5vh;
                    }
                    .ft-site a {
                        margin-right : 0.5%;
                    }
                    .ff-inner {
                    display : flex;
                    font-size : 10px;
                    z-index : 3;
                }
                .ff-one {
                    display : flex;
                    background-color: white;
                    width : 50%;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    border-top-right-radius: 60px;
                    box-sizing: border-box;
                    box-shadow: 0 0 0.4rem 0 rgba(0,0,0,.16);
                    
                }
                .ff-two {
                    display : flex;
                    width : 50%;
                    background-color: white;
                    padding-top : 0.5%;
                    padding-bottom : 0.5%;
                    border-top-left-radius: 60px;
                    box-sizing: border-box;
                    box-shadow: 0 0 0.4rem 0 rgba(0,0,0,.16);
                    
                }
                .fo-loca  {
                    margin-left : 59%;
                    width : 10%;
                    
                }
                .fo-loca a:hover,.fo-search a:hover,.ft-like a:hover,.ft-my a:hover {
                    filter: invert(59%) sepia(36%) saturate(2243%) hue-rotate(137deg) brightness(101%) contrast(97%);
                    font-weight : bolder;
                }
                
                .fo-search {
                    margin-left : 12.5%;
                    width : 10%;
                }
                .ft-like {
                    margin-left : 15.5%;
                    width : 10%;
                }
                .ft-my {
                    margin-left : 12.5%;
                    width : 10%;
                }
                .loca-name {
                    margin-left : -8%;
                }
                .search-name { 
                    margin-left : 1%;
                }
                .like-name {
                    margin-left : 3%;
                }
                .my-name {
                    margin-left : -11%;
                }
                .most-logo {
                    width : 60px;
                    position : absolute;
                    bottom : -2%;
                    left : 48%;
                }
                .ff-inner {
                    position : fixed;
                    bottom : 0;
                    left: 0;
                    right : 0;
                }
                .ff-inner a {
                    text-decoration: none;
                    color : black;
                }
				.flex-container {
				  
				  width: 975px;
				  margin-bottom :0.5%;
				  display: flex;
				  overflow-x: auto;
				}
				
				.itme {
				  flex: 0 0 auto;
				}
				
				.flex-container::-webkit-scrollbar {
				  display: none;
				}
				
				/* Firefox에 스크롤 바를 숨기기 위한 스타일 */
				.flex-container {
				  scrollbar-width: none;
				  -ms-overflow-style: none;				  
				}
				
				.list{
					margin-top : 1%;
				 	margin-left : 17%;
				 	/* width: 400px;  */
				}
				
				.scroll-button {
				  top: 50%;
				  border-radius : 15px;
				  width: 50px;
				  height: 50px;
				  background-color: gray;
				  color: white;
				  border: none;
				  cursor: pointer;
				  z-index: 1;
				}
				

				
				/* 추가: 각 스크롤 영역에 해당하는 버튼들의 위치를 조절합니다. */
				.prev-button-1 {
				  left: 170px;
				margin-left : 35%;
				}
				
				.next-button-1 {
				  right: 240px;
				
				}
				
				.prev-button-2 {
				   left: 170px;			   
				margin-left : 35%;
				   
				}
				
				.next-button-2 {
				  right: 240px;
				  
				}
				
				
				.prev-button-3 {
				  left: 170px;
				margin-left : 35%;
				
				}
				
				.next-button-3 {
				  right: 240px;

				}
				
				.prev-button-4 {
				   left: 170px;
				margin-left : 35%;
				 
				}
				
				.next-button-4 {
				  right: 240px;
				
				}
				
				.editMenu{
					margin-bottom: 1%; 
					display: none;

				}
				.editMenu_h{
					margin-bottom: 1%;
					display: block;			
					border-color: white;
				}
				.editMenu_h span{
					border-bottom:  2px solid white;
					margin-bottom: 0.5%;
					margin-right : 1.5%;
					/* border-radius: 15px; */
					cursor: pointer;
					color: white;
					padding: 0.3%;
					background-color: 
				}
				table {
					border-right : 1px solid black;
				}
				.title_ip{				
					font-weight: bold;
                    font-size : 39px;
					color : white;
					background-color: #04CFD4;
					border-width: 0;
					border-size: 0;
					border-radius: 15px;
				}
				
				.title_ip2{				
					font-weight: bold;
                    font-size : 39px;
					color : white;
					background-color: aqua;
					border-width: 0;
					border-size: 0;
					border-radius: 15px;
				}

				.etBtn1{
				    border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    font-weight : bold;
                    background-color : #04CFD4;
                    filter : brightness(80%);
                    color : white;
					display: none;
				}
				
				.etBtn2{
					border : 0;
                    cursor: pointer;
                    padding-top : 0.6%;
                    padding-bottom : 0.6%;
                    padding-left : 1.2%;
                    padding-right : 1.2%;
                    border-radius: 25px;
                    font-weight : bold;
                    background-color : #04CFD4;
                    filter : brightness(80%);
                    color : white;
				}
				
            </style>
            <script type="text/javascript">
            
            	
            
            document.addEventListener("DOMContentLoaded", () => {
            	  // 스크롤 영역 1
            	  
            	  const scrollContainer1 = document.querySelector(".flex-container-1");
            	  const prevButton1 = document.querySelector(".prev-button-1");
            	  const nextButton1 = document.querySelector(".next-button-1");

            	  // 스크롤 영역 2
            	  const scrollContainer2 = document.querySelector(".flex-container-2");
            	  const prevButton2 = document.querySelector(".prev-button-2");
            	  const nextButton2 = document.querySelector(".next-button-2");

            	  // 스크롤 영역 3
            	  const scrollContainer3 = document.querySelector(".flex-container-3");
            	  const prevButton3 = document.querySelector(".prev-button-3");
            	  const nextButton3 = document.querySelector(".next-button-3");

            	  // 스크롤 영역 4
            	  const scrollContainer4 = document.querySelector(".flex-container-4");
            	  const prevButton4 = document.querySelector(".prev-button-4");
            	  const nextButton4 = document.querySelector(".next-button-4");

            	  const scrollStep = 486*2; // 스크롤 단계 크기를 조절합니다.

            	  function smoothScrollTo(container, targetScrollLeft) {
            	    const startTime = performance.now();
            	    const startScrollLeft = container.scrollLeft;

            	    function scrollAnimation(currentTime) {
            	      const elapsedTime = currentTime - startTime;
            	      if (elapsedTime >= 400) {
            	        container.scrollLeft = targetScrollLeft;
            	        return;
            	      }

            	      const scrollAmount = easeInOutCubic(elapsedTime, startScrollLeft, targetScrollLeft - startScrollLeft, 400);
            	      container.scrollLeft = scrollAmount;
            	      requestAnimationFrame(scrollAnimation);
            	    }

            	    requestAnimationFrame(scrollAnimation);
            	  }

            	  prevButton1.addEventListener("click", () => {
            	    const targetScrollLeft = Math.max(0, scrollContainer1.scrollLeft - scrollStep);
            	    smoothScrollTo(scrollContainer1, targetScrollLeft);
            	  });

            	  nextButton1.addEventListener("click", () => {
            	    const targetScrollLeft = Math.min(scrollContainer1.scrollLeft + scrollStep, scrollContainer1.scrollWidth - scrollContainer1.clientWidth);
            	    smoothScrollTo(scrollContainer1, targetScrollLeft);
            	  });

            	  prevButton2.addEventListener("click", () => {
            	    const targetScrollLeft = Math.max(0, scrollContainer2.scrollLeft - scrollStep);
            	    smoothScrollTo(scrollContainer2, targetScrollLeft);
            	  });

            	  nextButton2.addEventListener("click", () => {
            	    const targetScrollLeft = Math.min(scrollContainer2.scrollLeft + scrollStep, scrollContainer2.scrollWidth - scrollContainer2.clientWidth);
            	    smoothScrollTo(scrollContainer2, targetScrollLeft);
            	  });

            	  prevButton3.addEventListener("click", () => {
            	    const targetScrollLeft = Math.max(0, scrollContainer3.scrollLeft - scrollStep);
            	    smoothScrollTo(scrollContainer3, targetScrollLeft);
            	  });

            	  nextButton3.addEventListener("click", () => {
            	    const targetScrollLeft = Math.min(scrollContainer3.scrollLeft + scrollStep, scrollContainer3.scrollWidth - scrollContainer3.clientWidth);
            	    smoothScrollTo(scrollContainer3, targetScrollLeft);
            	  });

            	  prevButton4.addEventListener("click", () => {
            	    const targetScrollLeft = Math.max(0, scrollContainer4.scrollLeft - scrollStep);
            	    smoothScrollTo(scrollContainer4, targetScrollLeft);
            	  });

            	  nextButton4.addEventListener("click", () => {
            	    const targetScrollLeft = Math.min(scrollContainer4.scrollLeft + scrollStep, scrollContainer4.scrollWidth - scrollContainer4.clientWidth);
            	    smoothScrollTo(scrollContainer4, targetScrollLeft);
            	  });

            	  // Easing 함수 (Cubic easing: https://easings.net/#easeInOutCubic)
            	  function easeInOutCubic(t, b, c, d) {
            	    t /= d / 2;
            	    if (t < 1) return c / 2 * t * t * t + b;
            	    t -= 2;
            	    return c / 2 * (t * t * t + 2) + b;
            	  }
            	});
        </script>
            <script>
            	function exitSche() {   
            		const exit = window.confirm("일정 홈에서 나가시겠습니까 ? ");
            		if(exit){
            			location.href = "${pageContext.request.contextPath}/";
            		}else{
            			return;
            		}
				}
            	
            	function changeCity(i) {
            		btclass = document.getElementById("cbtn"+i).className;
            		console.log(btclass);
            		if(btclass == 'clbtnz'){
            			document.getElementById("addr1_seq1").value = i;
            			document.getElementById("clistForm").submit();
            		}
					
				}
            	
            	function editMenu() {
            		const ib = document.getElementById("s_title");
					const edMn = document.getElementById("editMenu");
            		const etBtn = document.getElementById("etBtn");
					edMnC = edMn.className;
					if(edMnC == 'editMenu_h'){
						edMn.className = "editMenu";
            			etBtn.className = "etBtn1";
						ib.className = "title_ip"            				
            			ib.disabled = true;
            			ib.readOnly =true;      
					}else{
						edMn.className = "editMenu_h";
					}
				}
            	
				function editSche(item) {
            		
            		const form = document.getElementById("scheHomeForm");
            		var msg = "";
            		var url = "";
            		var tc = true;
            		
            		switch(item){
            		case 'city':
            			msg ="여행 도시를 편집 하시겠습니까 ? ";
            			url = "schedule/sche/edit/reCity";           			
            			break;
            		case 'title':
						tc = false;
            			break;
            		case 'date':
            			msg = "여행 일정을 수정하시겠습니까 ?";
            			url = "schedule/sche/edit/reDate";
            			break;
            		case 'invite': 
            			msg = "여행 일정에 친구를 초대하시겠습니까 ? ";
            			url = "schedule/sche/partner/partnerList";
            			break;
            		case 'exit':
            			msg = "여행 일정에서 떠나기, 삭제하시겠습니까 ? ";
            			url = "schedule/sche/edit/exitSche"
            			break
            		}			
            		
            		if(tc){
	            		const check = window.confirm(msg);
	            		if(check){
	            			form.action += url;
	            			form.submit();
	            		}else{
	            			return;
	            		}
            		}else{
            			// 여기서 제목 수정 코드 작성
            			const etBtn = document.getElementById("etBtn");	
            			const etC = etBtn.className;
            			const ib = document.getElementById("s_title");
            			if(etC == "etBtn1"){
            				etBtn.className = "etBtn2";
            				ib.className = "title_ip2"
            				ib.focus();
            				ib.disabled = false;
            				ib.readOnly =false; 
            			}else{
            				etBtn.className = "etBtn1";
            				ib.className = "title_ip";      				
            				ib.disabled = true;
            				ib.readOnly =true;        				
            			}
            		}
				}
            	
            	function moveMenu(item) {
            		       		
            		const form = document.getElementById("scheHomeForm");
            		switch(item){
            		
            		case 'home' :
            			if(window.confirm("홈으로 나가시겠습니까?")){
            				form.method = "get";
            				form.submit();	
            			}else{
            				return;
            			}
            			break;          
            			
            		case 'plan' :
            			form.action += "schedule/plan/planHome";
            			form.submit();
            			break;            		
            			
            		case 'tool' :
            			form.action += "schedule/tool/toolHome";
            			form.submit();
            			break;
            			
            		case 'sche' :
						form.action += "schedule/sche/scheHome";
						form.submit();
            			break;
            			
            		case 'save':
            			form.action += "";
            			alert("업데이트 예정");
            			return;
            			break;
            		}			
				}
            	function editTitle() {
					const s_title  = document.getElementById("s_title").value;
					const s_seq = document.getElementById("s_seq").value;
					console.log(s_seq);
					
					const url = "${pageContext.request.contextPath}/schedule/sche/edit/editTitle"
					const param = "s_title="+s_title+"&&s_seq="+s_seq; 
					
					sendRequest(url, param, resultFn, "POST");
				}
            	function resultFn() {
            		if(xhr.readyState == 4 && xhr.status == 200){
            			var data = xhr.responseText;
            			if(data ==='성공'){
            				location.reload();
            			}else{
            				location.reload();			
            			}           			
            		}else{
            			console.log('ajax 오류');
            		}
				}
            	
            	function findLoad() {
            		const start = document.getElementById("start").value;
            		const end = document.getElementById("end").value;
            		console.log(start);
            		console.log(end);
            		
            		if(start=="" || end == ""){
            			alert("출발지와 목적지를 입력하세요");
            			return;
            		}else{
	            		const url = "http://map.naver.com/index.nhn?slng=127&slat=37.5&stext="+start+"&elng=127.5&elat=37.4&pathType=0&showMap=true&etext="+end+"&menu=route"
						
	            		window.open(url, "길찾기", "_parent");
	            							
            		}
            	}
            	
            </script>
        </head>
        <body style ="overflow-x: hidden;">
        <form action="${pageContext.request.contextPath }/" id="scheHomeForm" method="post">
        	<input type="hidden" id="s_seq" name="s_seq" value="${scheInfo.S_SEQ }">        	
        	<input type="hidden" name="day_no" value="-1">
        	<input type="hidden" name="addr1_seq1" value="-1">
        </form>
            <header>
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <a href="#"><img onclick="exitSche()" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE4LjM2NCA0LjIyMkwxOS43NzggNS42MzYgMTMuNDE0IDEyIDE5Ljc3OCAxOC4zNjQgMTguMzY0IDE5Ljc3OCAxMiAxMy40MTQgNS42MzYgMTkuNzc4IDQuMjIyIDE4LjM2NCAxMC41ODYgMTIgNC4yMjIgNS42MzYgNS42MzYgNC4yMjIgMTIgMTAuNTg2eiIvPgo8L3N2Zz4K"></a>
                        </div>
                        <div class="hd-right">
                            <a class="hdr-z" href="#"><img class="hdr1" src="${pageContext.request.contextPath }/resources/img/searchpng.png"/></a>
                            <a href="#"><img class="hdr2" src="https://cdn-icons-png.flaticon.com/512/3502/3502458.png"/></a>
                        </div>
                    </div>
                    <div class="hd-travel">
                        <div class="hdt-title">
                        <input class="title_ip" type="text" id="s_title" value="${scheInfo.TITLE }" readonly="readonly" disabled="disabled">                          
                        <button type="button" onclick="editTitle()" id="etBtn" class="etBtn1">수정</button>
                        </div>
                        <div class="hdt-date">
                        <c:choose>
                        	<c:when test="${scheInfo.DDAY == 0 }">여행 출발 ~!</c:when>
                        	<c:when test="${scheInfo.DDAY >0 }">
                        		D-${scheInfo.DDAY }
                        	</c:when>
 							<c:when test="${scheInfo.DLAST > 0 }">
 								여행중
 							</c:when>
 							<c:otherwise>
 								지난 여행
 							</c:otherwise>
                        </c:choose>
                        </div>
                        <div class="hdt-sub">
                            <div class="sub-date">
                                <a href="#"onclick="moveMenu('plan')">
                                <c:choose>
                                	<c:when test="${scheInfo.FIRSTDAY == scheInfo.LASTDAY }">
                                	${scheInfo.FIRSTDAY }
                                		당일치기
                                	</c:when>
                                	<c:otherwise>
		                                ${scheInfo.FIRSTDAY } - ${scheInfo.LASTDAY }
                                	</c:otherwise>
                                </c:choose>
                                </a><span>l</span>
                            </div>
                            <div class="sub-num">
                                <span>
									<c:choose>
										<c:when test="${scheInfo.CNT != 1 }">일행 + ${scheInfo.CNT }명</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</span>
                            </div>
                            <div class="sub-re">
                                <span style="cursor: pointer;" onclick="editMenu()">편집</span>
                            </div>
                        </div>
                    </div>
                    <div class="city-list">
                                <div id="editMenu"  class="editMenu">
                                	<span onclick="editSche('city')">여행도시 편집</span>
                                	<span onclick="editSche('title')">여행제목 수정</span>
                                	<span onclick="editSche('date')">여행날짜 수정</span>
                                	<span onclick="editSche('invite')">일정에 일행 초대하기</span>
                                	<span onclick="editSche('exit')">여행 나가기(삭제)</span>
                                </div>
                    <form action="${pageContext.request.contextPath }/schedule/sche/scheHome" id="clistForm" method="post">
	                    <input type="hidden" name="s_seq" value="${s_seq }">
	                    <input type="hidden"  id="addr1_seq1" name="addr1_seq1" value="">
                    </form>
                    <c:forEach var="map" items="${clist }" varStatus="i">
	                    <c:choose>
	                    	<c:when test="${map.ADDR1_SEQ == addr1_seq1 }">
		                        <button class="clbtn"  id="cbtn${map.ADDR1_SEQ}" onclick="changeCity(${map.ADDR1_SEQ})">
			                        ${map.ADDR_NAME }
	    	                    </button>                    
	                    	</c:when>
		                    <c:otherwise>
			                     <button class="clbtnz" id="cbtn${map.ADDR1_SEQ }"  onclick="changeCity(${map.ADDR1_SEQ })">
			                      ${map.ADDR_NAME }
			                    </button>                    
		                    </c:otherwise>                          
                    </c:choose>
                    </c:forEach>
                     
                        <button class="clbtny" onclick="editSche('city')">╉</button>
                    </div>
                </div>
                <div class="outer">
                    <div class="ot-list">							
                        <a href="#"><div>숙소</div></a>
                        <a href="#"><div>관광</div></a>
                        <a href="#"><div>맛집</div></a>
                        <a href="#"><div>투어·티켓</div></a>
                        <a href="#"><div>라운지</div></a>
                    </div>
                </div>
            </header>
            <c:choose>
            	<c:when test="${!empty hlist }">
					<div id="hotSection"  class="list">
						<h2 style="margin-bottom: 2%">트리핀 추천 관광지</h2>								
            	</c:when>
            	<c:otherwise>
					<div id="hotSection"  style="display: none">								
            	</c:otherwise>
            </c:choose>
						<div class="flex-container flex-container-1"  >					
						<c:forEach var="map" items="${hlist }" varStatus="i">
						  <div class="item-1">
							  <table border="0" cellspacing="5px"  height="150px" width="486px" style="margin-right:6%; border-bottom : 1px solid #EBEBEB; cursor: pointer;" onclick="document.location.href='${pageContext.request.contextPath }/member/tour/selectTour?f_seq=${map.F_SEQ }'" >
								<tr width="486px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${map.NAME }</b></td>
									<td rowspan="4" valign="top" width="29%">
										<img src="${cpath}/common/getImg?path=${map.MAIN_IMG }&file=${map.mainImg }" style="width:130px; height : 130px;"/>
									</td>
								</tr>
								<tr>
									<td>${map.INTRO }</td>
								</tr>
								<tr>
									<td><font color="#F0DA49">★</font>${map.SAVG }<span style="color : #BABABA;">(${map.RV })</span>·<font color="red">♥</font>${map.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA;">${map.KIND_NAME }·${map.ADDR2_NAME }</td>
								</tr>
							</table>
						  </div>				
						</c:forEach>			
							
						</div>
							<button class="scroll-button prev-button-1">이전</button>
							<button class="scroll-button next-button-1">다음</button>
					</div>
		
            <c:choose>
            	<c:when test="${!empty mlist}">
					<div id="matSection" class="list">
					<h2 style="margin-bottom: 2%">트리핀 추천 맛집</h2>									
            	</c:when>
            	<c:otherwise>
					<div id="matSection" style="display: none">									      	
            	</c:otherwise>
            </c:choose>
						<div class="flex-container flex-container-2" >
						<c:forEach var="map" items="${mlist }" varStatus="i">
						  <div class="item-2">
							  <table border="0" cellspacing="5px"  height="150px" width="486px" style="border-bottom : 1px solid #EBEBEB; cursor: pointer;" onclick="document.location.href='${pageContext.request.contextPath }/member/hotple/selectHotple?f_seq=${map.F_SEQ }'">
								<tr width="486px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${map.NAME }</b></td>
									<td rowspan="4" valign="top" width="29%"><%-- ${map.MAIN_IMG } --%>
										<img src="${cpath}/common/getImg?path=${map.MAIN_IMG }&file=${map.mainImg }" style="width:130px; height : 130px;"/>
									</td>
								</tr>
								<tr>
									<td>${map.INTRO }</td>
								</tr>
								<tr>
									<td><font color="#F0DA49">★</font>${map.SAVG }<span style="color : #BABABA;">(${map.RV })</span>·<font color="red">♥</font>${map.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA;">${map.KIND_NAME }·${map.ADDR2_NAME }</td>
								</tr>
							</table>
						  </div>				
						</c:forEach>			
						</div>
							<button class="scroll-button prev-button-2">이전</button>
							<button class="scroll-button next-button-2">다음</button>
					</div>
				
            <c:choose>
            	<c:when test="${!empty slist }">
					<div id="accSection" class="list" >				
					<h2 style="margin-bottom: 2%">트리핀 추천 숙소</h2>				
            	</c:when>
            	<c:otherwise>
					<div id="accSection" style="display:none">								            	
            	</c:otherwise>
            </c:choose>
						<div class="flex-container flex-container-3" >
						<c:forEach var="map" items="${slist }" varStatus="i">
						  <div class="item-3">
							  <table border="0" cellspacing="5px"  height="150px" width="486px" style="border-bottom : 1px solid #EBEBEB; cursor: pointer;" onclick="document.location.href='${pageContext.request.contextPath }/member/tour/selectTour?f_seq=${map.F_SEQ }'">
								<tr width="486px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${map.NAME }</b></td>
									<td rowspan="4" valign="top" width="29%">${map.MAIN_IMG }</td>
								</tr>
								<tr>
									<td>${map.INTRO }</td>
								</tr>
								<tr>
									<td><font color="#F0DA49">★</font>${map.SAVG }<span style="color : #BABABA;">(${map.RV })</span>·<font color="red">♥</font>${map.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA;">${map.KIND_NAME }·${map.ADDR2_NAME }</td>
								</tr>
							</table>
						  </div>				
						</c:forEach>			
						</div>
							<button class="scroll-button prev-button-3">이전</button>
							<button class="scroll-button next-button-3">다음</button>
					</div>
            <c:choose>
            	<c:when test="${!empty tlist }">
					<div id="tourSection" style="margin-top : 1%; margin-left : 17%;" >		
					<h2 style="margin-bottom: 2%">트리핀 추천 티켓/투어</h2>						
            	</c:when>
            	<c:otherwise>
					<div id="tourSection" style="display:none;">								            
            	</c:otherwise>
            </c:choose>
						<div class="flex-container flex-container-4">						
						<c:forEach var="map" items="${tlist }" varStatus="i">
						  <div class="item-4">
							  <table border="0" cellspacing="5px"  height="150px" width="400px" style="border-bottom : 1px solid #EBEBEB; cursor: pointer;" onclick="document.location.href='${pageContext.request.contextPath }/member/tour/selectTour?f_seq=${map.F_SEQ }'">
								<tr width="400px">
									<th rowspan="4" valign="top" width="8%" style="color : blue;">${i.count }</th>
									<td width="63%"><b>${map.NAME }</b></td>
									<td rowspan="4" valign="top" width="29%">${map.MAIN_IMG }</td>
								</tr>
								<tr>
									<td>${map.INTRO }</td>
								</tr>
								<tr>
									<td><font color="#F0DA49">★</font>${map.SAVG }<span style="color : #BABABA;">(${map.RV })</span>·<font color="red">♥</font>${map.JJ }</td>
								</tr>
								<tr>
									<td style="color : #BABABA;">${map.KIND_NAME }·${map.ADDR2_NAME }</td>
								</tr>
							</table>
						  </div>				
						</c:forEach>			
							<button class="scroll-button prev-button-4">이전</button>
							<button class="scroll-button next-button-4">다음</button>
						</div>
					</div>
                <div class="f-road">
                    <div class="fr-head">
                        <span>길찾기</span>
                        <h2>역/터미널에서 숙소가기</h2>
                    </div>
                    <div class="fr-input">
                        <input class="fri" id="start" type="text" placeholder="출발지를 입력해주세요.">
                    </div>
                    <div class="fr-input">
                        <input class="fri" id="end" type="text" placeholder="도착지를 입력해주세요.">
                    </div>
                    <div class="fr-btn">
                        <button class="frb" onclick="findLoad()">길찾기</button>
                    </div>
                </div>

            </div>
            <div class="footer">
                <div class="ft-top">
                    <span>친구들에게<br>트리핑을 추천해주세요.</span>
                </div>
                <div class="ft-code">
                    내 코드 NLYUF <span>&#128455;</span>
                </div>
                <div class="ft-site">
                    <a href="#"><img src="https://yaimg.yanolja.com/joy/sunny/static/images/footer/ic-sns-instagram.svg"></a>
                    <a href="#"><img src="https://yaimg.yanolja.com/joy/sunny/static/images/footer/ic-sns-facebook.svg"></a>
                    <a href="#"><img src="https://yaimg.yanolja.com/joy/sunny/static/images/footer/ic-sns-naverblog.svg"></a>
                </div>
            </div>
            <div class="foot-fix">
                <div class="ff-inner">
                    <div class="ff-one">
                        <div class="fo-loca">
                            <a href="#" onclick="moveMenu('sche')">
                                <img src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-location-empty.svg">
                                <div class="loca-name">여행 홈</div>
                            </a>
                        </div>
                        <div class="fo-search">
                            <a href="#" onclick="moveMenu('plan')">
                                <img src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-nearme-empty.svg">
                                <div class="search-name">일정</div>
                            </a>
                        </div>
                    </div>
                    <div class="ff-two">
                        <div class="ft-like">
                            <a href="#"  onclick="moveMenu('save')">
                                <img src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-favorite-empty.svg">
                                <div class="like-name">저장</div>
                            </a>
                        </div>
                        <div class="ft-my">
                            <a href="#" onclick="moveMenu('tool')">
                                <img src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg">
                                <div class="my-name">여행 도구</div>
                            </a>
                        </div>
                    </div>
                    <div class="ya-logo">
                        <div class="most-logo">
                            <a href="#" onclick="moveMenu('home')">
                                <img src="https://triple.guide/icons/favicon-152x152.png">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </body>

    </html>
