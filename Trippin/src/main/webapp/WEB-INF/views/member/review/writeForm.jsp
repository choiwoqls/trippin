<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <html lang="kr">
        <head>
            <meta charset="utf-8">
            <c:set var="cpath" value="${pageContext.request.contextPath }" />
            <script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
			<script
			  src="https://code.jquery.com/jquery-3.7.0.js"
			  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			  crossorigin="anonymous">
			</script>
            
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
                    height : auto;
                }
                .header {
                    margin-left : 30%;
                    margin-right : 30%;
                    padding-top : 0.5%;
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
                    left : 2vw;
                    font-size :24px;
                    font-family: 'Jua', sans-serif;
                }
                .main {
                    margin-left : 30%;
                    margin-right : 30%;
                    padding-top : 0.5%;
                    background-color: white;
                    border-bottom : 1px solid #F2F2F2;
                }
                .custom {
                	align-items: center;
                    align-content: center;
                    padding-top : 4%;
                    padding-left : 4%;
                }
                .custom-info {
                    display: flex;
                    width : 70%;
                    position: relative;
                }
                .custom-img img {
                    width : 10vw;
                    height : auto;
                    border-radius: 10px;
                    margin-left : 40%;
                }
                .custom-name {
                    font-weight: bold;
                    font-size: 20px;
                    margin-left : 12%;
                    margin-top : 3%;
                    width : 60%;
                    
                }
                .custom-name a{
                	color: #000;
					text-decoration: none;
                }
                .custom-jjim {
                    width : 40px;
                    cursor: pointer;
                    position: relative;
                    top : 1vh;
                }
                .custom {
                    display : flex;
                }
                .main-mid {
                    padding-top : 2%;
                    text-align: center;
                }
                .star {
                    margin-left : 15%;
                    margin-right : 15%;
                }
                .star-info {
                    margin-left : 15%;
                    margin-right : 15%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    font-family: 'Jua',sans-serif;
                }
                input[type='month'] {
                    border: none; 
                    position: relative; 
                    width: 25%;
                    padding: 10px;
                    background: url('https://o.remove.bg/downloads/169075d3-ec5c-4b17-b59d-64fb1db6452b/75624-removebg-preview.png') no-repeat right 10px center /
                        35px auto; 
                    background-color: #F2F2F2;
                    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                    border-radius: 8px;
                    text-align: center;
                    font-size: 100%;
                    margin-bottom: 1%;
                    margin-top : 1%;
                    font-family: 'Jua', sans-serif;
                }
                input[type='month']::-webkit-calendar-picker-indicator {
                    position: absolute; 
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background: transparent; 
                    color: transparent; 
                    cursor: pointer;
                }
                input[type='month']::before {
                    content: attr(placeholder); 
                    width: 100%;
                    height: 100%;
                }
                input[type='month']:valid::before {
                    display: none; 
                }
                .area {
                    margin-top : 5%;
                }
                textarea {
                    width : 90%;
                    height : 50vh;
                    resize: none;
                    outline: none;
                    border : 2px solid #F2F2F2;
                    font-size : 15px;
                    font-weight: bold;
                    padding-top : 2%;
                    padding-left : 2%;
                    line-height: 150%;
                    font-family: Arial, Helvetica, sans-serif;
                }
                textarea::placeholder {
                    font-size : 12px;
                    font-weight: bold;
                    color : #897E7F;
                }
                input[type=file]::file-selector-button {
                    width: 150px;
                    height: 30px;
                    background: #fff;
                    border: 1px solid rgb(77,77,77);
                    border-radius: 10px;
                    cursor: pointer;
                    margin-bottom : 2%;
                }
                input[type=file]::file-selector-button:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                #file {
                    display : flex;
                    background : white;
                }
                .main-foot {
                    margin-top : 2%;
                    margin-left : 4%;
                    padding-bottom : 5%;
                }
                .submit {
                    text-align: center;
                    padding-bottom : 5%;
                }
                .submit input {
                    padding-left : 2%;
                    padding-right : 2%;
                    padding-top : 1%;
                    padding-bottom : 1%;
                    cursor: pointer;
                    background-color: white;
                    border-radius: 5px;
                    box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
                    border : 2px solid rgb(77,77,77);
                }
                .submit input:hover {
                    background: rgb(77,77,77);
                    color : #fff;
                }
                .addre{
                	color: rgba(0, 0, 0, 0.2);
                	font-size: 15px;
                	padding-top: 3%;
                }
                #star1, #star2, #star3, #star4, #star5{
			    	cursor: pointer;
			    	
			    }
            </style>
        </head>
        <body>
            <header class="header">
                <div class="inner">
                    <div class="hd-in">
                        <a onclick="history.back()" style="cursor: pointer;">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLjuQtoYJv9cnr8l1xXoOflCBGLP_jFwS1hw&usqp=CAU">
                        </a>
                        <span class="hd-sp">리뷰 작성</span>
                    </div>
                </div>
            </header>
            <div class="main">
                
                   <div class="main-top">
                       <div class="custom">
                           <div class="custom-info">
                               <div class="custom-img">
                                   <img src="${cpath}/common/getImg?path=${map.MAIN_IMG }&file=${main_imgNM }" style="width:5em; height: 5em;"/>
                               </div>
                               <div class="custom-name">
                                   <span><a href="${cpath }/member/tour/selectTour?f_seq=${map.F_SEQ}" target="_blank"><b>${map.NAME }</b></a></span>
	                               <div class="addre">${map.KIND_NAME } · ${map.ADDR1_NAME }(${map.ADDR2_NAME })</div>
                               </div>
                           </div>
                           <div class="custom-jjim">
                               <c:choose>
		                         <c:when test="${!check}">
			                           <div class="mb-save">
			                               <a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; margin-left : 2%;">
			                                   <img class="mb-img" id="jjimimg" style="width: 63px;" src="https://assets.triple.guide/images/btn-end-save-off@4x.png">
			                               </a>
			                           </div>
		                          </c:when>
								  <c:otherwise>
			                           <div class="mb-save">
											<a id="jjimbtn" onclick="javascript:myjjim()" style="cursor: pointer; position : relative; top : 0.6vh; left : 0.4vw;">
			                                    <img id="jjimimg" style= "margin-bottom:19%; width : 30px;"src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=">
			                                </a>
			                           </div>
			                      </c:otherwise>
		                      </c:choose>
                           </div>
                       </div>
                   </div>
                <form method="post" enctype="multipart/form-data">
                    <input type="hidden" name="f_seq" id="f_seq" value="${map.F_SEQ }">
                    <div class="main-mid">
                        <div class="star">
                        	<c:forEach begin="1" end="5" step="1" varStatus="i">
								<img id="star${i.count }" src="${cpath }/resources/star/graystar.jpg" style="width:6%;" onclick="checkstars(${i.count});">
                        	</c:forEach>
							<input type="hidden" name="stars" id="stars">
                        </div>
                        <div class="star-info">
                            <span id="starcmt">별점을 선택해주세요!</span>
                        </div>
                        <div class="date">
                            <input type="month" name="visitday" placeholder="날짜를 선택해주세요." required value={props.date} onchange={props.changeHandler} id="dateSelect" min="{props.isFullRange ? undefined : getDate()}">
                        </div>
                        <div class="area">
                            <textarea name="content" placeholder="- 직접 경험한 솔직한 리뷰를 남겨주세요.&#13;&#10;- 사진도 첨부할 수 있어요."></textarea>
                        </div>
                    </div>
                    <div class="main-foot">
                        <div class="photo">
                            <input type="file" name="files" id="file" multiple/>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="button" value="등록하기" onclick="checkRV(this.form);">
                    </div>
                </form>
            </div>
            
            <script type="text/javascript">

				function myjjim(){
				 	
					var jjimbtn = document.getElementById("jjimbtn");
					var url = null;
					var jjimimg = document.getElementById("jjimimg");
					
					if(jjimimg.src === "https://assets.triple.guide/images/btn-end-save-off@4x.png"){
						url = "${cpath}/member/dojjim";			
					}else{
						url = "${cpath}/member/nojjim";
					}
							
					console.log(jjimimg.src)
							
					var f_seq = document.getElementById("f_seq").value;
					var param = "f_seq=" + f_seq;
					
					sendRequest(url, param, function() {
						console.log(xhr.readyState)
						console.log(xhr.status)
						
						if(xhr.readyState === 4 && xhr.status === 200){
							console.log("여기??");
							var data = xhr.responseText;
							var jjimsrc = jjimimg.src;
							jjimimg.src = '';
							
							if(data == '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
							}else if(data != '찜!' && jjimsrc == 'https://assets.triple.guide/images/btn-end-save-off@4x.png'){
								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
							}else if(data == '찜!' && jjimsrc == 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4='){
								jjimsrc = 'https://assets.triple.guide/images/btn-end-save-off@4x.png';
							}else{
								jjimsrc = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDIxLjM1bC0xLjQ1LTEuMzJDNS40IDE1LjM2IDIgMTIuMjggMiA4LjUgMiA1LjQyIDQuNDIgMyA3LjUgM2MxLjc0IDAgMy40MS44MSA0LjUgMi4wOUMxMy4wOSAzLjgxIDE0Ljc2IDMgMTYuNSAzIDE5LjU4IDMgMjIgNS40MiAyMiA4LjVjMCAzLjc4LTMuNCA2Ljg2LTguNTUgMTEuNTRMMTIgMjEuMzV6IiBmaWxsPSIjREUyRTVGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=';
							}
							console.log(jjimsrc)
							location.reload();
							var f_seq = document.getElementById("f_seq").value;
							var param = "f_seq" + f_seq;
							var url = "${cpath}/member/jjimcnt";
							
							sendRequest(url, param, function(){
								if(xhr.readyState === 4 && xhr.status === 200){
									var data = xhr.responseText;
									var jjimcnt = document.getElementById("jjimcnt");
									
									jjimcnt.innerText = data;
								}
							}, "POST");
						}
					}, "POST");
					location.reload();
				} 
				
				
				
				function checkstars(v){
					var stars = document.getElementById("stars");
					var starcmt = document.getElementById("starcmt");
					
					for(let i = 1; i <= 5; i++){
						var star = document.getElementById("star"+i);
						if(i <= v){
							star.src = "${cpath}/resources/star/yellowstar.jpg";
						}else{
							star.src = "${cpath}/resources/star/graystar.jpg";
						}
						
					}
					stars.value = v;
					
					if(v == 1){
						starcmt.innerText = "별로예요";
					}else if(v == 2){
						starcmt.innerText = "조금 아쉬워요";
					}else if(v == 3){
						starcmt.innerText = "주위에 있다면 가볼만해요";
					}else if(v == 4){
						starcmt.innerText = "꽤 가볼만해요";
					}else{
						starcmt.innerText = "꼭 가야 하는 곳이에요";
					}
					
				}
					
				
				
				function checkRV(f){
					var stars = f.stars.value;
					var content = f.content.value;
					
					if(stars == ''){
						alert("별점을 선택해주세요!");
						return;
					}else if(content == ''){
						alert("내용을 입력해주세요!");
						f.content.focus();
						return;
					}else{
						f.action = "${cpath}/member/review/insertCheck";
						f.submit();
					}
				}
				
				
				
			
			</script>
            
        </body>
    </html>