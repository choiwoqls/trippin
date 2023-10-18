<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <link rel="shorcut icon" href="https://triple.guide/icons/favicon-152x152.png">
            <title>나를 아는 여행 앱, 트리핀</title>

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
                    background-color : #F2F2F2;
                }
                .inner {
                    margin-left : 24%;
                    margin-right : 22%;
                    background-color: white;
                }
                .main {
                    
                    
                }
                .hd-in img {
                    width : 30px;
                    margin-top : 3%;
                    margin-left : 5%;
                }
                .hd-in h2 {
                    margin-top : 3%;
                    margin-left : 3%;
                    font-weight: bold;
                    font-size : 30px;
                }
                .hd-in h4 {
                    margin-top : 3%;
                    margin-left : 3%;
                    color : #9B9D9B;
                    padding-bottom : 3%;
                }
                .m-index {
                    
                    margin-left : 24%;
                    margin-right : 22%;
                    background-color: white;
                }
                .dateHead div {
                background: #04CFD4;
                color: #fff;
                text-align: center;
                border-radius: 5px;
                font-weight : bold;
                }

                .grid {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                grid-gap: 5px;
                }

                .grid div {
                padding: .6rem;
                font-size: .9rem;
                cursor: pointer;
                }
               /*  .dateBoard div:active {
                    background-color : #04CFD4;
                } */

                .dateBoard div {
                color: #222;	
                font-weight: bold;
                min-height: 6rem;
                padding: .6rem .8rem;
                border-radius: 5px;
                border: 1px solid #eee;
                }

                .noColor {
                background: #eee;
                }

                .rap-header {
                display: flex;
                justify-content: space-between;
                padding: 1rem 2rem;
                }

                
                .btn {
                display: block;
                width: 20px;
                height: 20px;
                border: 3px solid #000;
                border-width: 3px 3px 0 0;
                cursor: pointer;
                }

                .prevDay {
                transform: rotate(-135deg);
                }

                .nextDay {
                transform: rotate(45deg);
                }
                  .mb-title {
                    width : 100%;
                    
                    margin-top : 33.8%;
                    height : 50px;
                    margin-bottom : 0.2%;
                    border : 1px solid;
                    line-height: 50px;
                    text-align: center;
                    font-size : 20px;
                    background-color: #2987F0;
                    color : white;
                    border-radius: 5px;
                    font-weight: bold;
                }
  				.choose{
                	background-color: #04CFD4;
                }
                .between{
                	background-color: silver;
                }
                

                @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

                * {
                margin: 0;
                padding: 0;
                list-style: none;
                box-sizing: border-box;  
                font-family: Pretendard;
                }

                .rap {
                max-width: 820px;
                padding: 0 1.4rem;
                
                }

                .dateHead {
                    margin: .4rem 0;
                }
              
                
            </style>

        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <img onclick="checkBack()" src="data:image/png;base64,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">
                        <h2>여행일정 등록</h2>
                        <h4>일정에 따른 날씨예보, 여행 정보를 알려드립니다.</h4>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="m-index">
                    <div class='rap'>
                        <div class="rap-header">
                           <div class="btn prevDay"></div>
                          <h2 class='dateTitle'></h2>
                          <div class="btn nextDay"></div>
                        </div>
                        
                        <div class="grid dateHead">
                          <div>일</div>
                          <div>월</div>
                          <div>화</div>
                          <div>수</div>
                          <div>목</div>
                          <div>금</div>
                          <div>토</div>
                        </div>
                    
                        <div class="grid dateBoard"></div>
                        <div class="me-bot">
                        <span id="result"></span>
                        <form id="date-form" method="post" action="${pageContext.request.contextPath }/schedule/sche/styleSelect">
	                        <input class="mb-title" type="button" value="선택 완료" onclick="submitForm()"/>
							<input type="hidden"  name="addrlist" value="${addrlist }" >
							<input type="hidden"  id="dlist-input" name="daylist" value="">                         
                        </form>
                      	                   
                    </div>
                      </div>
                      <script>
						var lday = 0;
						console.log(typeof(lday));
                      	
                        const makeCalendar = (date) => {
                        const currentYear = new Date(date).getFullYear();
                        const currentMonth = new Date(date).getMonth() + 1;
						
                        const firstDay = new Date(date.setDate(1)).getDay();
                        const lastDay = new Date(currentYear, currentMonth, 0).getDate();                                             
						
						console.log(lastDay);
                        lday = lastDay;
                        
                        const limitDay = firstDay + lastDay;
                        const nextDay = Math.ceil(limitDay / 7) * 7;
						
                        let htmlDummy = '';

                        for (var i = 0; i < firstDay; i++) {
                            htmlDummy += `<div class="noColor"></div>`;
                        }

                        for (var j = 1; j <= lastDay; j++) {    
                            htmlDummy += `<div class="def" id="cddv`+j+`"  onclick="addDay(`+j+`)"><input type="hidden" id="cday`+j+`" value ="`+currentYear+`/`+currentMonth+`/`+ j+`">`+j+`</div>
                            
                            `;
                        }

                        for (var k = limitDay; k < nextDay; k++) {
                            htmlDummy += `<div class="noColor"></div>`;
                        }

                        document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
                        document.querySelector(`.dateTitle`).innerText = currentYear+`년`+ currentMonth+`월`;
                        }

						
                        const date = new Date();

                        makeCalendar(date);

                        
                        document.querySelector(`.prevDay`).onclick = () => {
                        makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
                        }

                        
                        document.querySelector(`.nextDay`).onclick = () => {
                        makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
                        }
                        
                        function checkBack() {
							var checkx = window.confirm("작성한 여행 일정은 저장되지 않습니다 일정을 취소하시겠습니까 ? ");
							if(checkx){
								history.go(-2);
							}else{
								return;
							}
						}                        
                        
                        
						var dayArr = new Array();                        
                        var numArr = new Array();
						
                        function addDay(j) {
                        	console.log(lday);
                        	
                        	const result = document.getElementById("result");
                        	
                        	const cddv = document.getElementById("cddv"+j);
                        	const clName = cddv.className;
                        	const date = document.getElementById("cday"+j).value;                     	
							console.log(cddv);      
							
							console.log(dayArr.length);      
							
                        	if(clName == "def"){
								if(dayArr.length<=1){
									cddv.className = "choose";
									console.log('날짜 추가');
									dayArr.push(date);	
									numArr.push(j);
									dayArr = dayArr.filter(item => item !== undefined && item !== null && item !== '');									
									numArr = numArr.filter(item => item !== undefined && item !== null && item !== '');															
									numArr.sort(function(a, b)  {
										  return a - b;
									});
									console.log(dayArr.length);
									result.innerText = dayArr[0];
									if(dayArr.length==2){
										var first = dayArr[0];
										var last = dayArr[1];
										
										var firstn = numArr[0];
										var lastn = numArr[1];
										
										console.log(firstn);
										console.log(lastn);
										
										var fdate = first.split('/');
										var ldate = last.split('/');							
										
										console.log(fdate);
										console.log(ldate);
										
										var fy = Number(fdate[0]);
										var ly = Number(ldate[0]);
										
										var fm = Number(fdate[1]);
										var lm = Number(ldate[1]);
										
										var fd = Number(fdate[2]);
										var ld = Number(ldate[2]);
				
										dayArr = [];
										if(fy != ly){
											if(fy < ly){
												dayArr.push(first);
												dayArr.push(last);
											}else{
												dayArr.push(last);
												dayArr.push(first);
											}
										}else if(fm != lm){
											if(fm < lm){
												dayArr.push(first);
												dayArr.push(last);
											}else{
												dayArr.push(last);
												dayArr.push(first);
											}
										}else if(fd != ld){
											if(fd < ld){
												dayArr.push(first);
												dayArr.push(last);
											}else{
												dayArr.push(last);
												dayArr.push(first);
											}
										}																		
										result.innerText = dayArr[0]+" ~ " +dayArr[1];
										
										if(fm!=lm){
											if(fm>lm){
												for(var w=ld+1; w<=lday ; w++){
													document.getElementById("cddv"+w).className="between";													
												}
											}else{
												for(var q=1; q<ld; q++){
													document.getElementById("cddv"+q).className="between";													
												}
											}										
										}else{
											var start = numArr[0] +1;
											var end = numArr[1];
											console.log(start);
											console.log(end);
											for(var k=start; k<end; k++){
												document.getElementById("cddv"+k).className="between";
												console.log("색 바꿈");												
											}											
										}
									}
								}else {
									alert("출발일과 도착일만 선택하세요");
									return;
								}
                        	}else if(clName =="choose"){
                        		console.log("아하")
								cddv.className = "def";
								for(var m=0; m< dayArr.length; m++){		
									for(var x=0; x<numArr.length; x++){
										if(numArr[x]==j){
											console.log("숫자 삭제");
											delete numArr[x];
										}
									}
									if(date === dayArr[m]){
										console.log("날짜 삭제");
										delete dayArr[m];													
										const btw = document.querySelectorAll(".between");
										console.log(btw);
										for(var p=0; p<btw.length; p++){
											console.log("원래대로");
											btw[p].className ="def";
										}
									}				
								}         
								dayArr = dayArr.filter(item => item !== undefined && item !== null && item !== '');
								numArr = numArr.filter(item => item !== undefined && item !== null && item !== '');	
        						if(dayArr[0] == undefined){
        							result.innerText = "";
        						}else{
									result.innerText = dayArr[0];        							
        						}
                        	}else{
                        		alert("출발일과 도착일만 선택하세요");
                        		return;
                        	}
							console.log(dayArr);
							console.log(numArr);
                  		
							console.log(date);
						}
                        
                        function submitForm() {
							const daylist = document.getElementById("dlist-input");
							daylist.value = JSON.stringify(dayArr);
							const nolength = daylist.value;
							const check = nolength ==='[]';
							if(check){
								alert("최소 1개의 날짜를 선택해주세요");
							}else{
								const recheck = window.confirm("다음으로 넘어가시겠습니까 ? ");								
								if(recheck){
									document.getElementById("date-form").submit();																
								}else{
									return ;
								}
							
									
								
							}
						}
                        
                        
                      </script>
                      
                </div>
            </div>
        </body>
    </html>