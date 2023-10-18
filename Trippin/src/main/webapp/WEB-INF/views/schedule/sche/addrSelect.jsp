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

                .hd-in {
                    display : flex;
                    margin-left: 30%;
                    margin-right : 30%;
                    border-bottom : 1px solid silver;
                    height : 70px;
                }
                
                .hd-left img {
                    width : 40px;
                    margin-top : 40%;
                    
                }
                .hd-right {
                    background : url(https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_search@2x.png);
                    background-repeat: no-repeat;
                    width : 50px;
                    border : 0px;
                    background-size: 35px 35px;
                    position : relative;
                    cursor : pointer;
                    left : 285px;
                    top : 19px;
                    filter:  brightness(0%)invert(3%) sepia(10%) saturate(1418%) hue-rotate(292deg) brightness(105%) contrast(104%);
                }
                .hd-mid input{
                    width : 200%;
                    height : 60px;
                    margin-top : 2%;
                    margin-left: 10%;
                    border : 0px;
                    font-size : 20px;
                }
                input::placeholder {
                    
                    font-size : 20px;
                }
                
                .main-header {
                    border-bottom : 1px solid silver;
                    height : 50px;
                }
                .mh-title {
                    height : 50px;
                    line-height: 50px;
                    font-weight: bold;
                    margin-left : 35%;
                    margin-right : 35%;
                    padding-left : 10%;
                    border-bottom : 3px solid #3666FF;
                    
                }
                .mt-1 img {
                    width : 70px;
                    height : 70px;
                    border-radius: 50%;
                    margin-left : 20%;
                    
                }
                .me-top1 {
                    display : flex;
                    
                }
                .mt-2 {
                    margin-left : 5%;
                    
                    width : 50%;
                }
                .mt2-title {
                    font-weight: bold;
                    font-size : 20px;
                    margin-top : 4%;
                }
                .mt2-subtitle {
                    font-size : 14px;

                    font-weight: 500;
                    color : #818181;
                    margin-top : 4%;
                }
                .mt-3 {
                    margin-left : 10%;
                    margin-top : 3%;
                }
                .mt-3 button {
                    width : 80px;
                    padding-top : 15%;
                    padding-bottom : 15%;
                    padding-left : 20%;
                    padding-right : 20%;
                    border-radius: 35px;
                    cursor: pointer;
                    border : 0px;
                    font-weight: bold;
                    font-size : 16px;
                    
                }
                .mtbtn-1 {
                    display : block;
                    
                    
                }
                .mtbtn-2 {
                    display: none;
                    border : 2px solid #3666FF !important;
                    color : #3666FF;
                    background-color: white;
                    
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
                .main {
                    background-color: #F2F2F2;
                }
                .main-header,.main-ex {
                    margin-left : 30%;
                    margin-right : 30%;
                    background-color: white;
                }
                .hd-in:focus-within {
                    border-bottom : 3px solid;
                    
                }
            </style>
            
            <script type="text/javascript">
            	
            	var nolist = new Array();
            
            	function addList(i) {
					const chbtn  = document.getElementById("chbtn"+i);
					const cnbtn  = document.getElementById("cnbtn"+i);
					console.log(chbtn);
					const dno = chbtn.value;
					console.log(dno);
					
					nolist.push(dno);
					chbtn.style.display = "none";
					cnbtn.style.display = "block";
					console.log(nolist);
					
					nolist = nolist.filter(item => item !== undefined && item !== null && item !== '');
            	
            	}	
            	
            	function xList(i) {
            		const chbtn  = document.getElementById("chbtn"+i);
					const cnbtn  = document.getElementById("cnbtn"+i);
					console.log(cnbtn);
					const dno = cnbtn.value;				
					
					for(var j =0; j < nolist.length; j++){
						if(dno === nolist[j]){
							console.log("배열삭제");
							delete nolist[j];
						}
						console.log(nolist[j]);
					}
					
					chbtn.style.display = "block";
					cnbtn.style.display = "none";
					
					console.log(nolist);
					
					 nolist = nolist.filter(item => item !== undefined && item !== null && item !== '');
					
					
				}
            	 function submitForm() {
			           
			            const nolistInput = document.getElementById("nolist-input");
			            nolistInput.value = JSON.stringify(nolist);
            		 const nolength = nolistInput.value;
            		 console.log(nolength);
            		 const check = nolength ==='[]';
            		 console.log(check);
            		 if(check){
            			 alert("최소 1개 이상의 장소를 선택해주세요");
            		 }else{
            			const recheck = window.confirm("다음으로 넘어가시겠습니까 ? ");
            			if(recheck){
				            document.getElementById("travel-form").submit();            				
            			}else{
            				return;
            			}
			         
            		 }
			        }
            
            
            </script>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <div class="hd-left">
                            <img onclick="history.back()" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                        </div>
                        <div class="hd-mid">
                            <input type="text" placeholder="여행, 어디로 떠나시나요?">
                        </div>
                        <div class="hd-right">

                        </div>
                    </div>
                </div>
                
            </header>
            <div class="main">
                <div class="main-header">
                    <div class="mh-title">
                        국내도시
                    </div>
                </div>
                <form class="main-ex"  id="travel-form" action="${pageContext.request.contextPath }/schedule/sche/daySelect" method="POST">
                    <div class="me-top">
                        <div class="me-top1" style="margin-top : 3%;">
                            <div class="mt-1" style="margin-top : 2%;">
                                <img src="https://i.ytimg.com/vi/vXCga2K_mUE/maxresdefault.jpg">
                            </div>
                            <div class="mt-2" style="margin-top : 2%;">
                                <div class="mt2-title">
                                    국내
                                </div>
                                <div class="mt2-subtitle" >
                                    어디론가 떠나고 싶을 때
                                </div>
                            </div>
                            <div class="mt-3" style="margin-top : 4%;">
                                <button type="button"  value="0"  class="mtbtn-1" id="chbtn0" onclick="addList(0)">선택</button>
                                <button type="button"  value="0"  class="mtbtn-2" id="cnbtn0" onclick="xList(0)">취소</button>
                            </div>
                        </div>
                        <c:forEach var="vo" items="${alist }" varStatus="i">
                        
	                        <div class="me-top1" style="margin-top : 3%;">
	                            <div class="mt-1">
	                                <img src="" >
	                            </div>
	                            <div class="mt-2">
	                                <div class="mt2-title">
	                                    ${vo.addr1_name }
	                                </div>
	                                <div class="mt2-subtitle">
	                                   국내
	                                </div>
	                            </div>
	                            <div class="mt-3">
	                                <button type="button"  value="${vo.addr1_seq }"  class="mtbtn-1" id="chbtn${vo.addr1_seq }" onclick="addList(${vo.addr1_seq })">선택</button>
	                                <button type="button"  value="${vo.addr1_seq}"  class="mtbtn-2"id="cnbtn${vo.addr1_seq }" onclick="xList(${vo.addr1_seq })">취소</button>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                        <div class="me-top1" style="margin-top : 3%;">
                            <div class="mt-1">
                                <img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/1jPF/image/6dTBQAAJW6QLbLUaneCZWL3Vhf4.jpg">
                            </div>
                            <div class="mt-2">
                                <div class="mt2-title">
                                    가평, 양평
                                </div>
                                <div class="mt2-subtitle">
                                    업데이트 예정
                                </div>
                            </div>
                            <div class="mt-3">
                                <button type="button"  disabled="disabled"  class="mtbtn-1">선택</button>
                                <button type="button"  disabled="disabled"  class="mtbtn-2">취소</button>
                            </div>
                        </div>
                        <div class="me-top1" style="margin-top : 3%;">
                            <div class="mt-1">
                                <img src="https://www.expedia.co.kr/stories/wp-content/uploads/2022/05/4-8-1.jpg">
                            </div>
                            <div class="mt-2">
                                <div class="mt2-title">
                                    강릉, 속초
                                </div>
                                <div class="mt2-subtitle">
                                   	업데이트 예정	
                                </div>
                            </div>
                            <div class="mt-3">
                                <button type="button"  disabled="disabled" class="mtbtn-1">선택</button>
                                <button type="button"  disabled="disabled"  class="mtbtn-2">취소</button>
                            </div>
                        </div>
                    </div>
                    <div class="me-bot">
                        <input class="mb-title" type="button" value="선택 완료" onclick="submitForm()"/>
                        <input type="hidden" id="nolist-input" name="nolist" value="" />                     
                    </div>
                </form>
            </div>
        </body>
    </html>