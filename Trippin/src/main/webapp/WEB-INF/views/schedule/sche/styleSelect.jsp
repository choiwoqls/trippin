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
                .hd-in {
                    background-color: white;
                    margin-left : 30%;
                    margin-right : 30%;
                }
                .hd-in a img {
                    width : 10%;
                    margin-top : 5%;
                    margin-left : 2%;
                }
                .hd-tit {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                    padding-top : 2%;
                    font-size : 30px;
                    font-weight: bold;
                    padding-left : 2%;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                }
                .m-one {
                    padding-top : 10%;
                }
                .mo-tit, .mt-tit {
                    margin-left : 6%;
                    font-weight : bold;
                    font-size : 20px;
                }
                .mo-list, .mt-list {
                    
                    margin-left : 8%;
                }
               /*  .mo-list button, .mt-list button {
                    margin-top : 4%;
                    background-color : #F2F2F2;
                    color :#B7B7B7;
                    border : 0px;
                    cursor: pointer;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    padding-left : 3%;
                    padding-right : 3%;
                    border-radius: 25px;
                    font-weight: bold;
                    font-size : 15px;
                    margin-right : 2%;
                    
                } */
                .mo-listz {
                    background-color: #2987F0;
                    color: white;

                }
                .m-two {
                    padding-top : 10%;
                }
                .footer {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                    padding-top : 10%;
                    text-align: center;
                    padding-bottom : 0.2%;
                }
                .f-name button {
                    width : 100%;
                    height : 60px;
                    font-size: 17px;
                    font-weight: bold;
                    color : white;
                    background-color: #2987F0;
                    border : 0px;
                    border-radius: 5px;
                }
                
                .def{
                    margin-top : 4%;
                    background-color : #F2F2F2;
                    color :#B7B7B7;
                    border : 0px;
                    cursor: pointer;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    padding-left : 3%;
                    padding-right : 3%;
                    border-radius: 25px;
                    font-weight: bold;
                    font-size : 15px;
                    margin-right : 2%;
                    
                
                }
                .choose{
                	margin-top : 4%;
                    background-color : #04CFD4;
                    color : white;
                    border : 0px;
                    cursor: pointer;
                    padding-top : 2%;
                    padding-bottom : 2%;
                    padding-left : 3%;
                    padding-right : 3%;
                    border-radius: 25px;
                    font-weight: bold;
                    font-size : 15px;
                    margin-right : 2%;
                    
                }
            </style>
            <script>
            
            var ngArr = new Array();
            var stArr = new Array();
            
            function addNugu(i) {
            	
            	const nugu = document.getElementById("ngBtn"+i);
            	console.log(nugu);
            	const ngV = nugu.value;
            	const ngC = nugu.className;
            	
            	if(ngC == "def"){
            		console.log("누구와 추가");
            		nugu.className = "choose";
            		ngArr.push(ngV);
            		
            	}else if(ngC =="choose"){
            		console.log("누구와 삭제");
            		nugu.className = "def";
            		for(var i=0; i<ngArr.length; i++){
            			if(ngV == ngArr[i]){
            				console.log("번호 삭제");
            				delete ngArr[i];
            			}
            		}
            	}
            	console.log(ngArr);
				ngArr = ngArr.filter(item => item !== undefined && item !== null && item !== '');															
            	console.log(ngArr);          	
			}
            
            function addStyle(j) {
            	
            	const style = document.getElementById("stBtn"+ j );
            	const stV = style.value;
            	const stC = style.className;
            	
            	if(stC == "def"){
            		console.log("스타일");
            		style.className = "choose";
            		stArr.push(stV);
            		
            	}else if(stC == "choose"){
            		console.log("스타일 삭제");
            		style.className = "def";
            		for(var k = 0; k < stArr.length ; k ++){
            			if(stV == stArr[k]){
            				console.log("스타일 번호 삭제");
            				delete stArr[k];
            			}
            		}
            	}
            	
            	console.log(stArr);
            	stArr = stArr.filter(item => item !== undefined && item !== null && item !== '');				
            	console.log(stArr);
				console.log(stArr.length);
			}
            
           	function fsubmit() {
				console.log(ngArr);
				console.log(stArr);
				ngArr.sort(function(a, b)  {
					  return a - b;
				});
				stArr.sort(function(a, b)  {
					  return a - b;
				});
				console.log(ngArr);
				console.log(stArr);
				
				var bool = true;
				
				if(ngArr.length == 0 || stArr.length == 0){
					const check = window.confirm("다음에 다시 선택하시겠습니까 ?  ");
					if(check){
						bool = true;
					}else{
						bool = false;
					}
				}
				if(bool){
					const acheck = window.confirm("이대로 일정을 생성하시겠습니까 ?");
					if(acheck){
						const ng_list = document.getElementById("ng_list");
						const st_list = document.getElementById("st_list");
						ng_list.value = JSON.stringify(ngArr);
						st_list.value = JSON.stringify(stArr);
						document.getElementById("ns_form").submit();					
					}else{
						return;
					}
				}else{
						return;
				}
				
			}
           	
            function checkBack() {
				const checkx = window.confirm("작성한 여행 일정은 저장되지 않습니다 일정을 취소하시겠습니까 ? ");
				if(checkx){
					history.go(-3);
				}else{
					return;
				}
			}       
            
            
            
            </script>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <a href="#"><img onclick="checkBack()" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU"></a>
                    </div>
                    <div class="hd-tit">
                        <span>어떤 스타일의<br>여행을 할 계획인가요?</span>
                    </div>
                </div>
            </header>
            <div class="main">
                <div class="m-one">
                    <div class="mo-tit">
                        누구와
                    </div>
                    <div class="mo-list">
                 	<c:forEach var="vo" items="${nulist }" varStatus="i">
                       <button class="def"  type="button" id="ngBtn${i.index }" onclick="addNugu(${i.index })" value="${vo.nugu_seq }">${vo.nugu_who }</button>		
                 	</c:forEach>   
                    </div>
                </div>
                <div class="m-two">
                    <div class="mt-tit">
                        여행 스타일
                    </div>
                    <div class="mt-list">
                    <c:forEach var="vo" items="${stlist }" varStatus="j">
                        <button class="def" type="button" id="stBtn${j.index }" onclick="addStyle(${j.index })" value="${vo.style_seq }">${vo.style_what }</button>                    
                    </c:forEach>                   
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="f-name">
                <form id="ns_form" action="${pageContext.request.contextPath }/schedule/sche/newSche" method="post">       	
					<input type="hidden" name="addrlist" value="${addrlist }">
					<input type="hidden" name="first_day" value="${first_day }">
					<input type="hidden" name="last_day" value="${last_day }">
					<input type="hidden" id="ng_list" name="nglist" value="">
					<input type="hidden" id="st_list" name="stlist" value="">
                    <button type="button"  onclick="fsubmit()">완료</button>
                </form>
                </div>
            </div>
        </body>
    </html>