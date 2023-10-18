<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html lang="kr">
        <head>
        
            <meta charset="utf-8">
        	<c:set var="cpath" value="${pageContext.request.contextPath }"/>
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>pension</title>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Jua&display=swap" rel="stylesheet">


			  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css">
			  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
			  <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
			  <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
			</head>
			<body>

		
		<!-- 달력 -->
		<script>
		$(document).ready(function() {
		  $('#dateRangePicker').daterangepicker({
		    opens: 'left',
		    linkedCalendars: false
		  }, function(start, end, label) {
		    $('#startDate').text(start.format('YYYY-MM-DD'));
		    $('#endDate').text(end.format('YYYY-MM-DD'));
		    
		    var duration = end.diff(start, 'days') + 1;
		    $('#duration').text(duration + ' days');
		  });
		});
		</script>



    <script type="text/javascript">
 
        //날짜,인원 숨김
        function dis1() {
            var dis1Element = document.getElementById('dis1');
            if (dis1Element.style.display === 'none') {
                dis1Element.style.display = 'block';
            } else {
                dis1Element.style.display = 'none';
            }
        }

        function dis2() {
            var dis2Element = document.getElementById('dis2');
            if (dis2Element.style.display === 'none') {
                dis2Element.style.display = 'block';
            } else {
                dis2Element.style.display = 'none';
            }
        }

        function dis3() {
            var dis3Element = document.getElementById('dis3');
            if (dis3Element.style.display === 'none') {
                dis3Element.style.display = 'block';
            } else {
                dis3Element.style.display = 'none';
            }
        }
        
	        
        
	        document.addEventListener("DOMContentLoaded", function() {
	            var minusBtn = document.querySelector(".minus");
	            var plusBtn = document.querySelector(".plus");
	            var resultSpan = document.querySelector("#result");

	            var count = 1;

	            minusBtn.addEventListener("click", function() {
	                if (count > 1) {
	                    count--;
	                    resultSpan.textContent = count;
	                }
	            });

	            plusBtn.addEventListener("click", function() {
	                count++;
	                resultSpan.textContent = count;
	            });
	        });

    </script>
    
    
	<script>
	
	//날짜, 인원 list
	  var selectedButtons = [];
	
	  function buttonClicked(button) {
	    var buttonValue = button.value;
	
	    var index = selectedButtons.indexOf(buttonValue);
	    if (index === -1) {
	      selectedButtons.push(buttonValue);
	    } else {
	      selectedButtons.splice(index, 1);
	    }
	
	    updateSelectionInfo();
	  }
	
	
	  function updateSelectionInfo() {
	    var selectedInfo = selectedButtons.join(', ');
	    var totalCount = selectedButtons.length;
	    document.getElementById('selectedButtons').textContent = selectedInfo;
	    document.getElementById('totalCount').textContent = totalCount;
	  }
	  
	  
	  //인원 파라미터
	  function chooseRoom(item) {
		  
		document.getElementById("room_seq").value = item;
		
		const su1 = document.getElementById("result").innerText;
		const su2 = document.getElementById("totalCount").innerText;
		const su3 = document.getElementById("selectedButtons").innerText;
		const su4 = document.getElementById("startDate").innerText;
		const su5 = document.getElementById("endDate").innerText;
		const su6 = document.getElementById("duration").innerText;
		const form = document.getElementById("roomForm");
		
		var input1 = document.createElement("input");
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "result");
		input1.setAttribute("value", su1);
		form.appendChild(input1);
		
		var input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "totalCount");
		input2.setAttribute("value", su2);
		form.appendChild(input2);
		
		var input3 = document.createElement("input");
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "selectedButtons");
		input3.setAttribute("value", su3);
		form.appendChild(input3);
		
		var input4 = document.createElement("input");
		input4.setAttribute("type", "hidden");
		input4.setAttribute("name", "startDate");
		input4.setAttribute("value", su4);
		form.appendChild(input4);
		
		var input5 = document.createElement("input");
		input5.setAttribute("type", "hidden");
		input5.setAttribute("name", "endDate");
		input5.setAttribute("value", su5);
		form.appendChild(input5);
		
		var input6 = document.createElement("input");
		input6.setAttribute("type", "hidden");
		input6.setAttribute("name", "duration");
		input6.setAttribute("value", su6);
		form.appendChild(input6);
		
		form.submit();
		
		
		
	}
	  
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

                .header {
                    height : 13vh;
                    width : 100%;
                }
                .inner {
                    position: fixed;
                    background-color: white;
                    box-shadow: 0px 2px 0px 0px #F2F2F2;
                    height : 13vh;
                    z-index: 300;
                    width : 100%;
                }
                .hd-in {
                    display : flex;
                    justify-content: space-around;
                    line-height: 13vh;
                }
                .hd-left { 
                    width :25%;
                }
                .hd-mid,.hd-right {
                    width : 33%;
                }
                .hm-1 input {
                    width : 80%;
                    height : 8vh;
                    font-size : 18px;
                    border : 0;
                    border-bottom : 2px solid #929292;
                    
                    
                }
                
                .hm-img {
                    width : 10%;
                    position : relative;
                    top : 2vh;
                    right : 3.5vw;
                }
                .my-page {
                    
                    height : 13vh;
                }
                .my-page a {
                    text-decoration: none;
                }
                .mp-ind {
                    width : 25%;
                    
                    border: 2px solid #E2E2E2;
                    border-radius: 45px;
                    height : 8vh;
                    margin-top : 4%;
                    margin-left : 45%;
                }
                .mp-ind:hover {
                    transition-duration: 0.3s;
                    box-shadow : 0px 4px 3px #adadad;
                }
                .hdr1 {
                    width : 30%;
                    margin-left : 16%;
                    margin-bottom : 4%;
                }
                .hdr2 {
                    width : 30%;
                    margin-bottom : 4%;
                }
                .hl-1 a {
                    text-decoration: none;
                }
                .tit1 {
                    width : 25%;
                    margin-left : 20%;
                    position : relative;
                    top : 2vh;
                }
                .tit2 {
                    width : 5%;
                    position : relative;
                    top : -1vh;
                    right : 0.5vw;
                }
                body {
                    width : 100vw;
                    
                }
                .main-detail {
                    margin-left : 26%;
                    margin-right : 26%; 
                }
                .cu-btn {
                    padding-top : 5%;
                    
                }
                .m1-btn {
                    width : 100%;
                    padding-top : 1.5%;
                    padding-bottom : 1.5%;
                    border : 0;
                    cursor: pointer;
                    border-radius: 5px;
                    background-color: #368FFF;
                    color : white;
                    font-weight: bold;
                }
                .cu-text {
                    color : rgba(58, 58, 58, 0.5);
                    overflow-wrap: break-word;
                    font-weight: 500;
                    white-space: pre-line;
                    font-size: 13px;
                    line-height: 1.46;
                }
                .setting {
                    padding-top : 10%;
                    display : flex;
                    justify-content: space-around;
                }
                .date, .personnel {
                    border : 1px solid rgba(58,58,58,0.2);
                    width : 48%;
                    height : 6vh;
                    text-align: center;
                    line-height: 6vh;
                    border-radius: 5px;
                    color : rgb(58, 58, 58);
                    cursor: pointer;
                    font-size: 14px;
                    font-weight: 550;
                }
                .addpage {
                    display : none;
                    position: fixed;
                    width : 100vw !important;
                    height : 100vh !important;
                    top : 0;
                    background-color: white;
                    z-index: 9999;
                    transition: transform 300ms ease-out 0s;
                    inset: 0px;
                    transform: translateY(0px);
                }
                .addpagez {
                    display : block;
                    position: fixed;
                    width : 100vw !important;
                    height : auto !important;
                    top : 0;
                    background-color: white;
                    z-index: 9999;
                    transition: transform 300ms ease-out 0s;
                    inset: 0px;
                    transform: translateY(0px);
                }
                .ap-top {
                    
                    height : 10vh;
                }
                .ap-top img {
                    height: 34px;
                    width: 34px;
                    margin-left: 0px;
                    margin-right: 6px;
                    padding-left : 2%;
                    padding-top : 1%;
                    cursor: pointer;
                }
                .ap-main {
                    margin-left : 26%;
                    margin-right : 26%; 
                    padding-top : 2%;
                }
                .ap-title {
                    border-bottom :1px solid rgb(239, 239, 239);
                    height : 13vh;
                    line-height: 13vh;
                    color : rgb(58, 58, 58);
                    font-weight: bold;
                    font-size: 21px;
                    padding-left : 2%;
                } 
                .ap-date {
                    border-bottom :1px solid rgb(239, 239, 239);
                    color : rgb(58, 58, 58);
                    font-weight: bold;
                    font-size: 17px;
                    padding-left : 2%;
                    display: flex;
                    cursor: pointer;
                }
                .date-btn {
                    width : 80%;
                }
                .open-btn {
                    width : 20%;
                    text-align: right;
                    padding-right : 3%;
                    padding-top : 2%;
                }
                .open-btn img {
                    width : 40px;
                }
                .ap-adult {
                    border-bottom :1px solid rgb(239, 239, 239);
                    height : 13vh;
                    line-height: 13vh;
                    color : rgb(58, 58, 58);
                    font-size: 20px;
                    padding-left : 2%;
                    display: flex;
                }
                .adult {
                    width : 80%;
                }
                .count {
                    width : 20%;
                    
                    text-align: right;
                    padding-right : 3%;
                }
                .select {
                    width : 20%;
                    
                    text-align: right;
                    padding-right : 3%;
                }
                .count1 span {
                    font-weight: bold;
                }
                .count1 button {
                    background-color: white;
                    border : 0;
                    cursor: pointer;
                }
                .c1-img1 {
                    width : 20px;
                }
                .c1-btn1 {
                    vertical-align: -12%;
                }
                .c1-img2 {
                    width : 25px;
                }
                .ap-submit {
                    padding-top : 10%;
                    width : 100%;
                }
                .ap-submit button {
                    width : 100%;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    border : 0;
                    background-color: #368FFF;
                    font-weight: bold;
                    color : white;
                    font-size : 16px;
                    cursor: pointer;
                }
                .main-3 {
                    padding-top : 8%;
                }
                .list-title {
                    font-weight: bold;
                    font-size: 24px;
                }
                .hotel-list {
                    padding-top : 3%;
                    padding-bottom : 2%;
                    
                }
                .main-img {
                    width: 100%;
                    border-radius: 6px;
                    object-fit: cover;
                }
                .list-img {
                    position: relative;
                }
                .jjim-img {
                    position: absolute;
                    top: 3px;
                    right: 3px;
                    width: 36px;
                    height: 36px;
                    cursor: pointer;
                }
                .best {
                    
                    margin-top : 2%;
                    display: inline-block;
                    padding : 0.5%;
                    font-size: 12px;
                    background-color: rgb(38, 206, 194);
                    color : white;
                    font-weight: 500;
                    border-radius: 3px;
                }
                .best span {
                    font-weight: bold;
                }
                .hotel-name {
                    padding-top : 1%;
                    font-weight: bold;
                }
                .mltsc-1 {
                    width : 100%;
                    
                    display: flex;
                    height : 3vh;
                }
                .ml-sect {
                    width : 11.5%;
                    
                }
                .mlstar {
                    margin-top : 4%;
                    width : 46.4%;
                    height : 100%;
                    background-image : url("https://yaimg.yanolja.com/joy/sunny/static/images/icon-score-yayellow-fill.svg");
                    background-repeat: repeat-x;
                }
                .mltsc-1 span {
                    font-weight: 550;
                    font-size : 13px;
                    overflow : hidden;
                    color: rgba(58, 58, 58, 0.4);
                }

                .price {
                    text-align: right;
                    color: rgb(58, 58, 58);
                    font-weight: bold;
                    font-size : 20px;
                }
                .price span {
                    color: rgb(253, 46, 105);
                }
                .roomprice{
                	text-align: right;
                	font-weight: bold;
                }
                .foot-info {
                    display: flex;
                    justify-content: space-between;
                }
                .fi-1 {
                    color: rgba(58, 58, 58, 0.3);
                    font-weight: 500;
                    font-size : 13px;
                }
                .fi-2 {
                    color: rgba(58, 58, 58, 0.7);
                    font-size: 13px;
                    font-weight: bold;
                }
                a {
 					text-decoration: none;
				}
                
        </style>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <div class="hl-1">
                                <a href="#">
                                    <img class= "tit1" src="titname.jpg"/>
                                    <img class= "tit2" src="titlogo.jpg"/>
                                </a>
                            </div>
                        </div>
                        <div class="hd-mid">
                            <div class="hm-1">
                                <input type="text" placeholder="어느 도시가 궁금하세요?">
                                <img class="hm-img" src="https://assets.triple.guide/images/btn-com-search@3x.png">
                            </div>
                        </div>
                        <div class="hd-right">
                            <div class="my-page">
                                <a href="#">
                                    <div class="mp-ind">
                                        <img class="hdr1" src="https://cdn-icons-png.flaticon.com/512/3502/3502458.png"/>
                                        <img class="hdr2" src="https://yaimg.yanolja.com/joy/sunny/static/images/gnb/icon-my-empty.svg"/>
                                    </div>
                                </a> 
                                
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="main-detail">
                    <div class="main-1">
                        <div class="coupons">
                            <div class="cu-img">
                                <img src="https://media.triple.guide/triple-cms/q_auto:best,f_auto/9530d891-51b1-4d44-9f3e-e3d5b7ff6cc8.jpeg">
                            </div>
                            <div class="cu-btn">
                                <button class="m1-btn">쿠폰 받기</button>
                            </div>
                            <div class="cu-text">
                                <span>쿠폰은 최초 1회만 지급되며, 이미 쿠폰을 받았다면 ‘쿠폰함’에서 확인 할 수 있습니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="main-2">
                        <div class="setting" id="mio" onclick="showlist1()">
                            <div class="date">
                                <span>8.31(목) - 9.1(금)</span>
                            </div>
                            <div class="personnel">
                                <span>성인2, 아동3</span>
                            </div>
                        </div>
                        <div class="addpage" id="mit">
                            <div class="ap-top">
                                <img onclick="closemit()" src="https://assets.triple.guide/images/btn-com-close@3x.png">
                            </div>
                            <div class="ap-main">
                                <div class="ap-title">
                                    <span>일정 및 인원</span>
                                </div>
                                
                                
                                <div class="ap-date">
                                    <div class="date-btn" >
	                                <button id='showDate' onclick="dis1()">날짜 선택</button>
										<div class="num" style="width:800px;">
										<div id='dis1' style="display: none;">
								
										<input id="dateRangePicker" />
								
											<div>
											  <p>체크 인 : <span id="startDate"></span></p>
											  <p>체크 아웃: <span id="endDate"></span></p>
											  <p>투숙 기간: <span id="duration"></span></p>
											</div>
								 
										</div>
										</div>
							
                                    </div>
                                    <div class="open-btn">
                                        <img src="https://assets.triple.guide/images/ico-accordion-expand-more@4x.png">
                                    </div>
                                </div>
                                
                                
                                <div class="ap-adult">
                                    <div class="adult">
                                        <span>성인</span>
                                    </div>
									<span class="count">
										<a href="#" class="minus">-</a>
										<span id="result">1</span>
										<a href="#" class="plus">+</a>
									</span>
                                </div>
                                <div class="ap-adult">
                                    <div class="adult">
                                        <span>아동</span>
                                    </div>
							  		<span class="select">
										<a href="#" onclick="dis3();" class="a" >-</a>
										<span id="totalCount">0</span>
										<a href="#" onclick="dis3();" class="b">+</a>
									</span>
                                </div>
                                
                                <div id='dis3' style="display: none;">
								<table>
								  <tr>
								    <td><input type="button" value="만  0세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  1세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  2세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  3세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  4세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  5세" onclick="buttonClicked(this)"></td>
								  </tr>
								  <tr>
								    <td><input type="button" value="만  6세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  7세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  8세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만  9세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만 10세" onclick="buttonClicked(this)"></td>
								    <td><input type="button" value="만 11세" onclick="buttonClicked(this)"></td>
								  </tr>
								</table>
					
								<p>나이를 선택해주세요: <span id="selectedButtons"></span></p>
								
							</div>
                                
                                <div class="ap-submit">
                                    <button>변경하기</button>
                                </div>
                            </div>
                        </div>
                        <script>
                                    function showlist1() {
                                        const modiv = document.getElementById("mio");
                                        const moC = modiv.className;
                                        const mtdiv = document.getElementById("mit");
                                        const mtC = mtdiv.className;
                                        console.log(moC);
                                        if(moC == "setting"){
                                            mtdiv.className = "addpagez";
                                                            
                                            
                                        }
                                    }
                                    function closemit(){
                                        const mtdiv = document.getElementById("mit");
                                        mtdiv.className = "addpage";

                                    }
                        </script>
                    </div>
                    <div class="main-3">
                        <div class="list-title">
                            <span>추천 펜션</span>
                        </div>
                        
                        
                      <div>
						<c:forEach var="a" items="${alist }">
                        
                        <div onclick="document.location.href='${cpath}/admin/member/accom/selectPen?f_seq=${a.F_SEQ }'">

                        <div class="hotel-list">
                            <div class="list-ex">
                                <div class="list-img">
                                    <img class="main-img" src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/8a861d83-1847-4b52-90ad-1e0ea5579f9b">
                                    <img class="jjim-img" src="https://assets.triple.guide/images/btn-content-scrap-overlay-off@3x.png">
                                </div>
                                <div class="best">
                                    트리플 <span>BEST</span>
                                </div>
                                <div class="hotel-name">
                                    <span>${a.NAME }</span>
                                </div>
                                <div class="mltsc-1">
                                    <div class="ml-sect">
                                        <div class="mlstar">
    
                                        </div>
                                    </div>
                                    <span>(${a.SAVG }) · 저장 ${a.JJ } · ${a.ADDR2_NAME }</span>
                                </div>
                                <div class="won">
	                                <div class="price">
	                                    <span>3% </span>
	                                </div>
	                                <div class="roomprice">
	                                    <span id="money">${a.PRICE }원</span>
	                                </div>
                                </div>
                                <div class="foot-info">
                                    <div class="fi-1">
                                        <span>1박, 세금포함</span>
                                    </div>
                                    <div class="fi-2">
                                        <span>쿠폰할인가</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                    </c:forEach>

                    </div>
                    
                    <script>
                    const mon = document.querySelectorAll("#money");
                    console.log(mon);
                    
	    				for(let i=0; i<mon.length; i++){
	    					const roomPriceStr = mon[i].innerText.replace(/,/g, ''); 
	    					const roomPrice = parseFloat(roomPriceStr); 
	    					const formattedPrice = roomPrice.toLocaleString('ko-KR');
	    					mon[i].innerText = formattedPrice+"원";					
	    				}
                    </script>
                    
                </div>
            </div>
        </body>
    </html>